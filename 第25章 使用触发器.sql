1. 创建触发器
  触发器是MySQL响应以下任意语句而自动执行的一条MySQL语句。
• DELETE
• INSERT
• UPDATE
  其他MySQL语句不支持触发器。
  2. 创建触发器
  CREATE TRIGGER newproduct AFTER INSERT ON products
  FOR EACH ROW SELECT 'Product added'
 • 此时报错：
[Err] 1415 - Not allowed to return a result set from a trigger
解决方法：MYSQL5以后，不允许触发器返回任何结果，因此使用into @变量名，将结果赋值到变量中，用SELECT调用即可
  CREATE TRIGGER newproduct AFTER INSERT ON products
  FOR EACH ROW SELECT 'Product added' INTO @value;
3. 删除触发器
  DROP TRIGGER newproduct;
4. 使用触发器
4.1 INSERT触发器
  INSERT触发器在INSERT语句执行之前或之后执行。需要知道以下几点：
• 在INSERT触发器代码内，可引用一个名为NEW的虚拟表，访问被插入的行
• 在BEFORE INSERT触发器中，NEW中的值也可以被更新（允许更改被插入的值）
• 对AUTO_INCREMENT列，NEW在ISNERT执行之前包含0，在INSERT执行之后包含新的自动生成值。
  下面举一个例子。AUTO_INCREMENT列具有MySQL自动赋予的值。前面建议了几种确定新生成值的方法，但下面是一种更好的方法：
  CREATE TRIGGER neworder AFTER INSERT ON orders 
  FOR EACH ROW SELECT	NEW.order_num INTO @order_num;
4.2 DELETE触发器
  DELETE触发器在DELETE语句执行之前或之后执行。需要知道以下两点：
• 在delete触发器代码内，你可以引用一个名为OLD的虚拟表，访问被删除的行
• OLD中的值全都是只读的，不能更新
  下面的例子演示使用OLD保存将要被删除的行到一个存档表中：
  CREATE TRIGGER deleteorder BEFORE DELETE ON orders
  for each ROW
  BEGIN
      INSERT INTO archive_orders(order_num, order_date, cust_id)
      vaues(OLD.order_num, OLD.order_date, OLD.cust_id);
  END;
  多语句触发器 
正如所见，触发器deleteorder使用begin和end语句标记触发器体。使用begin end块的好处是触发器能容纳多条SQL语句。
4.3 UPDATE触发器
  UPATE触发器在UPDATE语句执行之前或之后执行。需要知道以下几点：
• 在UPDATE触发器代码中，你可以引用一个名为OLD的虚拟表访问以前的值，引用一个名为NEW的虚拟表访问新的值
• OLD中的值全都是只读的，不能更新。
  CREATE TRIGGER updatevendor BEFORE UPDATE ON vendors
  for each ROW SET NEW.vend_state = Upper(NEW.vend_state);
4.4 关于触发器的进一步介绍
• 与其他DBMS相比，MySQL 5中支持的触发器相当初级。
• 创建触发器可能需要特殊的安全访问权限，但是，触发器的执行是自动的。如果INSERT、UPDATE或DELETE语句能够执行，则相关的触发器也能执行
• 应该用触发器来保证数据的一致性。在触发器中执行这种类型的处理的优点是它总是进行这种处理，而且是透明地进行，与客户机应用无关。
• 触发器的一种非常有意义的使用是创建审计跟踪。使用触发器，把更改记录到另一个表非常容易。
• 遗憾的是，MySQL触发器中不支持CALL语句。这表示不能从触发器内调用存储过程。所需的存储过程代码需要复制到触发器内。