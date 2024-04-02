<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-bJQN0gRBAFlqVcFrj2k/9+JMe50VnT8i8FDEQoiR8tRckCeTV6UKGq6vtsbgndnOnvKEtLcctzN7K0s9Jko9w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    td.green-text {
        color: green;
    }
    td.red-text {
        color: red;
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
				<h1 style="margin-bottom: 70px; text-align: center;">회의실 예약</h1>
				<div style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;">
					<div>
						<nav class="nav nav-borders">
<!-- 							<ul style="display: flex; flex-direction: row; height: 62px; margin-bottom: 0px; padding-top: 14px;"> -->
<%-- 								<li class="nav-link active ms-0" onclick="allReserveList(${loginVo.id}); setActive(this)">전체</li> --%>
<%-- 								<li class="nav-link" id="완료" onclick="reserveListStatus(${loginVo.id}); setActive(this)">완료</li> --%>
<%-- 								<li class="nav-link" id="예정" onclick="reserveListStatus(${loginVo.id}); setActive(this)">예정</li> --%>
<!-- 							</ul> -->
						</nav>
					</div>
				</div>
				<hr class="mt-0 mb-5">
				<div class="container">
					<div id="reservation"></div>
				</div>
			</div>
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
	<script src="js/reserve.js"></script>
</body>
</html>