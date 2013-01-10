-- Create as AQADMIN create at local and remote site

--conn aqadmin/aqadmin

BEGIN
   dbms_aqadm.create_queue_table(
      queue_table => 'objmsg_qtab',
      multiple_consumers => TRUE,
      queue_payload_type => 'aqdemo.message_typ',
      compatible => '8.1',
      comment => 'Message Queue Table');

   dbms_aqadm.create_queue(
      queue_name => 'msg_queue',
      queue_table => 'objmsg_qtab',
      comment => 'Message Queue');

   dbms_aqadm.grant_queue_privilege(
      privilege => 'ALL',
      queue_name => 'aqadmin.msg_queue',
      grantee => 'aqdemo');

   dbms_aqadm.start_queue(
        queue_name => 'msg_queue');
END;
/
