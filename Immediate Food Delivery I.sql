SELECT  ROUND(CAST(COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN delivery_id END) AS FLOAT) * 100/  COUNT(delivery_id), 2) AS  immediate_percentage
FROM Delivery
