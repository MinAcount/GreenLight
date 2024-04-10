UPDATE APPROVAL
SET APPR_STATUS='03', APPR_DATE=SYSDATE, SIGNATURE='반려'
WHERE DOCNO = '202400002' AND EMP_ID = '2311020001';

UPDATE DOCUMENT 
SET DOC_STATUS = '03'
WHERE DOCNO = '202400007';



SELECT DISTINCT D.DOCNO ,D.TITLE ,D.DRAFT_DATE ,D.URGENCY ,E.NAME ,C.CODE_NAME ,(SELECT COUNT(*) FROM FILESTORAGE f WHERE F.REF_ID = D.DOCNO AND FTYPE = '01') AS 첨부
        FROM DOCUMENT D
        JOIN APPROVAL A ON D.DOCNO = A.DOCNO
        JOIN EMPLOYEE E ON A.EMP_ID = E.ID
        JOIN COMMON C ON D.TEMPNO = C.CODE AND C."TYPE" = '문서양식코드'
        WHERE A.EMP_ID = '2311020001'
        AND A.APPR_STATUS = '01'
        AND A.ATYPE = '01'
        AND ( A.ORDERNO = 1 -- 사용자의 결재순서가 첫 번째일 때
                OR (
            A.ORDERNO <> 1 -- 사용자의 결재순서가 첫 번째가 아닐 때
                        AND EXISTS (
                        SELECT 1
                        FROM APPROVAL A2
                        WHERE A.DOCNO = A2.DOCNO
                                AND A2.ORDERNO = A.ORDERNO - 1
                                AND A2.APPR_STATUS = '02'
            )
        )
    );
    
   
   
   
   
INSERT INTO EMPLOYEE (ID, NAME, PASSWORD, EMAIL, PHONE, BIRTHDAY, GENDER, ADDRESS, DEPTNO, SPOT, "POSITION", ESTATUS, JOIN_DAY, EXIT_DAY, ETYPE, LEAVE, AUTH, PROFILE, FAIL)
SELECT '2305050201', '김동인', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'kdi@naver.com', '01012345678', '1998-02-01', 'M', '서울시 강남구', '02', '01', '', 'Y', '2023-05-05', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2305050202', '김지아', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'kja@naver.com', '01023456789', '1990-05-05', 'F', '서울시 강북구', '02', '06', '01', 'Y', '2023-05-05', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2305050203', '김태영', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'kty@naver.com', '01034567890', '1997-08-03', 'M', '서울시 강서구', '02', '01', '', 'Y', '2023-05-05', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2307050401', '김한국', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'khk@naver.com', '01045678901', '1991-04-01', 'M', '서울시 관악구', '04', '01', '', 'Y', '2023-07-05', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2307050402', '김동휘', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'kdh@naver.com', '01056789012', '1997-06-22', 'M', '서울시 관악구', '04', '01', '', 'Y', '2023-07-05', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2307050403', '류종윤', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'rjy@naver.com', '01067890123', '1990-11-15', 'M', '서울시 관악구', '04', '05', '01', 'Y', '2023-07-05', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2401220701', '전민균', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'jmk@naver.com', '01078901234', '1988-12-03', 'M', '서울시 송파구', '07', '06', '02', 'Y', '2024-01-22', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2401220702', '박경민', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'pkm@naver.com', '01089012345', '1992-12-02', 'M', '서울시 송파구', '07', '04', '01', 'Y', '2024-01-22', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2401220703', '서종우', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'sjw@naver.com', '01090123456', '2000-01-18', 'M', '서울시 송파구', '07', '01', '', 'Y', '2024-01-22', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2310230303', '신동준', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'sdj@naver.com', '01001234567', '1989-05-25', 'M', '서울시 마포구', '03', '06', '01', 'Y', '2023-10-23', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2205180101', '신정원', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'sjw@gmail.com', '01012345678', '1992-08-30', 'M', '서울시 성북구', '01', '04', '01', 'Y', '2022-05-18', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2306080201', '신윤상', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'sys@naver.com', '01012345678', '1996-09-14', 'M', '서울시 성북구', '02', '02', '', 'Y', '2023-06-08', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2209200301', '오지수', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'ojs@naver.com', '01045678901', '1990-11-11', 'M', '경기도 군포시', '03', '05', '', 'Y', '2022-09-20', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2308150401', '윤영훈', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'yyh@naver.com', '01056789012', '1993-08-30', 'M', '경기도 군포시', '04', '02', '', 'Y', '2023-08-15', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2312050501', '김재원', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'kjw@naver.com', '01067890123', '1998-07-25', 'M', '경기도 군포시', '05', '01', '', 'Y', '2023-12-05', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2401300601', '김희웅', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'khw@naver.com', '01078901234', '1995-06-11', 'M', '경기도 부천시', '06', '01', '', 'Y', '2024-01-30', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2402160802', '정우찬', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'jwc@naver.com', '01089012345', '1997-12-14', 'M', '경기도 부천시', '08', '01', '', 'Y', '2024-02-16', '', 'A', 0, '01', '', 0 FROM DUAL
UNION ALL
SELECT '2311080804', '박다운', '$2a$10$cWLrNwwsLBMJ.uRnQtsTRe3OAhtW8K0FGVJv6S/.hCh1o2Zr8VNiy', 'pdw@naver.com', '01090123456', '1994-05-08', 'F', '경기도 수원시', '08', '	05', '01', 'Y', '2023-11-08', '', 'A', 0, '01', '', 0 FROM DUAL;




