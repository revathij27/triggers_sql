CREATE OR REPLACE TRIGGER mytrig BEFORE DELETE OR INSERT OR UPDATE ON emp_tab
BEGIN     
IF (TO_CHAR(SYSDATE, 'dy') IN ('sat', 'sun'))
OR     
(TO_CHAR(SYSDATE,'hh24:mi') NOT BETWEEN '08:30' AND '18:30') 
THEN           
RAISE_APPLICATION_ERROR(-20500, 'table is secured');     
END IF;
END;
/
