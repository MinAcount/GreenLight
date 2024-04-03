//알림
if (!("Notification" in window)) {
	alert("이 브라우저는 알림이 허용되지 않습니다");
} else {
	Notification.requestPermission(); //default, denied, granted
	console.log(Notification.permission);
}

//알림 보내기
export function notify(title, content, url) {
	if(Notification.permission == "default" ||Notification.permission == "denied"){
		alert("알림을 허용해주세요");
		Notification.requestPermission(); // default일때만 가능
		return;
	}else{
		console.log("알림이 허용되었습니다");
		let notification = new Notification(
			title, // 제목 
			{
			body: content, // 메세지
			icon: "./assets/img/logo_grn.png", // 아이콘
//			image: "./imgs/pdf.png", // 배경이미지
			requireInteraction: true, //닫기버튼 [닫기]를 누르기 전까지 사라지지 않음
			silent:true, //소리설정 (true:무음)
//			timestamp:new Date(),//데스크탑에 표현되지는 않지만 알림을 시간순으로 정리할 때 필요, 밀리초로 나옴
			}
		);
		console.log(notification.timestamp);
		
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