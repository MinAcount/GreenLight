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
SELECT '개인', '01', '휴가', '' FROM DUAL
UNION ALL
SELECT '개인', '02', '외근', '' FROM DUAL;

-- 부서일정
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '부서', '01', '회의', '' FROM DUAL
UNION ALL
SELECT '부서', '02', '협업', '' FROM DUAL
UNION ALL
SELECT '부서', '03', '교육', '' FROM DUAL
UNION ALL
SELECT '부서', '04', '워크숍', '' FROM DUAL;

-- 회사일정
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '회사', '01', '공휴일', '' FROM DUAL
UNION ALL
SELECT '회사', '02', '기념일', '' FROM DUAL
UNION ALL
SELECT '회사', '03', '행사', '' FROM DUAL;
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












---------------------------------------------------------------------------------------------------------------------

/*
 * <테이블 생성>
 * 컬럼명, 값 범의 등 변경 원할시 변경원하는 것 있으면
 * 변경되는 값만
 * 테이블 명, 컬럼명, 타입, 조건 같이 보내주세요
 * EX) CREATE TABLE EMPLOYEE (
   		  HAPPY_BIRTH_DAY DATE, -- 생년월일   		  
 */
--------------------------------------------------------1.인사--------------------------------------------------------
-- 본부 테이블
CREATE TABLE HEADQUARTERS (
    HEADNO VARCHAR2(10) NOT NULL,-- 본부번호
    HNAME VARCHAR2(50) NOT NULL, -- 본부명
    HEAD_MGR VARCHAR2(2), 		 -- 본부장코드
    DELFLAG CHAR(1) DEFAULT 'N'  -- 삭제여부
);
ALTER TABLE HEADQUARTERS ADD CONSTRAINT PK_HEADQUARTERS PRIMARY KEY (HEADNO);

-- 부서 테이블
CREATE TABLE DEPARTMENT (
    DEPTNO VARCHAR2(2) NOT NULL,-- 부서번호
    DNAME VARCHAR2(50) NOT NULL, -- 부서명
    DEPT_MGR VARCHAR2(10), 		 -- 부서장코드
    HEADNO VARCHAR2(10), 		 -- 상위본부
    DELFLAG CHAR(1) DEFAULT 'N'  -- 삭제여부
);
ALTER TABLE DEPARTMENT ADD CONSTRAINT PK_DEPARTMENT PRIMARY KEY (DEPTNO);
ALTER TABLE DEPARTMENT ADD CONSTRAINT FK_HEADQUARTERS_HEA FOREIGN KEY (HEADNO) REFERENCES HEADQUARTERS(HEADNO);

-- 사원 테이블
CREATE TABLE EMPLOYEE (
    ID VARCHAR2(10) NOT NULL, 					-- 사원번호
    NAME VARCHAR2(60) NOT NULL, 				-- 이름
    PASSWORD VARCHAR2(20) DEFAULT '1q2w3e4r!!', -- 비밀번호
    EMAIL VARCHAR2(60) NOT NULL, 				-- 이메일
    PHONE VARCHAR2(12) NOT NULL, 						-- 전화번호
    BIRTHDAY DATE, 								-- 생년월일
    GENDER CHAR(1), 							-- 성별
    ADDRESS VARCHAR2(300), 						-- 주소
    DEPTNO VARCHAR2(2), 						-- 부서번호
    SPOT VARCHAR2(20), 							-- 직위
    "POSITION" VARCHAR2(20), 					-- 직책
    ESTATUS CHAR(1) DEFAULT 'Y', 				-- 재직상태
    JOIN_DAY DATE, 								-- 입사일
    EXIT_DAY DATE, 								-- 퇴사일
    ETYPE CHAR(1), 								-- 근무형태
    LEAVE NUMBER DEFAULT 0, 					-- 연차
    AUTH CHAR(3) DEFAULT '01', 					-- 권한
    PROFILE CLOB, 								-- 프로필사진
    FAIL NUMBER DEFAULT 0 						-- 실패횟수
);
ALTER TABLE EMPLOYEE ADD CONSTRAINT PK_EMPLOYEE PRIMARY KEY (ID);
ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_EMPLOYEE_DEP FOREIGN KEY (DEPTNO) REFERENCES DEPARTMENT(DEPTNO);

-- 전자서명 테이블
CREATE TABLE SIGNLIST (
    SIGNNO VARCHAR2(10), 	 -- 서명번호
    ID NUMBER NOT NULL, 	 -- 사원번호
    SAVE_SIGN CLOB NOT NULL, -- 저장서명
    MAIN CHAR(1) DEFAULT 'N' -- 기본서명 여부
);
ALTER TABLE SIGNLIST ADD CONSTRAINT PK_SIGNATURE PRIMARY KEY (SIGNNO);

