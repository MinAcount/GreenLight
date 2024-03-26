<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body class="nav-fixed">

   <%@ include file="./include/mainHeader.jsp"%>
   <!-- 사이드나브바 & 콘텐트 영역 -->
   <div id="layoutSidenav">
      <%@ include file="./include/mainSidenav.jsp"%>

      <!-- 콘텐츠 영역 -->
      <div id="layoutSidenav_content">
         <div id="main_content">
            <h1 style="margin-bottom: 70px; text-align: center;">기안서 작성</h1>

            <hr class="mt-0 mb-5">
            <div style="display: flex; flex-direction: row; padding: 20px;">
               <div id="templateArea">
                  <div class="top" style="text-align: center; margin-bottom: 70px; padding-top: 30px;">
                     <h2>지출결의서</h2>
                  </div>
                  <div class="header" style="display: flex; flex-direction: row; justify-content: space-between;">
                     <div>
                        <table class="template">
                           <tr>
                              <th style="width: 80px;">기안자</th>
                              <td id="draftWriter" style="width: 180px;" class="paddingL10"></td>
                           </tr>
                           <tr>
                              <th>소속부서</th>
                              <td class="paddingL10"></td>
                           </tr>
                           <tr>
                              <th>기안일</th>
                              <td class="paddingL10"></td>
                           </tr>
                           <tr>
                              <th>문서번호</th>
                              <td class="paddingL10"></td>
                           </tr>
                        </table>
                     </div>
                     <div style="display: flex; flex-direction: row;">
                        <table id="WriterArea" class="template" style="height: 180px;">
                           <tr>
                              <th rowspan="3" class="width30" >신청</th>
                              <td class="fontSize14" style="width: 90px; height: 20px;">사원</td>
                           </tr>
                           <tr>
                              <td>
                                 <div class="fontSize14">배강훈</div>
                              </td>
                           </tr>
                           <tr>
                              <td class="fontSize14" style="height: 20px;">2024.03.21</td>
                           </tr>
                        </table>
                        <table id="approvalArea" class="template" style="margin-left: 10px; height: 180px;">
                           <tr>
                              <th rowspan="3" class="width30">승인</th>
                              <td style="width: 90px; height: 20px;" class="fontSize14">대리</td>
                           </tr>
                           <tr>
                              <td class="fontSize14">이혜원</td>
                           </tr>
                           <tr>
                              <td style="height: 20px;" class="fontSize14">2024.03.21</td>
                           </tr>
                        </table>
                     </div>
                  </div>
                  <div class="content" style="width: 100%; margin-top: 30px;">
                     <table class="template" style="width: 100%;">
                        <tr>
                           <th style="width: 20%;">제목</th>
                           <td colspan="3"></td>
                        </tr>
                        <tr>
                           <th style="width: 20%;">작성일자</th>
                           <td style="width: 30%;"></td>
                           <th style="width: 20%;">소속</th>
                           <td style="width: 30%;"></td>
                        </tr>
                        <tr>
                           <th>작성자</th>
                           <td></td>
                           <th>금액</th>
                           <td></td>
                        </tr>
                        <tr>
                           <th>지출사유</th>
                           <td colspan="3"></td>
                        </tr>
                     </table>
                  </div>
                  <div class="AddDetails" style="margin-top: 30px; margin-bottom: 10px; text-align: right;">
                     <button style="background-color: rgba(123,130,124,0.1); border: 1px solid #B0B5B1">추가</button>
                     <button style="background-color: rgba(123,130,124,0.1); border: 1px solid #B0B5B1">삭제</button>
                  </div>
                  <div class="bottom" style="width: 100%;">
                     <table class="template" style="width: 100%;">
                        <tr>
                           <th>일자</th>
                           <th>분류</th>
                           <th>사용내역</th>
                           <th>금액</th>
                           <th>비고</th>
                        </tr>
                        <tr>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                        </tr>
                        <tr>
                           <th colspan="2">합계</th>
                           <td colspan="3"></td>
                        </tr>
                     </table>
                  </div>
               </div>
               <div style="margin-left: 30px; width: 25%; border: 1px solid black; padding: 10px; border-color: #B0B5B1;">
                  <div>
                        <nav class="nav nav-borders">
                           <ul style="display: flex; flex-direction: row; height: 62px; margin-bottom: 0px; padding-top: 14px;">
                                  <li class="nav-link active ms-0" onclick="setActive(this)">결재선</li>
                                  <li class="nav-link" id="doc_status1" onclick="setActive(this)">참조자</li>
                              </ul>
                          </nav>
                     </div>
               <hr class="mt-0 mb-5">
               </div>
            </div>

            <%@ include file="./include/footer.jsp"%>
         </div>
      </div>
   </div>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="js/scripts.js"></script>
</body>
</html>