-- 비밀번호 변경
alter user hr IDENTIFIED by hr;


-- 새로운 사용자 생성
-- common_user_prefix parameter
create user c##scott IDENTIFIED BY tiger
default tablespace users
TEMPORARY TABLESPACE temp;

-- 새로운 사용자에게 권한 부여
grant connect, RESOURCE, dba to c##scott;



--사용자 관리
-- scott , hr .. 오라클 데이터 베이스가 기본 계정으로 제공

-- 오라클 데이터베이스 특징
-- 테이블, 인덱스, 뷰 ...여러가지 객체가 사용자 별로 생성되고 관리

-- 데이터 베이스 스키마
-- 데이터 간 관계, 데이터 구조, 제약조건등 데이터를 저장 및 관리하기 위해 정의한 데이터베이스 구조의 범위
-- 사용자 == 스키마

-- 사용자 생성
create user c##test IDENTIFIED BY 12345;
-- 사용자 비밀번호 변경
alter user c##test identified by 54321;
-- 사용자 삭제(cascade = 현재 사용자가 만든 모든 객체 같이 삭제)
drop user c##test2 cascade;


--권한 관리
-- 시스템 권환: 사용자 생성, 정보수정, 삭제, 데이터베이스 접근, 객체 생성....


--상태: 실패 -테스트 실패: ORA-01045: 사용자 C##TEST는 CREATE SESSION 권한을 가지고있지 않음; 로그온이 거절되었습니다.
-- 권한 부여
grant create session to c##test;
grant create  table to c##test;

create user c##test2 identified by 12345
default tablespace users
TEMPORARY TABLESPACE temp;

grant resource,create session, create table to c##test2;
-- resource 는 다른거 롤 같은개념 resource 에는 trigger,sequence,table ..생성 권한들이 모여있는 롤
-- 그럼 resource 안에 테이블생성도 있는데 create table 를 또 쓴거아니냐 라고할수있는데 똑같은권한 줘도 오류나지않아서 썼다.

--c##test2에게 user 테이블 공간 2m 할당
alter user c##test2 quota 2M on users;






