function readNoti(noti_id){
	let loginVoId = document.getElementById("loginVoId").value;
	
	fetch("./readNoti.do", {
		method:"POST",
		headers:{"content-type":"application/json"},
		body:JSON.stringify({
			id:loginVoId,
			noti_id:noti_id
		})
	})
	.then(data => data.json())
	.then(result => {
		console.log(result);
	});
}


function allReadNoti(){
	let id = document.getElementById("loginVoId").value;
	let bellOutIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell" style=" width: 20px; height: 20px;"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>';
	fetch("./allReadNoti.do", {
		method:"POST",
		body:id
	})
	.then(data => data.text())
	.then(result => {
		if(result == 'success'){
			let notiZone = document.getElementById("notiZone");
			let bellIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell me-2"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>';
			let notiHTML = "";
			notiZone.innerHTML="";
			notiHTML += '<h6 class="dropdown-header dropdown-notifications-header">'+bellIcon+'최근 알림</h6>';
			notiHTML += '<div class="dropdown-item dropdown-notifications-item"><div class="dropdown-notifications-item-content" style="font-size: 12px;">최근 알림이 없습니다</div></div>'
			notiZone.innerHTML = notiHTML;
			document.getElementById("navbarDropdownAlerts").innerHTML = bellOutIcon;
		}
	});
}

function openNoti(gubun, ntype, noti_id){
	console.log(gubun, ntype, noti_id);
	if(ntype == '03'){
		console.log('전자결재');
		location.href = './draftDetail.do?docno='+gubun;
	}else if(ntype == '02'){
		console.log('일정');
		location.href = './month.do';
	}else if(ntype == '04'){
		console.log('회의실예약');
		location.href = './reserveList.do';
	}
	readNoti(noti_id);
}