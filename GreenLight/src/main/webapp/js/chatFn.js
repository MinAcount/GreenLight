//load 시 실행
window.onload=function(){
	doGetAllChat();
	console.log("실행됨");
}

var copyResult = {}; // 채팅방 목록 result 복사본

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
				if(result != null){
					getAllChat(result)
				}else{
					alert('실패..')
				}
			});
	
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
		
		html += '<li>';
		html += '<div class="tavle-container-div">';
		html += '<table class="table-container">   ';
		html += '<thead>                           ';
		html += '<tr>';
		if(result[i].gmvo.favor=="Y"){
			img="★";
			//html += '<td>'+result[i].gmvo.favor+'</td>    ';
			html += '<td>'+img+'</td>';
		} else {
			img="☆";
			html += '<td>'+img+'</td>';
		}
		html += '</tr>                             ';
		html += '<tr onclick="getViewInsideChat('+result[i].chat_id+')">';
		html += '<td>'+result[i].gmvo.roomname+'</td>     ';
		html += '<td>'+formattedSendDate+'</td>          ';
		html += '</tr>                             ';
		html += '<tr id=\"chat'+result[i].chat_id+'\" onclick="getViewInsideChat('+result[i].chat_id+')">';
		html += '<td>'+result[i].content+'</td>            ';
		html += '<td class="notinoti">'+result[i].gmvo.noti+'</td>     ';
		html += '</tr>                             ';
		html += '</thead>                          ';
		html += '</table>                          ';
		html += '</div>';
		html += '</li>';
		html += '<br/>';
	};
		chatList.innerHTML = html;
	}
}	


//채팅방 목록 클릭 시 chat_id 전달하여 해당 채팅방 오픈
function getViewInsideChat(idx){
			console.log(idx);
			var chat_id = idx;
			
			fetch('./insideChat.do', {
				method:'POST',
				headers:{
					"Content-Type":"application/json",
					"Accept":"application/json"
					},
				body: JSON.stringify({
					//id:chat_id
					id:idx
				}),
			})
			.then(response => response.json())
			.then(result => {
				console.log("result:",result);
				if(result != null){
					doGetViewInsideChat(result);
					document.getElementById('chatRoom').style.display = 'block';
					chatPeople(result);
					chatSetting(result)
					closePeople();
					closeSettingAnother();
					scrollToBottom();
				}else{
					alert('실패..')
				}
			});
	
	function formatSendDate(send_date){
		var date = new Date(send_date);
		var hours = date.getHours();
		var minutes = date.getMinutes();
	    var amOrPm = hours >= 12 ? '오후' : '오전'; // 시간이 12 이상인 경우 '오후', 그렇지 않은 경우 '오전'
	    hours = hours % 12 || 12; // 시간을 12시간 형식으로 조정
	    var timeString = amOrPm + ' ' + hours + ':' + (minutes < 10 ? '0' : '') + minutes; // 시간과 분을 구분자와 함께 합치기
	    return timeString;
	}
	
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
        for (var i = 0; i < result.length; i++) {
            var participantName = result[i].empVo.name;
            if (!participants[participantName]) {
                participants[participantName] = true;
                html += '<div id="peopleWhoJoin">' + participantName + '</div>';
            }
        }
        peopleModal.innerHTML = html;
    }
    
    
    function chatSetting(result){
    	var settingModal = document.getElementById('settingModal');
    	var html = '';
    	console.log(result);
    	
    	html += '<span id="closeSetting" onclick="closeSetting()">&times;</span>';
		html += '<br/>';
		html += '<div id="settingContainer">';
		html += '<div class="settingBtn">초대하기</div>';
		html += '<div class="settingBtn" id="changeRoomName" onclick="changeRoomName()">채팅방 수정하기</div>';
		if(result[0].noti == 'Y'){
			html += '<div class="settingBtn" id="notificationYn" onclick="toggleNotification('+result[0].chat_id+')">알림 끄기</div>';
		} else {
			html += '<div class="settingBtn" id="notificationYn" onclick="toggleNotification('+result[0].chat_id+')">알림 켜기</div>';
		}
		html += '<div class="settingBtn">채팅방 나가기</div>';
		html += '</div>';
    	
    	settingModal.innerHTML = html;
    }

