1. AND操作符
  SELECT prod_id, prod_price, prod_name
  FROM products
  WHERE vend_id = 1003 AND prod_price <= 10;
2. OR操作符
  SELECT prod_name, prod_price 
  FROM products
  WHERE vend_id = 1002 OR vend_id = 1003;
3. 计算次序
  SELECT prod_name, prod_price 
  FROM products
  WHERE (vend_id = 1002 OR vend_id = 1003) AND prod_price >= 10;
4. IN操作符
-- IN操作符用来指定条件范围，范围内的每个条件都可以进行匹配
  SELECT prod_name, prod_price 
  FROM products
  WHERE vend_id IN (100,1003)
  ORDER BY prod_name;
5. NOT操作符
-- WHERE子句中用来否定后跟条件的关键字
  SELECT prod_name, prod_price 
  FROM products
  WHERE vend_id NOT IN (100,1003)
  ORDER BY prod_name;