function insertDocument(){
	console.log("insertDocument()");
}

document.addEventListener("DOMContentLoaded", function(){
	var today = new Date();

	// 연도, 월, 일을 문자열로 변환하여 조합
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month + '-' + day;
	console.log(dateString)
	
	// input 요소의 value에 할당
	document.querySelector("#draft_date").value = dateString;
})

function radioActiveS(chk){
	console.log("radioActive()")
	console.log(chk);
	
//		console.log("input[name='start_day']");
		$("input[name='시작일']").prop("disabled", !chk);
}

function radioActiveE(chk){
	console.log("radioActive()")
	console.log(chk);
	
//		console.log("input[name='start_day']");
		$("input[name='종료일']").prop("disabled", !chk);
}