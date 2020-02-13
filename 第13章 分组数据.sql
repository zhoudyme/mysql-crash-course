1. 创建分组
  SELECT vend_id, COUNT(*) AS num_prods
  FROM products
  GROUP BY vend_id;
2. 过滤分组
-- HAVING和WHERE的差别：
-- • WHERE过滤行，而HAVING过滤分组
-- • WHERE在数据分组前进行过滤，HAVING在数据分组后进行过滤
  • SELECT cust_id, COUNT(*) AS orders
    FROM orders
    GROUP BY cust_id
    HAVING COUNT(*) >= 2;
  • SELECT vend_id, COUNT(*) AS num_prods
    FROM products
    WHERE prod_price >= 10
    GROUP BY vend_id
    HAVING COUNT(*) >= 2
3. 分组和排序
  SELECT order_num, SUM(quantity * item_price) AS ordertotal
  FROM orderitems
  GROUP BY order_num
  HAVING SUM(quantity * item_price) >= 50
  ORDER BY ordertotal