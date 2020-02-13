1. 使用UNION
  SELECT vend_id, prod_id, prod_price
  FROM products
  WHERE prod_price <= 5
  UNION
  SELECT vend_id, prod_id, prod_price
  FROM products 
  WHERE vend_id IN (1001,1002);
2. UNION规则
• UNION必须由两条或两条以上的SELECT语句组成，语句之间用关键字UNION分隔（因此，如果组合4条SELECT语句，将要使用3个UNION关键字）。
• UNION中的每个查询必须包含相同的列，表达式或聚集函数（不过各个列不需要以相同的次序列出）。
• 列数据类型必须兼容：类型不必完全相同，但必须是DBMS可以隐含地转换的类型（例如，不同的数值类型或者不同的日期类型）。
3. 包含或取消重复的行
-- 使用UNION ALL，MySQL不取消重复的行。
  SELECT vend_id, prod_id, prod_price
  FROM products
  WHERE prod_price <= 5
  UNION ALL
  SELECT vend_id, prod_id, prod_price
  FROM products
  WHERE vend_id IN (1001,1002);
4. 对组合查询结果排序
  -- 在用UNION组合查询时，只能使用一条ORDER BY子句，它必须出现在最后一条SELECT语句之后
  SELECT vend_id, prod_id, prod_price
  FROM products
  WHERE prod_price <= 5
  UNION
  SELECT vend_id, prod_id, prod_price
  FROM products
  WHERE vend_id IN (1001,1002)
  GROUP BY vend_id, prod_price;