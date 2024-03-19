/*
 * 공통코드 테이블 생성
 */
--------------------------------------------------------1.공통코드--------------------------------------------------------
-- 공통코드 테이블
CREATE TABLE COMMON (
    "TYPE" VARCHAR2(30) NOT NULL,       -- 타입: 대분류 카테고리 이름
    CODE VARCHAR2(2) NOT NULL,       -- 코드: 소분류 카테고리 번호
    CODE_NAME VARCHAR2(30) NOT NULL, -- 코드네임: 소분류 카테고리 이름
    DESCRIPTION VARCHAR2(200)        -- 설명: 해당 행에 대한 설명
);

-- 직위
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '직위', '01', '사원', '' FROM DUAL
UNION ALL
SELECT '직위', '02', '주임', '' FROM DUAL
UNION ALL
SELECT '직위', '03', '대리', '' FROM DUAL
UNION ALL
SELECT '직위', '04', '과장', '' FROM DUAL
UNION ALL
SELECT '직위', '05', '차장', '' FROM DUAL
UNION ALL
SELECT '직위', '06', '부장', '' FROM DUAL
UNION ALL
SELECT '직위', '07', '이사', '' FROM DUAL;

-- 직책
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '직책', '01', '부서장', '' FROM DUAL
UNION ALL
SELECT '직책', '02', '본부장', '' FROM DUAL
UNION ALL
SELECT '직책', '03', '부대표이사', '' FROM DUAL
UNION ALL
SELECT '직책', '04', '대표이사', '' FROM DUAL;

-- 권한
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '권한', '01', '시스템관리자', '' FROM DUAL
UNION ALL
SELECT '권한', '02', '인사관리자', '' FROM DUAL
UNION ALL
SELECT '권한', '03', '일반사원', '' FROM DUAL;

-- 문서종류
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '인사문서', '01', '이력서', '' FROM DUAL
UNION ALL
SELECT '인사문서', '02', '근로계약서', '' FROM DUAL;

-- 문서양식코드
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '문서양식코드', '01', '휴가신청서', '' FROM DUAL
UNION ALL
SELECT '문서양식코드', '02', '지출결의서', '' FROM DUAL
UNION ALL
SELECT '문서양식코드', '03', '부서발령신청서', '' FROM DUAL;

-- 기안서상태
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '기안서상태', '01', '진행중', '' FROM DUAL
UNION ALL
SELECT '기안서상태', '02', '승인', '' FROM DUAL
UNION ALL
SELECT '기안서상태', '03', '반려', '' FROM DUAL
UNION ALL
SELECT '기안서상태', '04', '임시저장', '' FROM DUAL;

-- 결재상태
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '결재상태', '01', '미결재', '' FROM DUAL
UNION ALL
SELECT '결재상태', '02', '승인', '' FROM DUAL
UNION ALL
SELECT '결재상태', '03', '반려', '' FROM DUAL;

INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '결재타입', '01', '결재자', '' FROM DUAL
UNION ALL
SELECT '결재타입', '02', '참조자', '' FROM DUAL
UNION ALL
SELECT '결재타입', '03', '작성자', '' FROM DUAL;

-- 개인일정
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '개인일정', '01', '휴가', '' FROM DUAL
UNION ALL
SELECT '개인일정', '02', '출장', '' FROM DUAL
UNION ALL
SELECT '개인일정', '03', '경조사', '' FROM DUAL
UNION ALL
SELECT '개인일정', '04', '개인일정', '' FROM DUAL;

-- 부서일정
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '부서일정', '01', '회의', '' FROM DUAL
UNION ALL
SELECT '부서일정', '02', '협업', '' FROM DUAL
UNION ALL
SELECT '부서일정', '03', '교육', '' FROM DUAL
UNION ALL
SELECT '부서일정', '04', '워크숍', '' FROM DUAL
UNION ALL
SELECT '부서일정', '05', '회식', '' FROM DUAL;

-- 회사일정
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '회사일정', '01', '공휴일', '' FROM DUAL
UNION ALL
SELECT '회사일정', '02', '기념일', '' FROM DUAL
UNION ALL
SELECT '회사일정', '03', '행사', '' FROM DUAL
UNION ALL
SELECT '회사일정', '04', '세미나', '' FROM DUAL
UNION ALL
SELECT '회사일정', '05', '정산', '' FROM DUAL;

-- 우선순위
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '일정우선순위', '02', '높음', '' FROM DUAL
UNION ALL
SELECT '일정우선순위', '03', '중간', '' FROM DUAL
UNION ALL
SELECT '일정우선순위', '04', '낮음', '' FROM DUAL
UNION ALL
SELECT '일정우선순위', '01', '없음', '' FROM DUAL;

-- 알림
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '알림', '01', '채팅', '' FROM DUAL
UNION ALL
SELECT '알림', '02', '일정', '' FROM DUAL
UNION ALL
SELECT '알림', '03', '전자결재', '' FROM DUAL
UNION ALL
SELECT '알림', '04', '예약', '' FROM DUAL;

-- 알림시간
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '일정알람시간', '01', '10분전', '' FROM DUAL
UNION ALL
SELECT '일정알람시간', '02', '30분전', '' FROM DUAL
UNION ALL
SELECT '일정알람시간', '03', '1시간전', '' FROM DUAL
UNION ALL
SELECT '일정알람시간', '04', '2시간전', '' FROM DUAL
UNION ALL
SELECT '일정알람시간', '05', '1일전', '' FROM DUAL
UNION ALL
SELECT '일정알람시간', '06', '2일전', '' FROM DUAL
UNION ALL
SELECT '일정알람시간', '07', '1주전', '' FROM DUAL
UNION ALL
SELECT '일정알람시간', '08', '알림없음', '' FROM DUAL;
--------------------------------------------------------2.공통파일--------------------------------------------------------
-- 공통파일 테이블
CREATE TABLE FILESTORAGE (
    REF_ID VARCHAR2(10),             	-- 참조 번호
    FTYPE VARCHAR2(2) NOT NULL,       	-- 분류
    ORIGIN_NAME VARCHAR2(200) NOT NULL, -- 원본 파일명
    STORED_NAME VARCHAR2(200) NOT NULL, -- 저장 파일명
    PAYLOAD CLOB NOT NULL,				-- 파일 데이터
    FSIZE NUMBER NOT NULL,            	-- 파일 크기
    UPLOAD_DATE DATE DEFAULT CURRENT_DATE NOT NULL, -- 업로드 날짜
    DELFLAG CHAR(1) DEFAULT 'N' NOT NULL -- 삭제 여부
);

/*DROP TABLE COMMON;
DROP TABLE FILESTORAGE;*/