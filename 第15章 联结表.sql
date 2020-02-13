1、 创建联结
  SELECT vend_name, prod_name, prod_price
  FROM vendors, products
  WHERE vendors.vend_id = products.vend_id
  ORDER BY vend_name, prod_name;
2. 内部联结
  SELECT vend_name, prod_name, prod_price
  FROM vendors INNER JOIN products
  ON vendors.vend_id = products.vend_id
3. 联结多个表
  SELECT prod_name, vend_name, prod_price, quantity
  FROM orderitems, products, vendors
  WHERE products.vend_id = vendors.vend_id
  AND orderitems.prod_id = products.prod_id
  AND order_num = 20005;