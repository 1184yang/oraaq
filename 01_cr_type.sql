-- Create as AQDEMO at Local and Remote site

--connect aqdemo/aqdemo

create type Message_typ as object
(
 subject VARCHAR2(30),
 text    VARCHAR2(80)
)
/

grant execute on Message_typ to aqadmin;
