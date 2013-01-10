-- Login as AQDEMO, Create at Remote Site

--conn aqdemo/aqdemo

create or replace procedure notifyCB( context raw,
                                      reginfo sys.aq$_reg_info,
                                      descr sys.aq$_descriptor,
                                      payload raw,
                                      payloadl number)
as
   dequeue_options    dbms_aq.dequeue_options_t;
   message_properties dbms_aq.message_properties_t;
   message_handle     RAW(16);
   message            aqdemo.message_typ;
BEGIN
   dequeue_options.msgid := descr.msg_id;
   dequeue_options.consumer_name := descr.consumer_name;
   DBMS_AQ.DEQUEUE(queue_name => descr.queue_name,
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

grant execute on notifyCB to aqadmin;
