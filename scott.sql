-- SQL 은 대소문자 구별은 안함(쿼리문)
-- 대소문자 구별은 비밀번호만 함
-- 문자열 표현할 때 홑따옴표 사용함

-- scott 계정에 존재하는 모든 테이블 조회
SELECT
    *
FROM
    tab;

-- 조회(Select) : 행 단위로 조회, 열 단위로 조회

-- emp 테이블의 내용을 전체조회
SELECT
    *
FROM
    emp;

-- emp 테이블의 empno, ename, job만 조회
SELECT
    empno,
    ename,
    job
FROM
    emp;

-- emp 테이블의 empno, deptno 조회
SELECT
    empno,
    deptno
FROM
    emp;


-- 중복 제거 후 조회 : distinct

SELECT DISTINCT
    deptno
FROM
    emp;

-- 별칭을 붙여서 조회 : AS(alais)
SELECT
    empno AS 사원번호
FROM
    emp;

SELECT
    ename           AS 사원명,
    job             AS "직 책",
    sal             AS 급여,
    comm            AS 추가수당,
    sal * 12 + comm AS 연봉
FROM
    emp;
    

-- 정렬 : ORDER BY 컬럼명 기준(오름차순(ASC),내림차순(DESC))

-- ename,sal 조회할 때 sal 내림차순으로 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

-- 오름차순(생략가능-기본값)
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;

-- EMP 테이블의 전체 내용을 조회하고, 단 사원번호 내림차순 정렬
SELECT
    *
FROM
    emp
ORDER BY
    empno DESC;
    
-- 전체 내용 조회(부서번호 오름차순, 급여 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

-- [문제] 조회할 테이블은 EMP 테이블이며 모든 열을 출력한다.
SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no,
    job,
    hiredate
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;
    

-- 특정 조건을 기준으로 원하는 데이터를 조회 : WHERE  

-- 전체 데이터 조회, 단, 부서번호가 30번인 데이터 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;
    
-- 사원번호가 7782 번 조회    
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- 부서번호가 30번이고, 사원직책이 SALESMAN 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

-- 사원번호가 7499이고, 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;


-- 부서번호가 30이거나 사원직책이 CLERK인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';


-- 연산자를 사용한 WHERE

-- 연봉이 36000 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

-- 월급이 3000 보다 큰 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal > 3000;

-- 월급이 3000 이상인  사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

-- 이름의 첫 글자가 F 이후인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

-- 급여가 2500이상이고, 직업이 ANALYST인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

-- 직무가 SALESMAN 이거나, CLERK 이거나, MANAGER 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'ANALYST'
    OR job = 'CLERK'
    OR job = 'MANAGER';

-- 등가비교연산자(같음  = ,  같지않음 =>  !=, <>, ^=)
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;

SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;


-- IN 

SELECT
    *
FROM
    emp
WHERE
    job IN ( 'ANALYST', 'CLERK', 'MANAGER' );

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'ANALYST', 'CLERK', 'MANAGER' );

-- 부서번호가 10,20번 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );


-- BETWEEN A AND B 

-- 급여가 2000 ~ 3000 사이인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

-- 급여가 2000 ~ 3000 사이가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드
-- 일부 문자열이 포함된 데이터 조회
-- 와일드카드 
-- ①  % : 길이와 상관없이 모든 문자 데이터를 의미
-- ②  _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미


-- 사원명이 S로 시작하는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

-- 사원명의 두번째 글자가 L인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

-- 사원명에 AM 문자가 포함되어 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

-- 사원명에 AM 문자가 포함되어 있지 않은 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

-- IS NULL 
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;
-- NULL 은 0이 아니고 완전히 비어 있는 상태를 의미

-- MGR이 NULL 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

-- MGR이 NULL이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

-- 집합 연산자 : 합집합 - UNION, UNION ALL(중복값을 제거하지 않음), 
--               교집합 - INTERSECT
--               차집합 - MINUS


-- EMPNO,ENAME,SAL,DEPTNO 조회(부서번호가 10번이거나 20번인)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    sal,
    job,
    deptno,
    sal
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;


-- 오라클 함수

-- 내장함수 - 1) 문자함수

--               대소문자 변경
--               UPPER(문자열) : 괄호 안 문자를 모두 대문자로 변환
--               LOWER(문자열) : 괄호 안 문자를 모두 소문자로 변환
--               INITCAP(문자열) : 괄호 안 문자 중 첫글자만 대문자로 변환, 나머지는 소문자

SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

-- ENAME이 SCOTT 인 찾기
SELECT
    *
FROM
    emp
WHERE
    lower(ename) = lower('scott');

SELECT
    *
FROM
    emp
WHERE
    lower(ename) LIKE lower('%scott%');


--               문자 길이 구하기
--               LENGTH(문자열) : 해당 문자열의 길이 돌려줌
--               LENGTHB(문자열) : 해당 문자열의 바이트수 돌려줌

SELECT
    ename,
    length(ename)
FROM
    emp;

-- 한글 한 자당 3BYTE 사용
-- DUAL : 데이터베이스 관리자가 소유한 테이블 / 임시 연산이나 함수의 결과 값 확인 용도
SELECT
    length('한글'),
    lengthb('한글')
FROM
    dual;

-- JOB 이 6글자 이상인 사원들 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;

--               문자열 일부를 추출하기
--               SUBSTR(문자열데이터,시작위치,추출길이)
--               SUBSTR(문자열데이터,시작위치)
SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

-- EMP 테이블의 모든 사원 이름을 세 번째 글자부터 끝까지 출력하기
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;


--               문자열 데이터 안에서 특정 문자를 찾기
--               INSTR(문자열,찾을 문자열,시작위치(옵션), 몇번째에 있는걸 찾을 것인지(옵션)) 

SELECT
    instr('HELLO, ORACLE!', 'L'),
    instr('HELLO, ORACLE!', 'L', 5),
    instr('HELLO, ORACLE!', 'L', 2, 2)
FROM
    dual;
    
-- 원본 문자열 : 이것이 Oracle이다. 이것도 오라클이다.
-- 찾을 문자열 : 이것

-- 제일 처음에 나오는 이것의 위치를 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것')
FROM
    dual;

-- 시작위치를 3으로 지정한 후 나오는 이것의 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 3)
FROM
    dual;

-- 이것이 두번째로 나오는 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 1, 2)
FROM
    dual;


-- 사원 이름에 문자 S가 있는 사원 구하기
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'S') > 0;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S%';


--               특정 문자를 다른 문자로 바꾸는 함수
--               REPLACE(문자열 데이터 또는 열이름,찾는문자,바꿀문자)

-- 010-1234-5678 => 010 1234 5678, 01012345678
SELECT
    '010-1234-5678'                    AS 원본,
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')      AS replace2
FROM
    dual;
    

--               두 문자열 데이터를 합치는 함수
--               CONCAT(문자열1,문자열2)

