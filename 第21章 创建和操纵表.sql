1.1. 表创建基础
  CREATE TABLE customers (
    cust_id INT NOT NULL AUTO_INCREMENT,
    cust_name CHAR (50) NOT NULL,
    cust_city CHAR (50) NULL,
    cust_state CHAR (5) NULL,
    cust_zip CHAR (10) NULL,
    cust_country CHAR (50) NULL,
    cust_contact CHAR (50) NULL,
    cust_email CHAR (255) NULL,  
    PRIMARY KEY (cust_id)
  ) ENGINE = INNODB;
1.2. 使用NULL值
  CREATE TABLE orders (
    order_num INT NOT NULL AUTO_INCREMENT,
    order_date DATATI ME NOT NULL,
    cust_id INT NOT NULL,
    PRIMARY KEY (order_num)
  ) ENGINE = INNODB;
1.3. 主键再介绍
• 正如所述，主键值必须唯一。即，表中的每个行必须具有唯一的主键值。如果主键使用单个列，则它的值必须唯一。如果使用多个列，则这些列的组合值必须唯一。
• 为创建多个列组成的主键，应该以逗号分隔的列表给出各列名，如下所示：
  CREATE TABLE orderietms (
    order_num INT NOT NULL,
    order_item INT NOT NULL,
    prod_id CHAR (10) NOT NULL,
    quantity INT NOT NULL,
    item_price DECIMAL (8, 2) NOT NULL,
    PRIMARY KEY (order_num, order_item)
  ) ENGINE = INNODB;
1.4. 使用AUTO_INCREMENT
• AUTO_INCREMENT告诉MySQL，本列每当增加一行时自动增量。每次执行一个INSERT操作时，MySQL自动对该列增量（从而才有这个关键字AUTO_INCREMENT），给该列赋予下一个可用的值。这样给每个行分配一个唯一的cust_id,从而可以用作主键值。
• 每个表只允许一个AUTO_INCREMENT列，而且它必须被索引（如，通过使它成为主键）。
• 覆盖AUTO_INCREMENT 
  如果一个列被指定为AUTO_INCREMENT,则它需要使用特殊的值吗？你可以简单地在INSERT语句中指定一个值，只要它是唯一的即可，该值将被用来替换自动生成的值。后续的增量将开始使用该手动插入的值。
• 确定AUTO_INCREMENT值 
  让MySQL生成主键的一个缺点是你不知道这些值都是谁。那么，如何在使用AUTO_INCREMENT列时获 得这个值呢？可使用last_insert_id()函数获得这个值。如下所示：
  SELECT last_insert_id();
1.5. 指定默认值
-- 如果在插入行时没有给出值，MySQL允许指定此时的默认值。默认值用CREATE TABLE语句的列定义中的DEFAULT关键字指定。
  CREATE TABLE orderitems (
    order_num INT NOT NULL,
    order_item INT NOT NULL,
    prod_id CHAR (10) NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    item_price DECIMAL (8, 2) NOT NULL,
    PRIMARY KEY (order_num, order_item)
  ) ENGINE = INNODB;
1.6. 引擎类型
• InnoDB是一个可靠的事务处理引擎，它不支持全文本搜索
• MEMORY在功能等于MyISAM,但由于数据存储在内存中，速度很快（特别适合于临时表）
• MyISAM是一个性能极高的引擎，它支持全文本搜索，但不支持事务处理。
• 外键不能跨引擎 
  混用引擎类型有一个大缺陷。外键不能跨引擎，即使用一个引擎的表不能引用具有使用不同引擎的表的外键。
2.更新表
  ALTER TABLE vendors 
  ADD vend_phone CHAR (20);
复杂的表结构更改一般需要手动删除过程，它涉及以下步骤：
• 用新的列布局创建一个新表
• 使用insert select语句从旧表复制数据到新表。如果有必要，可使用转换函数和计算字段
• 检验包含所需数据的新表
• 重命名旧表
• 用旧表原来的名字重命名新表
• 根据需要，重新创建触发器、存储过程、索引和外键。
3. 删除表
  DROP TABLE customers2;
4. 重命名表
  RENAME TABLE customers2 TO customers;
-- 使用下面的语句对多个表重命名
  RENAME TABLE backup_customers TO customers,
  backup_vendors TO vendors,
  backup_products TO products;