-- 근태 테이블
CREATE TABLE ATTENDANCE (
    ID VARCHAR2(10) NOT NULL,-- 사원번호
    IN_DATE DATE, 		 	-- 근태시간(출근시간)
    OUT_DATE DATE, 		 	-- 근태시간(퇴근시간)
    ATT_STATUS VARCHAR2(10) -- 근태상황
);

-- 연차사용 테이블
CREATE TABLE VACATION (
    VACNO VARCHAR2(10) NOT NULL,  -- 연차번호
    ID VARCHAR2(10) NOT NULL, 	 -- 사원번호
    START_DAY DATE, 			-- 연차시작날짜
    END_DAY DATE, 				-- 연차마지막날짜
    HALF CHAR(1), 				-- 반차여부
    GETSU NUMBER, 				-- 갯수
    BIGO VARCHAR2(50) 			-- 비고
);
ALTER TABLE VACATION ADD CONSTRAINT PK_VACATION PRIMARY KEY (VACNO);

--------------------------------------------------------2.결재--------------------------------------------------------

-- 문서 테이블
CREATE TABLE DOCUMENT (
    DOCNO VARCHAR2(10) NOT NULL, 	-- 문서번호
    WRITER_ID VARCHAR2(10) NOT NULL, -- 사원번호
    TITLE VARCHAR2(200) NOT NULL, 	-- 제목
    CONTENT CLOB, 					-- 문서내용(HTML)
    DRAFT_DATE DATE NOT NULL, 		-- 기안일
    URGENCY CHAR(1), 				-- 긴급여부
    TEMPNO VARCHAR2(2) NOT NULL, 	-- 기안서 양식유형
    DOC_STATUS VARCHAR2(2) NOT NULL		-- 기안서 상태
);
ALTER TABLE DOCUMENT ADD CONSTRAINT PK_DOCUMENT PRIMARY KEY (DOCNO, WRITER_ID);

-- 결재 테이블
CREATE TABLE APPROVAL (
    APPRNO VARCHAR2(10) NOT NULL,  -- 결재번호
    DOCNO VARCHAR2(10) NOT NULL,   -- 문서번호
    WRITER_ID VARCHAR2(10) NOT NULL,     -- 작성자 사원번호
    ATYPE VARCHAR2(2) NOT NULL,         -- 결재타입
    EMP_ID VARCHAR2(10) NOT NULL,  -- 사원번호
    APPR_STATUS VARCHAR2(2) DEFAULT '01', -- 결재상태
    ORDERNO NUMBER,      -- 결재순서
    APPR_DATE DATE,                -- 결재일
    SIGNATURE CLOB 				   -- 서명
);
ALTER TABLE APPROVAL ADD CONSTRAINT PK_APPROVAL PRIMARY KEY (APPRNO);
ALTER TABLE APPROVAL ADD CONSTRAINT FK_APPROVAL_DOC FOREIGN KEY (DOCNO, WRITER_ID) REFERENCES DOCUMENT (DOCNO, WRITER_ID);

-- 양식 테이블
CREATE TABLE TEMPLATE (
    TEMPNO VARCHAR2(2) NOT NULL,    -- 문서양식코드
    EMP_ID VARCHAR2(10) NOT NULL, 	-- 작성자
    HTML CLOB, 						-- 양식 소스(HTML)
    CREATEAT DATE DEFAULT CURRENT_TIMESTAMP -- 작성일
);

--------------------------------------------------------3.채팅--------------------------------------------------------

-- 메시지 테이블
CREATE TABLE MESSAGE (
    MESG_ID VARCHAR2(10) NOT NULL, 	 -- 메시지ID
    WRITTER VARCHAR2(60) NOT NULL, 	 -- 작성자
    CONTENT VARCHAR2(3000) NOT NULL, -- 내용
    SEND_DATE DATE NOT NULL, 		 -- 전송시간
    FILE_ID NUMBER(10), 			 -- 파일ID
    FILE_GPRNO VARCHAR2(10), 		 -- 파일그룹번호
    NOREAD NUMBER(5) 				 -- 안 읽음 갯수
);
ALTER TABLE MESSAGE ADD CONSTRAINT PK_MESSAGE PRIMARY KEY (MESG_ID);