-- EMPNO,ENAME 합쳐서 조회
SELECT
    empno,
    ename,
    concat(empno, ename)
FROM
    emp
WHERE
    ename = 'SCOTT';
    
-- 7788:SCOTT     
SELECT
    empno,
    ename,
    concat(empno, concat(':', ename))
FROM
    emp
WHERE
    ename = 'SCOTT';  
    
-- || : 문자열 데이터 연결 연산자

SELECT
    empno || ename,
    empno
    || ':'
    || ename
FROM
    emp
WHERE
    ename = 'SCOTT';
    
--  문자열 함수 : 공백제거(기본)
--                TRIM : 양쪽 공백 제거
--                LTRIM : 왼쪽 공백 제거
--                RTRIM : 오른쪽 공백 제거

SELECT
    '    이것이    ',
    TRIM('    이것이    ')
FROM
    dual;
    
    
    
-- TRIM(삭제옵션(선택), 삭제할 문자(선택), from 원본문자열)  
SELECT
    '['
    || TRIM('_' FROM '__Oracle__')
    || ']' AS trim,
    '['
    || TRIM(LEADING '_' FROM '__Oracle__')
    || ']' AS trim_leading,
    '['
    || TRIM(TRAILING '_' FROM '__Oracle__')
    || ']' AS trim_trailing,
    '['
    || TRIM(BOTH '_' FROM '__Oracle__')
    || ']' AS trim_both
FROM
    dual;
    
    
-- 숫자함수 : ROUND(숫자,반올림 위치(선택))
--            TRUNC(숫자,버림 위치(선택))
--            CEIL(숫자) : 입력된 숫자와 가장 가까운 큰 정수
--            FLOOR(숫자) : 입력된 숫자와 가장 가까운 작은 정수
--            MOD(숫자,나눌숫자) : 나머지 값

SELECT
    round(1234.5678)      AS round,
    round(1234.5678, 0)   AS round0,
    round(1234.5678, 1)   AS round1,
    round(1234.5678, 2)   AS round2,
    round(1234.5678, - 1) AS round_minus1,
    round(1234.5678, - 2) AS round_minus2
FROM
    dual;

SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc0,
    trunc(1234.5678, 1)   AS trunc1,
    trunc(1234.5678, 2)   AS trunc2,
    trunc(1234.5678, - 1) AS trunc_minus1,
    trunc(1234.5678, - 2) AS trunc_minus2
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;
    
-- 날짜함수
-- SYSDATE : 오라클 데이터베이스 서버가 설치된 os의 현재 날짜와 시간
-- ADD_MONTHS : 몇 개월 이후 날짜를 구하는 함수

SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;

SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;


-- 입사 20주년이 되는 날짜 조회
SELECT
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;
    
-- 현재 날짜를 기준으로 입사 40년 미만인 사원 조회

SELECT
    ename,
    hiredate
FROM
    emp
WHERE
    add_months(hiredate, 480) > sysdate;





-- MONTHS_BETWEEN : 두 날짜 간의 개월 수 차이 구하기
SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(sysdate, hiredate)        AS month1,
    months_between(hiredate, sysdate)        AS month2,
    trunc(months_between(sysdate, hiredate)) AS month3
FROM
    emp;
    
-- next_day(날짜,요일문자)
-- last_day(날짜)

SELECT
    sysdate,
    next_day(sysdate, '월요일'),
    last_day(sysdate)
FROM
    dual;

-- 형변환 함수
-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환
SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD') AS 현재날짜
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'MM') AS 현재월
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'MON') AS 현재월
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH:MI:SS') AS 현재시간
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH12:MI:SS AM') AS 현재시간
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH24:MI:SS') AS 현재시간
FROM
    dual;

-- L(Locale) : 지역화폐단위를 붙여서 출력
-- 9, 0 : 숫자의 한 자리를 의미함(9는 빈자리를 채우지 않음, 0 빈자리를 채우는 개념)
SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$,
    to_char(sal, '$000,000') AS sal_$2,
    to_char(sal, 'L999,999') AS sal_l
FROM
    emp;

SELECT
    to_number('1,300', '999,999')
FROM
    dual;

SELECT
    TO_DATE('2021-09-12', 'YYYY-MM-DD') AS todate1,
    TO_DATE('20210912', 'YYYY-MM-DD')   AS todate2
FROM
    dual;

-- 날짜 데이터는 연산이 가능함
-- 1981-06-01 이후 입사자

SELECT
    *
FROM
    emp
WHERE
    hiredate > TO_DATE('1981/06/01', 'YYYY-MM-DD');


-- 널처리 함수
-- NVL(데이터,널이면 반환할 값)
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm
FROM
    emp;

SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;

-- NVL2(데이터,널이 아닐경우 반환할 값,널이면 반환할 값)
SELECT
    empno,
    ename,
    sal,
    comm,
    nvl2(comm, 'O', 'X'),
    nvl2(comm, sal * 12 + comm, sal * 12)
FROM
    emp;
    

-- DECODE 함수
-- DECODE([검사 대상이 될 열 또는 데이터],
--        [조건1],[데이터가 조건 1과 일치할 때 반환할 결과],
--        [조건2],[데이터가 조건 2와 일치할 때 반환할 결과],
--        ......
--        [위 조건들 중에서 일치한 경우가 없을 때 반환할 결과])

-- job 에 따라 급여의 비율 설정
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS upsal
FROM
    emp;
    
-- CASE : DECODE 문으로 작성할 수 있는 것들은 모두 변환 가능
--        = 의 의미로 사용되지만 다른 조건도 가능하다
SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ANALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS upsal
FROM
    emp;




-- COMM 이 널이면 '해당사항 없음', 0 이면 '수당없음', 0보다 크면 '수당 : 2500' 출력
SELECT
    empno,
    ename,
    comm,
    CASE
        WHEN comm IS NULL THEN
            '해당사항없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm > 0 THEN
            '수당 : ' || comm
    END AS comm_text
FROM
    emp;


-- [실습] EMP 테이블에서 사원들의 월 평균 근무일수는 21.5일이다.
-- 하루 근무 시간을 8시간으로 보았을 때 사원들의 하루 급여(DAY_PAY)와 
-- 시급(TIME_PAY)를 계산하여 결과를 출력한다. 
-- 단, 하루 급여는 소수점 셋째 자리에서 버리고, 시급은 두 번째 소수점에서 반올림하시오.

-- 하루급여 = 월급 / 21.5
-- 시급 = 하루급여 / 8

SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;


-- [실습] EMP 테이블에서 사원들은 입사일(HIREDATE)을 기준으로 3개월이 지난 후 
-- 첫 월요일에 정직원이 된다. 사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 
-- 형식으로 아래와 같이 출력하시오.
-- 단, 추가수당(COMM)이 없는 사원의 추가 수당은 N/A로 출력하시오.

SELECT
    comm,
    nvl(comm, 0)
FROM
    emp;

SELECT
    comm,
    nvl(comm, '0')
FROM
    emp;

