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
		
		
		#table-container-div {
			display: flex;
			justify-content: center;
			width: 22vw;
			height:20vh;
		}
		
		#table-container-list {
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
			padding-top:3.2vh;
			font-size: large;
			margin-left: 2vh;
			align-items: center;
		}
		
		#chatSetting {
			text-align: right;
			width: 35vh;
			height: 10vh;
			padding-top: 2.7vh;
		}
		
		.right {
		    text-align: right;
		    height: 9vh;
		}
		
		.left {
			text-align: left;
			height: 9vh;
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
			z-index: 10000;
			background-color: white;
			border: 1px solid gray;
			position: absolute;
			top: 6.4%;
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
		
		.settingBtn {
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
			z-index: 10000;
			background-color: white;
			border: 1px solid gray;
			position: absolute;
			top: 17.2%;
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
<script type="text/javascript" src="./js/jstree/chat_jstree.js"></script>
<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file="./include/mainSidenav.jsp" %>
<input type="hidden" value="${loginVo.id}" id="id">
<input type="hidden" value="${loginVo.name}" id="name">
<input type="hidden" value="${loginVo.spot}" id="spot">
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
						<button id="createChatRoomModal" class="btn btn-primary btn-sm" type="button" data-bs-toggle="modal"
							data-bs-target="#chatModal">생성</button>
					</div>
					
					<div style="display: flex; flex-direction: row; justify-content: space-between;">
						<div class="modal fade" id="chatModal" tabindex="-1"
							aria-labelledby="chatModalLabel" aria-hidden="true"
							data-bs-backdrop="static">
							<div class="modal-dialog">
								<div class="modal-content" style="width: 800px; height: 630px;">
									<div class="modal-header">
										<h5 class="modal-title" id="chatModalLabel">채팅방 생성</h5>
										<input type="text" placeholder="이름을 입력하세요">
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body"
										style="display: flex; flex-direction: column; justify-content: space-between; margin-top: 15px;">
										<div class="toast-body"
											style="display: flex; flex-direction: row; justify-content: space-around;">
											<!-- 참조자들(js tree) -->
											<div id="chat_sel"
												style="width: 300px; min-height: 450px; border: 1px solid black; padding: 10px;">
												<div id="search_box">
													<input id="search_input2" type="text">
												</div>
												<div id="chatTree"
													style="margin-top: 10px; border: 1px solid black; width: 100%; max-height: 390px; overflow-y: scroll;"></div>
											</div>
											<div style="width: 50px; text-align: center;">
												<button id="addPeople" class="btn btn-primary"
													style="width: 30px; height: 100px; margin-top: 180px">></button>
											</div>
											<!-- 선택된 참조자들 -->
											<div id="people_chk"
												style="width: 300px; min-height: 450px; border: 1px solid black; padding-top: 30px;"></div>
										</div>
										<div class="modal-footer"
											style="margin-bottom: 20px; margin-top: 10px;">
											<input type="button" class="btn btn-danger" value="초기화"
												onclick="cleanChat()">
											<button class="btn btn-secondary " type="button"
												data-bs-dismiss="modal" onclick="chatCancel()">취소</button>
											<button data-bs-dismiss="modal" onclick="chatDone()"
												class="btn btn-primary " type="button"
												style="margin-left: 10px;">완료</button>
										</div>
									</div>
								</div>
							</div>
						</div>
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
						<div id="settingModal" class="settingModal"></div>
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
						<button type="button" id="buttonChat">전송</button>
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