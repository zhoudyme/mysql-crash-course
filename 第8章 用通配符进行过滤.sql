1. 百分号(%)通配符
-- %表示任何字符出现任意次数，不匹配NULL
  SELECT prod_id, prod_name
  FROM products
  WHERE prod_name LIKE 'jet%'
2. 下划线(_)通配符
  SELECT prod_id, prod_name
  FROM products
  WHERE prod_name LIKE '_ ton anvil'
3. 使用通配符的技巧
  正如所见， MySQL的通配符很有用。但这种功能是有代价的：通配符搜索的处理一般要比前面讨论的其他搜索所花时间更长。这里给出一些使用通配符要记住的技巧。
	• 不要过度使用通配符。如果其他操作符能达到相同的目的，应该 使用其他操作符。
	• 在确实需要使用通配符时，除非绝对有必要，否则不要把它们用 在搜索模式的开始处。把通配符置于搜索模式的开始处，搜索起 来是最慢的。
	• 仔细注意通配符的位置。如果放错地方，可能不会返回想要的数.
