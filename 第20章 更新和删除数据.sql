1. 更新数据
  UPDATE customers
  SET cust_email = 'elmer@fudd.com'
  WHERE cust_id = 1005;
-- 更新多个列
  UPDATE customers
  SET cust_name = 'The Fudds',
		cust_email = 'elmer@fudd.com'
  WHERE cust_id = 1005;
• 在UPDATE语句中使用子查询 
UPDATE语句中可以使用子查询，使得能用SELECT语句检索出的数据更新列数据。
• IGNORE关键字 
如果用update语句更新多行，并且在更新这些行中的一行或多行时出现一个错误，则整个update操作被取消（错误发生前更新的所有行被恢复到它们原来的值）。
即使是发生错误，也继续进行更新，可使用IGNORE关键字，如下所示：
UPDATE IGNORE customers
2. 删除数据
  DELETE FROM customers
  WHERE cust_id = 10006;
• 更快的删除 
如果想从表中删除所有行，不要使用delete。
可使用truncate table语句，它完成相同的工作，但速度更快（truncate实际是删除原来的表并重新创建一个表，而不是逐行删除表中的数据）。
3. 更新和删除的指导原则
下面是许多SQL程序员使用update或delete时所遵循的习惯。
• 除非确实打算更新和删除每一行，否则绝对不要使用不带where子句的update或delete语句。
• 保证每个表都有主键，尽可能像where子句那样使用它。
• 在对update或delete语句使用where子句前，应该先用select进行测试，保证它过滤的是正确的记录，以防编写的where子句不正确。
• 使用强制实施引用完整性的数据库，这样MySQL将不允许删除具有与其他表相关联的数据的行。