SELECT
    comm,
    nvl(comm, 'N/A')
FROM
    emp;

SELECT
    comm,
    nvl(to_char(comm), 'N/A')
FROM
    emp;

SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3), '월요일') AS r_job,
    nvl(to_char(comm), 'N/A')                AS comm
FROM
    emp;
    
    
-- [실습] EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 
-- 다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오.

--직속상관의 사원 번호가 존재하지 않을 경우 : 0000
--직속상관의 사원 번호 앞 두자리가 75일 경우 : 5555
--직속상관의 사원 번호 앞 두자리가 76일 경우 : 6666
--직속상관의 사원 번호 앞 두자리가 77일 경우 : 7777
--직속상관의 사원 번호 앞 두자리가 78일 경우 : 8888
--그 외 직속 상관 사원 번호의 경우 : 본래 직속 상관의 사원번호 그대로 출력

SELECT
    empno,
    ename,
    mgr,
    decode(substr(to_char(mgr), 1, 2), NULL, '0000', '75', '5555',
           '76', '6666', '77', '7777', '78',
           '8888', substr(to_char(mgr), 1)) AS chg_mgr
FROM
    emp;

SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN substr(to_char(mgr), 1, 2) = '75' THEN
            '5555' -- WHEN MGR LIKE '75%' THEN '5555'
        WHEN substr(to_char(mgr), 1, 2) = '76' THEN
            '6666'
        WHEN substr(to_char(mgr), 1, 2) = '77' THEN
            '7777'
        WHEN substr(to_char(mgr), 1, 2) = '78' THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;    
    
    
-- 다중행 함수 : SUM(), COUNT(), MAX(), MIN(), AVG()    

SELECT
    SUM(sal)
FROM
    emp;

-- SELECT SUM(SAL),ENAME FROM EMP; -- 단일 그룹의 그룹 함수가 아닙니다

-- EMP 테이블의 데이터 개수 조회
SELECT
    COUNT(*)
FROM
    emp;

SELECT
    COUNT(empno)
FROM
    emp;

SELECT
    COUNT(sal)
FROM
    emp;

SELECT
    COUNT(DISTINCT sal)
FROM
    emp;

-- 부서번호가 10번인 사원의 최대 급여
SELECT
    MAX(sal)
FROM
    emp
WHERE
    deptno = 10;
-- 부서번호가 10번인 사원의 최소 급여
SELECT
    MIN(sal)
FROM
    emp
WHERE
    deptno = 10;

-- 부서번호가 20번인 사원 중에서 제일 오래된 입사일 조회
SELECT
    MIN(hiredate)
FROM
    emp
WHERE
    deptno = 20;

-- 부서번호가 30번인 사원들의 평균 급여 조회
SELECT
    AVG(sal)
FROM
    emp
WHERE
    deptno = 30;

SELECT
    avg(DISTINCT sal)
FROM
    emp
WHERE
    deptno = 30;


-- GROUP BY 그룹화할 열 지정(여러개 지정 가능)


-- 부서별 급여의 합 조회
SELECT
    SUM(sal),
    deptno
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;

-- 부서별 급여 평균 조회
SELECT
    AVG(sal),
    deptno
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;

-- 부서별,직무별 급여 평균 조회
SELECT
    AVG(sal),
    deptno,
    job
FROM
    emp
GROUP BY
    deptno,
    job
ORDER BY
    deptno,
    job;

-- GROUP BY ~ HAVING 조건식

-- 부서별, 직무별 급여 평균 조회(단, 급여의 평균이 2000 이상)

--SELECT DEPTNO, JOB, AVG(SAL)
--FROM emp
--WHERE AVG(SAL) >= 2000 -- 그룹 함수는 허가되지 않습니다
--GROUP BY DEPTNO,JOB
--ORDER BY DEPTNO, JOB;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    sal <= 3000  -- ① 출력 대상이 되는 행 제한
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000 -- ② 그룹화한 행 제한
ORDER BY
    deptno,
    job;   
    
-- [실습1] EMP 테이블을 이용하여 부서번호(DEPTNO), 평균급여(AVG_SAL), 
-- 최고급여(MAX_SAL), 최저급여(MIN_SAL), 사원수(CNT)를 출력한다.
-- 단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서번호별로 출력하는 SQL 문을 작성하시오.

SELECT
    deptno,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        max_sal,
    MIN(sal)        min_sal,
    COUNT(*)
FROM
    emp
GROUP BY
    deptno;


-- [실습2] 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하는 SQL문을 작성하시오.

SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;


-- [실습3] 사원들의 입사연도(HIRE_YEAR)를 기준으로 부서별로 몇 명이 입사했는지 
-- 출력하는 SQL문 작성하시오.
SELECT
    to_char(hiredate, 'YYYY') AS hire_year,
    deptno,
    COUNT(*)                  AS cnt
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno
ORDER BY
    hire_year DESC,
    deptno ASC;

-- 데이터 삽입, 삭제, 수정 : 결과는 실행된 행의 갯수로 넘어옴

-- 실습용 테이블 생성
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

SELECT
    *
FROM
    dept_temp;

-- insert : 데이터 삽입
-- insert into 테이블명(필드명.....) values(값1,값2....)
-- insert into 테이블명 values(값1,값2....)

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);

INSERT INTO dept_temp VALUES (
    'NETWORK',
    'BUSAN',
    70
);    -- ORA-01722: 수치가 부적합합니다
INSERT INTO dept_temp (
    dname,
    loc,
    deptno
) VALUES (
    'NETWORK',
    'BUSAN',
    70
);  

-- 이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
-- insert into dept_temp(deptno, dname, loc) values(500,'DATABASE','SEOUL'); 

-- NULL 삽입하는 방법(테이블 생성시 널이 가능하도록 열이 설정되어 있는 경우만 사용 가능)
INSERT INTO dept_temp (
    deptno,
    dname
) VALUES (
    90,
    'DATABASE'
);

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    91,
    'WEB',
    NULL
);

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    92,
    'MOBILE',
    ''
);

COMMIT;



-- 실습용 테이블 생성
-- 테이블 구조는 복사하되, 데이터는 복사하고 싶지 않을 때
CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

SELECT
    *
FROM
    emp_temp;

DESC emp_temp;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    1111,
    '홍길동',
    'manager',
    NULL,
    '2021-09-27',
    4000,
    NULL,
    10
);

INSERT INTO emp_temp VALUES (
    2222,
    '성춘향',
    'analyst',
    NULL,
    '2021/09/27',
    5000,
    NULL,
    10
);

INSERT INTO emp_temp VALUES (
    3333,
    '박보검',
    'analyst',
    NULL,
    sysdate,
    5000,
    NULL,
    10
);

SELECT
    *
FROM
    emp_temp;

DESC emp_temp;

COMMIT;

-- UPDATE : 수정
-- UPDATE 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값....
-- UPDATE 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값.... WHERE 수정할 조건

SELECT
    *
