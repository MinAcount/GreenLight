<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<style type="text/css">
		.container {
			display: flex;
			width: 100%;
			height: 95%;
		}
		
		#allChatDiv {
			justify-content: space-between;
			width: 40%;
			border: 1px solid gray;
		}
		
		#chatList{
			list-style:none;
		}
		
		#chatRoom {
			justify-content: space-between;
			width: 53%;
			border: 1px solid gray;
		}
		
		#searchChat {
			width: 100%;
			text-align: center;
			padding-top: 20px;
		}
		
		#searchChatRoom {
			width: 90%;
			height: 60px;
		}
		
		.table-container-div-first {
			display: flex;
			justify-content: center;
			width: 100%;
			padding-top: 45px;
		}
		
		.table-container-div {
			display: flex;
			justify-content: center;
			width: 120vw;
			height:20vh;
			padding-top: 20px;
		}
		
		
		.table-container {
			text-align: center;
			width: 90%;
			border: 1px solid gray;
		}
		
		.create-btn {
			text-align: right;
			padding-right: 25px;
			padding-top: 15px;
		}
		
	</style>
</head>
<body class="nav-fixed">
	<%@ include file="./include/mainHeader.jsp" %>
	
<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file="./include/mainSidenav.jsp" %>
<input type="hidden" value="${loginVo.id}" id="id">
<!-- 콘텐트 영역 -->
	<div id="layoutSidenav_content">
		<div id="main_content">
			<div class="container">
				<div id="allChatDiv">
					<form id="searchChat">
						<input type="text" id="searchChatRoom" name="searchChatRoom" placeholder="대화방 이름 검색">
					</form>
					<br/>
					
					<ul id="chatList">											
						
					</ul>
					<div class="create-btn">
						<button class="btn btn-primary btn-sm" type="button">생성</button>
					</div>
				</div>
				<div style="justify-content: space-between; width: 3%;"></div>
				<div id="chatRoom" style="display: none">
				채팅방
				</div>
			</div>
		</div>
		<%@ include file="./include/footer.jsp" %>
	</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="js/chatFn.js"></script>
</body>
</html>