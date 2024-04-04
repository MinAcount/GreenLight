<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
    td.green-text {
        color: green;
    }
    td.red-text {
        color: red;
    }
    table {
        border-collapse: collapse;
        width: 60%;
    }

    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #f5f5f5;
    }
</style>
</head>
<body class="nav-fixed">

	<%@ include file="./include/mainHeader.jsp"%>

	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file="./include/mainSidenav.jsp"%>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">${vo.cname}</h1>
				<div style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;">
				</div>
				<hr class="mt-0 mb-5">
				<div>
					<div style="padding:30px; display: flex; justify-content: center; align-items: center;">
					<table border="1">
						<tr>
							<th>자산</th>
							<td>${vo.cname}</td>
						</tr>
						<tr>
							<th>수용 인원</th>
							<td>${vo.capacity}</td>
						</tr>
						<tr>
							<th>가용 여부</th>
							<td>${vo.availability}</td>
						</tr>
						<tr>
							<th>장소</th>
							<td>${vo.locality}</td>
						</tr>
						<tr>
							<th>호수</th>
							<td>${vo.ho}</td>
						</tr>
						<tr>
							<th>회의실 정보</th>
							<td>${vo.roominfo}</td>
						</tr>
					</table>
					</div>
					<div style="display: flex; justify-content: center;">
						<img src="assets/img/conference_gd.png" style="width: 1000px;">
					</div>
				</div>
			</div>
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="js/reserve.js"></script>
</body>
</html>