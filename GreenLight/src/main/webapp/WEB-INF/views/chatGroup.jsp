<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<style type="text/css">
		#container {
			display: flex;
			width: 100%;
			height: 90%;
		}
		
		#chatList {
			justify-content: space-between;
			width: 40%;
			border: 1px solid gray;
		}
		
		#chatRoom {
			justify-content: space-between;
			width: 53%;
			border: 1px solid gray;
		}
	</style>
</head>
<body class="nav-fixed">
	<%@ include file="./include/mainHeader.jsp" %>
	
<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file="./include/mainSidenav.jsp" %>

<!-- 콘텐트 영역 -->
	<div id="layoutSidenav_content">
		<div id="main_content">
			<div id="container">
				<div id="chatList">
				채팅방 목록
				</div>
				<div style="justify-content: space-between; width: 3%;"></div>
				<div id="chatRoom">
				채팅방
				</div>
			</div>
		</div>
		<%@ include file="./include/footer.jsp" %>
	</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</body>
</html>