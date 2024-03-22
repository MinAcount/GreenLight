window.onload=function(){
	doGetAllChat();
	console.log("실행됨");
}

function doGetAllChat(){
			var id = document.getElementById('id').value;
			console.log("id",id)
			
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
				console.log("111111111");
				console.log("result:",result);
				if(result != null){
					getAllChat(result)
				}else{
					alert('실패..')
				}
			});

function getAllChat(result){
	var chatList = document.getElementById('chatList');
	var html = '';
	
result.forEach(function(item){	
		html += '<table class="table-container">   ';
		html += '<thead>                           ';
		html += '<tr>                              ';
		html += '<td>'+item.gmvo.favor+'</td>    ';
		html += '</tr>                             ';
		html += '<tr onclick="getViewInsideChat()">';
		html += '<td>'+item.gmvo.name+'</td>     ';
		html += '<td>'+item.send_date+'</td>          ';
		html += '</tr>                             ';
		html += '<tr onclick="getViewInsideChat()">';
		html += '<td>'+item.content+'</td>            ';
		html += '<td>'+item.gmvo.noti+'</td>     ';
		html += '</tr>                             ';
		html += '</thead>                          ';
		html += '</table>                          ';
	});
	chatList.innerHTML = html;
	}
}	





function getViewInsideChat(){
	//채팅방 목록에서 채팅방 클릭 시 
}