FROM
    dept_temp;

UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = 90;

UPDATE dept_temp
SET
    loc = 'BUSAN'
WHERE
    deptno = 91;

COMMIT;

SELECT
    *
FROM
    emp_temp;

-- SAL 이 4000이하인 사원만 추가 수당을 50으로 변경
UPDATE emp_temp
SET
    comm = 50
WHERE
    sal <= 4000;

COMMIT;

UPDATE emp_temp
SET
    sal = 6500
WHERE
    empno = 1111;

UPDATE emp_temp
SET
    comm = 100;

ROLLBACK;

-- DELETE : 삭제 
-- DELETE 테이블 이름 WHERE 삭제할 데이터 조건
-- DELETE FROM 테이블 이름 WHERE 삭제할 데이터 조건

CREATE TABLE emp_temp2
    AS
        SELECT
            *
        FROM
            emp;

SELECT
    *
FROM
    emp_temp2;

-- JOB이 MANAGER인 사원 삭제
DELETE emp_temp2
WHERE
    job = 'MANAGER';

-- 전체 사원 삭제
DELETE emp_temp2;

ROLLBACK;
    
-- 조인

SELECT
    COUNT(*)
FROM
    emp;

SELECT
    COUNT(*)
FROM
    dept;


-- 카테시안 조인 : 나올 수 있는 모든 조합(14행 * 4행 = 56행)
SELECT
    *
FROM
    emp,
    dept;


-- 내부조인(inner 조인)
-- 등가조인 : 일치하는 데이터 추출
-- 비등가 조인 : 특정 범위에 있는 데이터 추출


SELECT
    *
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;

-- 00918. 00000 -  "column ambiguously defined" 열의 정의가 애매합니다
SELECT
    empno,
    ename,
    emp.deptno,
    dname
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;

SELECT
    empno,
    ename,
    emp.deptno,
    dname
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno
ORDER BY
    dname;

-- 테이블 별칭 설정

SELECT
    empno,
    ename,
    e.deptno,
    dname
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno
ORDER BY
    dname;    
   
-- sal 3000 이상인 사원들의 사번,이름,부서번호,부서명,급여   
SELECT
    empno,
    ename,
    d.deptno,
    dname,
    sal
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal >= 3000;

-- 급여가 2500 이하이고, 사원번호가 9999 이하인 사원의 사번,이름,급여,부서명,부서위치
SELECT
    empno,
    ename,
    sal,
    dname,
    loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal <= 2500
    AND empno <= 9999;


-- emp 테이블의 급여가 salgrade 특정 범위에 속하면 grade 값 조회
SELECT
    *
FROM
    salgrade;

SELECT
    *
FROM
    emp;

SELECT
    *
FROM
    emp      e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal;

   
-- 자체 조인(셀프 조인) : 본인 테이블과 조인
SELECT
    *
FROM
    emp;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;

-- 외부조인(outer join)
-- 왼쪽외부조인(left outer join)  
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno (+);  
  
  
-- 오른쪽외부조인(right outer join)  
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr (+) = e2.empno;    
  
-- 양쪽외부조인(+ 기호는 제공안함)  
-- outer-join된 테이블은 1개만 지정할 수 있습니다
--select e1.empno, e1.ename,e1.mgr, e2.empno, e2.ename
--from emp e1, emp e2
--where e1.mgr(+) = e2.empno(+);   
   

-- 모든 데이터 베이스에서 사용가능한 표준 조인 구문

-- join~on

SELECT
    empno,
    ename,
    emp.deptno,
    dname
FROM
         emp
    JOIN dept ON emp.deptno = dept.deptno
ORDER BY
    dname;

SELECT
    empno,
    ename,
    d.deptno,
    dname,
    sal
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    sal >= 3000;

SELECT
    empno,
    ename,
    sal,
    dname,
    loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        sal <= 2500
    AND empno <= 9999;

SELECT
    *
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;

-- outer 표준 구문
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    FULL OUTER JOIN emp e2 ON e1.mgr = e2.empno;

-- [실습1] 급여가 2000초과인 사원들의 부서 정보, 사원 정보를 
-- 아래와 같이 출력하는 SQL 문을 작성하시오.
-- deptno, dname, empno, ename, sal

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    sal
FROM
    dept d,
    emp  e
WHERE
        d.deptno = e.deptno
    AND sal > 2000
ORDER BY
    d.deptno;

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    sal
FROM
         dept d
    JOIN emp e ON d.deptno = e.deptno
WHERE
    sal > 2000
ORDER BY
    d.deptno;


-- [실습2] 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력하는 SQL문을 작성하시오.

SELECT
    d.deptno,
    dname,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        max_sal,
    MIN(sal)        min_sal,
    COUNT(*)        cnt
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno
GROUP BY
    d.deptno,
    dname;

SELECT
    d.deptno,
    dname,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        max_sal,
    MIN(sal)        min_sal,
    COUNT(*)        cnt
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
GROUP BY
    d.deptno,
    dname;

-- [실습3] 모든 부서정보와 사원 정보를 아래와 같이 부서번호, 사원이름 순으로 
-- 정렬하여 출력하는 SQL문을 작성하시오
-- deptno, dname, empno, ename, job, sal

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    job,
    sal
FROM
    dept d,
    emp  e
WHERE
    d.deptno = e.deptno (+);

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    job,
    sal
FROM
    dept d
    LEFT OUTER JOIN emp  e ON d.deptno = e.deptno
ORDER BY
    d.deptno,
    e.empno;


-- 세 개 테이블 조인
SELECT
    *
FROM
    emp e1,
    emp e2,
    emp e3
WHERE
        e1.empno = e2.empno
    AND e2.empno = e3.empno;

SELECT
    *
FROM
         emp e1
    JOIN emp e2 ON e1.empno = e2.empno
    JOIN emp e3 ON e2.empno = e3.empno;
            
-- [실습4] 모든 부서정보와 사원 정보, 급여등급 정보, 각 사원의 직속 상관의 
-- 정보 부서번호, 사원번호 순으로 정렬하여 출력하는 SQL문을 작성하시오.

-- emp e1 테이블과 dept 테이블 조인 => dept 테이블 기준(dept 테이블 내용 모두 출력)
SELECT
    *
FROM
    emp  e1,
    dept d1
WHERE
    e1.deptno (+) = d1.deptno;

-- 첫번째 연결 결과랑 salgrade 조인
SELECT
    *
FROM
    emp      e1,
    dept     d1,
    salgrade s1
WHERE
        e1.deptno (+) = d1.deptno
    AND e1.sal BETWEEN s1.losal (+) AND s1.hisal (+);


-- 두번째 결과의 mgr이랑 emp e2 테이블의 empno 랑 조인
SELECT
    d.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp      e1,
    dept     d,
    salgrade s,
    emp      e2
WHERE
        e1.deptno (+) = d.deptno
    AND e1.sal BETWEEN s.losal (+) AND s.hisal (+)
    AND e1.mgr = e2.empno (+)
