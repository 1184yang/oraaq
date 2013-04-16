/* Login as aqdemo at Local Site
|  Author: 楊震宇  xyang@mail.pec.com.tw
|  Modified on 2013/04/03
|
|  conn aqdemo/aqdemo
|  Create enqueue procedure enqueue_msg (開始傳送資料)
|  用法: 1. SQL> exec enqueue_msg('This is AQ Test'); at Local Site
|        2. SQL> select * from message_table;         from Remote Site
|
*/

create procedure enqueue_msg( p_msg in varchar2 )
as
   enqueue_options    dbms_aq.enqueue_options_t;
   message_properties dbms_aq.message_properties_t;
   message_handle     RAW(16);
   /* 先前 Create 的物件,也就是傳輸的資料(Payload)(包裹) */
   message            aqdemo.message_typ;
BEGIN
   /* 要傳送的資料物件 */
   message := message_typ('NORMAL MESSAGE',  p_msg );

   dbms_aq.enqueue(queue_name => 'aqadmin.msg_queue',
                   enqueue_options => enqueue_options,
                   message_properties => message_properties,
                   payload => message,
                   msgid => message_handle);
end;
/
show errors
