1. 管理用户
  USE mysql;
  SELECT user FROM user;
2. 创建用户
  CREATE USER ben identified BY 'p@$$w0rd';
  为了重新命名一个用户账号，使用RENAME USER语句，如下所示：
  RENAME USER ben TO bforta;
3. 删除用户账号
  DROP USER bforta;
4. 设置访问权限
• 为看到赋予用户账号的权限，使用show grants for,如下所示：
  SHOW GRANTS FOR bforta;
• 以下例子给出grant的用法： 
  GRANT SELECT ON crashcourse.* TO bforta;
• GRANT的反操作为REVOKE，用它来撤销特定的权限。下面举一个例子：
  REVOKE SELECT ON crashcourse.* FROM bforta;
  GRANT和REVOKE可在几个层次上控制访问权限：
• 整个服务器，使用GRANT ALL和REVOKE all;
• 整个数据库，使用ON database.*;
• 特定的表，使用ON database.table;
• 特定的列;
• 特定的存储过程。
  简化多次授权 可通过列出各权限并用逗号分隔，将多条grant语句串在一起，如下所示：
  GRANT SELECT, INSERT ON crashcourse.* TO bforta;
5. 更多口令
• 为了更改口令，可使用set password语句。新口令必须如下加密：
  SET PASSWORD FOR bforta = PASSWORD('n3w p@$$w0rd');
• SET PASSWORD还可以用来设置你自己的口令：
  SET PASSWORD = PASSWORD('n3w p@$$w0rd');