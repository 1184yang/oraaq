/* Login as AQDEMO, Create at Remote Site
|  Author: 楊震宇  xyang@mail.pec.com.tw
|  Modified on 2013/04/03
|
|  conn aqdemo/aqdemo
|
|  當資料到達目的端時,會存在 Queue Table 中,你必須將其取出,稱為 Dequeue。
|  此程式用來 Dequeue 的, Dequeue 的資料要如何處裡, 就是你應用系統的邏輯了。
*/

create or replace procedure notifyCB( context raw,
                                      reginfo sys.aq$_reg_info,
                                      descr sys.aq$_descriptor,
                                      payload raw,
                                      payloadl number)
as
   dequeue_options    dbms_aq.dequeue_options_t;
   message_properties dbms_aq.message_properties_t;
   message_handle     RAW(16);
   /* 先前 Create 的物件,也就是傳輸的資料(Payload)(包裹) */
   message            aqdemo.message_typ;
BEGIN
   dequeue_options.msgid := descr.msg_id;
   dequeue_options.consumer_name := descr.consumer_name;
   DBMS_AQ.DEQUEUE(queue_name => descr.queue_name,
                   dequeue_options => dequeue_options,
                   message_properties => message_properties,
                   /* 接收的資料物件 */
                   payload => message,
                   msgid => message_handle);

   /* 單純的加入 Table, 或是你的程式邏輯 */
   insert into message_table values
    ( 'Dequeued and processed "' || message.text || '"' );
   COMMIT;
END;
/
show errors

/* 我們也可將此程式註冊到 Queue,當有資料到達時自動 Run 此程式,
   首先將此程式執行權限 Grant 給 AQADMIN */

grant execute on notifyCB to aqadmin;
