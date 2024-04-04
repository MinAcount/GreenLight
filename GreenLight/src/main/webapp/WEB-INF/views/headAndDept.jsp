<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body class="nav-fixed">

	<%@ include file="./include/mainHeader.jsp"%>

	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file="./include/mainSidenav.jsp"%>

		<c:set var="count" value="0" />
		<c:forEach items="${list}" var="list">
			<c:if test="${list.estatus eq 'Y'}">
				<c:set var="count" value="${count + 1}" />
			</c:if>
		</c:forEach>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">본부 및 부서관리</h1>
				<div class="datatable-dropdown" style="margin-bottom: 20px;">
					<select class="datatable-selector" name="headno" id="headno"
						onchange="selectHeadList()">
						<c:forEach var="head" items="${headList}" varStatus="vs">
							<c:if test="${head.delflag ne 'Y'}">
								<option value="${head.headno}">${head.hname}</option>
							</c:if>
						</c:forEach>
					</select>
					<button class='btn btn-primary' type='button' style='float: right;' onclick="location.href='./headAndDeptManage.do'">본부/부서 관리</button>
				</div>
				<hr/>
				<div id="headAndDeptInfo">
					<table class="datatable-table" style="width: 30%; float: left;">
						<tbody id="inputTableBody">
							<tr style='width: 24%; background-color: #EFF5F2'  onclick="selectHead('${headVo.headno}')">
								<th style='border-right: 1px solid #ccc;' rowspan='${fn:length(headVo.deptVo)+1}' id='hname'>${headVo.hname}</th>
							</tr>
							<c:forEach items="${headVo.deptVo}" var="headDeptVo">
								<tr style='width: 25%' onclick="selectDept('${headDeptVo.deptno}')">
									<th class='dname'>${headDeptVo.dname}</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="infoZone" style="width: 67%; float: right; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
						<div id="nameZone" style="padding: 13.5px; font-size: 15px;">
							${headVo.hname}(${fn:length(headVo.deptVo)})
						</div>
						<div id="managerZone" style="padding: 13.5px; font-size: 15px;">
							<c:if test="${headVo.head_mgr ne null}">
								본부장 : ${headVo.empVo.name} ${headVo.empVo.spot}
							</c:if>
							<c:if test="${headVo.head_mgr eq null}">
								본부장 : -
							</c:if>
						</div>
						<div style="height: 30vh; overflow: auto;">
							<table class="datatable-table">
								<thead id="inputListTableHead">
									<tr><th>부서번호</th><th>부서명</th><th>소속본부</th><th>부서장명</th></tr>
								</thead>
								<tbody id="inputListTableBody">
									<c:forEach items="${headVo.deptVo}" var="headDept">
										<tr>
											<td>${headDept.deptno}</td>
											<td>${headDept.dname}</td>
											<td>${headVo.hname}</td>
											<c:forEach items="${headDept.empVo}" var="deptEmp">
												<c:if test="${headDept.dept_mgr eq deptEmp.id}">
													<td>${deptEmp.name}</td>
												</c:if>
											</c:forEach>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="buttonZone" style="margin: 20px;">
							<c:if test="${headVo.head_mgr ne null}">
								<button class='btn btn-primary' type='button' style='margin-right:10px;' data-bs-toggle='modal' data-bs-target='#headManagerModal' onclick="modifyManager('${headVo.headno}')">본부장 수정</button>
							</c:if>
							<c:if test="${headVo.head_mgr eq null}">
								<button class='btn btn-primary' type='button' style='margin-right:10px;' data-bs-toggle='modal' data-bs-target='#headManagerModal' onclick="modifyManager('${headVo.headno}')">본부장 등록</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="headManagerModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true"
				data-bs-backdrop="static">
				<div class="modal-dialog">
					<div class="modal-content" style="width: 300px;">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">본부장 후보</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body"
							style="display: flex; flex-direction: column; justify-content: space-between;">
							<div class="toast-body" style="display: flex; flex-direction: row; justify-content: space-around;">
								<table id="managerHubo"></table>
							</div>
							<div class="modal-footer">
								<button class="btn btn-secondary btn-sm" type="button"
									data-bs-dismiss="modal">취소</button>
								<button class="btn btn-primary btn-sm" type="button" id="modalSubmitBtn"
									style="margin-left: 10px;">변경</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="js/headAndDept_ljw/headAndDept.js"></script>
</body>
</html>