ORDER BY
    d.deptno,
    e1.ename;

SELECT
    d.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp  e1
    RIGHT OUTER JOIN dept d ON e1.deptno = d.deptno
    LEFT OUTER JOIN salgrade ON e1.sal BETWEEN s.losal AND s.hisal
    LEFT OUTER JOIN emp  e2 ON e1.mgr = e2.empno
ORDER BY
    d.deptno,
    e1.ename;    
    
    
-- 서브쿼리 : sql 문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해 sql 문
--            내부에서 사용하는 select 문을 말함
--            연산자와 같은 비교 또는 조회 대상으 오른쪽에 놓여서 괄호로 묶어서 사용
--            서브쿼리의 SELECT 절에 명시한 열은 메인쿼리의 비교 대상과 같은 자료형과
--            같은 개수로 지정

-- JONES 사원의 급여보다 높은 급여를 받는 사원 조회

-- JONES 사원의 급여 조회
SELECT
    sal
FROM
    emp
WHERE
    ename = 'JONES';  -- 2975
-- 2975보다 큰 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal > 2975;

-- 단일행 서브쿼리
-- 서브쿼리의 결과가 단 하나의 행으로 나온 상황
-- >, >=, =, <=, <>, ^=, != 


SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'JONES'
    );


-- ALLEN 사원의 추가 수당보다 많은 추가수당을 받는 사원 조회

SELECT
    *
FROM
    emp
WHERE
    comm > (
        SELECT
            comm
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

-- WARD 사원의 입사일보다 빨리 입사한 사원 목록 조회
SELECT
    *
FROM
    emp
WHERE
    hiredate < (
        SELECT
            hiredate
        FROM
            emp
        WHERE
            ename = 'WARD'
    );


-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원정보(사원번호,사원명
-- 직업,급여)와 소속부서정보(부서번호,부서명,부서위치)를 조회

SELECT
    empno,
    ename,
    job,
    sal,
    d.deptno,
    dname,
    loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND d.deptno = 20
    AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    );


-- 다중행 서브쿼리
-- 서브쿼리 실행결과가 여러 개로 나오는 걸 의미
-- IN : 메인 쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하면 true
-- ANY(SOME) : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
-- ALL : 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 TRUE
-- EXISTS : 서브 쿼리의 결과가 존재하면(행 1개이상 존재하면) TRUE


-- 부서별 최고급여와 같은 사원 조회

-- 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
--SELECT * 
--FROM EMP
--WHERE SAL > (SELECT MAX(SAL)  FROM EMP  GROUP BY deptno);

SELECT
    *
FROM
    emp
WHERE
    sal IN (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );


-- ANY(SOME)
SELECT
    *
FROM
    emp
WHERE
    sal = ANY (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );    
    
    
-- 30번 부서 사원들의 최고급여보다 적은 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal < ANY (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            deptno = 30
    );

SELECT
    *
FROM
    emp
WHERE
    sal < ANY (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

-- 30번 부서 사원들의 최저급여보다 많은 사원
SELECT
    *
FROM
    emp
WHERE
    sal > ANY (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );
    
 
-- ALL
-- 30번 부서 사원들의 급여보다 적은 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal < ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

SELECT
    *
FROM
    emp
WHERE
    sal > ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    ); 


-- EXISTS
SELECT
    *
FROM
    emp
WHERE
    EXISTS (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = 10
    );

SELECT
    *
FROM
    emp
WHERE
    EXISTS (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = 50
    );

-- 문제] 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보,부서정보 출력하기
-- ENAME,EMPNO,JOB,SAL,DEPTNO,DNAME 출력

SELECT
    ename,
    empno,
    job,
    sal,
    d.deptno,
    d.dname
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.job IN (
        SELECT
            job
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

-- 문제] 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보,부서정보,급여등급
-- 출력하기(급여가 많은 순으로 정렬하되 급여가 같은 경우에는 사원번호를 오름차순으로 정렬)

SELECT
    ename,
    empno,
    job,
    sal,
    d.deptno,
    d.dname,
    s.grade
FROM
    emp      e,
    dept     d,
    salgrade s
WHERE
        e.deptno = d.deptno
    AND e.sal BETWEEN s.losal AND s.hisal
    AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    )
ORDER BY
    e.sal DESC,
    e.empno ASC;


-- 비교할 열이 여러 개인 다중열 서브쿼리

SELECT
    *
FROM
    emp
WHERE
    ( deptno, sal ) IN (
        SELECT
            deptno, MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );


-- FROM 서브쿼리 (인라인 뷰)
SELECT
    empno,
    ename,
    d.deptno,
    dname,
    loc
FROM
    (
        SELECT
            *
        FROM
            emp
        WHERE
            deptno = 10
    ) e10,
    (
        SELECT
            *
        FROM
            dept
    ) d
WHERE
    e10.deptno = d.deptno;


-- INSERT 사용하는 서브쿼리
-- VALUES 절은 사용하지 않음
-- 데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야 한다.
-- 데이터가 추가되는 테이블의 자료형과 서브쿼리의 자료형이 일치해야 한다.


-- EMP 테이블에서 SALGRADE 테이블을 참조하여 급여 등급이 1인 사원만을 EMP_TEMP
-- 에 추가하기

SELECT
    *
FROM
    emp      e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal
    AND s.grade = 1;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        e.empno,
        e.ename,
        e.job,
        e.mgr,
        e.hiredate,
        e.sal,
        e.comm,
        e.deptno
    FROM
        emp      e,
        salgrade s
    WHERE
        e.sal BETWEEN s.losal AND s.hisal
        AND s.grade = 1;


-- UPDATE 서브쿼리
SELECT
    *
FROM
    dept_temp;

-- 40번 부서의 부서 이름과 지역 수정(DEPT 테이블의 DEPTNO = 30인 지역명,부서명추출)
SELECT
    dname,
    loc
FROM
    dept
WHERE
    deptno = 30;

UPDATE dept_temp
SET
    ( dname,
      loc ) = (
        SELECT
            dname,
            loc
        FROM
            dept
        WHERE
            deptno = 30
    )
WHERE
    deptno = 40;

UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = (
        SELECT
            deptno
        FROM
            dept_temp
        WHERE
            dname = 'ACCOUNTING'
    );


-- DELETE 서브쿼리

SELECT
    *
FROM
    emp_temp;

-- 급여 등급이 3등급이고 30번 부서인 사원들만 삭제

DELETE emp_temp
WHERE
    empno IN (
        SELECT
            empno
        FROM
            emp_temp e, salgrade s
        WHERE
            e.sal BETWEEN s.losal AND s.hisal
            AND s.grade = 3
            AND deptno = 30
    );


-- 실습
--[실습1] 실습을 위하여 기존 테이블을 이용하여 테이블을 생성한다.
--① EMP 테이블의 내용을 이용하여 EXAM_EMP 생성
CREATE TABLE exam_emp
    AS
        SELECT
            *
        FROM
            emp;

