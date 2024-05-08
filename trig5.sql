create or replace trigger trig5 before insert or update on emp_tab
for each row
begin
if :new.esal<0 or :new.esal>=5000
then
RAISE_APPLICATION_ERROR(-20500, 'Not a valid salary');
end if;
end;
/

