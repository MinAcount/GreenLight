<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="./se2/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript" src="./js/draft_bkh/draft.js"></script>
</head>
<body class="nav-fixed">
	<%@ include file='./include/mainHeader.jsp'%>
	<!-- 사이드나브바 & 콘텐트 영역 -->

	<i data-feather='check-circle' id='toastFeather'></i>
	<div id="layoutSidenav">
		<%@ include file='./include/mainSidenav.jsp'%>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">기안서 작성</h1>
				<hr class="mt-0 mb-5">

				<div
					style="display: flex; flex-direction: row; justify-content: space-between;">
					<!-- 문서양식선택 모달 -->
					<div class="modal fade" id="templateModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true"
						data-bs-backdrop="static">
						<div class="modal-dialog">
							<div class="modal-content" style="width: 800px; height: 600px;">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">문서양식 선택</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
									<input type="hidden" id="tempcode" name="tempcode" value="">

								</div>
								<div class="modal-body"
									style="display: flex; flex-direction: column; justify-content: space-between;">
									<div class="toast-body"
										style="display: flex; flex-direction: row; justify-content: space-around;">
										<!-- 문서양식목록(js tree) -->
										<div
											style="width: 395px; min-height: 450px; border-right: 1px solid black;">
											<div id="search_box">
												<input id="search" type="text">
											</div>
											<div id="JTSelectTemplate"
												style="max-height: 450px; overflow-y: scroll;"></div>

										</div>
										<!-- 선택된 문서양식 미리보기 -->
										<div style="width: 395px; min-height: 450px;"></div>
									</div>
									<div class="modal-footer">
										<button class="btn btn-secondary btn-sm" type="button"
											data-bs-dismiss="modal">취소</button>
										<button class="btn btn-primary btn-sm" type="button"
											style="margin-left: 10px;" data-bs-dismiss="modal"
											onclick="selectComplete()">완료</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div>
						<button id="selectTemplateModal" class="btn btn-secondary "
							type="button" data-bs-toggle="modal"
							data-bs-target="#templateModal" style="margin-right: 5px;">문서양식
							선택</button>

						<!-- 결재선 설정 -->
						<button class="btn btn-secondary " type="button"
							data-bs-toggle="modal" data-bs-target="#approvalModal"
							style="margin-right: 5px;">결재선 설정</button>

						<div class="modal fade" id="approvalModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true"
							data-bs-backdrop="static">
							<div class="modal-dialog">
								<div class="modal-content" style="width: 800px; height: 630px;">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">결재선 설정</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body"
										style="display: flex; flex-direction: column; justify-content: space-between; margin-top: 15px;">
										<div class="toast-body"
											style="display: flex; flex-direction: row; justify-content: space-around;">
											<!-- 결재자들(js tree) -->
											<div id="approval_sel"
												style="width: 300px; min-height: 450px; border: 1px solid black; padding: 10px;">
												<div id="search_box">
													<input id="search_input" type="text">
												</div>
												<div id="apprJstree"
													style="margin-top: 10px; border: 1px solid black; width: 100%; max-height: 390px; overflow-y: scroll;"></div>

											</div>
											<div style="width: 50px; text-align: center;">
												<button id="addEmp" class="btn btn-primary"
													style="width: 30px; height: 100px; margin-top: 180px">얍</button>
											</div>
											<!-- 선택된 결재자들 -->
											<div id="apr_chk"
												style="width: 300px; min-height: 450px; border: 1px solid black; padding-top: 30px;"></div>
										</div>
										<div class="modal-footer"
											style="margin-bottom: 20px; margin-top: 10px;">
											<input type="button" class="btn btn-danger" value="초기화"
												onclick="clean()">
											<button class="btn btn-secondary " type="button"
												data-bs-dismiss="modal" onclick="apprCancel()">취소</button>
											<button data-bs-dismiss="modal" onclick="apprDone()"
												class="btn btn-primary " type="button"
												style="margin-left: 10px;">완료</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 참조자추가 모달 -->
						<button class="btn btn-secondary " type="button"
							data-bs-toggle="modal" data-bs-target="#refModal">참조자 추가</button>

						<div class="modal fade" id="refModal" tabindex="-1"
							aria-labelledby="refModalLabel" aria-hidden="true"
							data-bs-backdrop="static">
							<div class="modal-dialog">
								<div class="modal-content" style="width: 800px; height: 630px;">
									<div class="modal-header">
										<h5 class="modal-title" id="refModalLabel">참조자 추가</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body"
										style="display: flex; flex-direction: column; justify-content: space-between; margin-top: 15px;">
										<div class="toast-body"
											style="display: flex; flex-direction: row; justify-content: space-around;">
											<!-- 참조자들(js tree) -->
											<div id="ref_sel"
												style="width: 300px; min-height: 450px; border: 1px solid black; padding: 10px;">
												<div id="search_box">
													<input id="search_input2" type="text">
												</div>
												<div id="refJstree"
													style="margin-top: 10px; border: 1px solid black; width: 100%; max-height: 390px; overflow-y: scroll;"></div>
											</div>
											<div style="width: 50px; text-align: center;">
												<button id="addRef" class="btn btn-primary"
													style="width: 30px; height: 100px; margin-top: 180px">얍</button>
											</div>
											<!-- 선택된 참조자들 -->
											<div id="ref_chk"
												style="width: 300px; min-height: 450px; border: 1px solid black; padding-top: 30px;"></div>
										</div>
										<div class="modal-footer"
											style="margin-bottom: 20px; margin-top: 10px;">
											<input type="button" class="btn btn-danger" value="초기화"
												onclick="cleanRef()">
											<button class="btn btn-secondary " type="button"
												data-bs-dismiss="modal" onclick="refCancel()">취소</button>
											<button data-bs-dismiss="modal" onclick="refDone()"
												class="btn btn-primary " type="button"
												style="margin-left: 10px;">완료</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div>
						<button class="btn btn-secondary " type="button"
							style="margin-right: 5px;">임시저장</button>
						<button class="btn btn-primary " type="button"
							style="width: 73.6px;" onclick="insertDocument()">상신</button>
					</div>
				</div>
				
				<input type="hidden" id="loginVo_name" value="${sessionScope.loginVo.name}">
                  <input type="hidden" id="deptVo_dname" value="${deptVo.dname}">
                  <input type="hidden" id="loginVo_id" value="${sessionScope.loginVo.id}">
                  <input type="hidden" id="tempCode" value="">
                  <input type="hidden" id="loginVo_spot" value="${sessionScope.loginVo.spot}">

				<input type="hidden" id="loginVo_name"
					value="${sessionScope.loginVo.name}"> <input type="hidden"
					id="deptVo_dname" value="${deptVo.dname}"> <input
					type="hidden" id="loginVo_id" value="${sessionScope.loginVo.id}">
				<input type="hidden" id="tempCode" value="">
				<div
					style="display: flex; flex-direction: row; padding-top: 20px; padding-bottom: 20px; min-height: 800px;">
					<div id="templateArea">
						<div style="width: 100%; text-align: center;" id="templateAreaLeft">
                     <div class="top"
                        style="text-align: center; margin-bottom: 70px; padding-top: 30px;">
                        <h2>휴가신청서</h2>
                     </div>
                     <div class="header1"
                        style="display: flex; flex-direction: row; justify-content: flex-end; margin-bottom: 50px;">
                        <div style="display: flex; flex-direction: row;">
                           <table id="WriterArea" class="template" style="height: 160px;">
                              <tr>
                                 <th rowspan="3" class="width30">신청</th>
                                 <td id="drafter_spot" class="fontSize14" style="width: 90px; height: 20px;"></td>
                              </tr>
                              <tr>
                                 <td>
                                    <div id="drafter_name" class="fontSize14"></div>
                                 </td>
                              </tr>
                              <tr>
                                 <td id="drafter_draft_date" class="fontSize14" style="height: 20px;"></td>
                              </tr>
                           </table>
                           <table id="approvalArea" class="template"
                              style="margin-left: 10px; height: 160px;">
                              <tr id="firstTr">
                                 <th id="apprTh" rowspan="3" class="width30" style="display: none;">승인</th>
                                 
                              </tr>
                              <tr id="secondTr">
                                 
                              </tr>
                              <tr id="thirdTr">
                                 
                              </tr>
                           </table>
                        </div>
                     </div>
                     <div class="header2"
                        style="display: flex; flex-direction: row; justify-content: flex-start;">
                        <div style="width: 100%;">
                           <table class="template" style="width: 65%;">
                              <tr>
                                 <th style="width: 80px;">기안자</th>
                                 <td id="draftWriter" style="width: 180px;" class="paddingL10">
                                    <input type="text" id="name" name="name" value="" readonly="readonly">
                                    <input type="hidden" id="writer_id" name="writer_id" value="">
                                 </td>
                              </tr>
                               <tr>
                                 <th>소속부서</th>
                                 <td class="paddingL10">
                                    <input type="text" id="dname" name="dname" value="">
                                 </td>
                              </tr>
                              <tr>
                                 <th>기안일</th>
                                 <td class="paddingL10">
                                    <input type="text" id="draft_date" name="draft_date" value="">
                                 </td>
                              </tr>
                              <tr>
                                 <th>문서번호</th>
                                 <td class="paddingL10"></td>
                              </tr>
                           </table>
                        </div>
                     </div>
                     <div id="content">
                        <div style="width: 100%; margin-top: 30px;">
                           <table class="template" style="width: 100%;">
                              <colgroup>
                                 <col width="20%">
                                 <col width="80%">
                              </colgroup>
                              <tr>
                              	<th>제목</th>
                              	<td><input type="text" id="title" name="title"></td>
                              </tr>
                              <tr>
                                 <th>휴가 종류</th>
                                 <td>
                                 	<select id="getsuFlag">
                                       <option value="N">연차</option>
                                       <option value="Y">공가</option>
                                	</select>
                                 </td>
                              </tr>
                              <tr>
                                 <th>기간 및 일시</th>
                                 <td>
                                    <div class="input-group input-group-joined" style="width: 16.5rem;">
                                        <span class="input-group-text"><i data-feather="calendar"></i></span>
                                        <input type="text" id="daterangepicker" name="daterangepicker" value="" />
										<input type="hidden" id="start_day" name="start_day" value="">
										<input type="hidden" id="end_day" name="end_day" value="">
                                    </div>
                                 </td>
                              </tr>
                              
                              <tr>
                                 <th>반차 여부</th>
                                 <td>
                                 	<input type="checkbox" id="start_day_half" name="start_day_half" value="시작일" onchange="radioActiveS(this.checked)"><label>시작일</label>
                                 	(<input type="radio" name="start_day_half" value="오전" disabled="disabled"><label>오전</label>
                                 	<input type="radio" name="start_day_half" value="오후" disabled="disabled"><label>오후</label>)
                                 	<input type="checkbox" id="end_day_half" name="end_day_half" value="종료일" onchange="radioActiveE(this.checked)"><label>종료일</label>
                                 	(<input type="radio" name="end_day_half" value="오전" disabled="disabled"><label>오전</label>
                                 	<input type="radio" name="end_day_half" value="오후" disabled="disabled"><label>오후</label>)
                                 </td>
                              </tr>
                              <tr>
                                 <th>연차 일수</th>
                                 <td><span> <b>잔여연차 : </b> <input type="text">
                                 </span> <span> <b>신청연차 : </b> <input type="text" id="getsu" name="getsu" value="">
                                 </span></td>
                              </tr>
                              <tr>
                              	<th>긴급 여부</th>
                              	<td><input type="checkbox" id="urgency" name="urgency"></td>
                              </tr>
                              <tr>
                                 <td colspan="2">공가 : <br> 경조사 휴가는 행사일을 증명할 수 있는 가족
                                    관계 증명서 또는 등본, 청첩장 등 제출<br> 예비군/민방위는 사전에 통지서를, 사후에 참석증을
                                    반드시 제출<br> 질병휴가는 의사의 진단서 또는 진료 증명서를 반드시 제출
                                 </td>
                              </tr>
                           </table>
                           <table style="border: 1px solid black;">
                           		<colgroup>
                           			<col width="20%">
                           			<col width="80%">
                           		</colgroup>
                           		<tr>
                           			<th style="border: 1px solid black;">파일첨부</th>
                           			<td style="border: 1px solid black;">
                           				<input type="file" id="fileInput" multiple="multiple">
                           			</td>
                           		</tr>
                           	</table>
                        </div>
                     </div>
                  </div>
					</div>
					<div
						style="margin-left: 30px; width: 25%; border: 1px solid black; padding: 10px; border-color: #B0B5B1;">
						<div>
							<nav class="nav nav-borders">
								<ul
									style="display: flex; flex-direction: row; height: 62px; margin-bottom: 0px; padding-top: 14px;">
									<li id="getApproval" class="nav-link active ms-0"
										onclick=" setActive(this); getApprLine();">결재선</li>
									<li class="nav-link" id="getReference"
										onclick=" setActive(this); getRefLine();">참조자</li>
								</ul>
							</nav>
						</div>
						<hr class="mt-0 mb-5">
						<div id="chkAppr"></div>
						<div id="chkRef"></div>
					</div>
				</div>

				<%@ include file="./include/footer.jsp"%>
			</div>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>