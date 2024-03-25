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

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">일정</h1>
				<div
					style="display: flex; justify-content: flex-end; margin-top: 50px; height: 60.8px;">
					<div style="display: flex; flex-direction: row;">
						<input class="form-control" type="text" placeholder="Search..."
							aria-label="Search"
							style="width: 200px; margin-right: 15px; height: 42px;">
						<div class="datatable-dropdown">
							<select class="datatable-selector">
								<option value="5">월</option>
								<option value="10" selected="">10</option>
								<option value="15"></option>
								<option value="20">20</option>
								<option value="25">25</option>
							</select>
						</div>
					</div>
				</div>
				<hr class="mt-0 mb-5">
				<div>
					<h2>Schedule</h2>

					<table>
						<tr>
							<th>Title</th>
							<th>Category</th>
							<th>Start Date</th>
							<th>End Date</th>
							<th>Alarm</th>
						</tr>
						<c:forEach var="vo" items="${lists}" varStatus="vs">
							<tr>
								<td>${vo.title}</td>
								<td>${vo.category}</td>
								<td>${vo.start_date}</td>
								<td>${vo.end_date}</td>
								<td>${vo.alarm}</td>
							</tr>
						</c:forEach>
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


</body>
</html>