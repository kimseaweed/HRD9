commit;

select * from TBL_TEACHER_202201;
select * from TBL_member_202201;
select * from TBL_class_202201;

create table TBL_TEACHER_202201( --t
teacher_code char(3) primary key,
teacher_name varchar2(15),
class_name varchar2(20),
class_price number(8),
teache_resist_date varchar(9)
);
create table TBL_member_202201( --m
c_no char(5) primary key,
c_name varchar2(15),
phone varchar2(11),
address varchar2(50),
grade varchar2(6)
);
create table  TBL_class_202201( --c
resist_month varchar2(6),
c_no char(5),
class_area varchar2(15),
tuiton number(8),
teacher_code char(3),
primary key(resist_month,c_no)
);

insert into TBL_TEACHER_202201 values('100','이초급','초급반',100000,'20220101');
insert into TBL_TEACHER_202201 values('200','김중급','중급반',200000,'20220102');
insert into TBL_TEACHER_202201 values('300','박고급','고급반',300000,'20220103');
insert into TBL_TEACHER_202201 values('400','정심화','심화반',400000,'20220104');

insert into TBL_member_202201 values('10001','홍길동','01011112222','서울시 강남구','일반');
insert into TBL_member_202201 values('10002','장발장','01022223333','성남시 분당구','일반');
insert into TBL_member_202201 values('10003','임꺽정','01033334444','대전시 유성구','일반');
insert into TBL_member_202201 values('20001','성춘향','01044445555','부산시 서구','VIP');
insert into TBL_member_202201 values('20002','이몽룡','01055556666','대구시 북구','VIP');

insert into TBL_class_202201 values('202203','10001','서울본원',100000,'100');
insert into TBL_class_202201 values('202203','10002','성남분원',100000,'100');
insert into TBL_class_202201 values('202203','10003','대전분원',200000,'200');
insert into TBL_class_202201 values('202203','20001','부산분원',150000,'300');
insert into TBL_class_202201 values('202203','20002','대구분원',200000,'400');


---------------------------------------------------------------------------------------

select teacher_code,teacher_name,class_name,'￦'||TO_char(class_price,'FM999,999,999,999,999'),substr(teache_resist_date,1,4)||'년'||substr(teache_resist_date,5,2)||'월'||substr(teache_resist_date,7,2)||'일' from TBL_TEACHER_202201;

insert into TBL_class_202201 values('202203','10001','서울본원',100000,'100');
insert into TBL_class_202201 values(?,?,?,?,?);

select substr(c.resist_month,1,4)||'년'||substr(c.resist_month,5,2)||'월', c.c_no,m.c_name,t.class_name,c.class_area,'￦'||to_char(c.tuiton,'FM999,999,999,999'),m.grade from TBL_TEACHER_202201 t join TBL_class_202201 c on t.teacher_code=c.teacher_code join TBL_member_202201 m on m.c_no = c.c_no;

select t.teacher_code,t.class_name,t.teacher_name, '￦'||to_char(sum(c.tuiton),'FM999,999,999,999') from TBL_TEACHER_202201 t join TBL_class_202201 c on t.teacher_code=c.teacher_code group by t.teacher_code,t.class_name,t.teacher_name order by t.teacher_code;