-- 채팅방 테이블
CREATE TABLE CHAT (
    CHAT_ID VARCHAR2(10) NOT NULL, -- 채팅방ID
    MESG_ID VARCHAR2(10) NOT NULL -- 메시지ID
);
ALTER TABLE CHAT ADD CONSTRAINT PK_CHAT PRIMARY KEY (CHAT_ID);
ALTER TABLE CHAT ADD CONSTRAINT FK_CHAT_MES FOREIGN KEY (MESG_ID) REFERENCES MESSAGE(MESG_ID);

-- 구성원 테이블
CREATE TABLE GROUPCHAT (
    GROUPNO VARCHAR2(10), 		   -- 그룹ID
    CHAT_ID VARCHAR2(10) NOT NULL, -- 채팅방ID
    ID VARCHAR2(10) NOT NULL, 	   -- 사원번호
    NAME VARCHAR2(60) NOT NULL,    -- 채팅방이름
    NOTI CHAR(1) DEFAULT 'N', 	   -- 알림여부
    GROUP_OUT CHAR(1) DEFAULT 'N', -- 나감여부
    FAVOR CHAR(1) DEFAULT 'N' 	   -- 즐겨찾기
);
ALTER TABLE GROUPCHAT ADD CONSTRAINT PK_GROUPCHAT PRIMARY KEY (GROUPNO);
ALTER TABLE GROUPCHAT ADD CONSTRAINT FK_GROUP_CHAT FOREIGN KEY (CHAT_ID) REFERENCES CHAT(CHAT_ID);

--------------------------------------------------------4.일정--------------------------------------------------------

-- 일정 테이블
CREATE TABLE SCHEDULE (
    SCHEDULE_ID VARCHAR2(10) NOT NULL,  -- 일정ID
    CRNO VARCHAR2(10) NOT NULL,  		-- 생성자ID
    CREATOR VARCHAR2(60) NOT NULL,  	-- 생성자 이름
    PHONE VARCHAR2(20),  				-- 전화번호
    MODIFIED DATE DEFAULT CURRENT_DATE, -- 수정 일자
    USERTYPE VARCHAR2(20) DEFAULT '개인' CHECK (USERTYPE IN ('개인', '부서', '회사')), -- 대분류
    CATEGORY VARCHAR2(2) NOT NULL,      -- 소분류 코드
    TITLE VARCHAR2(100) NOT NULL,  		-- 제목
    MEMO VARCHAR2(500),  				-- 메모
    START_DATE DATE NOT NULL,  			-- 시작일
    END_DATE DATE NOT NULL,  			-- 종료일
    LOCATION VARCHAR2(100),  			-- 장소
    RECUR CHAR(1) DEFAULT 'N',			-- 반복 여부
    VISIBILITY CHAR(1) DEFAULT 'N',		-- 공개 여부
    PARTICIPANTS CLOB CONSTRAINT ENSURE_PARTICIPANTS CHECK (PARTICIPANTS IS JSON), 	-- 참여자 목록
    PERMISSION CHAR(1) DEFAULT 'R',  												-- 접근 권한
    ALARM NUMBER DEFAULT 0,  														-- 알람코드
    DELFLAG CHAR(1) DEFAULT 'N' CHECK (DELFLAG IN ('N', 'Y')) 						-- 삭제 여부
);
ALTER TABLE SCHEDULE ADD CONSTRAINT PK_SCHEDULE PRIMARY KEY (SCHEDULE_ID);
ALTER TABLE SCHEDULE ADD CONSTRAINT CHK_START_END CHECK (START_DATE <= END_DATE);

--------------------------------------------------------5.예약--------------------------------------------------------

-- 회의실 테이블
CREATE TABLE CONFERENCE (
    CONF_ID VARCHAR2(10) NOT NULL, 				-- 회의실ID
    CNAME VARCHAR2(100) NOT NULL, 				-- 회의실명
    CAPACITY NUMBER NOT NULL, 					-- 수용가능인원
    AVAILABILITY CHAR(1) DEFAULT 'Y' NOT NULL, 	-- 사용가능여부
    HO VARCHAR2(50) NOT NULL, 					-- 위치
    ROOMINFO VARCHAR2(500) 						-- 회의실정보
);
ALTER TABLE CONFERENCE ADD CONSTRAINT PK_CONFERENCE PRIMARY KEY (CONF_ID);

-- 예약 테이블
CREATE TABLE RESERVATION (
    RESERVENO VARCHAR2(10) NOT NULL, 		-- 예약번호
    APPLICANT VARCHAR2(10) NOT NULL, 		-- 예약자ID
    PHONE VARCHAR2(20) NOT NULL, 			-- 전화번호
    RESERVE_DATE DATE NOT NULL, 			-- 예약날짜
    RES_STATUS CHAR(1) DEFAULT 'Y' NOT NULL,-- 처리상태
    MEETINGTITLE VARCHAR2(100) NOT NULL 	-- 회의제목
);
ALTER TABLE RESERVATION ADD CONSTRAINT PK_RESERVATION PRIMARY KEY (RESERVENO);

