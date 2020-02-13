1. 插入完整的行
  INSERT INTO customers
  VALUES
    (
      NULL,
      'Pep E. LaPew',
      '100 Main Street',
      'Los Angeles',
      'CA',
      '90046',
      'USA',
      NULL,
      NULL
    )
-- 上面的SQL语句高度依赖于表中列的定义和次序，并且还依赖于其次序容易获得的信息。
-- 即使可得到这种次序信息，也不能保证下一次表结构变动后各个列保持完全相同的次序。
-- 编写INSERT语句的更安全（不过更烦琐）的方法如下：
  INSERT INTO customers
  VALUES
    (
      NULL,
      'Pep E. LaPew',
      '100 Main Street',
      'Los Angeles',
      'CA',
      '90046',
      'USA',
      NULL,
      NULL
    )
2. 插入多个行
  INSERT INTO customers (
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country
  )
  VALUES
    (
      'Pep E. LaPew',
      '100 Main Street',
      'Los Angeles',
      'CA',
      '90046',
      'USA'
    ),
    (
      'M. Martain',
      '42 Galaxy Way',
      'New York',
      'NY',
      '11213',
      'USA'
    )
3. 插入检索出的数据
  INSERT INTO customers (
    cust_id,
    cust_contact,
    cust_email,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country
  ) SELECT
    cust_id,
    cust_contact,
    cust_email,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country
  FROM
    custnew;

