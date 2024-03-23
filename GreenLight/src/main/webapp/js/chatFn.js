//load 시 실행
window.onload=function(){
	doGetAllChat();
	console.log("실행됨");
}

var copyResult = {}; // 채팅방 목록 result 복사본

//채팅방 목록 API 호출
function doGetAllChat(){
			var id = document.getElementById('id').value;
			console.log("id",id);
			
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
			
//채팅방 목록 HTML 조립
function getAllChat(result){
	var chatList = document.getElementById('chatList');
	var html = '';
	
	copyResult = result;
	for(var i=0;i<result.length;i++){
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
		html += '<tr onclick="getViewInsideChat('+i+')">';
		html += '<td>'+result[i].gmvo.name+'</td>     ';
		html += '<td>'+result[i].send_date+'</td>          ';
		html += '</tr>                             ';
		html += '<tr onclick="getViewInsideChat('+i+')">';
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
	console.log(copyResult[idx].chat_id);
}