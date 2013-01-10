-- Create as AQDEMO at Local and Remote site
-- Author: 楊震宇  xyang@mail.pec.com.tw
-- Modified on 2013/01/10 測試 Git and Oracle SQL Developer

--connect aqdemo/aqdemo

create type Message_typ as object
(
 subject VARCHAR2(30),
 text    VARCHAR2(80)
)
/

grant execute on Message_typ to aqadmin;
