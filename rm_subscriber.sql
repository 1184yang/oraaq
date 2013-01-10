-- Login as AQADMIN

conn aqadmin/aqadmin

begin
   dbms_aqadm.remove_subscriber
      (queue_name => 'aqadmin.msg_queue',
       subscriber => sys.aq$_agent('recipient', null, null));
end;
/

