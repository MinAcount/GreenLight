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
    HEADNO VARCHAR2(2) NOT NULL, -- 본부번호
    HNAME VARCHAR2(50) NOT NULL, -- 본부명
    HEAD_MGR VARCHAR2(10), 		 -- 본부장 사원번호
    DELFLAG CHAR(1) DEFAULT 'N' NOT NULL -- 삭제여부
);
ALTER TABLE HEADQUARTERS ADD CONSTRAINT PK_HEADQUARTERS PRIMARY KEY (HEADNO);

-- 부서 테이블
CREATE TABLE DEPARTMENT (
    DEPTNO VARCHAR2(2) NOT NULL, -- 부서번호
    DNAME VARCHAR2(50) NOT NULL, -- 부서명
    DEPT_MGR VARCHAR2(10), 		 -- 부서장 사원번호
    HEADNO VARCHAR2(2) NOT NULL, -- 상위본부
    DELFLAG CHAR(1) DEFAULT 'N'  -- 삭제여부
);
ALTER TABLE DEPARTMENT ADD CONSTRAINT PK_DEPARTMENT PRIMARY KEY (DEPTNO);
ALTER TABLE DEPARTMENT ADD CONSTRAINT FK_HEADQUARTERS_HEA FOREIGN KEY (HEADNO) REFERENCES HEADQUARTERS(HEADNO);

-- 사원 테이블
CREATE TABLE EMPLOYEE (
    ID VARCHAR2(10) NOT NULL, 					-- 사원번호
    NAME VARCHAR2(60) NOT NULL, 				-- 이름
    PASSWORD VARCHAR2(20) DEFAULT '1q2w3e4r!!' NOT NULL, -- 비밀번호
    EMAIL VARCHAR2(60) NOT NULL, 				-- 이메일
    PHONE VARCHAR2(11) NOT NULL, 				-- 전화번호
    BIRTHDAY DATE, 								-- 생년월일
    GENDER CHAR(1), 							-- 성별
    ADDRESS VARCHAR2(300), 						-- 주소
    DEPTNO VARCHAR2(2), 						-- 부서번호
    SPOT VARCHAR2(20), 							-- 직위
    "POSITION" VARCHAR2(20), 					-- 직책
    ESTATUS CHAR(1) DEFAULT 'Y' NOT NULL, 		-- 재직상태
    JOIN_DAY DATE, 								-- 입사일
    EXIT_DAY DATE, 								-- 퇴사일
    ETYPE CHAR(1), 								-- 근무형태
    LEAVE NUMBER DEFAULT 0 NOT NULL, 			-- 연차
    AUTH CHAR(3) DEFAULT '01' NOT NULL, 		-- 권한
    PROFILE CLOB, 								-- 프로필사진
    FAIL NUMBER DEFAULT 0 NOT NULL				-- 실패횟수
);
ALTER TABLE EMPLOYEE ADD CONSTRAINT PK_EMPLOYEE PRIMARY KEY (ID);
ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_EMPLOYEE_DEP FOREIGN KEY (DEPTNO) REFERENCES DEPARTMENT(DEPTNO);

-- 전자서명 테이블
CREATE TABLE SIGNLIST (
    SIGNNO VARCHAR2(10) NOT NULL, -- 서명번호
    ID VARCHAR2(10) NOT NULL, 	  -- 사원번호
    SAVE_SIGN CLOB NOT NULL, 	  -- 저장서명
    MAIN CHAR(1) DEFAULT 'N' 	  -- 기본서명 여부
);
ALTER TABLE SIGNLIST ADD CONSTRAINT PK_SIGNATURE PRIMARY KEY (SIGNNO);

-- 근태 테이블
CREATE TABLE ATTENDANCE (
    ID VARCHAR2(10) NOT NULL, -- 사원번호
    IN_DATE DATE, 		 	  -- 근태시간(출근시간)
    OUT_DATE DATE, 		 	  -- 근태시간(퇴근시간)
    ATT_STATUS VARCHAR2(50)   -- 근태상황
);

-- 연차사용 테이블
CREATE TABLE VACATION (
    VACNO VARCHAR2(10) NOT NULL,-- 연차번호
    ID VARCHAR2(10) NOT NULL, 	-- 사원번호
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
    WRITER_ID VARCHAR2(10) NOT NULL,-- 사원번호
    TITLE VARCHAR2(200) NOT NULL, 	-- 제목
    CONTENT CLOB NOT NULL, 			-- 문서내용(HTML)
    DRAFT_DATE DATE NOT NULL, 		-- 기안일
    URGENCY CHAR(1) DEFAULT 'N' NOT NULL, -- 긴급여부
    TEMPNO VARCHAR2(2) NOT NULL, 		  -- 기안서 양식유형
    DOC_STATUS VARCHAR2(2) NOT NULL		  -- 기안서 상태
);
ALTER TABLE DOCUMENT ADD CONSTRAINT PK_DOCUMENT PRIMARY KEY (DOCNO, WRITER_ID);

