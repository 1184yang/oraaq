-- Login as AQDEMO at Local Site
-- Example: 1. enqueue_msg('This is AQ Test'); at Local Site
--          2. select * from message_table; from Remote Site

--connect aqdemo/aqdemo

create procedure enqueue_msg( p_msg in varchar2 )
as
   enqueue_options    dbms_aq.enqueue_options_t;
   message_properties dbms_aq.message_properties_t;
   message_handle     RAW(16);
   message            aqdemo.message_typ;
BEGIN
   message := message_typ('NORMAL MESSAGE',  p_msg );

   dbms_aq.enqueue(queue_name => 'aqadmin.msg_queue',
                   enqueue_options => enqueue_options,
                   message_properties => message_properties,
                   payload => message,
                   msgid => message_handle);
end;
/
show errors
