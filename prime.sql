/*
Shakil Ibne Shaikh
Oracle
*/
-- + Write a program to count the prime number from previously stored values in a column of a table using pl/sql
--+ Creating the Table 1st

create table prim
(
num number(10)
);

--+ Generating 1..100

declare
i number;
begin
for 1..100 loop
insert into prim values(i);
end loop;
end;


--+ Now checking the the primes
declare
n number;
i number;
f number:=1;
total number:=0;
begin
--+ Selecting only the odd numbers
for w in (select nums from prim where nums&gt;1 and mod(nums,2)!=0) loop
n:=w.nums;
f:=1;
for i in 2..n/2 loop
if mod(n,i)=0 then
f:=0;
exit;
end if;
end loop;
if f=1 then
dbms_output.put_line(n);
total:=total+1;
end if;
end loop;
dbms_output.put_line(&#39;Total &#39;|| total);
end;
