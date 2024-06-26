
// 전역변수
var url = "";
var checkUrl = "";
var ws = "";
var chat_id = "";
var getMsgData = "";
var id = "";
var chatListAll = "";
var chatListNoti = "";
var name = "";
var spot = "";
var copyResult = {}; // 채팅방 목록 result 복사본

//load 시 실행
window.onload=function(){
	doGetAllChat();
	console.log("실행됨");
}

//채팅방 목록 API 호출
function doGetAllChat(){
			var id = document.getElementById('id').value;
			
			fetch('./chatList.do', {
				method:'POST',
				headers:{
					"Content-Type":"application/json",
					"Accept":"application/json"
					},
				body: JSON.stringify({
					id:id
				}),
			})
			.then(response => response.json())
			.then(result => {
				console.log("result:",result);
				chatListAll = result;
				if(result != null){
					getAllChat(result)
				}else{
					alert('실패..')
				}
			});
	// 시간 오전오후 ~~ 으로 변경
	function formatSendDate(send_date){
		var date = new Date(send_date);
		var hours = date.getHours();
		var minutes = date.getMinutes();
	    var amOrPm = hours >= 12 ? '오후' : '오전'; // 시간이 12 이상인 경우 '오후', 그렇지 않은 경우 '오전'
	    hours = hours % 12 || 12; // 시간을 12시간 형식으로 조정
	    var timeString = amOrPm + ' ' + hours + ':' + (minutes < 10 ? '0' : '') + minutes; // 시간과 분을 구분자와 함께 합치기
	    return timeString;
	}
	
	
//채팅방 목록 HTML 조립
function getAllChat(result){
	var chatList = document.getElementById('chatList');
	var html = '';
	
	copyResult = result;
	for(var i=0;i<result.length;i++){
		var formattedSendDate = formatSendDate(result[i].send_date);
		var img = "";	
		
		html += '<div id="chatListLi">';
		html += '<div id="table-container-div">';
		html += '<div id="table-container-list" class="chat_card">';
		html += '<div class="table-container-list-thead card">';
		html += '<div id="favorTr">';
		html += '</div>';
		html += '<div class="chatNameDate" id=\"roomname'+result[i].chat_id+'\" onclick="getViewInsideChat('+result[i].chat_id+', '+i+')">';
		html += '<div class="roomnamename">'+result[i].gmvo.roomname+'</div>';
		html += '<div class="datedate">'+formattedSendDate+'</div>';
		html += '</div>';
		html += '<div class="chatContentNoti" id=\"chat'+result[i].chat_id+'\" onclick="getViewInsideChat('+result[i].chat_id+', '+i+')">';
		html += '<div class="contentcontent">'+result[i].content+'</div>';
		html += '<div class="notinoti">'+result[i].gmvo.noti+'</div>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '<br/>';
	};
		chatList.innerHTML = html;
	}
}	



