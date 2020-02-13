1. 排序数据
  SELECT prod_name 
  FROM produces 
  ORDER BY prod_name;
2. 按多个列排序
  SELECT prod_id, prod_price, prod_name
  FROM products
  ORDER BY prod_price, prod_name;
3. 指定排序方向
  SELECT prod_id, prod_price, prod_name
  FROM products
  ORDER BY prod_price DESC;