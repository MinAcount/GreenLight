function insertDocument(){
	console.log("insertDocument()");
	
	/*document table*/
	var writer_id = document.getElementById("writer_id").value;
	var templateArea = document.getElementById("templateArea");
	var content = templateArea.innerHTML;
	var title = document.getElementById("title").value;
	var draft_date = document.getElementById("draft_date").value;
	var urgencyChecked = document.getElementById("urgency");
	var urgency = urgencyChecked.checked?'Y':'N';
	var tempcode = document.getElementById("tempcode").value;
	console.log("writer_id:",writer_id);
	console.log("content:",content);
	console.log("title:",title);
	console.log("draft_date:",draft_date);
	console.log("urgency:",urgency);
	console.log("tempcode:",tempcode);
	
	/*vacation table*/
	/*var writer_id = document.getElementById("writer_id").value;*/
	var start_day = document.getElementById("start_day").value;
	var end_day = document.getElementById("end_day").value;
	var getsu = document.getElementById("getsu").value;
	
	console.log("start_day:",start_day);
	console.log("end_day:",end_day);
	console.log("getsu:",getsu);
	
	/*Approval table*/
	
	
	/*fetch post*/
	fetch("./insertDocument.do", {
	    method: 'POST',
	    headers:{'Content-Type': 'application/json'},
	    body: JSON.stringify({
			writer_id:writer_id,
			content:content,
			title:title,
			draft_date:draft_date,
			urgency:urgency,
			tempcode:tempcode,
			start_day:start_day,
			end_day:end_day,
			getsu:getsu
		})
	    
	})
	.then(response => {
	    if (!response.ok) {
	        throw new Error('네트워크 에러..');
	    }
	    return response.json();
	})
	.then(data => {
	    console.log('data:', data);
	})
	.catch(error => {
	    console.error('오류 발생:', error);
	});
	
}

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