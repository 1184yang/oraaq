/* Login AQADMIN, Create at Remote Site
|  Author: 楊震宇  xyang@mail.pec.com.tw
|  Modified on 2013/04/03
|
|  conn aqadmin/aqadmin
|
|  將 Dequeue 的程式註冊到 Queue, 當有資料到達時會自動 Call 此程式；
|  這並非必要,你可手動執行 Dequeue 程式。
*/

BEGIN
   dbms_aq.register
     (sys.aq$_reg_info_list(
      sys.aq$_reg_info('AQADMIN.MSG_QUEUE:RECIPIENT',
                        DBMS_AQ.NAMESPACE_AQ,
                        /* Dequeue 的程式 */
                        'plsql://AQDEMO.notifyCB',
                        HEXTORAW('FF'))),
                        1);
end;
/
