1. 启用全文本搜索支持
-- 为了进行全文本搜索，必须索引被搜索的列，而且要随着数据的改变不断地重新索引。
-- MySQL根据子句FULLTEXT (note_text)的指示对它进行索引。
-- 这里的FULLTEXT索引单个列，如果需要也可以指定多个列。
-- 在定义之后，MySQL自动维护该索引。在增加、更新或删除行时，索引随之自动更新。
  CREATE TABLE productnotes (
    note_id INT NOT NULL AUTO_INCREMENT,
    prod_id CHAR (10) NOT NULL,
    note_date datetime NOT NULL,
    note_text text NULL,
    PRIMARY KEY (note_id),
    FULLTEXT (note_text)
  ) ENGINE = MyISAM;
2. 进行全文本搜索
-- MATCH()指定被搜索的列，AGAINST()指定要使用的搜索表达式。
-- 全文本搜索的一个重要部分就是对结果排序。具有较高登记的行先返回。
  SELECT note_text
  FROM productnotes
  WHERE MATCH(note_text) AGAINST('rabbit')
-- 演示排序
  SELECT note_text,
	  		 MATCH(note_text) AGAINST('rabbit') AS rank
  FROM productnotes;
3. 使用查询扩展
-- 查询扩展用来设法放宽所返回的全文本搜索结果的范围
  SELECT note_text
  FROM productnotes
  WHERE MATCH(note_text) AGAINST('anvils' WITH QUERY EXPANSION)
4. 布尔文本搜索
-- 即使没有FULLTEXT索引也可以使用
-- 匹配包含heavy但不包含任意以rope开始的词的行
  SELECT note_text
  FROM productnotes
  WHERE MATCH(note_text) AGAINST('heavy -rope*' IN BOOLEAN MODE)
5. 全文本搜索的使用说明
• 在索引全文本数据时，短词被忽略且从索引中排除。短词定义为那些具有3个或3个以下字符的词（如果需要，这个数目可以更改)。
• MySQL带有一个内建的非用词（stopword）列表，这些词在索引全文本数据时总是被忽略。如果需要，可以覆盖这个列表。
• 许多词出现的频率很高，搜索它们没有用处（返回太多的结果）。因此，MySQL规定了一条50%规则，如果一个词出现在50%以上的行中，则将它作为一个非用词忽略。50%规则不用于IN BOOLEAN MODE。
• 如果表中的行数少于3行，则全文本搜索不返回结果（因为每个词或者不出现，或者至少出现在50%的行中）。
• 忽略词中的单引号。例如，don’t索引为dont。
• 不具有词分隔符（包括日语和汉语）的语言不能恰当地返回全文本搜索结果。
• 如前所述，仅在MyISAM数据库引擎中支持全文本搜索。