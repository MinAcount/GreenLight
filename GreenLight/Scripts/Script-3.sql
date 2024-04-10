
-- APPR_JSTREE_VIEW
CREATE VIEW APPR_JSTREE_VIEW (ID, TEXT, SPOT, ICON, PARENT) AS
SELECT '2311020001', '이대표', '07', 'glyphicon glyphicon-user', '00' FROM DUAL
UNION ALL
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


SELECT ID, TEXT, PARENT, SPOT, ICON
	FROM APPR_JSTREE_VIEW ajv;