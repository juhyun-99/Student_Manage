drop table student;

create table student (
	num      int constraint student_num_pk primary key
,	name    varchar2(20) constraint student_name_nn not null
,   gender varchar2(15) constraint student_gender_nn not null
,	korScore     int constraint student_kor_nn not null
,	engScore     int constraint student_eng_nn not null
,	mathScore    int constraint student_math_nn not null
,	sciScore     int constraint student_sci_nn not null
);

insert into student
values(20230211,'홍길동','남자', 100, 90, 100, 100);

insert into student
values(20230220,'김연아','여자', 100, 100, 95, 95);


commit;

select * from student;