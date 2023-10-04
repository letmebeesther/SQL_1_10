-- SampleDB데이터베이스 / 책테이블, 출판사 테이블
-- 요리분야 책을 출판하는 출판사명 출력

select* from 책
select* from 출판사

select 출판사코드
from 책
where 분야 = '요리'

-- 서브쿼리 : 중복없음
select 출판사명
from 출판사
where 출판사코드 in (select 출판사코드 from 책 where 분야 in ('요리','경제'))

-- join on : 중복있음
select 출판사명
from 출판사 join 책
on 책.출판사코드 = 출판사.출판사코드
where 분야 in ('요리','경제')

-- join on + distinct : 중복없음
select distinct 출판사명
from 출판사 join 책
on 책.출판사코드 = 출판사.출판사코드
where 분야 in ('요리','경제')

-- SampleDB / 성적테이블
-- 평균점수 이상 되는 학생들 이름 출력
select avg(점수) 평균점수 from 성적

-- 서브쿼리
select 이름
from 성적
where 점수 >= (select avg(점수) 평균점수 from 성적)

-- 틀린구문
select 이름
from 성적
where 점수 >= avg(점수) -- 오류

-- SampleDB / 성적테이블 
-- 한효주 점수보다 높은 학생들 출력
select 점수 from 성적
where 이름 = '한효주'

select 이름 from 성적
where 점수 > (select 점수 from 성적 where 이름 = '한효주')

-- pubs데이터베이스 / sales테이블과 titles테이블
-- 평균 qty 이상의 qty의 title을 출력
select * from sales
select* from titles

select avg(qty) 평균qty from sales

select title_id from sales
where qty >= (select avg(qty) 평균qty from sales)

--서브쿼리
select title 서브쿼리
from titles
where title_id in (select title_id from sales where qty >= (select avg(qty) 평균qty from sales))

-- join on + distinct
select distinct title join문
from titles join sales
on titles.title_id = sales.title_id
where qty >= (select avg(qty) 평균qty from sales)

-- 상관관계 서브쿼리
-- SampleDB / 졸작평가 테이블
-- 각 조별 가장 높은 점수의 학생들의 조이름, 이름, 점수 출력
select 조이름, 이름, 점수 from 졸작평가

select max(점수) 가장높은점수
from 졸작평가 
where 조이름 = '베스트'

select max(점수) 가장높은점수
from 졸작평가 
where 조이름 = '예쁘조'

select max(점수) 가장높은점수
from 졸작평가 
where 조이름 = '점수조'

select max(점수) 가장높은점수
from 졸작평가 
where 조이름 = '학교짱'

select max(점수) 가장높은점수
from 졸작평가 
where 조이름 = '무한도전'

-- 상관관계 : 같은 테이블이지만 이름을 다르게 해서 비교
select s1.조이름, s1.이름, s1.점수
from 졸작평가 s1 
where s1.점수 = 
(select max(점수) 가장높은점수 from 졸작평가 s2 
where s2.조이름 = s1.조이름 ) 

-- pubs / sales 테이블
-- 각 서점별 최대판매량 출력
select qty, stor_id from sales

select s1.qty, s1.stor_id, s1.title_id from sales s1
where s1.qty = 
(select max(qty)
from sales s2 
where s2.stor_id = s1.stor_id ) 

-- employee 테이블
-- pub_id 별로 가장 높은 job_lvl을 가진 사람의 emp_id,pub_id,job_lvl 출력
select * from employee

select s1.emp_id, s1.pub_id, s1.job_lvl from employee s1
where s1.job_lvl =
(select max(job_lvl)
from employee s2 
where s2.pub_id = s1.pub_id ) 
