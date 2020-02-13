1. 使用where子句
	SELECT prod_name, prod_price
	FROM products
	WHERE prod_price = 2.5;
2. 检查单个值
-- Mysql在执行匹配时默认不区分大小写，所以fuses与Fuses匹配
	SELECT prod_name, prod_price
	FROM products
	WHERE prod_name = 'fuses';
3. 不匹配检查
	SELECT vend_id, prod_name
	FROM products
	WHERE vend_id <> 1003;
4. 范围值检查
	SELECT prod_name, prod_price
	FROM products
	WHERE prod_price BETWEEN 5 AND 10;
5. 空值检查
	SELECT prod_name 
	FROM products
  WHERE prod_price IS NULL;