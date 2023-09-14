WITH
  AggregatedProducts AS (
  SELECT
    user_id,
    ARRAY_AGG(CAST(product_id AS STRING)) AS product_array
  FROM
    `ninth-osprey-782.follower.product_plans`
  WHERE
  plan_id = 34
  and
  DATE(created_at)> DATE_SUB(CURRENT_DATE(),INTERVAL 30 day)
  GROUP BY
    user_id )

SELECT
  ap.user_id,
  STRING_AGG(product_id, ' | ') AS product_ids,
  u.email,
  LOWER(REGEXP_REPLACE(u.name, r'^(.*?)\s.*$', r'\1')) AS first_name,
FROM
  AggregatedProducts AS ap,
  UNNEST(product_array) AS product_id
LEFT JOIN
  `ninth-osprey-782.data_exports.bi_users` u
ON
  ap.user_id = u.user_id
WHERE 
  u.last_sale_date>=DATE_SUB(CURRENT_DATE(),INTERVAL 30 day)
GROUP BY
  1,
  3,
  4;