//채팅방 목록 클릭 시 chat_id 전달하여 해당 채팅방 오픈
function getViewInsideChat(idx, i){
			console.log(idx);
			chat_id = idx;
			id = document.getElementById('id').value;
			console.log(id);
			spot = document.getElementById('spot').value;
			console.log(spot);
			chatListNoti = chatListAll[i].gmvo.noti;
			
			// WebSocket
			url = location.href;
			checkUrl = "ws:" + (url.substring(url.indexOf("//"), url.lastIndexOf("/") + 1)) + "chat.do";
			console.log(checkUrl);
			
			ws = new WebSocket(checkUrl);
		//	ws = new WebSocket("ws://192.168.8.30:8080/GreenLight/chat.do");
			console.log("생성된 웹소켓 객체", ws);
			
			// WebSocket 오픈
			ws.onopen = function(){
				console.log("웹소켓 오픈");
			}
			
			// WebSocket 종료
			ws.onclose = function(){
				alert("서버와 연결이 종료되었습니다");
			}
			
			// 시간 오전오후 ~~ 변경
			function formatSendDate(send_date){
				var date = new Date(send_date);
				var hours = date.getHours();
				var minutes = date.getMinutes();
			    var amOrPm = hours >= 12 ? '오후' : '오전'; // 시간이 12 이상인 경우 '오후', 그렇지 않은 경우 '오전'
			    hours = hours % 12 || 12; // 시간을 12시간 형식으로 조정
			    var timeString = amOrPm + ' ' + hours + ':' + (minutes < 10 ? '0' : '') + minutes; // 시간과 분을 구분자와 함께 합치기
			    return timeString;
			}
			
			// WebSocket 메시지 전송
			ws.onmessage = function(event){
				var msg = event.data.split(":")[0];
				var sendName = event.data.split(":")[1];
				var chat_id = event.data.split(":")[2];
				var spot = event.data.split(":")[3];
				var send_date = new Date();
				var formattedSendDate = formatSendDate(send_date);
				name = document.getElementById("name").value;
				
				console.log("서버로부터 전달된 메시지 : ", msg);
				console.log(msg);
				console.log(sendName);
				console.log(chat_id);
				console.log(spot);
				
				if(sendName.startsWith(name)){
					console.log("확인1");
					$("#middleChat").append($("<div class='right'>").append($("<div>").text(sendName + " " + spot).css("text-align", "right")).append($("<span>").text(formattedSendDate).css("text-align", "right")).append($("<div id='textbox' class='textbox_card card'>").text(msg).css("text-align", "right")));
				} else {
					console.log("확인2");
					$("#middleChat").append($("<div class='left'>").append($("<div>").text(sendName + " " +spot).css("text-align", "left")).append($("<div id='textbox' class='textbox_card card'>").text(msg).css("text-align", "left")).append($("<span>").text(formattedSendDate).css("text-align", "left")));
					//알림
              		notify(sendName, msg, './chatGroup.do');
				}
				$("#middleChat").scrollTop($("#middleChat")[0].scrollHeight);
				
				document.getElementById('roomname'+chat_id).children[1].innerText = formatSendDate(send_date);
				document.getElementById('chat'+chat_id).children[0].innerText = msg;
			};
			
			fetch('./insideChat.do', {
				method:'POST',
				headers:{
					"Content-Type":"application/json",
					"Accept":"application/json"
					},
				body: JSON.stringify({
					id:idx
				}),
			})
			.then(response => response.json())
			.then(result => {
				console.log("result:",result);
				getMsgData = result;
				if(result != null){
					doGetViewInsideChat(result);
					document.getElementById('chatRoom').style.display = 'block';
					chatPeople(result);
					chatSetting(result);
					closePeopleX();
					closeSettingAnother();
					scrollToBottom();
				}else{
					alert('실패..')
				}
			});
	
	
	
	function scrollToBottom() {
	    var chatRoom = document.getElementById('middleChat');
	    chatRoom.scrollTop = chatRoom.scrollHeight;
	}
	
	function chatPeople(result) {
        var peopleModal = document.getElementById('peopleModal');
        var html = '';
        copyResult = result;
		console.log(result);
		
        var participants = {}; // 중복된 이름 제거를 위한 객체
        html += '<span id="closePeopleX" onclick="closePeopleX()">&times;</span>';
		html += '<br/>';
        for (var i = 0; i < result.length; i++) {
            var participantName = result[i].empVo.name;
            if (!participants[participantName]) {
                participants[participantName] = true;
                html += '<div id="peopleWhoJoin">' + participantName + '</div>';
            }
        }
        peopleModal.innerHTML = html;
    }
}

	$("#chatInput").keydown(function(event){
		if(event.keyCode == 13){
			event.preventDefault();
			sendMessage();
		}
	});
	
	$("#buttonChat").on('click', function(){
		sendMessage();
	});
				
	function sendMessage(){
		var message = $("#chatInput").val().trim();
		console.log(message);
		if(message != ""){
			ws.send(message + ":" + id + ":" + chat_id + ":" + spot);
			$("#chatInput").val("");
			fetch('./insertSendMessage.do', {
					method: 'POST',
					headers: {
						"Content-Type":"application/json"
					},
					body: JSON.stringify({
						chat_id:chat_id,
						writter:id,
						content:message,
						spot:spot
					})
				})
				.then(response => {
					if(!response.ok){
						throw new Error('Network response was not ok');
					}
					return response.json();
				})
				.then(data => {
					console.log("성공 : ", data);
				});
			
		}
	}

    
    function chatSetting(result){
    	var settingModal = document.getElementById('settingModal');
    	var html = '';
    	console.log(result);
    	
    	html += '<span id="closeSetting" onclick="closeSetting()">&times;</span>';
		html += '<br/>';
		html += '<div id="settingContainer" class="settingContainerModal">';
		html += '<div class="settingBtn_card" id="changeRoomName" style="border-bottom:1px solid" onclick="changeRoomName('+result[0].chat_id+')">채팅방 수정하기</div>';
		if(chatListNoti == 'Y'){
			html += '<div class="settingBtn_card" id="notificationYn" onclick="toggleNotification('+result[0].chat_id+')">알림 끄기</div>';
		} else {
			html += '<div class="settingBtn_card" id="notificationYn" onclick="toggleNotification('+result[0].chat_id+')">알림 켜기</div>';
		}
		html += '</div>';
    	
    	settingModal.innerHTML = html;
    }
    function formatSendDate(send_date){
		var date = new Date(send_date);
		var hours = date.getHours();
		var minutes = date.getMinutes();
	    var amOrPm = hours >= 12 ? '오후' : '오전'; // 시간이 12 이상인 경우 '오후', 그렇지 않은 경우 '오전'
	    hours = hours % 12 || 12; // 시간을 12시간 형식으로 조정
	    var timeString = amOrPm + ' ' + hours + ':' + (minutes < 10 ? '0' : '') + minutes; // 시간과 분을 구분자와 함께 합치기
	    return timeString;
	}

