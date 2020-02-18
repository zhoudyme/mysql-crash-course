1. 使用视图
• 视图用CREATE VIEW语句来创建
• 使用SHOW CREATE VIEW VIEWNAME;来查看创建视图的语句。
• 用DROP删除视图，其语法为DROP VIEW VIEWNAME;
• 更新视图时，可以先用DROP再用CREATE，也可以直接用CREATE OR REPLACE VIEW。如果更新的视图不存在，则第2条更新语句会创建一个视图；如果要更新的视图存在，则第2条更新语句会替换原有视图。
2. 利用视图简化复杂的联结
  CREATE VIEW productcustomers AS 
  SELECT cust_name, cust_contact, prod_id
  FROM customers, orders, orderitems
  WHERE customers.cust_id = orders.cust_id
  AND orderitems.order_num = orders.order_num;
3. 用视图重新格式化检索出的数据
 CREATE VIEW vendorlocations AS 
  SELECT Concat(RTrim(vend_name),'(',RTrim(vend_country),')') AS vend_title
  FROM vendors
  ORDER BY vend_name;
4. 用视图过滤不想要的数据
  CREATE VIEW customeremaillist AS 
  SELECT cust_id, cust_name, cust_email
  FROM customers
  WHERE cust_email IS NOT NULL;
5. 使用视图与计算字段
  CREATE VIEW orderitemsexpanded AS
  SELECT order_num,
        prod_id,
        quantity,
        item_price,
        quantity * item_price AS expanded_price
  FROM orderitems;
6. 更新视图
  通常，视图是可更新的（可以对它们使用INSERT、UPDATE和DELETE）。更新一个视图将更新其基表。如果你对视图增加或删除行，实际上是对其基表增加或删除行。
  但是，并非所有视图都是可更新的。基本上可以说，如果MYSQL不能正确地确定被更新的基数据，则不允许更新。这实际上意味着，如果视图定义中有以下操作，则不能进行视图的更新：
• 分组（使用GROUP BY和HAVING）；
• 联结；
• 子查询；
• 并；
• 聚集函数（Min()、Count()、Sum()等）；
• DISTINCT；
• 导出列；