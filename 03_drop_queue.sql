-- Login as AQADMIN at Local and Remote Site

--conn aqadmin/aqadmin
CREATE or REPLACE PROCEDURE catch_error ( error_code in number,
                                          error_string in varchar2)
AS
BEGIN
  dbms_output.put_line('Oracle Server Error = '|| to_char (error_code));
  dbms_output.put_line('Oracle Server Message = '|| error_string);
END;
/

DECLARE
BEGIN
  dbms_output.put_line ('Stopping Queue msg_queue...');
  dbms_aqadm.stop_queue (
     queue_name => 'msg_queue',
     wait       => TRUE);

  dbms_output.put_line ('Stopped Queue msg_queue.');
exception
  when others then
     catch_error(SQLCODE, 'Stop Queue ' || substr(SQLERRM, 1, 256));
END;
/

DECLARE
BEGIN
  dbms_output.put_line ('Dropping Queue msg_queue...');
  dbms_aqadm.drop_queue (queue_name => 'msg_queue');

  dbms_output.put_line ('Dropped Queue msg_queue.');
exception
  when others then
     catch_error(SQLCODE, 'Drop Queue ' || substr(SQLERRM, 1, 256));
END;
/

DECLARE
BEGIN
   dbms_output.put_line ('Dropping Queue Table objmsg_qtab...');
   dbms_aqadm.drop_queue_table (
      queue_table => 'objmsg_qtab',
      force => TRUE);

   dbms_output.put_line ('Dropped Queue Table objmsg_qtab.');
exception
  when others then
    catch_error(SQLCODE, 'Drop Queue Table ' || substr(SQLERRM, 1, 256));
END;
/
