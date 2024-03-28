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
   
   <i data-feather='check-circle' id='toastFeather'></i>
	<div id="layoutSidenav">
		<%@ include file='./include/mainSidenav.jsp'%>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">기안서 상세페이지</h1>

				<hr class="mt-0 mb-5">

				<div
					style="display: flex; flex-direction: row; justify-content: space-between;">
					<div>
						<button class="btn btn-secondary " type="button"
							style="margin-right: 5px;">미리보기</button>
					</div>
					
					<!-- 문서양식모달 -->
					<div class="modal fade" id="templateModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true"
						data-bs-backdrop="static">
						<div class="modal-dialog">
							<div class="modal-content" style="width: 800px; height: 600px;">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">문서양식 선택</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>

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
						<!-- 결재 모달 -->
						<button class="btn btn-primary " type="button"
							data-bs-toggle="modal" data-bs-target="#approve">결재</button>

						<div class="modal fade" id="approve" tabindex="-1"
							aria-labelledby="refModalLabel" aria-hidden="true"
							data-bs-backdrop="static">
							<div class="modal-dialog">
								<div class="modal-content" style="width: 800px; height: 630px;">
									<div class="modal-header">
										<h5 class="modal-title" id="refModalLabel">결재하기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body"
										style="display: flex; flex-direction: column; justify-content: space-between; margin-top: 15px;">
										<div class="toast-body"
											style="display: flex; flex-direction: row; justify-content: space-around;">
											
											
											
											
											
										</div>
										<div class="modal-footer"
											style="margin-bottom: 20px; margin-top: 10px;">
											<button class="btn btn-secondary " type="button"
												data-bs-dismiss="modal">취소</button>
											<button data-bs-dismiss="modal" onclick="refDone()"
												class="btn btn-primary " type="button"
												style="margin-left: 10px;">승인</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 반려 모달 -->
						<button class="btn btn-secondary " type="button"
							data-bs-toggle="modal" data-bs-target="#reject">반려</button>

						<div class="modal fade" id="reject" tabindex="-1"
							aria-labelledby="refModalLabel" aria-hidden="true"
							data-bs-backdrop="static">
							<div class="modal-dialog">
								<div class="modal-content" style="width: 800px; height: 630px;">
									<div class="modal-header">
										<h5 class="modal-title" id="refModalLabel">반려하기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body"
										style="display: flex; flex-direction: column; justify-content: space-between; margin-top: 15px;">
										<div class="toast-body"
											style="display: flex; flex-direction: row; justify-content: space-around;">
											
										</div>
										<div class="modal-footer"
											style="margin-bottom: 20px; margin-top: 10px;">
											<button class="btn btn-secondary " type="button"
												data-bs-dismiss="modal">취소</button>
											<button data-bs-dismiss="modal" onclick="refDone()"
												class="btn btn-primary " type="button"
												style="margin-left: 10px;">완료</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				<div 
					style="display: flex; flex-direction: row; padding-top: 20px; padding-bottom: 20px; min-height: calc((80vw * 0.64) * 1.414);">
					<div id="templateArea" style="">
						<div style="width: 100%; text-align: center; padding-top: 20px;"
							id="templateAreaLeft">
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
                                 <td class="fontSize14" style="width: 90px; height: 20px;">사원</td>
                              </tr>
                              <tr>
                                 <td>
                                    <div class="fontSize14">${loginVo.name}</div>
                                 </td>
                              </tr>
                              <tr>

                                 <td class="fontSize14" style="height: 20px;">2024.03.21</td>
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
											<td class="pdl10"><input type="text" id="title" name="title"></td>
										</tr>
										<tr>
											<th>휴가 종류</th>
											<td class="pdl10"><select id="getsuFlag">
													<option value="N">연차</option>
													<option value="Y">공가</option>
											</select></td>
										</tr>
										<tr>
											<th>기간 및 일시</th>
											<td class="pdl10">
												<div class="input-group input-group-joined"
													style="width: 16.5rem;">
													<span class="input-group-text"><i
														data-feather="calendar"></i></span> <input type="text"
														id="daterangepicker" name="daterangepicker" value="" /> <input
														type="hidden" id="start_day" name="start_day" value="">
													<input type="hidden" id="end_day" name="end_day" value="">
												</div>
											</td>
										</tr>

										<tr>
											<th>반차 여부</th>
											<td class="pdl10"><input type="checkbox" id="start_day_half"
												name="start_day_half" value="시작일"
												onchange="radioActiveS(this.checked)"><label>시작일</label>
												(<input type="radio" name="start_day_half" value="오전"
												disabled="disabled"><label>오전</label> <input
												type="radio" name="start_day_half" value="오후"
												disabled="disabled"><label>오후</label>) <input
												type="checkbox" id="end_day_half" name="end_day_half"
												value="종료일" onchange="radioActiveE(this.checked)"><label>종료일</label>
												(<input type="radio" name="end_day_half" value="오전"
												disabled="disabled"><label>오전</label> <input
												type="radio" name="end_day_half" value="오후"
												disabled="disabled"><label>오후</label>)</td>
										</tr>
										<tr>
											<th>연차 일수</th>
											<td class="pdl10"><span> <b>잔여연차 : </b> <input type="text">
											</span> <span> <b>신청연차 : </b> <input type="text" id="getsu"
													name="getsu" value="">
											</span></td>
										</tr>
										<tr>
											<th>긴급 여부</th>
											<td class="pdl10"><input type="checkbox" id="urgency" name="urgency"></td>
										</tr>
										<tr>
											<td style="background-color: rgba(123, 130, 124, 0.1); padding: 15px; padding-bottom: 40px; padding-top: 30px;" colspan="2">공가 : <br> 경조사 휴가는 행사일을 증명할 수 있는 가족
												관계 증명서 또는 등본, 청첩장 등 제출<br> 예비군/민방위는 사전에 통지서를, 사후에 참석증을
												반드시 제출<br> 질병휴가는 의사의 진단서 또는 진료 증명서를 반드시 제출
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div
						style="margin-left: 3%; width: 22%; border: 1px solid black; padding: 10px; border-color: #B0B5B1;">
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



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="js/scripts.js"></script>
</body>
</html>