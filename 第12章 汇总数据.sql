1. AVG()函数 - 平均值
-- AVG()函数忽略列值为NULL的行
  SELECT AVG(prod_price) AS avg_price
  FROM products;
2. COUNT()函数 - 计数
-- 如果指定列名，则指定列的值为空的行被COUNT()函数忽略，但如果COUNT()函数中用的是星号(*)，则不忽略
  • SELECT COUNT(*) AS num_cust
    FROM customers;
  • SELECT COUNT(cust_email) AS num_cust
    FROM customers;
3. MAX()函数 - 最大值
  SELECT MAX(prod_price) AS max_price
  FROM products;
4. MIN()函数 - 最小值
  SELECT MIN(prod_price) AS max_price
  FROM products;
5. SUM()函数 - 求和
  SELECT SUM(quantity) AS items_ordered
  FROM orderitems
  WHERE order_num = 20005;
6. 聚集不同值
  SELECT AVG(DISTINCT prod_price) AS avg_price
  FROM products
  WHERE vend_id = 1003;
7. 组合聚集函数
  SELECT COUNT(*) AS num_items,
        MIN(prod_price) AS price_min,
        MAX(prod_price) AS price_max,
        AVG(prod_price) AS price_avg
  FROM products;