1. 拼接字段
  SELECT CONCAT(vend_name,' (',vend_country, ')')
  FROM vendors
  ORDER BY vend_name;
2. 使用别名
  SELECT CONCAT(vend_name,' (',vend_country, ')') AS vend_title
  FROM vendors
  ORDER BY vend_name;
3. 执行算数计算
  SELECT prod_id, quantity, item_price, quantity * item_price AS expanded_price
  FROM orderitems
  WHERE order_num = 20005;