-- 예약리스트 테이블
CREATE TABLE CHECKLIST (
    LSEQ NUMBER, 				    -- 순번
    CONF_ID VARCHAR2(10) NOT NULL, 	-- 회의실ID
    RESERVENO VARCHAR2(10) NOT NULL -- 예약번호
);
ALTER TABLE CHECKLIST ADD CONSTRAINT PK_CHECKLIST PRIMARY KEY (LSEQ); -- PK
ALTER TABLE CHECKLIST ADD CONSTRAINT FK_CHECKLIST_CON FOREIGN KEY (CONF_ID) REFERENCES CONFERENCE(CONF_ID); -- 회의실ID 외래키
ALTER TABLE CHECKLIST ADD CONSTRAINT FK_CHECKLIST_RES FOREIGN KEY (RESERVENO) REFERENCES RESERVATION(RESERVENO); -- 예약번호 외래키

CREATE SEQUENCE CHECKLIST_SEQ START WITH 1 INCREMENT BY 1;

--------------------------------------------------------6.알림--------------------------------------------------------

-- 알림 테이블
CREATE TABLE NOTIFICATION (
    NOTI_ID VARCHAR2(10), 			-- 알림ID
    GUBUN NUMBER, 					-- 구분ID
    NTYPE NUMBER , 					-- 분류
    SENDER NUMBER, 					-- 발신자
    RECEIVER CLOB CONSTRAINT ENSURE_RECEIVER CHECK (RECEIVER IS JSON), -- 수신자
    ALERT_TIME DATE, 				-- 알림시간
    CONTENT VARCHAR2(2000) 			-- 알림내용
);
ALTER TABLE NOTIFICATION ADD CONSTRAINT PK_NOTIFICATION PRIMARY KEY (NOTI_ID); -- PK

--------------------------------------------------------------------------------------------------------------------
COMMIT;
--------------------------------------------------------------------------------------------------------------------

/*
 * <테이블 삭제>
 * FK 관계 있는 테이블은 지정 순서대로 삭제해주세요 		  
 * 테이블 생성시 지우고 사용해주세요
 */

-- 인사 관련 테이블 삭제

/*
DROP TABLE EMPLOYEE; -- FK DEPARTMENT
DROP TABLE DEPARTMENT; -- FK HEADQUARTERS
DROP TABLE HEADQUARTERS;
DROP TABLE SIGNLIST; 
DROP TABLE ATTENDANCE;
DROP TABLE VACATION; 

-- 결재 관련 테이블 삭제
DROP TABLE APPROVAL; -- FK DOCUMENT
DROP TABLE DOCUMENT;
DROP TABLE TEMPLATE;

-- 채팅 관련 테이블 삭제
DROP TABLE GROUPCHAT;
DROP TABLE CHAT;
DROP TABLE MESSAGE;

-- 일정 관련 테이블 삭제
DROP TABLE SCHEDULE;
DROP TABLE CHECKLIST;
DROP TABLE CONFERENCE;
DROP TABLE RESERVATION;

-- 알림 관련 테이블 삭제
DROP TABLE NOTIFICATION;

-- SEQUENCES 삭제
DROP SEQUENCE CHECKLIST_SEQ;


DROP TABLE COMMON;
DROP TABLE FILESTORAGE;


*/

















-- DOCNO SEQUENCE 생성
CREATE SEQUENCE DOCNO_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


-- TEMPNO SEQUENCE 생성
CREATE SEQUENCE TEMPNO_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


-- APPROVAL SEQUENCE 생성
CREATE SEQUENCE APPROVAL_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;




-- DOCUMENT INSERT
INSERT INTO DOCUMENT
(DOCNO, WIRTER_ID, CONTENT, TITLE, DRAFT_DATE, URGENT, TEMPNO, DOC_STATUS)
VALUES(TO_CHAR(SYSDATE, 'YYYY') || LPAD(DOCNO.NEXTVAL, 5, '0'), 19950206, '<h1>문서양식 HTML</h1>', '휴가신청서입니다', SYSDATE, 'N', 1, 1);



















