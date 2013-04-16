/* Create as AQADMIN Create at Local and Remote Site
|  Author: 楊震宇  xyang@mail.pec.com.tw
|  Modified on 2013/04/03
|
|  conn aqadmin/aqadmin
|
|  Create AQ Queue, Local 與 Remote 都要 Create Queue,但名稱可以不同
|    1. Create Queue Table
|    2. Create Queue
|    3. Start Queue
*/

BEGIN
   /* 1. Create Queue Table, 用來儲存傳送或接收的資料 */
   dbms_aqadm.create_queue_table(
      /* Queue Table Name */
      queue_table => 'objmsg_qtab',
      multiple_consumers => TRUE,
      /* 先前 Create 的物件,也就是要傳輸的資料(Payload)(包裹) */
      queue_payload_type => 'aqdemo.message_typ',
      compatible => '8.1',
      comment => 'Message Queue Table');

   /* 2. Create Queue */
   dbms_aqadm.create_queue(
      queue_name => 'msg_queue',
      queue_table => 'objmsg_qtab',
      comment => 'Message Queue');
 
   /* Grant 執行此 Queue 的權限給 AQDEMO, 我們將用 AQDEMO 傳送資料 */ 
   dbms_aqadm.grant_queue_privilege(
      privilege => 'ALL',
      queue_name => 'aqadmin.msg_queue',
      grantee => 'aqdemo');

   /* 啟動 Queue */
   dbms_aqadm.start_queue(
        queue_name => 'msg_queue');
END;
/