function doGetViewInsideChat(result){
	var chatRoom = document.getElementById('middleChat');
	var html = '';
	console.log(result);
	console.log(result[0]);
	console.log(result[0].gmvo.roomname);
	document.getElementById('roomName').innerText=result[0].gmvo.roomname;
	copyResult = result;
	
	function alignChatMessage(chat){
		var chatClass = '';
		var content = chat.content;
		var writterName = chat.writter;
		if(content.includes('입장하였습니다.')){
			writterName = '시스템';
			chatClass = 'center';
		} else if(chat.writter == id) {
			chatClass = 'right';
		} else {
			chatClass = 'left';
		}
		return {class : chatClass, writter : writterName};
	}
	
	for(var i=0;i<result.length;i++){
		var formattedSendDate = formatSendDate(result[i].send_date);
		var {class : chatClass, writter : writterName} = alignChatMessage(result[i]);	
		
		
		html += '<div class="'+chatClass+'">';
		if(chatClass != 'center'){
			html += '<div>'+result[i].empVo.name + " " + result[i].comVo.code_name+'</div>';
		}
		if(chatClass == 'left'){
			html += '<div id="textbox" class="textbox_card card">'+result[i].content+'</div>';
			html += '<span>'+formattedSendDate+'</span>';
		} else if (chatClass == 'right'){
			html += '<span>'+formattedSendDate+'</span>';
			html += '<div id="textbox" class="textbox_card card">'+result[i].content+'</div>';
		} else if (chatClass == 'center'){
			html += '<div id="textbox" class="textbox_card card">'+result[i].content+'</div>';
		}
		html += '</div>';
	};
		chatRoom.innerHTML = html;
}

function changeRoomName(chat_id) {
    	var roomNameDiv = document.getElementById("roomName");
    	var roomNameForChatId = document.getElementById("chatList");
    	var chatNameInfo = document.querySelector("[id='roomname" + chat_id + "']");
    	var chatNameInfoRoomName = chatNameInfo.querySelectorAll(".roomnamename")[0].innerText;
    	console.log(roomNameDiv);
    	console.log(chat_id);
    	console.log(chatNameInfo);
    	console.log(chatNameInfoRoomName);
    	
    	var inputField = document.createElement("input");
    	inputField.type = "text";
    	inputField.value = roomNameDiv.innerText;
    	inputField.id = "inputRoomName";
    	inputField.style.width = "20vh";
    	console.log(roomNameDiv.innerText);
    	
    	roomNameDiv.innerHTML = '';
    	roomNameDiv.appendChild(inputField);
    	inputField.disabled = false;
    	
    	inputField.addEventListener("keypress", function(event){
    		if(event.key == "Enter"){
    			var newRoomName = inputField.value;
    			console.log(newRoomName);
    			chatNameInfo.querySelectorAll(".roomnamename")[0].innerText = newRoomName;
    			updateRoomName(newRoomName, chat_id);
    			inputField.disabled = true;
    		}
    	});
    	inputField.focus();
    }

    