-- 결재 테이블
CREATE TABLE APPROVAL (
    APPRNO VARCHAR2(10) NOT NULL,  	 -- 결재번호
    DOCNO VARCHAR2(10) NOT NULL,   	 -- 문서번호
    WRITER_ID VARCHAR2(10) NOT NULL, -- 작성자 사원번호
    ATYPE VARCHAR2(2) NOT NULL,    	 -- 결재타입
    EMP_ID VARCHAR2(10) NOT NULL,  	 -- 사원번호
    APPR_STATUS VARCHAR2(2), 		 -- 결재상태
    ORDERNO NUMBER,      	 		 -- 결재순서
    APPR_DATE DATE,               	 -- 결재일
    SIGNATURE CLOB, 				 -- 서명
    "COMMENT" VARCHAR2(200)			 -- 부가정보
);
ALTER TABLE APPROVAL ADD CONSTRAINT PK_APPROVAL PRIMARY KEY (APPRNO);
ALTER TABLE APPROVAL ADD CONSTRAINT FK_APPROVAL_DOC FOREIGN KEY (DOCNO, WRITER_ID) REFERENCES DOCUMENT (DOCNO, WRITER_ID);

-- 양식 테이블
CREATE TABLE TEMPLATE (
    TEMPNO VARCHAR2(2) NOT NULL,    -- 문서양식코드
    EMP_ID VARCHAR2(10) NOT NULL, 	-- 작성자
    HTML CLOB NOT NULL, 			-- 양식 소스(HTML)
    CREATEAT DATE DEFAULT CURRENT_DATE NOT NULL -- 작성일
);

--------------------------------------------------------3.채팅--------------------------------------------------------

-- 메시지 테이블
CREATE TABLE MESSAGE (
    MESG_ID VARCHAR2(10) NOT NULL,     	 -- 메시지ID
    CHAT_ID VARCHAR2(10) NOT NULL,   	 -- 채팅방ID
    WRITTER VARCHAR2(60) NOT NULL,     	 -- 작성자
    CONTENT VARCHAR2(3000) NOT NULL, 	 -- 내용
    SEND_DATE DATE NOT NULL,        	 -- 전송시간
    FILE_YN CHAR(1) DEFAULT 'N' NOT NULL -- 파일ID
);
ALTER TABLE MESSAGE ADD CONSTRAINT PK_MESSAGE PRIMARY KEY (MESG_ID);

-- 구성원 테이블
CREATE TABLE GROUPMEMBER (
    GROUPNO VARCHAR2(10) NOT NULL, -- 그룹ID
    CHAT_ID VARCHAR2(10) NOT NULL, -- 채팅방ID
    ID VARCHAR2(10) NOT NULL,       -- 사원번호
    NAME VARCHAR2(60) NOT NULL,    -- 채팅방이름
    NOTI CHAR(1) DEFAULT 'Y' NOT NULL,      -- 알림여부
    GROUP_OUT CHAR(1) DEFAULT 'N' NOT NULL, -- 나감여부
    LAST_MESG VARCHAR2(10),         		-- 마지막 메세지 정보
    FAVOR CHAR(1) DEFAULT 'N' NOT NULL      -- 즐겨찾기
);
ALTER TABLE GROUPMEMBER ADD CONSTRAINT PK_GROUPMEMBER PRIMARY KEY (GROUPNO);

--------------------------------------------------------4.일정--------------------------------------------------------

