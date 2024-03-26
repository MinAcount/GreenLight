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
				<h1 style="margin-bottom: 70px; text-align: center;">기안서 작성</h1>

				<hr class="mt-0 mb-5">
				<div style="display: flex; flex-direction: row; justify-content: space-between;">
					<!-- Modal -->
					<div class="modal fade" id="templateModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
						<div class="modal-dialog">
							<div class="modal-content" style="width: 800px; height: 600px;">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">문서양식 선택</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body" style="display: flex; flex-direction: column; justify-content: space-between;">
									<div class="toast-body" style="display: flex; flex-direction: row; justify-content: space-around;">
										<!-- 문서양식목록(js tree) -->
										<div style="width: 395px; min-height: 450px; border-right: 1px solid black">
										</div>
										<!-- 선택된 문서양식 미리보기 -->
										<div style="width: 395px; min-height: 450px;">
											
										</div>
									</div>
									<div class="modal-footer">
										<button class="btn btn-secondary btn-sm" type="button" data-bs-dismiss="modal">취소</button>
										<button class="btn btn-primary btn-sm" type="button" style="margin-left: 10px;">완료</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div>
						<button class="btn btn-secondary btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#templateModal">문서양식 선택</button>
						<button class="btn btn-secondary btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#approvalModal">결재선 설정</button>
						
						<div class="modal fade" id="approvalModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
						<div class="modal-dialog">
							<div class="modal-content" style="width: 800px; height: 600px;">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">결재선 설정</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body" style="display: flex; flex-direction: column; justify-content: space-between;">
									<div class="toast-body" style="display: flex; flex-direction: row; justify-content: space-around;">
										<!-- 결재자들(js tree) -->
										<div style="width: 395px; min-height: 450px; border-right: 1px solid black">
										</div>
										<!-- 선택된 결재자들 -->
										<div style="width: 395px; min-height: 450px;">
											
										</div>
									</div>
									<div class="modal-footer">
										<button class="btn btn-secondary btn-sm" type="button" data-bs-dismiss="modal">취소</button>
										<button class="btn btn-primary btn-sm" type="button" style="margin-left: 10px;">완료</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
						<button class="btn btn-secondary btn-sm" type="button">참조자 추가</button>
					</div>
					<div>
						<button class="btn btn-secondary btn-sm" type="button">임시저장</button>
						<button class="btn btn-primary btn-sm" type="button" style="width: 73.6px;">상신</button>
					</div>
				</div>
				<div style="display: flex; flex-direction: row; padding: 20px;">
					<div id="templateArea">
						<div class="top"
							style="text-align: center; margin-bottom: 70px; padding-top: 30px;">
							<h2>지출결의서</h2>
						</div>
						<div class="header"
							style="display: flex; flex-direction: row; justify-content: space-between;">

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
										<th rowspan="3" class="width30">신청</th>
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
								<table id="approvalArea" class="template"
									style="margin-left: 10px; height: 180px;">
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
						<div class="AddDetails"
							style="margin-top: 30px; margin-bottom: 10px; text-align: right;">
							<button
								style="background-color: rgba(123, 130, 124, 0.1); border: 1px solid #B0B5B1">추가</button>
							<button
								style="background-color: rgba(123, 130, 124, 0.1); border: 1px solid #B0B5B1">삭제</button>
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
					<div
						style="margin-left: 30px; width: 25%; border: 1px solid black; padding: 10px; border-color: #B0B5B1;">
						<div>
							<nav class="nav nav-borders">
								<ul
									style="display: flex; flex-direction: row; height: 62px; margin-bottom: 0px; padding-top: 14px;">
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