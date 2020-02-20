1. 事务处理
  并非所有引擎都支持事务处理 
MyISAM和InnoDB是两种最常使用的引擎。前者不支持明确的事务处理管理，而后者支持。
这就是为什么本书中使用的样例表被创建来使用InnoDB而不是更经常使用的MyISAM的原因。
如果你的应用中需要事务处理功能，则一定要使用正确的引擎类型。
2. 使用ROLLBACK
  SELECT * FROM ordertotals;
  START TRANSACTION;
  DELETE from ordertotals;
  SELECT * FROM ordertotals;
  ROLLBACK;
  SELECT * FROM ordertotals;
  哪些语句可以回退？ 
事务处理用来管理INSERT、UPDATE和DELETE语句。你不能回退SELECT语句。你不能回退CREATE或DROP操作。事务处理块可以使用这两条语句，但如果你执行回退，它们不会被撤销。
2. 使用COMMIT
  START TRANSACTION;
  DELETE FROM orderitems WHERE order_num = 20010;
  DELETE FROM orders WHERE order_num = 20010;
  COMMIT;
3. 使用保留点
为了支持回退部分事务处理，必须能在事务处理块中合适的位置放置占位符。这样，如果需要回退，可以回退到某个占位符。
这些占位符称为保留点。为了创建占位符，可如下使用SAVEPOINT语句：
  SAVEPOINT delete1;
每个保留点都取标识它的唯一名字，以便在回退时，MySQL知道要回退到何处。为了回退到本例给出的保留点，可如下进行：
  ROLLBACK TO delete1;
  保留点越多越好
可以在MySQL代码中设置任意多的保留点，越多越好，为什么呢？因为保留点越多，你就越能按自己的意愿灵活地进行回退。
4. 更改默认的提交行为
  SET autocommit = 0;
  标志为连接专用 
autocommit标志是针对每个连接而不是服务器的。