-- 일정 테이블
CREATE TABLE SCHEDULE (
    SCHEDULE_ID VARCHAR2(10) NOT NULL,  		 -- 일정ID
    CRNO VARCHAR2(10) NOT NULL,  				 -- 생성자ID
    CREATOR VARCHAR2(60) NOT NULL,  			 -- 생성자 이름
    PHONE VARCHAR2(20),  						 -- 전화번호
    MODIFIED DATE DEFAULT CURRENT_DATE NOT NULL, -- 수정 일자
    USERTYPE VARCHAR2(20) DEFAULT '개인일정' NOT NULL, -- 대분류
    CATEGORY VARCHAR2(2) NOT NULL,      	-- 소분류 코드
    TITLE VARCHAR2(100) NOT NULL,  			-- 제목
    MEMO VARCHAR2(500),  					-- 메모
    START_DATE DATE NOT NULL,  				-- 시작일
    END_DATE DATE NOT NULL,  				-- 종료일
    LOCATION VARCHAR2(500),  				-- 장소
    PRIORITY VARCHAR2(2) NOT NULL,			-- 우선순위
    RECUR CHAR(1) DEFAULT 'N' NOT NULL,		-- 반복 여부
    VISIBILITY CHAR(1) DEFAULT 'Y' NOT NULL,-- 공개 여부
    PARTICIPANTS CLOB CONSTRAINT ENSURE_PARTICIPANTS CHECK (PARTICIPANTS IS JSON), 	-- 참여자 목록
    PERMISSION CHAR(1) DEFAULT 'R' NOT NULL,  										-- 접근권한
    ALARM VARCHAR2(2) DEFAULT '08' NOT NULL 												-- 알람코드
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
ALTER TABLE CONFERENCE ADD CONSTRAINT UQ_CONFERENCE_CNAME UNIQUE (CNAME);
ALTER TABLE CONFERENCE ADD CONSTRAINT UQ_CONFERENCE_HO UNIQUE (HO);

-- 예약 테이블
CREATE TABLE RESERVATION (
    RESERVENO VARCHAR2(10) NOT NULL, 	-- 예약번호
    APPLICANT VARCHAR2(10) NOT NULL, 	-- 예약자ID
    PHONE VARCHAR2(20) NOT NULL, 	 	-- 전화번호
    RESERVE_DATE DATE NOT NULL, 	 	-- 예약날짜
    MEETINGTITLE VARCHAR2(100) NOT NULL -- 회의제목
);
ALTER TABLE RESERVATION ADD CONSTRAINT PK_RESERVATION PRIMARY KEY (RESERVENO);

-- 예약리스트 테이블
CREATE TABLE CHECKLIST (
    LSEQ NUMBER NOT NULL, 			 -- 순번
    RESERVENO VARCHAR2(10) NOT NULL, -- 예약번호
    CONF_ID VARCHAR2(10) NOT NULL	 -- 회의실ID
    
);
ALTER TABLE CHECKLIST ADD CONSTRAINT PK_CHECKLIST PRIMARY KEY (LSEQ); -- PK
ALTER TABLE CHECKLIST ADD CONSTRAINT FK_CHECKLIST_RES FOREIGN KEY (RESERVENO) REFERENCES RESERVATION(RESERVENO); -- 예약번호 외래키
ALTER TABLE CHECKLIST ADD CONSTRAINT FK_CHECKLIST_CON FOREIGN KEY (CONF_ID) REFERENCES CONFERENCE(CONF_ID); -- 회의실ID 외래키

--------------------------------------------------------6.알림--------------------------------------------------------

-- 알림 테이블
CREATE TABLE NOTIFICATION (
    NOTI_ID VARCHAR2(10) NOT NULL, 	-- 알림ID
    GUBUN VARCHAR2(10), 			-- 구분ID
    NTYPE VARCHAR2(2), 				-- 분류
    SENDER VARCHAR2(10), 			-- 발신자
    RECEIVER CLOB CONSTRAINT ENSURE_RECEIVER CHECK (RECEIVER IS JSON), -- 수신자
    ALERT_TIME DATE, 				-- 알림시간
    CONTENT VARCHAR2(2000) 			-- 알림내용
);
ALTER TABLE NOTIFICATION ADD CONSTRAINT PK_NOTIFICATION PRIMARY KEY (NOTI_ID); -- PK

--------------------------------------------------------시퀀스--------------------------------------------------------

CREATE SEQUENCE VACATION_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE DOCUMENT_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE TEMPLATE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE APPROVAL_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE MESSAGE_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;
CREATE SEQUENCE GROUPMEMBER_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCYCLE;

CREATE SEQUENCE SCHEDULE_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE CONFERENCE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE RESERVATION_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE CHECKLIST_SEQ START WITH 11 INCREMENT BY 1 NOCACHE NOCYCLE NOMAXVALUE;

--------------------------------------------------------------------------------------------------------------------
COMMIT;
--------------------------------------------------------------------------------------------------------------------

/*
 * <테이블 삭제>
 * FK 관계 있는 테이블은 지정 순서대로 삭제해주세요 		  
 * 테이블 생성시 지우고 사용해주세요

-- 테이블 삭제
DROP TABLE EMPLOYEE; -- FK DEPARTMENT
DROP TABLE DEPARTMENT; -- FK HEADQUARTERS
DROP TABLE HEADQUARTERS;
DROP TABLE SIGNLIST; 
DROP TABLE ATTENDANCE;
DROP TABLE VACATION; 

DROP TABLE APPROVAL; -- FK DOCUMENT
DROP TABLE DOCUMENT;
DROP TABLE TEMPLATE;

DROP TABLE GROUPMEMBER;
DROP TABLE MESSAGE;

DROP TABLE SCHEDULE;

DROP TABLE CHECKLIST; -- FK CONFERENCE, FK RESERVATION
DROP TABLE CONFERENCE;
DROP TABLE RESERVATION; 

DROP TABLE NOTIFICATION;

-- 시퀀스 삭제
DROP SEQUENCE VACATION_SEQ;

DROP SEQUENCE DOCUMENT_SEQ;
DROP SEQUENCE TEMPLATE_SEQ;
DROP SEQUENCE APPROVAL_SEQ;

DROP SEQUENCE MESSAGE_SEQ;
DROP SEQUENCE GROUPMEMBER_SEQ;

DROP SEQUENCE SCHEDULE_SEQ;

DROP SEQUENCE CONFERENCE_SEQ;
DROP SEQUENCE RESERVATION_SEQ;
DROP SEQUENCE CHECKLIST_SEQ;

 */