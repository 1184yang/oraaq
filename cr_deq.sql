/* Login as AQDEMO, Create at Remote Site
|  Author: 楊震宇  xyang@mail.pec.com.tw
|  Modified on 2013/04/03
|
|  conn aqdemo/aqdemo
|
|  除了可用 Notification 自動 Dequeue 外, 也可手動 Dequeue 
|  SQL> exec dequeue_msg;
*/

connect aqdemo/aqdemo

create or replace procedure dequeue_msg
as
   dequeue_options    dbms_aq.dequeue_options_t;
   message_properties dbms_aq.message_properties_t;
   message_handle     RAW(16);
   message            aqdemo.message_typ;
BEGIN
   dequeue_options.consumer_name := 'RECIPIENT';

   DBMS_AQ.DEQUEUE(queue_name => 'aqadmin.msg_queue',
                   dequeue_options => dequeue_options,
                   message_properties => message_properties,
                   payload => message,
                   msgid => message_handle);

   insert into message_table values
   ( 'Dequeued and processed "' || message.text || '"' );

   COMMIT;
END;
/
show errors
