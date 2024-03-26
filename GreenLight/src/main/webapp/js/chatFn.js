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
		html += '<tr>                              ';
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
		html += '<tr onclick="getViewInsideChat('+result[i].chat_id+')">';
		html += '<td>'+result[i].content+'</td>            ';
		html += '<td>'+result[i].gmvo.noti+'</td>     ';
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



