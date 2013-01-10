-- Login AQADMIN

conn aqadmin/aqadmin

BEGIN
   dbms_aq.unregister
     (sys.aq$_reg_info_list(
      sys.aq$_reg_info('AQADMIN.MSG_QUEUE:RECIPIENT',
                        DBMS_AQ.NAMESPACE_AQ,
                        'plsql://AQDEMO.notifyCB',
                        HEXTORAW('FF'))),
                        1);
end;
/
