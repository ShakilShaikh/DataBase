-- + Write a program to display all the perfect number from a column of a table
--+ creating the function to check 1st
--+ 6 = 1+2+3 // perfect number

create or replace procedure isPerfect(num number)
is
sm number:=0;
i number;
begin

for i in 1..num/2 loop
if mod(num,i)=0 then
sm:=sm+i;
end if;
end loop;
if sm=num then
dbms_output.put_line(num);
end if;
end;

--+ cursor to send data to isPerfect
declare
c_num perf.nums%type;
cursor c_pref is
select nums from pref;
begin
open c_pref;
loop
fetch c_pref into c_num;
exit when c_num%not found;
isPerfect(c_num);
end loop;
close c_pref
end;
