1. 创建游标
  CREATE PROCEDURE processorders ()
  BEGIN

  DECLARE ordernumbers CURSOR FOR SELECT
    order_num
  FROM
    orders;
    
  END;
2. 打开和关闭游标
• 游标用open cursor语句来打开：
  OPEN ordernumbers;
• 游标处理完成后，应当使用如下语句关闭游标：
  CLOSE ordernumbers;
3. 使用游标数据
  CREATE PROCEDURE processorders()
  BEGIN
      -- declare local variables
      DECLARE o INT;
      
      -- declare the cursor
      DECLARE ordernumbers cursor
      FOR
      SELECT order_num FROM orders;
      
      -- open the cursor
      OPEN ordernumbers;
      
      -- get order number
      FETCH ordernumbers INTO o;
      
      -- close the cursor
      CLOSE ordernumbers;
  END;

  CREATE PROCEDURE processorders()
  BEGIN
      -- declare local variables
      DECLARE done BOOLEAN default 0;
      DECLARE o INT;
      DECLARE t DECIMAL(8,2);
      
      -- declare the cursor
      DECLARE ordernumbers cursor
      FOR 
      SELECT order_num FROM orders;
      
      -- declare continue handler
      DECLARE CONTINUE handler for sqlstate '02000' SET done = 1;
      
      -- create a table to store the results
      CREATE TABLE if NOT EXISTS ordertotals
          (order_num INT, total DECIMAL(8,2));
          
      -- open the cursor
      OPEN ordernumbers;
      
      -- loop through all rows
      REPEAT
          -- get order number
          FETCH ordernumbers INTO o;
          
          -- get the total for this order
          CALL ordertotal(o, 1, t);
          
          -- insert order and total into ordertotals
          INSERT INTO ordertotals(order_num, total)
          VALUES(o, t);
          
          -- end of loop
          UNTIL done END REPEAT;
          
          -- close the cursor
          CLOSE ordernumbers;
  END;
