create or replace PROCEDURE  mine (
input_date   varchar2,
input_type varchar2) IS
lastday varchar2(10);
num number;
BEGIN  
    select to_char (LAST_DAY(TO_DATE(input_date, 'MM/YY')),'Day') into lastday from dual;
    DBMS_OUTPUT.PUT_LINE('Last day of the month '||input_date||' is '||lastday );
    case 
	when upper(input_type)='P' then
		select count(*) into num from user_objects where upper(object_type)='PROCEDURE';
		DBMS_OUTPUT.PUT_LINE('Number of stored objects of type '||input_type||' is '||num); 
	when upper(input_type)='F' then
		select count(*) into num from user_objects where upper(object_type)='FUNCTION';
		DBMS_OUTPUT.PUT_LINE('Number of stored objects of type '||input_type||' is '||num); 
	when UPPER(input_type)='B' then
		select count(*) into num from user_objects where upper(object_type)='PACKAGE BODY';
		DBMS_OUTPUT.PUT_LINE('Number of stored objects of type '||input_type||' is '||num); 
	else
		DBMS_OUTPUT.PUT_LINE('You have entered an Invalid letter for the stored object. Try P, F or B. ');
    end case;
Exception
	WHEN others then
	DBMS_OUTPUT.PUT_LINE('You have entered an Invalid FORMAT for the MONTH and YEAR. Try MM/YY. ');
END  mine;
/