-- APPR_JSTREE_VIEW
CREATE VIEW APPR_JSTREE_VIEW (ID, TEXT, SPOT, ICON, PARENT) AS
SELECT '2311020001', '이대표', '07', 'glyphicon glyphicon-user', '00' FROM DUAL
UNION ALLrmsep
SELECT '2303100101', '이지원', '05', 'glyphicon glyphicon-user', '01' FROM DUAL
UNION ALL
SELECT '2205180101', '신정원', '04', 'glyphicon glyphicon-user', '01' FROM DUAL
UNION ALL
SELECT '2311020101', '생신입', '01', 'glyphicon glyphicon-user', '01' FROM DUAL
UNION ALL
SELECT '2305050202', '김지아', '06', 'glyphicon glyphicon-user', '02' FROM DUAL
UNION ALL
SELECT '2306080201', '신윤상', '02', 'glyphicon glyphicon-user', '02' FROM DUAL
UNION ALL
SELECT '2305050201', '김동인', '01', 'glyphicon glyphicon-user', '02' FROM DUAL
UNION ALL
SELECT '2305050203', '김태영', '01', 'glyphicon glyphicon-user', '02' FROM DUAL
UNION ALL
SELECT '2310230303', '신동준', '06', 'glyphicon glyphicon-user', '03' FROM DUAL
UNION ALL
SELECT '2209200301', '오지수', '05', 'glyphicon glyphicon-user', '03' FROM DUAL
UNION ALL
SELECT '2401110301', '이성민', '02', 'glyphicon glyphicon-user', '03' FROM DUAL
UNION ALL
SELECT '2307050403', '류종윤', '05', 'glyphicon glyphicon-user', '04' FROM DUAL
UNION ALL
SELECT '2308150401', '윤영훈', '02', 'glyphicon glyphicon-user', '04' FROM DUAL
UNION ALL
SELECT '2307050401', '김한국', '01', 'glyphicon glyphicon-user', '04' FROM DUAL
UNION ALL
SELECT '2307050402', '김동휘', '01', 'glyphicon glyphicon-user', '05' FROM DUAL
UNION ALL
SELECT '2402110501', '배강훈', '04', 'glyphicon glyphicon-user', '05' FROM DUAL
UNION ALL
SELECT '402110502', '주인공', '02', 'glyphicon glyphicon-user', '05' FROM DUAL
UNION ALL
SELECT '402110501', '주인공', '02', 'glyphicon glyphicon-user', '05' FROM DUAL
UNION ALL
SELECT '2312050501', '김재원', '01', 'glyphicon glyphicon-user', '05' FROM DUAL
UNION ALL
SELECT '2301010501', '비정규', '01', 'glyphicon glyphicon-user', '05' FROM DUAL
UNION ALL
SELECT '2312120601', '임주영', '04', 'glyphicon glyphicon-user', '06' FROM DUAL
UNION ALL
SELECT '2403010601', '신입생', '01', 'glyphicon glyphicon-user', '06' FROM DUAL
UNION ALL
SELECT '2401300601', '김희웅', '01', 'glyphicon glyphicon-user', '06' FROM DUAL
UNION ALL
SELECT '2401220701', '전민균', '06', 'glyphicon glyphicon-user', '07' FROM DUAL
UNION ALL
SELECT '2401220702', '박경민', '04', 'glyphicon glyphicon-user', '07' FROM DUAL
UNION ALL
SELECT '2401220703', '서종우', '01', 'glyphicon glyphicon-user', '07' FROM DUAL
UNION ALL
SELECT '2311080804', '박다운', '05', 'glyphicon glyphicon-user', '08' FROM DUAL
UNION ALL
SELECT '2402160802', '정우찬', '01', 'glyphicon glyphicon-user', '08' FROM DUAL
UNION ALL
SELECT '2402240801', '비정규직테스트', '01', 'glyphicon glyphicon-user', '08' FROM DUAL
UNION ALL
SELECT '2403110902', '이혜원', '05', 'glyphicon glyphicon-user', '09' FROM DUAL
UNION ALL
SELECT '2403120901', '테스트', '03', 'glyphicon glyphicon-user', '09' FROM DUAL
UNION ALL
SELECT '2403110901', '김태민', '02', 'glyphicon glyphicon-user', '09' FROM DUAL
UNION ALL
SELECT '01', '회계팀', NULL, 'glyphicon glyphicon-briefcase', '11' FROM DUAL
UNION ALL
SELECT '02', '재무팀', NULL, 'glyphicon glyphicon-briefcase', '11' FROM DUAL
UNION ALL
SELECT '03', '총무팀', NULL, 'glyphicon glyphicon-briefcase', '11' FROM DUAL
UNION ALL
SELECT '04', '신기술개발팀', NULL, 'glyphicon glyphicon-briefcase', '12' FROM DUAL
UNION ALL
SELECT '05', '내부개발팀', NULL, 'glyphicon glyphicon-briefcase', '12' FROM DUAL
UNION ALL
SELECT '06', '기술영업팀', NULL, 'glyphicon glyphicon-briefcase', '13' FROM DUAL
UNION ALL
SELECT '07', '상품영업팀', NULL, 'glyphicon glyphicon-briefcase', '13' FROM DUAL
UNION ALL
SELECT '08', '우유생산팀', NULL, 'glyphicon glyphicon-briefcase', '14' FROM DUAL
UNION ALL
SELECT '09', '인사팀', NULL, 'glyphicon glyphicon-briefcase', '11' FROM DUAL
UNION ALL
SELECT '00', '대표', NULL, 'glyphicon glyphicon-briefcase', '10' FROM DUAL
UNION ALL
SELECT '11', '경영지원본부', NULL, 'glyphicon glyphicon-home', '#' FROM DUAL
UNION ALL
SELECT '12', '개발본부', NULL, 'glyphicon glyphicon-home', '#' FROM DUAL
UNION ALL
SELECT '13', '영업본부', NULL, 'glyphicon glyphicon-home', '#' FROM DUAL
UNION ALL
SELECT '14', '생산본부', NULL, 'glyphicon glyphicon-home', '#' FROM DUAL
UNION ALL
SELECT '10', '중앙본부', NULL, 'glyphicon glyphicon-home', '#' FROM DUAL;


SELECT ID, TEXT, PARENT, POSITION, ICON
	FROM APPR_JSTREE_VIEW ajv;