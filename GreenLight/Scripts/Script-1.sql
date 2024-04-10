
-- 기안문서함
SELECT d.DOCNO, e.NAME , d.TITLE, 
       d.DRAFT_DATE, d.URGENCY, 
       (SELECT CODE_NAME FROM COMMON c WHERE d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드') AS TEMPNO,
       (SELECT CODE_NAME FROM COMMON c WHERE d.DOC_STATUS  = c.CODE AND c."TYPE" = '기안서상태') AS DOC_STATUS,
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS FILE_COUNT
		FROM DOCUMENT d 
		JOIN EMPLOYEE e ON d.WRITER_ID = e.ID 
		WHERE d.WRITER_ID = '2403110902'
		AND NOT d.DOC_STATUS = '04'
		ORDER BY CASE WHEN d.URGENCY = 'Y' THEN 0 ELSE 1 END, d.DRAFT_DATE DESC ;
		
	
SELECT d.DOCNO, e.NAME, d.TITLE, 
       d.DRAFT_DATE, d.URGENCY, 
       (SELECT CODE_NAME FROM COMMON c WHERE d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드') AS TEMPNO,
       (SELECT CODE_NAME FROM COMMON c WHERE d.DOC_STATUS  = c.CODE AND c."TYPE" = '기안서상태') AS DOC_STATUS,
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS 파일저장갯수
	FROM DOCUMENT d 
	JOIN EMPLOYEE e ON d.WRITER_ID = e.ID
	WHERE d.WRITER_ID = '2403110902' 
	AND NOT d.DOC_STATUS = '04' 
	AND d.DOC_STATUS = '01'
	ORDER BY CASE WHEN d.URGENCY = 'Y' THEN 0 ELSE 1 END, d.DRAFT_DATE DESC ;
	
-- 임시보관함
SELECT d.DOCNO , d.TITLE , d.DRAFT_DATE ,
			(SELECT CODE_NAME FROM COMMON c WHERE d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드') AS TEMPNO,
			(SELECT CODE_NAME FROM COMMON c WHERE d.TEMPNO = c.CODE AND c."TYPE" = '기안서상태') AS DOC_STATUS,
            (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS 파일저장갯수
        FROM DOCUMENT d 
        WHERE d.DOC_STATUS = '04' AND d.WRITER_ID = '2403110902';
        
       
       
CREATE VIEW APPROVAL_STEP_CHECK_VIEW AS
SELECT ORDERNO , ATYPE, DOCNO, EMP_ID, APPR_STATUS APPR_CURRENT,
                           LAG(APPR_STATUS) OVER (PARTITION BY DOCNO ORDER BY ORDERNO) APPR_PREV
                         FROM APPROVAL a ;
                         
                        
                        
-- 결재문서함                      
SELECT d.DOCNO, e.NAME , d.TITLE, 
       d.DRAFT_DATE,
       (SELECT MAX(APPR_DATE) FROM APPROVAL a2 WHERE d.DOCNO = a2.DOCNO) AS APPR_DATE,
       d.URGENCY, 
       (SELECT CODE_NAME FROM COMMON c WHERE d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드') AS TEMPNO,
       (SELECT CODE_NAME FROM COMMON c WHERE d.DOC_STATUS  = c.CODE AND c."TYPE" = '기안서상태') AS DOC_STATUS,
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS FILE_COUNT
FROM DOCUMENT d 
        JOIN APPROVAL_STEP_CHECK_VIEW a ON d.DOCNO = a.DOCNO
        JOIN EMPLOYEE e ON d.WRITER_ID = e.ID  
WHERE (a.APPR_CURRENT = '01' AND a.APPR_PREV ='02'
       AND a.EMP_ID='2403110902' AND a.ATYPE='01'
       AND NOT d.DOC_STATUS = '04')
OR (a.ORDERNO = 1
AND a.EMP_ID='2403110902' AND a.ATYPE='01'
AND NOT d.DOC_STATUS = '04')
OR (a.APPR_CURRENT ='02'
        AND a.EMP_ID='2403110902' AND a.ATYPE='01'
    AND NOT d.DOC_STATUS = '04');
    
   
   
   
-- 참조문서함
   SELECT d.DOCNO, e.NAME , d.TITLE, 
       d.DRAFT_DATE,
       (SELECT MAX(APPR_DATE) FROM APPROVAL a2 WHERE d.DOCNO = a2.DOCNO) AS APPR_DATE,
       d.URGENCY, 
       (SELECT CODE_NAME FROM COMMON c WHERE d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드') AS TEMPNO,
       (SELECT CODE_NAME FROM COMMON c WHERE d.DOC_STATUS  = c.CODE AND c."TYPE" = '기안서상태') AS DOC_STATUS,
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS FILE_COUNT
			FROM DOCUMENT d 
			        JOIN EMPLOYEE e ON d.WRITER_ID = e.ID
			        JOIN APPROVAL a ON d.DOCNO = a.DOCNO 
			WHERE a.ATYPE = '02' AND a.EMP_ID = '2303100101'
			AND NOT d.DOC_STATUS = '04';
   
   
SELECT d.DOCNO, e.NAME , d.TITLE, 
       d.DRAFT_DATE,
       (SELECT MAX(APPR_DATE) FROM APPROVAL a2 WHERE d.DOCNO = a2.DOCNO) AS APPR_DATE,
       d.URGENCY, 
       (SELECT CODE_NAME FROM COMMON c WHERE d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드') AS TEMPNO,
       (SELECT CODE_NAME FROM COMMON c WHERE d.DOC_STATUS  = c.CODE AND c."TYPE" = '기안서상태') AS DOC_STATUS,
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS FILE_COUNT
FROM DOCUMENT d 
        JOIN EMPLOYEE e ON d.WRITER_ID = e.ID
        JOIN APPROVAL a ON d.DOCNO = a.DOCNO 
WHERE a.ATYPE = '02' AND a.EMP_ID = '2303100101'
AND NOT d.DOC_STATUS = '04';

 --결재문서함 카테고리별 전체조회  
SELECT d.DOCNO, e.NAME, d.WRITER_ID, d.TITLE, 
       d.DRAFT_DATE, 
       (SELECT MAX(APPR_DATE) FROM APPROVAL a2 WHERE d.DOCNO = a2.DOCNO AND NOT d.DOC_STATUS='04' AND NOT d.DOC_STATUS='01') AS APPR_DATE,
       d.URGENCY, 
       (SELECT CODE_NAME FROM COMMON c WHERE d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드') AS TEMPNO,
       (SELECT CODE_NAME FROM COMMON c WHERE d.DOC_STATUS  = c.CODE AND c."TYPE" = '기안서상태') AS DOC_STATUS,
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS FILE_COUNT
			FROM DOCUMENT d 
			        JOIN APPROVAL_STEP_CHECK_VIEW a ON d.DOCNO = a.DOCNO
			        JOIN EMPLOYEE e ON d.WRITER_ID = e.ID 
			WHERE (a.APPR_CURRENT = '01' AND a.APPR_PREV ='02'
			       AND a.EMP_ID='2303100101' AND a.ATYPE='01'
			       AND d.DOC_STATUS = '01')
			OR (a.ORDERNO = 1
			        AND a.EMP_ID='2303100101' AND a.ATYPE='01'
			        AND d.DOC_STATUS = '01')
			OR (a.APPR_CURRENT ='01'
			        AND a.EMP_ID='2303100101' AND a.ATYPE='01'
			    AND d.DOC_STATUS = '01'
			    );

		SELECT d.DOCNO, e.NAME , d.TITLE, 
       d.DRAFT_DATE,
       (SELECT MAX(APPR_DATE) FROM APPROVAL a2 WHERE d.DOCNO = a2.DOCNO AND NOT d.DOC_STATUS='04' AND NOT d.DOC_STATUS='01') AS APPR_DATE,
       d.URGENCY, 
       (SELECT CODE_NAME FROM COMMON c WHERE d.TEMPNO = c.CODE AND c."TYPE" = '문서양식코드') AS TEMPNO,
       (SELECT CODE_NAME FROM COMMON c WHERE d.DOC_STATUS  = c.CODE AND c."TYPE" = '기안서상태') AS DOC_STATUS,
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS FILE_COUNT
			FROM DOCUMENT d 
			        JOIN EMPLOYEE e ON d.WRITER_ID = e.ID
			        JOIN APPROVAL a ON d.DOCNO = a.DOCNO 
			WHERE a.ATYPE = '02' AND a.EMP_ID = '2303100101'
			AND NOT d.DOC_STATUS = '04';\
			
			
			
			
			
			
			
SELECT d.DOCNO, e.NAME , d.TITLE, 
       d.DRAFT_DATE,
       (SELECT MAX(APPR_DATE) FROM APPROVAL a2 WHERE d.DOCNO = a2.DOCNO) AS APPR_DATE,
       d.URGENCY, 
       (SELECT CODE_NAME FROM COMMON c WHERE d.TEMPNO = c.CODE AND c.TYPE = '문서양식코드') AS TEMPNO,
       (SELECT CODE_NAME FROM COMMON c WHERE d.DOC_STATUS  = c.CODE AND c.TYPE = '기안서상태') AS DOC_STATUS,
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS FILE_COUNT
	FROM DOCUMENT d 
	        JOIN EMPLOYEE e ON d.WRITER_ID = e.ID
	        JOIN APPROVAL a ON d.DOCNO = a.DOCNO 
	WHERE a.ATYPE = '02' AND a.EMP_ID = '2303100101'
	AND d.DOC_STATUS = '01';