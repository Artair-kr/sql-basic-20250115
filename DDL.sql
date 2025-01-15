-- 데이터 정의어 (DDL)
-- 데이터 베이스, 테이블, 인덱스, 사용자를 정의하고 관리하는데 사용되는 언어

-- CREATE : 구조를 생성하는 명령어
-- CREATE 생성할구조 구조이름 [구조별 옵션];
-- 구조 : 스키마

-- 데이터베이스 생성
CREATE DATABASE practice_sql;

-- 데이터베이스 사용 : 데이터베이스 작업을 수행하기 전에 반드시 사용할 데이터베이스를 선택해야한다.
USE practice_sql;

-- 테이블 생성 
CREATE TABLE example_table(
example_column1 INT,
example_column2 BOOLEAN
);

-- 컬럼의 데이터 타입
CREATE TABLE data_type (
-- INT : 정수 타입
int_c INT,
-- DOUBLE : 실수 타입
double_c DOUBLE,
-- FLOAT : 실수 타입 (사이즈의 크기 차이)
-- 데이터베이스에서는 DOUBLE보다 FLOAT를 더 많이 사용한다.
float_c FLOAT,
-- BOOLEAN : 논리 타입 (실제로는 정수 0과 1을 다루는 tinyint)
boolean_c Boolean,
-- VARCHAR(문자열의길이) : 가변길이 문자열(문자열의 길이를 입력해야한다.)
-- 최대길이가 ()안에 들어있지만, 실재 저장공간은 입력한 문자열의 길이이다.
-- 문자열의 길이는 문자 수를 기준으로 설정된다.
-- 모든 제약조건을 다 수행시킬 수 있다.
varchar_c VARCHAR(5),
-- TEXT : 고정된 크기를 가지는 문자열 (64KB)
-- 장문을 다룰때 쓰는 문자열이다.
-- 가변길이이다, 실재 저장공간은 입력한 문자열의 길이이다.
-- INDEX, DEFAULT 라는 제약조건을 사용할 수 없다.
text_c TEXT,
-- DATE : 날짜
-- 관리가 힘들다.
date_c DATE,
-- DATETIME : 날짜 및 시간
-- 관리가 힘들다.
datetime_c DATETIME
);

-- 사용자 생성
-- CREATE USER '사용자명'@'접속IP' 
-- 비밀번호작성
-- CREATE USER '사용자명'@'접속IP' IDENTIFIED BY '비밀번호';
-- % : 모든 호스트 지정 (접속IP)
CREATE USER 'developer'@'%' IDENTIFIED BY '1234';
CREATE USER 'guest'@'192.168.1.101' IDENTIFIED BY 'qwer1234';

-- DROP : 데이터 구조(스키마)를 삭제할 때 사용하는 명령어
-- DROP 구조조이름(스키마명)
-- 사용자 삭제
-- DROP USER '사용자명'@'접속IP';
DROP USER 'guest'@'192.168.1.101';

-- 테이블 삭제
-- DROP TABLE 테이블명;
DROP TABLE data_type;

-- 데이터베이스 삭제
-- DROP DATABASE 데이터베이스명;
DROP DATABASE practice_sql;

-- ALTER : 데이터 구조(스키마)를 변경하는 명령어
-- 테이블 컬럼(열) 추가
ALTER TABLE example_table ADD example_column3 VARCHAR(10);

-- 테이블 컬럼(열) 삭제
ALTER TABLE example_table DROP COLUMN example_column3;

-- 테이블 컬럼(열) 타입수정
-- ALTER TABLE 테이블명 MODIFY COLUMN 컬럼명 바꿀타입;
ALTER TABLE example_table MODIFY COLUMN examexample_column1ple_column2 TEXT;

-- 테이블 컬럼(열) 전체 수정
-- 하나의 컬럼에 대한 전반적인 전체를 수정
-- ALTER TABLE 테이블명 CHANGE 칼럼명 바꿀칼럼명 바꿀타입;
ALTER TABLE example_table CHANGE example_column1 column1 VARCHAR(5);

-- 데이터베이스 문자셋 수정
-- ALTER DATABASE 데이터베이스명 DEFAULT CHARACTER SET 바꿀문자셋;
ALTER DATABASE practice_sql DEFAULT CHARACTER SET utf8;

DESC example_table;