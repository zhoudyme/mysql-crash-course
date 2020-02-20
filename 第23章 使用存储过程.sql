1. 执行存储过程
  CALL productpricing (
    @pricelow,
    @pricehigh,
    @priceaverage
  );
2. 创建存储过程
  CREATE PROCEDURE productpricing ()
  BEGIN
    SELECT AVG(prod_price) AS priceaverage
    FROM products;
  END;
3. 删除存储过程
  DROP PROCEDURE productpricing
4. 使用参数
-- 此存储过程接受3个参数：PL存储产品最低价格，PH存储产品最高价格，PA存储产品平均价格。
-- 每个参数必须具有指定的类型，这里使用十进制值。关键字OUT指出相应的参数用来从存储过程 传出一个值。
-- MYSQL支持IN（传递给存储过程）、OUT（从存储过程传出）和INOUT（对存储过程传入和传出）类型的参数。
-- 存储过程的代码位于BEGIN和END语句内，如前所见，它们是一系列SELECT语句，用来检索值，然后保存到相应的变量（通过指定INTO关键字）。
  CREATE PROCEDURE productpricing (
    OUT pl DECIMAL (8, 2),
    OUT ph DECIMAL (8, 2),
    OUT pa DECIMAL (8, 2)
  )
  BEGIN
    SELECT MIN(prod_price) 
    INTO pl
    FROM products;
  SELECT
    MAX(prod_price)
    INTO ph
    FROM products;
  SELECT
    AVG(prod_price) 
    INTO pa
    FROM products;
  END;
-- 下面是另外一个例子，这次使用IN和OUT参数。ordertotal接受订单号并返回该订单的合计：
  CREATE PROCEDURE ordertotal (
    IN onumber INT,
    OUT ototal DECIMAL (8, 2)
  )
  BEGIN
    SELECT Sum(item_price * quantity)
    FROM orderitems
    WHERE order_num = onumber INTO ototal;
  END;
5. 建立智能存储过程
首先，增加了注释(前面放置--)。
在存储过程复杂性增加时，这样做特别重要。添加了另外一个参数taxable，它是一个布尔值（如果要增加税为真，否则为假）。
在存储过程体中，用DECLARE语句定义了两个局部变量。DECLARE要求指定变量名和数据类型，它也支持可选的默认值。
SELECT语句已经改变，因此其结果存储到total而不是OTOTAL。IF语句检查taxable是否为真，如果为真，则用另一SELECT语句增加营业税到局部变量taxable。最后，用另一SELECT语句将total保存到ototal。
  -- Name: ordertotal
  -- Parameters: onumber = order number
  -- taxable = 0 if not taxable, 1 if taxable
  -- ototal = order total variable
  CREATE PROCEDURE ordertotal(
      IN onumber INT,
      IN taxable BOOLEAN,
      OUT ototal DECIMAL(8,2)
  ) comment 'Obtain order total, optionally adding tax'
  BEGIN

  -- Declare variable for total
  DECLARE total DECIMAL(8,2);
  -- Declare tax percentage
  DECLARE taxrate INT default 6;

  -- Get the order total
  SELECT Sum(item_price*quantity)
  FROM orderitems
  WHERE order_num = onumber
  INTO total;

  -- Is this taxable?
  IF taxable THEN
  -- Yes, so add taxrate to the total
      SELECT total+(total / 100 * taxrate) INTO total;
  END IF;
  -- And finally , save to out variable
      SELECT total INTO ototal;

  END;
6. 检查存储过程
  SHOW CREATE PROCEDURE ordertotal;
  为了获得包括何时、由谁创建等详细信息的存储过程列表，使用SHOW PROCEDURE STATUS。