--② DEPT 테이블의 내용을 이용하여 EXAM_DEPT 생성
CREATE TABLE exam_dept
    AS
        SELECT
            *
        FROM
            dept;

--③ SALGRADE 테이블의 내용을 이용하여 EXAM_SALGRADE 생성
CREATE TABLE exam_salgrae
    AS
        SELECT
            *
        FROM
            salgrade;

-- 
INSERT INTO exam_emp VALUES (
    7201,
    'test_user1',
    'MANAGER',
    7788,
    '2016-01-02',
    4500,
    NULL,
    50
);

INSERT INTO exam_emp VALUES (
    7202,
    'test_user2',
    'CLERK',
    7201,
    '2016-02-21',
    1800,
    NULL,
    50
);

INSERT INTO exam_emp VALUES (
    7203,
    'test_user3',
    'ANALYST',
    7201,
    '2016-04-11',
    3400,
    NULL,
    60
);

INSERT INTO exam_emp VALUES (
    7204,
    'test_user4',
    'SALESMAN',
    7201,
    '2016-05-31',
    2700,
    300,
    60
);

INSERT INTO exam_emp VALUES (
    7205,
    'test_user5',
    'CLERK',
    7201,
    '2016-07-20',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp VALUES (
    7206,
    'test_user6',
    'CLERK',
    7201,
    '2016-09-08',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp VALUES (
    7207,
    'test_user7',
    'LECTURER',
    7201,
    '2016-10-28',
    2300,
    NULL,
    80
);

INSERT INTO exam_emp VALUES (
    7208,
    'test_user8',
    'STUDENT',
    7201,
    '2018-03-09',
    1200,
    NULL,
    80
);

-- [실습3] EXAM_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 
-- 평균 급여보다 많은 급여를 받고 있는 사원들을 70번 부서로 옮기는 SQL 문 작성하기

UPDATE exam_emp
SET
    deptno = 70
WHERE
    sal > (
        SELECT
            AVG(sal)
        FROM
            exam_emp
        WHERE
            deptno = 50
    );

-- [실습4] EXAM_EMP에 속한 사원 중 60번 부서의 사원 중에서 입사일이 
-- 가장 빠른 사원보다 늦게 입사한 사원의 급여를 10% 인상하고 80번 부서로 옮기는 SQL 문 작성하기

UPDATE exam_emp
SET
    sal = sal * 1.1,
    deptno = 80
WHERE
    hiredate > (
        SELECT
            MIN(hiredate)
        FROM
            exam_emp
        WHERE
            deptno = 60
    );

-- [실습5] EXAM_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문을 작성하기
DELETE FROM EXAM_EMP WHERE EMPNO IN (SELECT EMPNO FROM EXAM_EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL)


--DDL(데이터 정의어)
--객체를 생성,변경,삭제
-- 실행하면 반영됨

-- create(생성), alter(변경) , drop(삭제)
-- create table 테이블이름(
--  필드명1 자료형,
--  필드명2 자료형,
--)
-- 테이블 이름 규칙
-- 문자로시작
-- 같은 사용자 안에서 동일한 테이블 명 사용불가
-- sql 키워드는 테이블 이름으로 사용할수 없음

-- 필드명 생성 규칙
-- 문자로 시작
-- 열이름은 중복되면 안됨
-- sql 키워드 사용불가

-- 자료형:숫자 Numver, 문자 varchar2, 날짜 date

create table EMP_DDL(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2), -- 숫자로 7자리 허용(소수점 2자리 허용)
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);
DESC emp_ddl;

DROP TABLE emp_ddl;

CREATE TABLE dept_ddl
    AS
        SELECT
            *
        FROM
            dept;

CREATE TABLE dept_ddl
    AS
        SELECT
            *
        FROM
            dept
        WHERE
            deptno = 30;

CREATE TABLE dept_ddl2
    AS
        SELECT
            *
        FROM
            dept
        WHERE
            1 <> 1;

SELECT
    *
FROM
    dept_ddl2;

--ALTER
-- 이미 생성된 객체를 변경

CREATE TABLE emp_alter
    AS
        SELECT
            *
        FROM
            emp;

-- 새로운 컬럼 (열) 추가: ADD
DESC emp_alter;

ALTER TABLE emp_alter ADD hp VARCHAR2(20);

SELECT
    *
FROM
    emp_alter;


-- RENAME : 열 이름 을 변경
ALTER TABLE emp_alter RENAME COLUMN hp TO tel;

-- MODIFY : 열의 자료형을 변경
ALTER TABLE emp_alter MODIFY
    empno NUMBER(5);

-- DROP: 열 삭제
ALTER TABLE emp_alter DROP COLUMN tel;

--테이블 이름 변경
RENAME emp_alter TO emp_rename;

SELECT
    *
FROM
    emp_rename;

DESC emp_rename;

-- 테이블 데이터를 삭제 TRUNCATE
SELECT
    *
FROM
    emp_rename;

TRUNCATE TABLE emp_rename;

CREATE TABLE member (
    id     CHAR(8),
    name   VARCHAR2(10),
    addr   VARCHAR2(50),
    nation CHAR(4),
    email  VARCHAR2(50),
    age    NUMBER(7, 2)
);

ALTER TABLE member ADD bigo VARCHAR2(20);

DESC member;

ALTER TABLE member MODIFY
    bigo VARCHAR2(30);

ALTER TABLE member RENAME COLUMN bigo TO remark;

--뷰(view) : 가상 테이블
--목적: 편리성 (select 문의 복잡도를 완화)
--      보안성(테이블의 특정 열을 노출하고 싶지 않을 경우)

--create or replace view 뷰이름 (열이름,열이름2.....) as 저장할 select 문
CREATE VIEW vm_emp20 AS
    ( SELECT
        empno,
        ename,
        job,
        deptno
    FROM
        emp
    WHERE
        deptno = 20
    );

SELECT
    *
FROM
    vm_emp20;

-- EMP 테이블의 전체 내용을 이용해 VIEW 생성
CREATE VIEW vm_empall AS
    SELECT
        *
    FROM
        emp;

-- VM_EMPALL 에 있는 특정 사원 정보를 수정
SELECT
    *
FROM
    vm_empall;

UPDATE vm_empall
SET
    job = 'SALESMAN'
WHERE
    empno = 7369;

INSERT INTO vm_empall VALUES (
    6666,
    'KIM',
    'MANAGER',
    NULL,
    '20/10/05',
    2650,
    NULL,
    20
);

SELECT
    *
FROM
    emp;


--뷰 생성(수정 불가)
CREATE VIEW vm_emp30read2 AS
    SELECT
        empno,
        ename,
        job
    FROM
        emp
    WHERE
        deptno = 30
WITH READ ONLY;

SELECT
    *
FROM
    vm_emp30read2;

-- 뷰 삭제
DROP VIEW vm_empall;

--시퀀스(수업에서 자주 사용)
--오라클에서만 있는 기능(오라클 데이터 베이스에서 특정 규칙에 맞는 연속 숫자 생성)

CREATE SEQUENCE 
seq_dept_sequence 
INCREMENT BY 10 --옵션 기본은 1
START WITH 10  -- 옵선 기본은 1
MAXVALUE 90 --옵션 기본값은 10의 27승
MINVALUE 0 -- 옵션(기본값은 1)
NOCYCLE CACHE 2; -- 옵션 (cycle or nocycle,cache 는 미리 발급해 놓을수)

create table dept_sequence as select * from dept where 1<>1;

insert into dept_sequence(deptno,dname,loc)
values(seq_dept_sequence.nextval,'database','seoul');


-- 시퀀스 수정
alter sequence seq_dept_sequence
increment by 3
maxvalue 99
cycle;

select * from dept_sequence;

-- 시퀀스 삭제
drop sequence seq_dept_sequence;

--인덱스: 빠른 검색
--데이터 검색 table full scan, index scan

-- 인덱스 생성
create index idx_emp_sal
on emp(sal); --sql 튜닝

-- 제약 조건을 사용한 테이블 생성
create table userTBL(
userid char(8) not null primary key,
username varchar(10) not null);


-- 인덱스 삭제
drop index idx_emp_sal;

--[실습1] 다음 SQL문을 작성해 보세요
--① EMP테이블과 같은 구조의 데이터를 저장하는 EMPIDX 테이블을 생성하시오.\
create table empidx as select * from emp;
--② 생성한 EMPIDX 테이블의 EMPNO 열에 IDX_EMPIDX_EMPNO 인덱스를 생성하시오.
create index idx_empidx_empno on empidx(empno);


--[실습2] 실습1에서 생성한 EMPIDX 테이블의 데이터 중 급여가 1500 초과인 사원들만 출력하는 EMPIDX_OVER15K 뷰를 생성하시오. (사원번호, 사원이름, 직책,부서번호,급여,추가수당 열을 가지고 있다)
create view EMPIDX_OVER15K as (select empno,ename,job,deptno,sal,comm from empidx where sal >=1500);

--실습3] 다음 SQL문을 작성해 보세요
--① DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 테이블을 작성하시오.
create TABLE DEPTSEQ AS SELECT * FROM DEPT;
--② 생성한 DEPTSEQ 테이블의 DEPTNO 열에 사용할 시퀀스를 아래에 제시된 특성에 맞춰 생성해 보시오.
CREATE SEQUENCE DEPTSEQ_SEQUENCE
START WITH 1
INCREMENT BY 1
MAXVALUE 99
MINVALUE 1
NOCYCLE NOCACHE;
--③  마지막으로 생성한 DEPTSEQ를 사용하여 아래쪽과 같이 세 개 부서를 차례대로 추가한다.
--부서명 : database/web/mobile
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQUENCE.NEXTVAL,'DATABASE','SEOUL');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQUENCE.NEXTVAL,'WEB','BUSAN');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQUENCE.NEXTVAL,'MOBILE','ILSAN');

