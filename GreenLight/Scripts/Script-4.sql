INSERT INTO APPROVAL
		(APPRNO, DOCNO, WRITER_ID, ATYPE, EMP_ID, APPR_STATUS, ORDERNO)
		SELECT 
		'55', '202400011', '2402110501', '01', '2403110901', '01', 2  FROM DUAL;
		
SELECT APPROVAL_SEQ.NEXTVAL FROM DUAL;

CREATE SEQUENCE APPROVAL_SEQ
START WITH 53
INCREMENT BY 1
NOCACHE
NOCYCLE;


SELECT TO_NUMBER(DOCNO) FROM DOCUMENT;
SELECT MAX(TO_NUMBER(DOCNO)) FROM DOCUMENT;
SELECT MAX(TO_NUMBER(APPRNO)) FROM APPROVAL;


 INSERT INTO APPROVAL (APPRNO, DOCNO, WRITER_ID, ATYPE, EMP_ID, APPR_STATUS, ORDERNO)
        VALUES
            (TO_CHAR((SELECT MAX(TO_NUMBER(APPRNO)) FROM APPROVAL)+1), (SELECT MAX(DOCNO) FROM DOCUMENT), '2402110501', '01', '2403110902', '01', 1)

            
            
            
            
            
--jstree를 위한 view
-- APPR_JSTREE_VIEW
CREATE VIEW APPR_JSTREE_VIEW (ID, TEXT, SPOT, ICON, PARENT) AS
SELECT ID, NAME, SPOT , 'glyphicon glyphicon-user', DEPTNO
   FROM EMPLOYEE e 
   WHERE ID != 'admin'
UNION ALL
SELECT DEPTNO , DNAME, '', 'glyphicon glyphicon-briefcase', '0'||HEADNO
   FROM DEPARTMENT d 
   UNION ALL
SELECT '0'||HEADNO, HNAME, '', 'glyphicon glyphicon-home', '#'
   FROM HEADQUARTERS h;
   
  
  
  SELECT ID, TEXT, PARENT, SPOT, ICON
   FROM APPR_JSTREE_VIEW
   
   
   
   
SELECT E.NAME , D2.DNAME , D.DRAFT_DATE , D.DOCNO , D.CONTENT
	FROM DOCUMENT d
	JOIN EMPLOYEE e ON D.WRITER_ID = E.ID
	JOIN DEPARTMENT d2 ON E.DEPTNO = D2.DEPTNO
	WHERE DOCNO = '202400111';
	


SELECT e.NAME , (SELECT CODE_NAME FROM COMMON c WHERE e.SPOT = c.CODE AND c."TYPE" = '직위') AS SPOT,
		a.EMP_ID, a.ORDERNO , a.APPR_STATUS , a.APPR_DATE , a.SIGNATURE ,a."COMMENT" 
        FROM APPROVAL a JOIN EMPLOYEE e 
        ON a.EMP_ID = e.ID 
        WHERE DOCNO = '202400191' AND ATYPE = '01'
        ORDER BY ORDERNO 
        
        
        SELECT APPRNO , DOCNO , WRITER_ID , 
        ATYPE , EMP_ID , APPR_STATUS , 
        ORDERNO , APPR_DATE , SIGNATURE , 
        e.NAME , e.SPOT , e."POSITION"
        FROM APPROVAL a JOIN EMPLOYEE e 
        ON a.EMP_ID = e.ID 
        WHERE DOCNO = '202400003' AND ATYPE IN ('02','03')
        ORDER BY ORDERNO ;
        
       
       
       
       UPDATE APPROVAL
SET APPR_STATUS='03', APPR_DATE=SYSDATE, SIGNATURE='반려'
WHERE DOCNO = '202400003' AND EMP_ID = '2403110901';




UPDATE APPROVAL  
	SET COMMENT = '반려합니다'
	WHERE DOCNO = '202400228';
	
UPDATE APPROVAL
SET "COMMENT"='제발'
WHERE APPRNO = (SELECT APPRNO FROM APPROVAL a WHERE EMP_ID = '2403110902' AND ATYPE ='01' AND DOCNO = '202400228');


UPDATE DOCUMENT 
SET DOC_STATUS = '03'
WHERE DOCNO ='202400228';



SELECT SAVE_SIGN
FROM SIGNLIST
WHERE ID = '2403110902' AND MAIN = 'Y';



UPDATE APPROVAL
SET APPR_STATUS='03', APPR_DATE=CURRENT_TIMESTAMP, SIGNATURE = (SELECT SAVE_SIGN
													FROM SIGNLIST s
													WHERE ID  = '2403110902' AND MAIN = 'Y')
WHERE DOCNO = '202400250' AND (EMP_ID = '2403110902' AND ATYPE='01');



