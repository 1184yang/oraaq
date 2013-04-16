/* Login as AQADMIN at Local Site
|  Author: 楊震宇  xyang@mail.pec.com.tw
|  Modified on 2013/04/03
|
|  conn aqadmin/aqadmin
*/

/* 新增訂閱者, 可以有很多訂閱者 */
begin
   dbms_aqadm.add_subscriber
      (queue_name => 'aqadmin.msg_queue',
      /* 遠端的訂閱者, 對應的是遠端的 Queue => aqadmin.msg_queue@lx03 
         此例 Local 與 Remote 的 Queue 同名,但可以不同名；
         但是乘載的物件(包裹),必須相同 */
       subscriber => sys.aq$_agent('recipient',
                    'aqadmin.msg_queue@lx03', null));
end;
/