SELECT * FROM DEPTSEQ;

--제약조건
--데이터 무결성 유지(결점이 없게 유지해주는것)

-- 1) NOT NULL : NULL 의 저장을 허용하지 않음
CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));

INSERT INTO TABLE_NOTNULL VALUES('TEST_01',NULL,'010-2132-2135');

INSERT INTO TABLE_NOTNULL(LOGIN_ID,LOGIN_PWD) VALUES('TEST_01','010-2132-2135');

UPDATE TABLE_NOTNULL
SET LOGIN_PWD=NULL
WHERE LOGIN_ID='TEST_01';


--제약조건 이름 지정
CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN2_LGNPWD_NN NOT NULL,
    TEL VARCHAR2(20));

-- 제약조건 확인
--현재 데이터 베이스에 접속한 사용자가 소유한 객체 정보: USER_ 로 시작
SELECT OWNER,CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_NOTNULL2';

-- 이미 생성한 테이블에 제약 조건 지정
--TABLE_NOTNULL 에 TEL 컬럼에 NOT NULL 추가
-- 오류 보고-
-- (C##SCOTT.)사용 으로 설정 불가 - 널 값이 발견되었습니다.
SELECT * FROM TABLE_NOTNULL;
ALTER TABLE TABLE_NOTNULL MODIFY(TEL NOT NULL);

-- UPDATE 를 통해 기존의 NULL 컬럼을 제거
UPDATE TABLE_NOTNULL
SET TEL='010-654-6524'
WHERE LOGIN_ID='TEST_01';

ALTER TABLE TABLE_NOTNULL2 MODIFY(TEL CONSTRAINT TBLNN_TEL_NN NOT NULL);

--제약조건 이름 변경
ALTER TABLE TABLE_NOTNULL2 RENAME CONSTRAINT TBLNN_TEL_NN TO  TBLNN2_TEL_NN;

--제약 조건 삭제
alter TABLE TABLE_NOTNULL2 DROP CONSTRAINT TBLNN2_TEL_NN;

--2) NUIQUE : 중복되지 않는 값
DROP TABLE TABLE_UNIQUE;

CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR2(20) UNIQUE,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));

SELECT OWNER,CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_UNIQUE';

INSERT INTO TABLE_UNIQUE
VALUES('TEST_ID_01','PWD081','010-1234-5689');

--무결성 제약 조건 (C##SCOTT.SYS_C007354)
INSERT INTO TABLE_UNIQUE
VALUES('TEST_ID_01','PWD082','010-1234-5539');

--UNIQUE 제약조건에 NULL 삽입 가능
INSERT INTO TABLE_UNIQUE
VALUES(NULL,'PWD082','010-1234-5539');

CREATE TABLE TABLE_UNIQUE2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNID_UNQ UNIQUE,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNQWD_UNQ NOT NULL,
    TEL VARCHAR2(20));

SELECT OWNER,CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE 'TABLE_UNI%';

ALTER TABLE TABLE_UNIQUE MODIFY(TEL UNIQUE);


--3) PRIMARY KEY :  NOY NULL + UNIQUE
--                  테이블 당 하나만 존재
--                  INDEX 자동 생성
--                  각 행을 식별 하는 용도
CREATE TABLE TABLE_PK(
    LOGIN_ID VARCHAR2(20) PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));

INSERT INTO TABLE_PK
VALUES('TEST_01','PWD01','010-123-1236');

INSERT INTO TABLE_PK
VALUES('TEST_01','PWD02','010-123-1236');

CREATE TABLE TABLE_PK2(
    LOGIN_ID VARCHAR2(20) PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) PRIMARY KEY,
    TEL VARCHAR2(20));

CREATE TABLE TABLE_PK2(
    LOGIN_ID VARCHAR2(20) constraint tblpk2_lgnkd_pk PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) constraint tblpk2_lgnpwd_nn not null,
    TEL VARCHAR2(20));
    
    
