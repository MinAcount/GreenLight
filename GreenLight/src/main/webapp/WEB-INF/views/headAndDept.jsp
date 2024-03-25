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
					<select class="datatable-selector" name="headno" id="headno" onchange="selectHeadList()">
						<option value="No">선택</option>
						<c:forEach var="head" items="${headList}" varStatus="vs">
							<option value="${head.headno}">${head.hname}</option>
						</c:forEach>
					</select>
					<button class='btn btn-primary' type='button' style='float: right;'>본부/부서 관리</button>
				</div>
				<div style="display: none;" id="headAndDeptInfo">
					<table class="datatable-table"
						style="width: 30%; float: left;">
						<tbody id="inputTableBody">
							<tr style="width: 50%;">
								<th id="hname"></th>
							</tr>
						</tbody>
					</table>
					<div id="infoZone"
						style="width: 67%; float: right; display: none;">
						<div id="nameZone" style="padding:13.5px; font-size: 15px;"></div>
						<div id="managerZone" style="padding: 13.5px; font-size: 15px;"></div>
						<div style="height: 30vh; overflow: auto;">
							<table class="datatable-table">
								<thead id="inputListTableHead"></thead>
								<tbody id="inputListTableBody"></tbody>
							</table>
						</div>
						<div id="buttonZone" style="margin:20px;"></div>
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