UPDATE DOCUMENT
SET CONTENT='hi'
WHERE DOCNO='202400222';

SELECT SAVE_SIGN
    FROM SIGNLIST s
    WHERE ID = '2403110902'
    AND MAIN = 'Y'
    
    
    
    
    
    
    SELECT e.ID, d.DOCNO, e.NAME , d.TITLE, 
       d.DRAFT_DATE, d.URGENCY, 
       (SELECT CODE_NAME FROM COMMON c WHERE d.TEMPCODE = c.CODE AND c."TYPE" = '문서양식코드') AS TEMPCODE,
       (SELECT CODE_NAME FROM COMMON c WHERE d.DOC_STATUS = c.CODE AND c."TYPE" = '기안서상태') AS DOC_STATUS,
       (SELECT COUNT(*) FROM FILESTORAGE f2 WHERE REF_ID = d.DOCNO AND FTYPE='01') AS FILE_COUNT
      FROM DOCUMENT d 
      JOIN EMPLOYEE e ON d.WRITER_ID = e.ID 
      WHERE d.WRITER_ID = '2403110902'
      AND NOT d.DOC_STATUS = '04'
      ORDER BY d.DRAFT_DATE DESC
      
      
      
      
      UPDATE DOCUMENT
	SET TITLE='수정', CONTENT='수정', DRAFT_DATE=SYSDATE, URGENCY='N' , TEMPCODE='01', DOC_STATUS='01'
	WHERE DOCNO='202400508'
	
	
	
	
	SELECT * FROM (SELECT DISTINCT D.DOCNO ,D.TITLE ,D.DRAFT_DATE ,D.URGENCY ,E.NAME ,C.CODE_NAME ,(SELECT COUNT(*) FROM FILESTORAGE f WHERE F.REF_ID = D.DOCNO AND FTYPE = '01') AS FILE_COUNT
           FROM DOCUMENT D
           JOIN APPROVAL A ON D.DOCNO = A.DOCNO
           JOIN EMPLOYEE E ON A.EMP_ID = E.ID
           JOIN COMMON C ON D.TEMPCODE = C.CODE AND C."TYPE" = '문서양식코드'
           WHERE A.EMP_ID = '2403110902'
           AND A.APPR_STATUS = '01'
           AND A.ATYPE = '01'
           AND ( A.ORDERNO = 1
                   OR (
               A.ORDERNO <> 1
                           AND EXISTS (
                           SELECT 1
                           FROM APPROVAL A2
                           WHERE A.DOCNO = A2.DOCNO
                                   AND A2.ORDERNO = A.ORDERNO - 1
                                   AND A2.APPR_STATUS = '02'
               )
           )
       )
       ORDER BY CASE WHEN d.URGENCY = 'Y' THEN 0 ELSE 1 END, d.DRAFT_DATE DESC)
       WHERE ROWNUM <=2;
      
      SELECT * FROM (SELECT DISTINCT D.DOCNO ,D.TITLE ,D.DRAFT_DATE ,D.URGENCY ,E.NAME ,C.CODE_NAME ,(SELECT COUNT(*) FROM FILESTORAGE f WHERE F.REF_ID = D.DOCNO AND FTYPE = '01') AS FILE_COUNT
           FROM DOCUMENT D
           JOIN APPROVAL A ON D.DOCNO = A.DOCNO
           JOIN EMPLOYEE E ON D.WRITER_ID  = E.ID
           JOIN COMMON C ON D.TEMPCODE = C.CODE AND C."TYPE" = '문서양식코드'
           WHERE A.EMP_ID = '2403110902'
           AND A.APPR_STATUS = '01'
           AND A.ATYPE = '01'
           AND ( A.ORDERNO = 1
                   OR (
               A.ORDERNO <> 1
                           AND EXISTS (
                           SELECT 1
                           FROM APPROVAL A2
                           WHERE A.DOCNO = A2.DOCNO
                                   AND A2.ORDERNO = A.ORDERNO - 1
                                   AND A2.APPR_STATUS = '02'
               )
           )
       )
       ORDER BY CASE WHEN d.URGENCY = 'Y' THEN 0 ELSE 1 END, d.DRAFT_DATE DESC)
       WHERE ROWNUM <=2
       
       
       
       
       
       
       
       
       
       
       
       
       
       INSERT INTO VACATION (VACNO, ID, START_DAY, END_DAY, HALF, GETSU, BIGO)
VALUES (, '2403110902', TO_DATE('2024-04-22', 'YYYY-MM-DD'), 
                TO_DATE('2024-04-23', 'YYYY-MM-DD'), 'M', '1', '')
                
                
                
                SELECT TO_CHAR(MAX(TO_NUMBER(VACNO))+1) FROM VACATION 
                
                