--본부 더미데이터
INSERT INTO HEADQUARTERS
(HEADNO, HNAME, HEAD_MGR, DELFLAG)
SELECT '01', '경영지원본부', '', 'N' FROM DUAL
UNION ALL
SELECT '02', '개발본부', '', 'N' FROM DUAL
UNION ALL
SELECT '03', '영업본부', '', 'N' FROM DUAL
UNION ALL
SELECT '04', '생산본부', '', 'N' FROM DUAL
;

INSERT INTO HEADQUARTERS (HEADNO, HNAME, HEAD_MGR, DELFLAG)
   VALUES ('00', '중앙본부', '', 'N');

  
  
--부서 더미데이터
INSERT INTO DEPARTMENT
(DEPTNO, DNAME, DEPT_MGR, HEADNO, DELFLAG)
SELECT '01', '회계팀', '', '01', 'N' FROM DUAL
UNION ALL
SELECT '02', '재무팀', '', '01', 'N' FROM DUAL
UNION ALL
SELECT '03', '총무팀', '', '01', 'N' FROM DUAL
UNION ALL
SELECT '04', '신기술개발팀', '', '02', 'N' FROM DUAL
UNION ALL
SELECT '05', '내부개발팀', '', '02', 'N' FROM DUAL
UNION ALL
SELECT '06', '기술영업팀', '', '03', 'N' FROM DUAL
UNION ALL
SELECT '07', '상품영업팀', '', '03', 'N' FROM DUAL
UNION ALL
SELECT '08', '우유생산팀', '', '04', 'N' FROM DUAL;

INSERT INTO DEPARTMENT d  (DEPTNO, DNAME, DEPT_MGR, HEADNO, DELFLAG)
   VALUES ('09', '인사팀', '', '01', 'N');

  INSERT INTO DEPARTMENT d  (DEPTNO, DNAME, DEPT_MGR, HEADNO, DELFLAG)
   VALUES ('00', '대표', '', '00', 'N');
  
--사원 더미데이터
INSERT INTO EMPLOYEE e (ID, NAME, PASSWORD, 
                  EMAIL, PHONE, BIRTHDAY, GENDER,
                  ADDRESS, DEPTNO, SPOT, "POSITION",
                  ESTATUS, JOIN_DAY, EXIT_DAY, ETYPE,
                  LEAVE, AUTH, PROFILE, FAIL)
SELECT '2303100101', '이지원', 'q1w2e3r4', 
      'ljw@naver.com', '01012345678', '1995-01-01', 'F',
      '서울특별시 강남구 강남에 살고 있습니다 100-00번지', '01', '05', '',
      'Y', '2023-03-10', '', 'A',
      '15', '01', '', '0' FROM DUAL
UNION ALL
SELECT '2403110901', '김태민', 'q1w2e3r4!!', 
      'ktm@naver.com', '01012340000', '1995-02-02', 'M',
      '서울특별시 관악구 관악에 살고 있습니다 100-00번지', '09', '02', '',
      'Y', '2024-03-11', '', 'A',
      '12', '02', '', '0' FROM DUAL
UNION ALL
SELECT '2403110902', '이혜원', 'q1w2e3!!', 
      'lhw@naver.com', '01000000000', '1995-03-03', 'F',
      '서울특별시 잠실구 잠실에 살고 있습니다 100-00번지', '09', '01', '',
      'Y', '2024-03-11', '', 'A',
      '14', '02', '', '0' FROM DUAL
UNION ALL
SELECT '2402110501', '배강훈', '1234', 
      'bkh@naver.com', '01025802580', '1995-04-04', 'M',
      '서울특별시 안양구 안양에 살고 있습니다 100-00번지', '05', '03', '',
      'Y', '2024-02-11', '', 'A',
      '2', '01', '', '0' FROM DUAL
UNION ALL
SELECT '2401110301', '이성민', '0000', 
      'lsm@naver.com', '01000002580', '1995-05-05', 'M',
      '서울특별시 인천구 인천에 살고 있습니다 100-00번지', '03', '02', '',
      'Y', '2024-01-11', '', 'A',
      '5', '01', '', '0' FROM DUAL
UNION ALL
SELECT '2312120601', '임주영', 'asd', 
      'ljy@naver.com', '01011112580', '1995-06-06', 'F',
      '서울특별시 홍대구 홍대에 살고 있습니다 100-00번지', '06', '04', '',
      'Y', '2023-12-12', '', 'A',
      '5', '01', '', '0' FROM DUAL;


     
     
---------------------------------------------------------------

     
     
     
-- 문서양식 등록
INSERT INTO TEMPLATE
(TEMPNO, EMP_ID, HTML, CREATEAT)
SELECT '01', '2403110902', '<h1>하이</h1>', SYSDATE FROM DUAL
UNION ALL
SELECT '02', '2403110902', '<h1>하이</h1>', SYSDATE FROM DUAL
UNION ALL
SELECT '03', '2403110902', '<h1>하이</h1>', SYSDATE FROM DUAL
UNION ALL
SELECT '04', '2403110902', '<h1>하이</h1>', SYSDATE FROM DUAL;

