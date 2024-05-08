create or replace trigger trig1 before delete or insert or update on emp_tab
for each row
when(new.job='Clerk' or old.job='Clerk')
begin
if deleting then
insert into emp_x values(:old.eno,:old.ename,:old.esal,:old.job,sysdate);
elsif inserting then
insert into emp_new values(:new.eno,:new.ename,:new.esal,:new.job);
else
insert into emp_modified values(:old.eno,:old.ename,:old.esal,:old.job);
end if;
end;
/