<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="./se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/draft_bkh/draft.js"></script>
<script type="text/javascript" src="./js/detailPreview.js"></script>
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
				<input type="hidden" id="loginVo_name" value="${sessionScope.loginVo.name}">
                  <input type="hidden" id="deptVo_dname" value="${deptVo.dname}">
                  <input type="hidden" id="loginVo_id" value="${sessionScope.loginVo.id}">
                  
                  <input type="hidden" id="loginVo_spot" value="${sessionScope.loginVo.spot}">
					<input type="hidden" id="docno" value="${docVo.docno}">
				<hr class="mt-0 mb-5">

				<div style="display: flex; flex-direction: row; justify-content: flex-end;">
					<!-- 문서양식모달 -->
					<div class="modal fade" id="templateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
						<div class="modal-dialog">
							<div class="modal-content" style="width: 800px; height: 600px;">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">문서양식 선택</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

								</div>
								<div class="modal-body" style="display: flex; flex-direction: column; justify-content: space-between;">
									<div class="toast-body" style="display: flex; flex-direction: row; justify-content: space-around;">
										<!-- 문서양식목록(js tree) -->
										<div style="width: 395px; min-height: 450px; border-right: 1px solid black;">
											<div id="search_box">
												<input id="search" type="text">
											</div>
											<div id="JTSelectTemplate" style="max-height: 450px; overflow-y: scroll;"></div>

										</div>
										<!-- 선택된 문서양식 미리보기 -->
										<div style="width: 395px; min-height: 450px;"></div>
									</div>
									<div class="modal-footer">
										<button class="btn btn-secondary btn-sm" type="button" data-bs-dismiss="modal">취소</button>
										<button class="btn btn-primary btn-sm" type="button" style="margin-left: 10px;" data-bs-dismiss="modal" onclick="selectComplete()">완료</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div>
						<!-- 결재 모달 -->
						<c:forEach var="item" items="${apprVo}">
							<c:if test="${item.apprVo.emp_id eq loginVo.id && item.apprVo.appr_status eq '01'}">
								<button class="btn btn-primary " type="button" data-bs-toggle="modal" data-bs-target="#approve">결재</button>
								<button class="btn btn-secondary " type="button" data-bs-toggle="modal" data-bs-target="#rejectApproval">반려</button>
							</c:if>
						</c:forEach>

						<div class="modal fade" id="approve" tabindex="-1"
							aria-labelledby="refModalLabel" aria-hidden="true"
							data-bs-backdrop="static">
							<div class="modal-dialog apprModal">
								<div class="modal-content" style="width: 500px; height: 430px;">
									<div class="modal-header">
										<h5 class="modal-title" id="refModalLabel">결재하기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body" style="display: flex; flex-direction: column; justify-content: space-between; margin-top: 15px;">
										<div class="toast-body" style="display: flex; flex-direction: row; justify-content: space-around;">
											<div>
												코멘트:
												<textarea class="comment" rows="5" cols="30"></textarea>
											</div>
										</div>
										<div class="modal-footer" style="margin-bottom: 20px; margin-top: 10px;">
											<button class="btn btn-secondary " type="button" data-bs-dismiss="modal">취소</button>
											<button data-bs-dismiss="modal" onclick="approve()" class="btn btn-primary " type="button" style="margin-left: 10px;">승인</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 반려 모달 -->
						

						<div class="modal fade" id="rejectApproval" tabindex="-1"
							aria-labelledby="refModalLabel" aria-hidden="true"
							data-bs-backdrop="static">
							<div class="modal-dialog apprModal">
								<div class="modal-content" style="width: 500px; height: 430px;">
									<div class="modal-header">
										<h5 class="modal-title" id="refModalLabel">반려하기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body"
										style="display: flex; flex-direction: column; justify-content: space-between; margin-top: 15px;">
										<div class="toast-body"
											style="display: flex; flex-direction: row; justify-content: space-around;">
											<div>
												반려사유:
												<textarea class="comment" rows="5" cols="30"></textarea>
											</div>
										</div>
										<div class="modal-footer"
											style="margin-bottom: 20px; margin-top: 10px;">
											<button class="btn btn-secondary " type="button"
												data-bs-dismiss="modal">취소</button>
											<button data-bs-dismiss="modal" onclick="rejectApproval()"
												class="btn btn-primary " type="button"
												style="margin-left: 10px;">반려</button>
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
						<input type="hidden" id="tempCode" value="">
						${docVo.content}
						
							
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
						<div id="chkAppr" style="display: block;">
							<c:forEach var="vo" items="${apprVo}">
								<div class="apr_row"
									style="display: flex; flex-direction: row; justify-content: center; margin-top: 10px;">
									${vo.name} ${vo.spot}
									<input type="hidden" name="id" value="${vo.apprVo.emp_id}">
									<input type="hidden" name="orderno" value="${vo.apprVo.orderno}">
								</div>
							</c:forEach>
							
						</div>

						<div id="chkRef" style="display: none;">
							<c:forEach var="vo" items="${refVo}">
								<div class="apr_row"
									style="display: flex; flex-direction: row; justify-content: center; margin-top: 10px;">
									${vo.name} ${vo.spot}
									<input type="hidden" name="id" value="">
								</div>
							</c:forEach>
						</div>
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