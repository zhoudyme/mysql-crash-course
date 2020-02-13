1. 基本字符匹配
  SELECT prod_name
  FROM products
  WHERE prod_name REGEXP '1000'
  ORDER BY prod_name;
2. 进行OR匹配
  SELECT prod_name
  FROM products
  WHERE prod_name REGEXP '1000|2000'
  ORDER BY prod_name;
3. 匹配几个字符之一
  SELECT prod_name
  FROM products
  WHERE prod_name REGEXP '[123] Ton'
  ORDER BY prod_name;
4. 匹配范围
-- 使用-来定义一个范围
  SELECT prod_name
  FROM products
  WHERE prod_name REGEXP '[1-5] Ton'
  ORDER BY prod_name;
5. 匹配特殊字符
-- 为了匹配特殊字符，必须用\\为前导转义
  SELECT prod_name
  FROM products
  WHERE prod_name REGEXP '\\.'
  ORDER BY prod_name;
6. 匹配多个实例
-- \\(匹配(，[0-9]匹配任意数字（这个例子中为1和5），sticks?匹配stick和sticks（s后的?使s可选，因为?匹配它前面的任何字符的0次或1次出现），\\)匹配)
  SELECT prod_name
  FROM products
  WHERE prod_name REGEXP '\\([0-9] sticks?\\)'
  ORDER BY prod_name;
-- [[:digit:]]匹配任意数字，因而它为数字的一个集合。{4}确切地要求它前面的字符（任意数字）出现4次，所以[[:digit:]]{4}匹配连在一起的任意4位数字
  SELECT prod_name
  FROM products
  WHERE prod_name REGEXP '[[:digit:]]{4}'
  ORDER BY prod_name;
7. 定位符
-- ^匹配串的开始。因此，^[0-9\\.]只在.或任意数字为串中第一个字符时才匹配它们。没有^，则还要多检索出4个别的行（那些中间有数字的行）
-- ^有两种用法。在集合中（用[和]定义），用它来否定该集合，否则，用来指串的开始处。
  SELECT prod_name
  FROM products
  WHERE prod_name REGEXP '^[0-9\\.]'
  ORDER BY prod_name;