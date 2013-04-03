-- Run as aqdemo/aqdemo on Local Site
--
begin
   for i in 1..10000 loop
      enqueue_msg('第 '||i||' 訊息');
      if mod(i,1000) = 0 then
          commit;
      end if;
   end loop;
   commit;
end;
/
