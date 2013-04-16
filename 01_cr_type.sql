/* Create as AQDEMO at Local and Remote site
|  Author: 楊震宇  xyang@mail.pec.com.tw
|  Modified on 2013/01/10 測試 Git and Oracle SQL Developer
|
|  為了管理上的方便統一使用 AQADMIN 管理 Queue, 基本上 AQADMIN 應由專人管理。
|  AQDEMO 則類似一般的應用系統 Schema
|
|  connect aqdemo/aqdemo
|
*/

/*  這是 Oracle 物件,定義要透過 AQ 傳輸的資料, 類似我們要運送的包裹 */
create type Message_typ as object
(
 subject VARCHAR2(30),
 text    VARCHAR2(80)
)
/

/* 我們將用 AQADMIN 產生 Queue, 所以 Grant 使用此物件的權限給 AQADMIN */
grant execute on Message_typ to aqadmin;
