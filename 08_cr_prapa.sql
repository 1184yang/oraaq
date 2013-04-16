/* Login as aqadmin at Local Site
|  Author: 楊震宇  xyang@mail.pec.com.tw
|  Modified on 2013/04/03
|
|  conn aqadmin/aqadmin
|  當 Local 與 Remote 不同 Database, 要啟動 Local 端的 Propatation
*/

/* 停止 Propagation */
/*
BEGIN
   dbms_aqadm.unschedule_propagation(
        queue_name => 'aqadmin.msg_queue',
        destination => 'lx03');
END;
/
*/

/* 啟動 Propagation */
BEGIN
   dbms_aqadm.schedule_propagation(
        queue_name => 'aqadmin.msg_queue',
        /* 遠端資料庫 (Database link)*/
        destination => 'lx03',
        latency => 0);
   dbms_output.put_line (
      'Scheduled propagation from msg_queue to other queues.');
END;
/
