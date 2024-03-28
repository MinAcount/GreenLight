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
			display: none;
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
		
		#topChat {
			height: 10vh;
			border-bottom: 1px solid gray;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		#middleChat {
			height: 60vh;
			overflow-y: auto;
		}
		
		#bottomChat {
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		#roomName {
			text-align: left;
			width: 30vh;
			height: 10vh;
			padding-top: 3.7vh;
			font-size: large;
			margin-left: 2vh;
		}
		
		#chatSetting {
			text-align: right;
			width: 35vh;
			height: 10vh;
			padding-top: 2.7vh;
		}
		
		.right {
		    text-align: right;
		    height: 10vh;
		}
		
		.left {
			text-align: left;
			height: 10vh;
		}
		
		#textbox {
			border: 1px solid gray;
			padding: 10px;
			display: inline-block;
			width: auto;
			margin-left: 5px;
			margin-right: 5px;
			line-height: 1;
		}
		
		#chatPeople {
			width: 50px;
		}
		
		#settingModal {
			display: none;
			width: 22vh;
			height: 22vh;
			overflow: auto;
			position: fixed;
			z-index: 10000;
			background-color: white;
			border: 1px solid gray;
			top: 17%;
			left: 75%;
		}
		
		#closeSetting {
			float: right;
			cursor: pointer;
		}
		
		#settingContainer {
			display: flex;
			flex-direction: column;
			justify-content: space-between;
		}
		
		#settingBtn {
			text-align: center;
			border: 1px solid gray;
			flex: 1;
			margin: 2px;
			padding: 2px;
		}
		
		#peopleModal {
			display: none;
			width: 15vh;
			height: 20vh;
			overflow: auto;
			position: fixed;
			z-index: 10000;
			background-color: white;
			border: 1px solid gray;
			top: 27%;
			left: 66%;
		}
		
		#peopleWhoJoin {
			text-align: center;
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
				<div id="chatRoom">
				<!-- 상단 -->
					<div id="topChat">
						<div id="roomName"></div>
						<div id="peopleModal" class="peopleModal"></div>
						<div id="chatPeople">
							<img alt="이미지" src="./assets/img/participants.png" height="30vh" width="30vh" onclick="openPeople()">
						</div>
						<div id="settingModal" class="settingModal">
							<span id="closeSetting" onclick="closeSetting()">&times;</span>
							<br/>
							<div id="settingContainer">
								<div id="settingBtn">초대하기</div>
								<div id="settingBtn">채팅방 수정하기</div>
								<div id="settingBtn">알림 끄기</div>
								<div id="settingBtn">채팅방 나가기</div>
							</div>
						</div>
						<div id="chatSetting">
							<img alt="이미지" src="./assets/img/hamburger.png" height="30vh" width="30vh" onclick="openSetting()">
						</div>
					</div>
				<!-- 중단 -->
					<div id="middleChat">
					</div>
				<!-- 채팅 입력 -->
					<div id="bottomChat">
						<input type="text" id="chatInput" placeholder="채팅 입력">
						<button type="button" id="buttionChat" onclick="sendMessage()">전송</button>
					</div>
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