-- 제약조건을 지정하는 다른 방식
create table table_con(
    col1 varchar2(20),
    col2 varchar2(20),
    col3 varchar2(20),
    primary key(col1),
    constraint tblcon_unq unique (col2));
    

--4)  foreign key : 외래키
--                  서로 다른 테이블 간 관계 정의
--                  특정 테이블에서 pk  제약조건을 지정한 열을 다른 테이블의 특정 열에서 참조
create table dept_FK(
    DEPTNO NUMBER(2) CONSTRAINT DPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13));

CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO));

--무결성 제약조건(C##SCOTT.EMPFK_DEPTNO_FK)이 위배되었습니다- 부모 키가 없습니다
INSERT INTO EMP_FK VALUES(9999,'TEST_NAME','TEST_JOB',NULL,'21-10-05',3000,NULL,10);--그냥 NULL넣으니깐 되긴 하드라

--외래키 수행순서
-- 부모 테이블에 해당하는 테이터 삽입
-- 자식테이블 데이터 삽입
INSERT INTO DEPT_FK VALUES (10,'DATABASE','SEOUL');
INSERT INTO EMP_FK VALUES(9999,'TEST_NAME','TEST_JOB',NULL,'21-10-05',3000,NULL,10);

 
-- 외래 키 참조 행 데이터 삭제
-- 자식 테이블에 해당하는 데이터 삭제
-- 부모 테이블에 해당하는 데이터 삭제

--자식 레코드가 발견되었습니다
DELETE FROM DEPT_FK WHERE DEPTNO = 10;

DELETE FROM EMP_FK WHERE DEPTNO = 10;
DELETE FROM DEPT_FK WHERE DEPTNO = 10;

-- 데이터 삭제 시 삭제할 테이터를 참조하는 처리를 어떻게 할 것인지 결정
-- ON DELETE CASCADE : 열 데이터 삭제시 이 데이터를 참조하고 있는 데이터도 함께 삭제
create table dept_FK2(
    DEPTNO NUMBER(2) CONSTRAINT DPTFK2_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13));

CREATE TABLE EMP_FK2(
    EMPNO NUMBER(4) CONSTRAINT EMPFK2_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK2_DEPTNO_FK REFERENCES DEPT_FK2(DEPTNO) ON DELETE CASCADE);

INSERT INTO DEPT_FK2 VALUES (10,'DATABASE','SEOUL');
INSERT INTO EMP_FK2 VALUES(9999,'TEST_NAME','TEST_JOB',NULL,'21-10-05',3000,NULL,10);

DELETE FROM DEPT_FK2 WHERE DEPTNO = 10;

SELECT * FROM DEPT_FK2;
SELECT * FROM EMP_FK2;


-- ON DELETE SET NULL: 열 데이터를 삭제할때 이 데이터를 참조하는 데이터를 NULL수정


CREATE TABLE EMP_FK3(
    EMPNO NUMBER(4) CONSTRAINT EMPFK3_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK3_DEPTNO_FK REFERENCES DEPT_FK2(DEPTNO) ON DELETE SET NULL);

INSERT INTO DEPT_FK2 VALUES (10,'DATABASE','SEOUL');
INSERT INTO EMP_FK3 VALUES(9999,'TEST_NAME','TEST_JOB',NULL,'21-10-05',3000,NULL,10);

SELECT * FROM DEPT_FK2;
SELECT * FROM EMP_FK3;

DELETE FROM DEPT_FK2 WHERE DEPTNO = 10;

--5) CHECK  : 열에 저장할 수 있는 값의 범위 또는 패턴 정의
--          : EX)시간 0~23만 가능하게

CREATE TABLE TABLE_CHECK(
    LOGIN_ID VARCHAR2(20) constraint tblLCK_lgnkd_pk PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) constraint tblCK_lgnpwd_nn CHECK(LENGTH(LOGIN_PWD)>3),
    TEL VARCHAR2(20));

INSERT INTO TABLE_CHECK VALUES('TEST_ID','123','010-456-456');

INSERT INTO TABLE_CHECK VALUES('TEST_ID','1234','010-456-456');

-- 기본값을 지정 DEFAULT
-- 특정 열에 저장할 값이 지정되지 않았을 경우에 입력되는 기본값

CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID VARCHAR2(20) constraint tblDF_lgnkd_pk PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
    TEL VARCHAR2(20));

INSERT INTO TABLE_DEFAULT(LOGIN_ID,LOGIN_PWD)
VALUES('TEST_ID','TEST_ID');

INSERT INTO TABLE_DEFAULT(LOGIN_ID,TEL)
VALUES('TEST_ID2','010-4506-1234');

INSERT INTO TABLE_DEFAULT(LOGIN_ID,LOGIN_PWD,TEL)
VALUES('TEST_ID3',NULL,'TEST_ID');

SELECT * FROM TABLE_DEFAULT;


-- 실습

--문 1)DEPT_CONST 테이블 생성
--DEPTNO 정수형 숫자 길이 2, 제약조건 PRIMARY KEY 제약조건명 DEPTCONST_DEPTNO_PK
--DEPTNAME 가변형 문자 길이 14, 제약조건 UNIQUE 제약조건명 DEPTCONST_DNAME_UNQ
--LOC 가변형 문자 길이 13, 제약조건 NOT NULL 제약조건명 DEPTCONST_LOC_NN
CREATE TABLE DEPT_CONST(
    DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE,
    LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL);

);




-- 문2) EMP_CONST 테이블 생성
-- EMPNO 정수형 숫자, 길이2,제약조건 PRIMARY KEY, 제약조건명 EMPCONST_EMPNO_PK
-- ENAME 가변형 문자, 길이 10 제약조건 NOT NULL, 제약명 EMPCONST_ENAME_NN
-- JOB 가변형 문자, 길이 9,
-- TEL 가변형 문자, 길이 20, 제약조건 UNIQUE, 제약조건명 EMPCONST_TEL_QNQ
-- HIREDATE 날짜,
-- SAL 정수형 숫자, 길이 7, 소수점 둘째자리까지 허용, 제양조건 CHECK(급여는 1000~9999만 입력가능)
-- 제약조건명 EMPCONST_SAL_CHK
-- COMM 정수형 숫자, 길이 7, 소수점 둘째자리까지 허용
-- DEPTNO 정수형 숫자, 길이 2 제약조건 FOREIGN KEY, 제약조건명 EMPCONST_DEPTNO_FK

create table emp_const(
    empno number(2) constraint empconst22_empno_pk primary key,
    ename varchar2(10) constraint empconst22_ename_nn not null,
    job varchar2(9),
    tel varchar2(20) constraint empconst22_tel_unq unique,
    hiredate date,
    sal number(7,2) constraint EMPCONST22_DEPTNO_FK check(sal between 1000 and 9999),
    comm number(7,2),
    deptno number(2) constraint EMPCONST22_DEPTNO_FK references dept_const(deptno)
    );



















