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
			width: 40%;
			height: 900px;
			max-height: 900px;
		}
		
		#chatList{
			list-style:none;
			overflow-y: scroll;
			min-height: 826px;
			padding-top: 18px;
		}
		
		#chatRoom {
			display: none;
			justify-content: space-between;
			width: 53%;
			height: 900px;
			max-height: 900px;
		}
		
		#table-container-div {
			display: flex;
			width: 5%;
			height: 100%;
		}
		
		#chatListName {
			text-align: left;
			width: 22vh;
			float: left;
			padding-top: 1vh;
			font-size: large;
			color: #69707a;
		}
		
		.create-btn {
			text-align: right;
			padding-right: 28px;
			padding-top: 17px;
		}
		
		#topChat {
			height: 8%;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		#middleChat {
			height: 85.5%;
			overflow-y: auto;
		}
		
		#bottomChat {
			display: flex;
			justify-content: center;
			align-items: center;
			margin-top: 3%;
		}
		
		#roomName {
			text-align: left;
			width: 30vh;
			padding-top: 1.3%;
			font-size: large;
			margin-left: 1vh;
			align-items: center;
			color: #69707a;
		}
		
		#chatSetting {
			text-align: right;
			width: 35vh;
			height: 10vh;
			padding-top: 2.7vh;
		}
		
		.right {
			padding: 10px;
		    text-align: right;
		    height: 9vh;
		}
		
		.left {
			padding: 10px;
			text-align: left;
			height: 9vh;
		}
		
		.center {
			text-align: center;
			height: 9vh;
			padding-top: 3vh;
		}
		
		#textbox {
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
			width: 20%;
			height: 11%;
			overflow: auto;
			z-index: 10000;
			background-color: white;
			border: 1px solid gray;
			position: absolute;
			top: 7%;
			left: 77%;
			color: #69707a;
		}
		
		#closeSetting {
			float: right;
			cursor: pointer;
			font-size: 150%;
    		margin-right: 8%;
    		height: 3%;
		}
		
		#settingContainer {
			display: flex;
			flex-direction: column;
			justify-content: space-between;
		}
		
		#peopleModal {
			display: none;
			width: 15%;
			height: 17%;
			overflow: auto;
			z-index: 10000;
			background-color: white;
			border: 1px solid gray;
			position: absolute;
			top: 7%;
    		left: 39%;
    		color: #69707a;
		}
		
		#closePeopleX {
			float: right;
			cursor: pointer;
			font-size: 150%;
    		margin-right: 8%;
    		height: 3%;
		}
		
		#peopleWhoJoin {
			text-align: center;
		    padding-top: 15px;
		    border-bottom: 1px solid;
		    width: 70px;
		    margin-left: 15px;
		}
		
		.chatNameDate {
			padding-top: 5%;
		}
		
		.chatContentNoti {
			padding-top: 14%;
		}
		
		.roomnamename {
			float: left;
			font-size: medium;
		}
		
		.datedate {
			float: right;
			font-size: medium;
		}
		
		.contentcontent {
			text-align: left;
		    width: 200px;
		    float: left;
		    font-size: medium;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		}
		
		.notinoti {
			float: right;
			font-size: large;
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
				<div id="allChatDiv" class="card">
					<div class="create-btn card-header">
					<div id="chatListName">채팅방 목록</div>
					<button id="createChatRoomModal" class="btn btn-primary btn-sm" type="button" data-bs-toggle="modal"
						data-bs-target="#chatModal" onclick="closePeople();closeSettingAnother();">생성</button>
					</div>
					<div id="chatList">											
					</div>
					<div style="display: flex; flex-direction: row; justify-content: space-between;">
						<div class="modal fade" id="chatModal" tabindex="-1"
							aria-labelledby="chatModalLabel" aria-hidden="true"
							data-bs-backdrop="static">
							<div class="modal-dialog jstreeModal">
								<div class="modal-content" style="width: 800px; height: 630px;">
									<div class="modal-header">
										<h5 class="modal-title" id="chatModalLabel">채팅방 생성&nbsp;&nbsp;</h5>
										<input type="text" id="createChatName" style="width: 30vh" placeholder="채팅방 이름을 입력하세요">
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
				<div id="chatRoom" class="card">
				<!-- 상단 -->
					<div id="topChat" class="card-header">
						<div id="roomName"></div>
						<div id="peopleModal" class="peopleModal card"></div>
						<div id="chatPeople">
							<i class="chatPeopleIcon" data-feather="user" onclick="openPeople()"></i>
						</div>
						<div id="settingModal" class="settingModal card"></div>
						<div id="chatSetting">
							<i class="chatSettingIcon" data-feather="align-justify" onclick="openSetting()"></i>
						</div>
					</div>
				<!-- 중단 -->
					<div id="middleChat">
					</div>
				<!-- 채팅 입력 -->
					<div id="bottomChat" class="input-group input-group-joined">
						<input type="text" id="chatInput" class="form-control pe-0" placeholder="채팅 입력">
						<button type="button" id="buttonChat" class="btn btn-primary">전송</button>
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