INSERT INTO TEMPLATE
(TEMPNO, EMP_ID, HTML, CREATEAT)
VALUES ('01', '2403110902', '<h1>하이</h1>', SYSDATE);

-- 문서양식 삭제
DELETE FROM TEMPLATE
WHERE TEMPNO='01';


-- 문서양식 전체조회
SELECT c.CODE_NAME, EMP_ID, CREATEAT 
	FROM TEMPLATE t JOIN COMMON c 
	ON t.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드';


-- 문서양식 상세조회
SELECT c.CODE ,c.CODE_NAME, HTML , EMP_ID , CREATEAT 
	FROM TEMPLATE t JOIN COMMON c 
	ON t.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드'
	WHERE t.TEMPNO = '02'; 



-------------------------------------------------------------------



-- 문서양식유형 추가
INSERT INTO COMMON ("TYPE", CODE, CODE_NAME, DESCRIPTION)
SELECT '문서양식코드', '04', '새로운문서양식유형', '' FROM DUAL
UNION ALL
SELECT '문서양식코드', '05', '또다른문서양식유형', '' FROM DUAL
UNION ALL
SELECT '문서양식코드', '06', '뉴문서양식유형', '' FROM DUAL;


-- 문서양식유형 수정
UPDATE COMMON
SET "TYPE"='문서양식코드', CODE='04', CODE_NAME='진짜새로운양식유형', DESCRIPTION='수정완료'
WHERE "TYPE" = '문서양식코드' AND CODE = '04';


-- 문서양식유형 삭제
DELETE FROM COMMON
WHERE "TYPE"='문서양식코드' AND CODE='05';


-- 문서양식유형 조회
SELECT CODE, CODE_NAME, DESCRIPTION
	FROM COMMON
	WHERE "TYPE" = '문서양식코드';



-----------------------------------------------------------------------



-- 기안서 상신
INSERT INTO DOCUMENT
(DOCNO, WRITER_ID, TITLE, CONTENT, DRAFT_DATE, URGENCY, TEMPNO, DOC_STATUS)
VALUES(TO_CHAR(SYSDATE,'YYYY')||TRIM(TO_CHAR(DOCNO_SEQ.NEXTVAL,'00000')), '2403110902', '이혜원 휴가신청서', '<h1>휴가신청서<h1>', SYSDATE, 'N', '04', '01');


-- 결재선 설정
INSERT INTO APPROVAL
(APPRNO, DOCNO, WRITER_ID, ATYPE, EMP_ID, APPR_STATUS, ORDERNO, APPR_DATE, SIGNATURE)
VALUES
(APPROVAL_SEQ.NEXTVAL, '202400005', '2403110902', '01', '2402110501', '01', 1, '', '');

INSERT INTO APPROVAL
(APPRNO, DOCNO, WRITER_ID, ATYPE, EMP_ID, APPR_STATUS, ORDERNO, APPR_DATE, SIGNATURE)
VALUES
(APPROVAL_SEQ.NEXTVAL, '202400005', '2403110902', '01', '2312120601', '01', 2, '', '');

INSERT INTO APPROVAL
(APPRNO, DOCNO, WRITER_ID, ATYPE, EMP_ID, APPR_STATUS, ORDERNO, APPR_DATE, SIGNATURE)
VALUES
(APPROVAL_SEQ.NEXTVAL, '202400005', '2403110902', '01', '2303100101', '01', 3, '', '');

INSERT INTO APPROVAL
(APPRNO, DOCNO, WRITER_ID, ATYPE, EMP_ID, APPR_STATUS, ORDERNO, APPR_DATE, SIGNATURE)
VALUES
(APPROVAL_SEQ.NEXTVAL, '202400005', '2403110902', '03', '2403110902', '', 4, '', '');

INSERT INTO APPROVAL
(APPRNO, DOCNO, WRITER_ID, ATYPE, EMP_ID, APPR_STATUS, ORDERNO, APPR_DATE, SIGNATURE)
VALUES
(APPROVAL_SEQ.NEXTVAL, '202400005', '2403110902', '02', '2402110501', '', '', '', '');


