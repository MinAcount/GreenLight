<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="./se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body class="nav-fixed">
   <%@ include file='./include/mainHeader.jsp'%>

   <!-- 사이드나브바 & 콘텐트 영역 -->
   <div id="layoutSidenav">
      <%@ include file='./include/mainSidenav.jsp'%>

      <!-- 콘텐츠 영역 -->
      <div id="layoutSidenav_content">
         <div id="main_content">
            <textarea name="ir1" id="ir1" rows="10" cols="100"><div class="top" style="text-align: center; margin-bottom: 30px;">
                  <h1>휴가신청서</h1>
               </div>
               <div class="header"
                     style="display: flex; flex-direction: row; justify-content: space-between;">

                     <div>
                        <table class="template">
                           <tr>
                              <th style="width: 80px;">기안자</th>
                              <td style="width: 180px;" class="paddingL10"></td>
                           </tr>
                           <tr>
                              <th>소속</th>
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
                        <table class="template" style="height: 180px;">
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
                        <table class="template" style="margin-left: 10px; height: 180px;">
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
               <div class="content"  style="width: 100%; margin-top: 30px;">
                  <table class="template"  style="width: 100%;">
                          <colgroup>
                                  <col width="20%">
                                  <col width="80%">
                          </colgroup>
                     <tr>
                             <th>휴가 종류</th>
                             <td>
                                     <select>
                                             <option value="연차">연차</option>
                                             <option value="공가">공가</option>
                                     </select>
                             </td>
                     </tr>
                     <tr>
                             <th>기간 및 일시</th>
                             <td>
                                     <div class="input-group input-group-joined" style="width: 16.5rem;">
                                                                 <span class="input-group-text">
                                                                         <i data-feather="calendar"></i>
                                                                 </span>
                                                        <input class="form-control ps-0" id="litepickerRangePlugin" placeholder="Select date range..." />
                                                        </div>
                             </td>
                     </tr>
                     <tr>
                             <th>반차 여부</th>
                             <td>
                                     <input type="checkbox" value="시작일" id="startCheckbox">
                                     <label>시작일</label>
                                     (
                                     <input type="radio" name="시작일" value="오전" disabled="disabled">
                                     <label>오전</label>
                                     <input type="radio" name="시작일" value="오후" disabled="disabled">
                                     <label>오후</label>
                                     )
                                     <input type="checkbox" value="종료일" id="endCheckbox">
                                     <label>종료일</label>
                                     (
                                     <input type="radio" name="종료일" value="오전" disabled="disabled">
                                     <label>오전</label>
                                     <input type="radio" name="종료일" value="오후" disabled="disabled">
                                     <label>오후</label>
                                     )
                             </td>
                     </tr>
                     <tr>
                             <th>연차 일수</th>
                             <td>
                                     <span>
                                             <b>잔여연차 : </b>
                                             <input type="text">
                                     </span>
                                     <span>
                                             <b>신청연차 : </b>
                                             <input type="text">
                                     </span>
                             </td>
                     </tr>
                     <tr>
                             <td colspan="2">
                                     공가 : <br>
                                     경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br>
                                     예비군/민방위는 사전에 통지서를, 사후에 참석증을 반드시 제출<br>
                                     질병휴가는 의사의 진단서 또는 진료 증명서를 반드시 제출 ㅁㄴㅇㄹ
                             </td>
                     </tr>
                  </table>
               </div>
            </div></textarea>
            <div>
            <hr>
            <div class="top" style="text-align: center; margin-bottom: 30px;">
                  <h1>휴가신청서</h1>
               </div>
               <div class="header"
                     style="display: flex; flex-direction: row; justify-content: space-between;">

                     <div>
                        <table class="template">
                           <tr>
                              <th style="width: 80px;">기안자</th>
                              <td style="width: 180px;" class="paddingL10"></td>
                           </tr>
                           <tr>
                              <th>소속</th>
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
                        <table class="template" style="height: 180px;">
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
                        <table class="template" style="margin-left: 10px; height: 180px;">
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
               <div class="content"  style="width: 100%; margin-top: 30px;">
                  <table class="template"  style="width: 100%;">
                          <colgroup>
                                  <col width="20%">
                                  <col width="80%">
                          </colgroup>
                     <tr>
                             <th>휴가 종류</th>
                             <td>
                                     <select>
                                             <option value="연차">연차</option>
                                             <option value="공가">공가</option>
                                     </select>
                             </td>
                     </tr>
                     <tr>
                             <th>기간 및 일시</th>
                             <td>
                                     <div class="input-group input-group-joined" style="width: 16.5rem;">
                                                                 <span class="input-group-text">
                                                                         <i data-feather="calendar"></i>
                                                                 </span>
                                                        <input class="form-control ps-0" id="litepickerRangePlugin" placeholder="Select date range..." />
                                                        </div>
                             </td>
                     </tr>
                     <tr>
                             <th>반차 여부</th>
                             <td>
                                     <input type="checkbox" value="시작일" id="startCheckbox">
                                     <label>시작일</label>
                                     (
                                     <input type="radio" name="시작일" value="오전" disabled="disabled">
                                     <label>오전</label>
                                     <input type="radio" name="시작일" value="오후" disabled="disabled">
                                     <label>오후</label>
                                     )
                                     <input type="checkbox" value="종료일" id="endCheckbox">
                                     <label>종료일</label>
                                     (
                                     <input type="radio" name="종료일" value="오전" disabled="disabled">
                                     <label>오전</label>
                                     <input type="radio" name="종료일" value="오후" disabled="disabled">
                                     <label>오후</label>
                                     )
                             </td>
                     </tr>
                     <tr>
                             <th>연차 일수</th>
                             <td>
                                     <span>
                                             <b>잔여연차 : </b>
                                             <input type="text">
                                     </span>
                                     <span>
                                             <b>신청연차 : </b>
                                             <input type="text">
                                     </span>
                             </td>
                     </tr>
                     <tr>
                             <td colspan="2">
                                     공가 : <br>
                                     경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br>
                                     예비군/민방위는 사전에 통지서를, 사후에 참석증을 반드시 제출<br>
                                     질병휴가는 의사의 진단서 또는 진료 증명서를 반드시 제출
                             </td>
                     </tr>
                  </table>
               </div>
            </div>
            <%@ include file="./include/footer.jsp"%>
         </div>
      </div>
   </div>
   
   
   <script type="text/javascript">
   var oEditors = [];
   nhn.husky.EZCreator.createInIFrame({
       oAppRef: oEditors,
       elPlaceHolder: "ir1",
       sSkinURI: "./se2/SmartEditor2Skin.html",
       fCreator: "createSEditor2"
   });
   
   function submitContents(elClickedObj) {
       // 에디터의 내용이 textarea에 적용된다.
       oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

       // 에디터의 내용에 대한 값 검증은 이곳에서
       // document.getElementById("ir1").value를 이용해서 처리한다.

       try {
           elClickedObj.form.submit();
       } catch(e) {
          
       }
    }
   
   document.getElementById("startCheckbox").addEventListener("change", function(){
      var radios = document.getElementsByName("시작일");
      for(let i = 0; i < radios.length; i++){
         radios[i].disabled = !this.checked;
      }
   });
   
   document.getElementById("endCheckbox").addEventListener("change", function(){
      var radios = document.getElementsByName("종료일");
      for(let i = 0; i < radios.length; i++){
         radios[i].disabled = !this.checked;
      }
   });
   
   window.addEventListener('DOMContentLoaded', event => {
      const litepickerDateRange2Months = document.getElementById('litepickerRangePlugin');
         if (litepickerRangePlugin) {
            new Litepicker({
               element: litepickerRangePlugin,
               singleMode: false,
               numberOfMonths: 2,
               numberOfColumns: 2,
               format: 'MMM DD, YYYY',
               lang: "ko-KR"
            });
         }
   });

   </script>   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="js/scripts.js"></script>
</body>
</html>