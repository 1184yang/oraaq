-- Login AQADMIN, Create at Remote Site

--conn aqadmin/aqadmin

BEGIN
   dbms_aq.register
     (sys.aq$_reg_info_list(
      sys.aq$_reg_info('AQADMIN.MSG_QUEUE:RECIPIENT',
                        DBMS_AQ.NAMESPACE_AQ,
                        'plsql://AQDEMO.notifyCB',
                        HEXTORAW('FF'))),
                        1);
end;
/
