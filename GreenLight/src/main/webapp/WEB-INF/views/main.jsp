<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css">
	.mainAttBox{
		display: flex;
		padding: 12px;
	}
	.mainAttBox > .item{
		flex-grow: 1;
		flex-shrink:  1;
		flex-basis: 300px;
		margin: auto;
		text-align: center;
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





				<!-- 출퇴근관리 -->
				<div class="mainAttBox" style="border: 1px solid;">
					<div class="item">
                        <% 
                            Date now = new Date();
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E)");
                            String formattedDate = sdf.format(now);
                        %>
						<h2><%=formattedDate%></h2>
						<h2 id="time"></h2>
					</div>
					<div class="item">
						<h4>출근시간 : 09:40</h4>
						<h4>퇴근시간 : 미등록</h4>
					</div>				
					<div class="item">
						<input type="button" value="출근하기">
						<input type="button" value="퇴근하기">
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
