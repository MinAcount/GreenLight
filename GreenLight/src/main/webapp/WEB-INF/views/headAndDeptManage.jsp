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
					<select class="datatable-selector" id="gubun"
						onchange="selectHeadAndDept()">
						<option value="No">선택</option>
						<option value="head">본부</option>
						<option value="dept">부서</option>
					</select>
					<button class='btn btn-primary' type='button' style='float: right; display: none;' id="headPlusBtn">본부추가</button>
				</div>
				<hr/>
				<div style="display: none;" id="headAndDeptInfoZone">
					<table class="datatable-table" style="width: 100%;">
						<thead id="inputListTableHead"></thead>
						<tbody>
							<c:forEach items="${headList}" var="head">
								<tr class="HeadListTableBody">
									<td class="editIcon" onclick="editHeadName(this,'${head.headno}')"><i data-feather="edit-3"></i></td>
									<td><input class="hname" value="${head.hname}" style="border: 0; background-color: rgba(66,138,70,0);" disabled="disabled"></td>
									<td>${head.head_mgr}</td>
									<c:if test="${head.delflag eq 'Y'}">
										<td></td>
									</c:if>
									<c:if test="${head.delflag eq 'N'}">
										<td><i data-feather="plus-square"></i>부서추가</td>
									</c:if>
									<c:if test="${head.delflag eq 'Y'}">
										<td><i data-feather="refresh-cw"></i>복구</td>
									</c:if>
									<c:if test="${head.delflag eq 'N'}">
										<td><i data-feather="trash"></i>삭제</td>
									</c:if>
									<td><i data-feather="trash-2"></i>완전삭제</td>
								</tr>
							</c:forEach>
							<c:forEach items="${deptList}" var="dept">
								<tr class="DeptListTableBody">
									<td><i data-feather="edit-3" onclick="editDeptName('${deptno}')"></i></td>
									<td>${dept.headno}</td>
									<td>${dept.dname}</td>
									<td>${dept.dept_mgr}</td>
									<c:if test="${dept.delflag eq 'Y'}">
										<td><i data-feather="refresh-cw"></i>복구</td>
									</c:if>
									<c:if test="${dept.delflag eq 'N'}">
										<td><i data-feather="trash"></i>삭제</td>
									</c:if>
									<td><i data-feather="trash-2"></i>완전삭제</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
	<script src="js/headAndDept_ljw/headAndDeptManage.js"></script>
</body>
</html>