1. 文本处理函数
  SELECT vend_name, UPPER(vend_name) AS vend_name_upcase
  FROM vendors
  ORDER BY vend_name;
-- SOUNDEX是一个将任何文本串转换为描述其语音表示的字母数字模式的算法。
-- SOUNDEX考虑了类似的发音字符和音节，使得能对串进行发音比较而不是字母比较。
  SELECT cust_name, cust_contact
  FROM customers
  WHERE SOUNDEX(cust_contact) = SOUNDEX('Y. Lie')
2. 日期和时间处理函数
  SELECT cust_id, order_num
  FROM orders
  WHERE Date(order_date) = '2005-09-01';