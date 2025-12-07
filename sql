WITH user_monthly_revenue AS (
    -- Агрегую revenue на рівні користувач-гра-місяць
    SELECT
        p.user_id,
        p.game_name,
        DATE_TRUNC('month', p.payment_date)::DATE AS payment_month,
        SUM(p.revenue_amount_usd) AS monthly_revenue
    FROM project.games_payments AS p
    WHERE p.user_id IS NOT NULL
    GROUP BY p.user_id, p.game_name, DATE_TRUNC('month', p.payment_date)::DATE
),

base AS (
    SELECT
        umr.user_id,
        umr.game_name,
        umr.payment_month,
        umr.monthly_revenue,
        pu."language",
        pu.has_older_device_model,
        pu.age,
        -- попередній і наступний місяць платежу
        LAG(umr.payment_month) OVER (PARTITION BY umr.user_id, umr.game_name ORDER BY umr.payment_month) AS prev_month,
        LEAD(umr.payment_month) OVER (PARTITION BY umr.user_id, umr.game_name ORDER BY umr.payment_month) AS next_month,
        LAG(umr.monthly_revenue) OVER (PARTITION BY umr.user_id, umr.game_name ORDER BY umr.payment_month) AS prev_revenue
    FROM user_monthly_revenue AS umr
    LEFT JOIN project.games_paid_users AS pu
        ON umr.user_id = pu.user_id 
        AND umr.game_name = pu.game_name  -- додаю game_name до JOIN
)

SELECT
    payment_month AS month,
    game_name,
    "language",
    has_older_device_model,
    age,

    -- MRR: загальний місячний recurring revenue
    SUM(monthly_revenue) AS mrr,

    -- Paid Users: загальна кількість користувачів, які платили цього місяця
    COUNT(DISTINCT user_id) AS paid_users,

    -- New Paid Users: користувачі без попереднього платежу
    COUNT(DISTINCT CASE
        WHEN prev_month IS NULL THEN user_id
    END) AS new_paid_users,

    -- New MRR: дохід від нових користувачів
    SUM(CASE
        WHEN prev_month IS NULL THEN monthly_revenue
        ELSE 0
    END) AS new_mrr,

    -- Churned Users: користувачі, які не платили наступного місяця 
    -- або був пропуск >1 місяця
    COUNT(DISTINCT CASE
        WHEN next_month IS NULL 
          OR next_month > payment_month + INTERVAL '1 month'
        THEN user_id
    END) AS churned_users,

    -- Churned Revenue: дохід від churned користувачів
    SUM(CASE
        WHEN next_month IS NULL 
          OR next_month > payment_month + INTERVAL '1 month'
        THEN monthly_revenue
        ELSE 0
    END) AS churned_revenue,

    -- Expansion MRR: збільшення доходу порівняно з попереднім місяцем
    -- тільки якщо місяці йдуть підряд
    SUM(CASE
        WHEN prev_month IS NOT NULL
         AND prev_month = payment_month - INTERVAL '1 month'
         AND monthly_revenue > prev_revenue
        THEN monthly_revenue - prev_revenue
        ELSE 0
    END) AS expansion_mrr,

    -- Contraction MRR: зменшення доходу порівняно з попереднім місяцем
    -- тільки якщо місяці йдуть підряд
    SUM(CASE
        WHEN prev_month IS NOT NULL
         AND prev_month = payment_month - INTERVAL '1 month'
         AND monthly_revenue < prev_revenue
        THEN prev_revenue - monthly_revenue
        ELSE 0
    END) AS contraction_mrr

FROM base
GROUP BY month, game_name, "language", has_older_device_model, age
ORDER BY month, game_name, "language", has_older_device_model, age;