-- 결재선 정보 조회
SELECT APPRNO , DOCNO , WRITER_ID , 
	ATYPE , EMP_ID , APPR_STATUS , 
	ORDERNO , APPR_DATE , SIGNATURE , 
	e.NAME , e.SPOT , e."POSITION"
	FROM APPROVAL a JOIN EMPLOYEE e 
	ON a.EMP_ID = e.ID 
	WHERE DOCNO = '202400003' AND ATYPE = '01'
	ORDER BY ORDERNO ;


-- 참조자 조회
SELECT EMP_ID , e.NAME , e.SPOT , e."POSITION"
	FROM APPROVAL a JOIN EMPLOYEE e 
	ON a.EMP_ID = e.ID 
	WHERE DOCNO = '202400003' AND ATYPE = '02';


-- 기안자 조회
SELECT WRITER_ID , e.NAME , e.SPOT , e."POSITION"
	FROM APPROVAL a JOIN EMPLOYEE e 
	ON a.EMP_ID = e.ID 
	WHERE DOCNO = '202400003' AND ATYPE = '03';


-- 결재 승인
UPDATE APPROVAL
SET APPR_STATUS='02', APPR_DATE=SYSDATE, SIGNATURE='승인'
WHERE DOCNO = '202400004' AND EMP_ID = '2403110901';


-- 기안서 상태 업데이트
UPDATE DOCUMENT 
SET DOC_STATUS = '02'
WHERE DOCNO = '202400003';


-- 결재 반려
UPDATE APPROVAL
SET APPR_STATUS='03', APPR_DATE=SYSDATE, SIGNATURE='반려'
WHERE DOCNO = '202400006' AND EMP_ID = '2402110501';

UPDATE DOCUMENT 
SET DOC_STATUS = '03'
WHERE DOCNO = '202400006';

-- 반려사유 등록
UPDATE DOCUMENT 
SET "COMMENT" = '반려사유'
WHERE DOCNO = '202400003';


-- 기안문서함 전체조회
SELECT d.DOCNO, d.WRITER_ID, d.TITLE, 
       d.DRAFT_DATE, d.URGENCY, 
       c.CODE_NAME AS 문서양식, 
       c2.CODE_NAME AS 기안서상태, 
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS 파일저장갯수
FROM DOCUMENT d 
JOIN COMMON c ON d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드'
JOIN COMMON c2 ON d.DOC_STATUS = c2.CODE AND c2."TYPE" = '기안서상태'
WHERE d.WRITER_ID = '2403110902';


-- 기안문서함 카테고리 전체조회
SELECT d.DOCNO, d.WRITER_ID, d.TITLE, 
       d.DRAFT_DATE, d.URGENCY, 
       c.CODE_NAME AS 문서양식, 
       c2.CODE_NAME AS 기안서상태, 
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS 파일저장갯수
FROM DOCUMENT d 
JOIN COMMON c ON d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드'
JOIN COMMON c2 ON d.DOC_STATUS = c2.CODE AND c2."TYPE" = '기안서상태'
WHERE d.WRITER_ID = '2403110902' AND c2.CODE_NAME  = '진행중';



-- 기안문서함 상세조회
SELECT DOCNO, WRITER_ID, TITLE, 
		CONTENT, DRAFT_DATE, URGENCY, 
		c.CODE_NAME AS 문서양식, c2.CODE_NAME AS 기안서상태, e.NAME ,
		d2.DNAME , h.HNAME , f.ORIGIN_NAME , f.FSIZE 
FROM DOCUMENT d
JOIN COMMON c ON d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드'
JOIN COMMON c2 ON d.DOC_STATUS = c2.CODE AND c2."TYPE" = '기안서상태'
JOIN EMPLOYEE e ON d.WRITER_ID = e.ID 
JOIN DEPARTMENT d2 ON e.DEPTNO = d2.DEPTNO  
JOIN HEADQUARTERS h ON h.HEADNO = d2.HEADNO
WHERE d.DOCNO = '202400003';


-- 결재할 문서(임시저장제외)
SELECT d.DOCNO, d.WRITER_ID, d.TITLE, 
       d.DRAFT_DATE, d.URGENCY, 
       c.CODE_NAME AS 문서양식, 
       c2.CODE_NAME AS 기안서상태, 
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID =d.DOCNO AND FTYPE = '01') AS 파일저장갯수
FROM DOCUMENT d 
	JOIN COMMON c ON d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드'
	JOIN COMMON c2 ON d.DOC_STATUS = c2.CODE AND c2."TYPE" = '기안서상태'
	JOIN APPROVAL_STEP_CHECK_VIEW a ON d.DOCNO = a.DOCNO 
