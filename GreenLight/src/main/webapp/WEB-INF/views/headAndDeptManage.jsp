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
						<option value="head">본부</option>
						<option value="dept">부서</option>
					</select>
					<div style='float: right;' id="headPlusZone">
						<input id="inputHeadPlus" placeholder="추가할 본부 이름" style="display: none;">
						<input id="inputDeptPlus" placeholder="추가할 부서 이름" style="display: none;">
						<button class='btn btn-primary' type='button' id="headPlusBtn" onclick="okHeadPlus()" style="display: none;">추가완료</button>
						<button class='btn btn-primary' type='button' id="deptPlusBtn" style="display: none;">추가완료</button>
						<button class='btn btn-secondary' type='button' id="cancelBtn" onclick="cancelPlus()" style="display: none;">취소</button>
						<button class='btn btn-primary' type='button' id="headBtn" onclick="headPlus()">본부추가</button>
					</div>
				</div>
				<hr/>
				<div id="headAndDeptInfoZone">
					<table class="datatable-table" style="width: 100%;" id="headAndDeptInfoTable">
						<thead id="inputListTableHead">
							<tr><th></th><th>본부명</th><th>본부장명</th><th>부서추가</th><th>복구/삭제</th><th>완전삭제</th></tr>
						</thead>
						<tbody id="inputListTableBody">
							<c:forEach items="${headList}" var="head">
								<tr class="HeadListTableBody">
									<td class="editIcon" onclick="editHeadName(this)"><i data-feather="edit-3"></i></td>
									<td class="okIcon" onclick="okHeadName(this,'${head.headno}')" style="display: none;"><i data-feather="check-circle"></i></td>
									<td><input class="hname" value="${head.hname}" style="border: 0; background-color: rgba(66,138,70,0);" disabled="disabled"></td>
									<c:if test="${head.head_mgr eq null}"><td></td></c:if>
									<c:forEach items="${empList}" var="emp">
										<c:if test="${head.head_mgr eq emp.id}">
											<td>${emp.name}</td>
										</c:if>
									</c:forEach>
									<c:if test="${head.delflag eq 'Y'}">
										<td></td>
										<td onclick="headRecycle('${head.headno}')">복구 <i data-feather="refresh-cw"></i></td>
									</c:if>
									<c:if test="${head.delflag eq 'N'}">
										<td onclick="deptPlus('${head.headno}')">부서추가 <i data-feather="plus-square"></i></td>
										<td onclick="headDel('${head.headno}','1')">삭제 <i data-feather="trash"></i></td>
									</c:if>
									<td onclick="headDel('${head.headno}','2')">완전삭제 <i data-feather="trash-2"></i></td>
								</tr>
							</c:forEach>
							<c:forEach items="${deptList}" var="dept">
								<tr class="DeptListTableBody" style="display: none;">
									<td class="editIcon" onclick="editDeptName(this)"><i data-feather="edit-3"></i></td>
									<td class="okIcon" onclick="okDeptName(this,'${dept.deptno}')" style="display: none;"><i data-feather="check-circle"></i></td>
									<td><input class="dname" value="${dept.dname}" style="border: 0; background-color: rgba(66,138,70,0);" disabled="disabled"></td>
									<c:forEach items="${headList}" var="head">
										<c:if test="${dept.headno eq head.headno}">
											<td>${head.hname}</td>
										</c:if>
									</c:forEach>
									<c:if test="${dept.dept_mgr eq null}"><td></td></c:if>
									<c:forEach items="${empList}" var="emp">
										<c:if test="${dept.dept_mgr eq emp.id}">
											<td>${emp.name}</td>
										</c:if>
									</c:forEach>
									<c:if test="${dept.delflag eq 'Y'}">
										<td class="recycleIcon" onclick="deptRecycle(this,'${dept.deptno}')">복구 <i data-feather="refresh-cw"></i></td>
									</c:if>
									<c:if test="${dept.delflag eq 'N'}">
										<td class="delIcon" onclick="deptDel(this,'${dept.deptno}','1')">삭제 <i data-feather="trash"></i></td>
									</c:if>
									<td class="allDelIcon" onclick="deptDel(this,'${dept.deptno}','2')">완전삭제 <i data-feather="trash-2"></i></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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