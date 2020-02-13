1. 检索单个列
	SELECT prod_name 
  FROM products; 
2. 检索多个列
	SELECT prod_id, prod_name, prod_price 
  FROM products;
3. 检索所有列
	SELECT * 
  FROM products;
4. 检索不同的行
	SELECT DISTINCT vend_id 
  FROM products;
5. 限制结果
  -- 第一个数为开始位置，第二个数为要检索的行数
	SELECT prod_name 
  FROM products 
  LIMIT 0,5;
6. 使用完全限定的表名
	• SELECT products.prod_name 
    FROM products;
	• SELECT products.prod_name 
    FROM crashcourse.products;