function updateRoomName(newRoomName, chat_id){
	console.log(newRoomName);
	console.log(chat_id);
    fetch("./updateChatName.do", {
    	method: 'POST',
    	headers: {
    		'Content-Type': 'application/json',
    		'Accept': 'application/json'
    	},
    	body: JSON.stringify({ 
    		roomname: newRoomName,
    		chat_id: chat_id
    	})
    })
    .then(response => {
		 if (!response.ok) {
		     throw new Error('네트워크 오류');
		 }
		 return response.json();
	})
	.then(result => {
	// 성공적으로 업데이트된 경우 새로운 이름을 표시
		if (result.success) {
		    var roomNameDiv = document.getElementById("roomName");
		    roomNameDiv.innerText = newRoomName;
		    console.log(newRoomName);
		}
	})
	.catch(error => {
		console.error('Update room name failed:', error);
	});
}



function openSetting(){
	var modal = document.getElementById('settingModal');
	modal.style.display = 'block';
}

function closeSetting(){
	var modal = document.getElementById('settingModal');
	modal.style.display = 'none';
}

function closeSettingAnother(){
	var modal = document.getElementById('settingModal');
	if(modal.style.display == 'block'){
		modal.style.display = 'none';
	}
}

function openPeople(){
	var modal = document.getElementById('peopleModal');
		modal.style.display = 'block';
}

function closePeopleX(){
	var modal = document.getElementById('peopleModal');
	modal.style.display = 'none';
}

window.onclick = function(event){
	var modal = document.getElementById('peopleModal');
	if(event.target == modal){
		modal.style.display = 'none';
	}
}

function toggleNotification(chat_id) {
	var notiBtn = document.getElementById("notificationYn");
	var chatListInfo = document.querySelector("[id='chat" + chat_id + "']");
	var chatListInfoNoti = chatListInfo.querySelectorAll(".notinoti")[0].innerText;
	var currentTxt = notiBtn.innerText.trim();
	console.log(currentTxt);
	console.log(chat_id);
	console.log(id);
	console.log(chatListInfo);
	console.log(chatListInfoNoti);
	
	var noti = '';
	if(currentTxt == "알림 끄기"){
			noti = "N";
		} else {
			noti = "Y";
		}
	
	fetch("./updateNoti.do", {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
            'Accept': 'application/json'
		},
		body: JSON.stringify({
			chat_id:chat_id,
			id: id,
			noti: noti
		})
	})
	.then(response => {
		if(!response.ok){
			throw new Error('Network response was not ok');
		}
		return response.text();
	})
	.then(result => {
		if(currentTxt == "알림 켜기"){
			notiBtn.innerText = "알림 끄기";
			chatListInfo.querySelectorAll(".notinoti")[0].innerText = 'Y';
		} else {
			notiBtn.innerText = "알림 켜기";
			chatListInfo.querySelectorAll(".notinoti")[0].innerText = 'N';
		}
	})
	.catch(error => {
		console.error("네트워크 오류:", error);
	});
}

//알림
function notify(title, content, url) {
   if(Notification.permission == "default" ||Notification.permission == "denied"){
      alert("알림을 허용해주세요");
      Notification.requestPermission(); // default일때만 가능
      return;
   }else{
      let notification = new Notification(
         title, // 제목 
         {
         body: content, // 메세지
         icon: "./assets/img/grn.png", // 아이콘
         image: "./assets/img/logo_grn.png", // 배경이미지
         requireInteraction: true, //닫기버튼 [닫기]를 누르기 전까지 사라지지 않음
         silent:true, //소리설정 (true:무음)
         }
      );
      
      // 3초뒤 알람 닫기 / 닫기버튼이 활성화 되어있어도 알람이 닫힘
      setTimeout(function() {
         notification.close();
      }, 3*1000);
      
      //알림 클릭 시 이벤트
      notification.addEventListener("click", () => {
         location.href = url;
      });
   }
}

//알림
function notify(title, content, url) {
	if(Notification.permission == "default" ||Notification.permission == "denied"){
		alert("알림을 허용해주세요");
		Notification.requestPermission(); // default일때만 가능
		return;
	}else{
		let notification = new Notification(
			title, // 제목 
			{
			body: content, // 메세지
			icon: "./assets/img/grn.png", // 아이콘
			image: "./assets/img/logo_grn.png", // 배경이미지
			requireInteraction: true, //닫기버튼 [닫기]를 누르기 전까지 사라지지 않음
			silent:true, //소리설정 (true:무음)
			}
		);
		
		// 3초뒤 알람 닫기 / 닫기버튼이 활성화 되어있어도 알람이 닫힘
		setTimeout(function() {
			notification.close();
		}, 3*1000);
		
		//알림 클릭 시 이벤트
		notification.addEventListener("click", () => {
			location.href = url;
		});
	}
}