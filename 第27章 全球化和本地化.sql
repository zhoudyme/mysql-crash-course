1. 使用字符集和校对顺序
• MySQL支持众多的字符集。为查看所支持的字符集完整列表，使用以下语句：
  SHOW CHARACTER SET;
• 为了查看所支持校对的完整列表，使用以下语句：
  SHOW COLLATION;
• 为了确定所用的字符集和校对，可以使用以下语句：
  SHOW VARIABLES LIKE 'charactrer%';
  SHOW VARIABLES LIKE 'collation%';
• 为了给表指定字符集和校对，可使用带子句的CREATE TABLE：
  CREATE TABLE mytable (
    column1 INT,
    column2 VARCHAR (10)
  ) DEFAULT CHARACTER SET hebrew COLLATE hebrew_general_ci;
• 除了能指定字符集和校对的表范围外，MySQL还允许对每个列设置它们，如下所示：
  CREATE TABLE mytable (
    column1 INT,
    column2 VARCHAR (10),
    column3 VARCHAR (10) CHARACTER SET latin1 COLLATE latin1_general_ci;
  ) DEFAULT CHARACTER SET behrew COLLATE behrew_general_ci;
• 校对在对用ORDER BY子句检索出来的数据排序起重要的作用。如果你需要用与创建表时不同的校对顺序排序特定的SELECT语句，可以在SELECT语句自身中进行：
  SELECT * FROM customers
  ORDER BY lastname, firstname COLLATE latina1_general_cs;