WHERE a.APPR_CURRENT = '01' 
AND a.APPR_PREV ='02' 
AND a.EMP_ID='2403110902' 
AND a.ATYPE='01'
AND NOT d.DOC_STATUS = '04';
   

-- 결재문서함 전체조회
SELECT d.DOCNO, d.WRITER_ID, d.TITLE, 
       d.DRAFT_DATE, d.URGENCY, 
       c.CODE_NAME AS 문서양식, 
       c2.CODE_NAME AS 기안서상태, 
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS 파일저장갯수
FROM DOCUMENT d 
	JOIN COMMON c ON d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드'
	JOIN COMMON c2 ON d.DOC_STATUS = c2.CODE AND c2."TYPE" = '기안서상태'
	JOIN APPROVAL_STEP_CHECK_VIEW a ON d.DOCNO = a.DOCNO
WHERE (a.APPR_CURRENT = '01' AND a.APPR_PREV ='02'
       AND a.EMP_ID='2403110902' AND a.ATYPE='01'
       AND NOT d.DOC_STATUS = '04')
OR (a.ORDERNO = 1
AND a.EMP_ID='2403110902' AND a.ATYPE='01'
AND NOT d.DOC_STATUS = '04')
OR (a.APPR_CURRENT ='02'
	AND a.EMP_ID='2403110902' AND a.ATYPE='01'
    AND NOT d.DOC_STATUS = '04');


-- APPROVAL_STEP_CHECK_VIEW 생성
CREATE VIEW APPROVAL_STEP_CHECK_VIEW AS
SELECT ORDERNO , ATYPE, DOCNO, EMP_ID, APPR_STATUS APPR_CURRENT,
			   LAG(APPR_STATUS) OVER (PARTITION BY DOCNO ORDER BY ORDERNO) APPR_PREV
		 	FROM APPROVAL a ;


-- 결재문서함 카테고리별 전체조회
SELECT d.DOCNO, d.WRITER_ID, d.TITLE, 
       d.DRAFT_DATE, d.URGENCY, 
       c.CODE_NAME AS 문서양식, 
       c2.CODE_NAME AS 기안서상태, 
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS 파일저장갯수
FROM DOCUMENT d 
	JOIN COMMON c ON d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드'
	JOIN COMMON c2 ON d.DOC_STATUS = c2.CODE AND c2."TYPE" = '기안서상태'
	JOIN APPROVAL_STEP_CHECK_VIEW a ON d.DOCNO = a.DOCNO
WHERE (a.APPR_CURRENT = '01' AND a.APPR_PREV ='02'
       AND a.EMP_ID='2403110902' AND a.ATYPE='01'
       AND NOT d.DOC_STATUS = '04'
       AND d.DOC_STATUS = '01')
OR (a.ORDERNO = 1
	AND a.EMP_ID='2403110902' AND a.ATYPE='01'
	AND NOT d.DOC_STATUS = '04'
	AND d.DOC_STATUS = '01')
OR (a.APPR_CURRENT ='02'
	AND a.EMP_ID='2403110902' AND a.ATYPE='01'
    AND NOT d.DOC_STATUS = '04'
    AND d.DOC_STATUS = '01'
    );






-- 결재문서함 상세조회
SELECT d.DOCNO, d.DRAFT_DATE,
    (SELECT MAX(a.APPR_DATE)
     FROM APPROVAL a
     WHERE a.DOCNO = d.DOCNO) AS 최신결재일,
     d.URGENCY , d.WRITER_ID , c.CODE_NAME AS 문서양식, 
       c2.CODE_NAME AS 기안서상태, e.NAME , d2.DNAME , 
       h.HNAME , f.ORIGIN_NAME , f.FSIZE 
FROM DOCUMENT d
JOIN COMMON c ON d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드'
JOIN COMMON c2 ON d.DOC_STATUS = c2.CODE AND c2."TYPE" = '기안서상태'
JOIN EMPLOYEE e ON d.WRITER_ID = e.ID 
JOIN DEPARTMENT d2 ON e.DEPTNO = d2.DEPTNO  
JOIN HEADQUARTERS h ON h.HEADNO = d2.HEADNO 
WHERE d.DOCNO = '202400004';



-- 임시저장함 전체조회
SELECT d.DOCNO , d.TITLE , d.DRAFT_DATE , c.CODE_NAME AS 문서양식, 
		(SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS 파일저장갯수,
		c2.CODE_NAME AS 기안서상태
	FROM DOCUMENT d 
	JOIN COMMON c ON d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드'
	JOIN COMMON c2 ON d.DOC_STATUS = c2.CODE AND c2."TYPE" = '기안서상태'
	WHERE d.DOC_STATUS = '04';







