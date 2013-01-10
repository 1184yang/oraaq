-- Login as AQADMIN at Local Site

--conn aqadmin/aqadmin

begin
   dbms_aqadm.add_subscriber
      (queue_name => 'aqadmin.msg_queue',
      subscriber => sys.aq$_agent('recipient',
                    'aqadmin.msg_queue@lx01', null));
end;
/