function doGetViewInsideChat(result){
	var chatRoom = document.getElementById('middleChat');
	var html = '';
	document.getElementById('roomName').innerText=result[idx].gmvo.roomname;
	copyResult = result;
	
	function alignChatMessage(chat){
		var chatClass = '';
		if(chat.writter == id.value){
			chatClass = 'right';
		} else {
			chatClass = 'left';
		}
		return chatClass;
	}
				
	for(var i=0;i<result.length;i++){
		var formattedSendDate = formatSendDate(result[i].send_date);
		var chatClass = alignChatMessage(result[i]);	
		html += '<div class="'+chatClass+'">';
		html += '<div>'+result[i].empVo.name+'</div>';
		if(chatClass == 'left'){
			html += '<span id="textbox">'+result[i].content+'</span>';
			html += '<span>'+formattedSendDate+'</span>';
		} else {
			html += '<span>'+formattedSendDate+'</span>';
			html += '<span id="textbox">'+result[i].content+'</span>';
		}
		html += '</div>';
	};
		chatRoom.innerHTML = html;
	}
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

function closePeople(){
	var modal = document.getElementById('peopleModal');
	if(modal.style.display == 'block'){
		modal.style.display = 'none';
	}
}

window.onclick = function(event){
	var modal = document.getElementById('peopleModal');
	if(event.target == modal){
		modal.style.display = 'none';
	}
}

function toggleNotification(chat_id) {
	var notiBtn = document.getElementById("notificationYn");
//	var chatListInfo = document.getElementById("chat" + chat_id);
	var chatListInfo = document.querySelector("[id='chat" + chat_id + "']");
	var chatListInfoNoti = chatListInfo.querySelectorAll(".notinoti")[0].innerText;
	var currentTxt = notiBtn.innerText.trim();
	console.log(currentTxt);
	console.log(chat_id);
	console.log(id);
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
			id: id.value,
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


var ws = null;
var url = null;
var nick = null;
var pageClose = true;

$(document).ready(function(){
	console.log("그룹 채팅 로딩중...");
	var id = document.getElementById('id').value;
	console.log(id);
	
	var url = location.href;
	var checkUrl = "ws:" + (url.substring(url.indexOf("//"), url.lastIndexOf("/") + 1)) + "chat.do";
	console.log(checkUrl);
	
	var ws = new WebSocket(checkUrl);
//	ws = new WebSocket("ws://192.168.8.30:8080/GreenLight/chat.do");
	console.log("생성된 웹소켓 객체", ws);
	
	ws.onopen = function(){
		console.log("웹소켓 오픈");
		ws.send("#$nick:" + id);
		console.log(id);
	}
	
	ws.onclose = function(){
		alert("서버와 연결이 종료되었습니다");
	}
	
	$("#buttonChat").click(function(){
		var message = $("#chatInput").val();
		if(message.trim() != ""){
			ws.send(message);
			$("#chatInput").val("");
		}
	});
	
	ws.onmessage = function(event) {
        var msg = event.data;
        console.log("서버로부터 전달된 메시지 : ", msg);
        if(msg.startWith("[나]")){
        	msg.substring(3);
        	$("#middleChat").append($("<div class='sendTxt'>").append($("<span class='send_img'>").text(msg))).append("<br><br>");
        } else {
        	$("#middleChat").append($("<div class='receiveTxt'>").append($("<span class='receive_img'>").text(msg))).append("<br><br>");
        }
    }
    
    $("#middleChat").scrollTop($("#middleChat")[0].scrollHeight);
});












