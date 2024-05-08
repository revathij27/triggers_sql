create or replace trigger trig1 before delete on emp_tab
for each row
begin
if deleting then
insert into emp_x values(:old.eno,:old.ename,:old.esal,:old.job,sysdate);
end if;
end;
/