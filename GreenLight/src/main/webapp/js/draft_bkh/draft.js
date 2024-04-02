//상신 유효성 검사
function submissionValidation(){
	console.log("submissionValidation()");
	
	//입력받는값
	//제목
	let title = document.querySelector("#title");
	console.log("title:",title.value);
	
	//기간 및 일시
	let daterangepicker = document.querySelector("#daterangepicker");
	console.log("daterangepicker:",daterangepicker.value);
	let daterpickers = daterangepicker.value.split("~");
	let start_day = daterpickers[0];
	console.log("start_day:",start_day)
	let end_day = daterpickers[1];
	console.log("end_day:",end_day);
//	document.querySelector("#start_day").value = start_day;
//	document.querySelector("#end_day").value = end_day;	

	//반차 여부
	
	//신청연차
	let getsu = document.querySelector("#getsu");
	console.log("getsu:",getsu.value);
	
	//긴급 여부
	let urgency = document.querySelector("#urgency").value;
	console.log("urgency:",urgency);
	
	//null체크
	if(title.value == ''){
		alert("제목을 입력하세요..");
		title.focus();
	} else if(document.querySelector("#start_day").value == '' || document.querySelector("#end_day").value){
		alert("기간 및 일시를 선택하세요..");
		daterangepicker.focus();
	}
}

//임시저장 유효성 검사
function temporaryValidation(){
	console.log("temporaryValidation()");
}

function insertDocument() {
	console.log("insertDocument()");
	// 결재순서 input 만들기
	var chkApprDiv = document.getElementById("chkAppr");
	var aprrows = chkApprDiv.querySelectorAll(".apr_row");
	aprrows.forEach(function(row, i) {
		var orderno = document.createElement("input");
		orderno.setAttribute("type", "hidden");
		orderno.setAttribute("name", "apr_no");
		orderno.setAttribute("value", i + 1);
		row.appendChild(orderno);
	})

	/*document table*/
	var writer_id = document.getElementById("writer_id").value;
	var templateArea = document.getElementById("templateArea");
	var content = templateArea.innerHTML;
	var title = document.getElementById("title").value;
	var draft_date = document.getElementById("draft_date").value;
	var urgencyChecked = document.getElementById("urgency");
	var urgency = urgencyChecked.checked ? 'Y' : 'N';
	var tempcode = document.getElementById("tempCode").value;
	console.log("writer_id:", writer_id);
	console.log("content:", content);
	console.log("title:", title);
	console.log("draft_date:", draft_date);
	console.log("urgency:", urgency);
	console.log("tempcode:", tempcode);

	/*vacation table*/
	/*var writer_id = document.getElementById("writer_id").value;*/
	var start_day = document.getElementById("start_day").value;
	var end_day = document.getElementById("end_day").value;
	var getsu = document.getElementById("getsu").value;

	console.log("start_day:", start_day);
	console.log("end_day:", end_day);
	console.log("getsu:", getsu);

	/*Approval table*/
	// 결재자 값 넘기기
	var emp_id = [];
	var orderno = [];
	var apprLine = [];
	var apr_chk_div = document.getElementById("apr_chk");
	var chkAppr_div = document.getElementById("chkAppr");

	//   console.log("apr_chk_div",apr_chk_div)
	var idInputs = apr_chk_div.querySelectorAll("[name='id']");
	var apprOrderInputs = chkAppr_div.querySelectorAll("[name=apr_no]");
	//   console.log("idInputs",idInputs)
	Array.from(idInputs).forEach(function(idInput) {
		emp_id.push(idInput.value)
	})
	//   console.log(emp_id);

	Array.from(apprOrderInputs).forEach(function(apprOrderInput) {
		//      console.log("------",apprOrderInput.value)
		orderno.push(apprOrderInput.value)
	})
	//   console.log("orderno",orderno)
	for (let i = 0; i < emp_id.length; i++) {
		let apprVo = ({
			writer_id: writer_id,
			emp_id: emp_id[i],
			atype: "01",
			orderno:orderno[i],
			appr_status:"01"
		})
		apprLine.push(apprVo);
	}

	// 참조자 값 넘기기
	var ref_emp_id = [];
	var refLine = [];
	var chkRef_div = document.getElementById("chkRef");
	var ids = chkRef_div.querySelectorAll("[name='id']");

	Array.from(ids).forEach(function(id) {
		ref_emp_id.push(id.value)
	})
	console.log("ref_emp_id", ref_emp_id);

	for (let i = 0; i < ref_emp_id.length; i++) {
		let refVo = ({
			writer_id: writer_id,
			emp_id: ref_emp_id[i],
			atype: "02"
		})
		refLine.push(refVo);
	}
	console.log(refLine);
	console.log(typeof refLine);

	// 작성자 값 넘기기
		var writerVo = {
			writer_id: writer_id,
			emp_id: writer_id,
			atype: "03"
		}
		console.log("writerVo",writerVo)

	/*filestorage table */
	var fileInput = document.getElementById("fileInput");
	var files = fileInput.files;

	var formData = new FormData();
	formData.append("writer_id", writer_id);
	formData.append("content", content);
	formData.append("title", title);
	formData.append("draft_date", draft_date);
	formData.append("urgency", urgency);
	formData.append("tempcode", tempcode);
	formData.append("start_day", start_day);
	formData.append("end_day", end_day);
	formData.append("getsu", getsu);
	formData.append("apprLine", JSON.stringify(apprLine));
	formData.append("refLine", JSON.stringify(refLine));
	formData.append("writerVo", JSON.stringify(writerVo));


	for (let i = 0; i < files.length; i++) {
		formData.append('files', files[i]);
		console.log("file:", files[i]);
	}

	/*fetch post*/
	fetch("./insertDocument.do", {
		method: 'POST',
		body: formData
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

function radioActiveS(chk) {
	console.log("radioActive()")
	console.log(chk);

	let start_day_halfs = document.getElementsByName("start_day_half");
	for(let i = 0; i < start_day_halfs.length; i++){
		start_day_halfs[i].disabled = !chk;
	}
}

function radioActiveE(chk) {
	console.log("radioActive()")
	console.log(chk);

	let end_day_halfs = document.getElementsByName("end_day_half");
	for(let i = 0; i < end_day_halfs.length; i++){
		end_day_halfs[i].disabled = !chk;
	}
}

var lastDetail;
function addExpenseDetail(){
	console.log("addExpenseDetail()")
	var expenseDetail = document.getElementById("expenseDetail");
	var tbody = expenseDetail.lastElementChild;
	var lastRow = tbody.lastElementChild;
	console.log("lastRow",lastRow)
	
	// 새로운 <tr> 생성
	var newRow = document.createElement("tr");
	newRow.setAttribute("class","details");

	var tbodyTrs = tbody.getElementsByTagName("tr");
	lastDetail = tbodyTrs[tbodyTrs.length-2];
	console.log("lastDetail",lastDetail)


	var amountInput = lastDetail.querySelector("[name='amount']");
	// input 요소에 input 이벤트 리스너를 추가
	amountInput.addEventListener("input", function(event) {
		// 입력된 값 가져오기
		var inputValue = event.target.value;

		// 입력된 값을 콘솔에 출력
		console.log("사용자 입력:", inputValue);
	});
	
	var detailsTr = document.getElementsByClassName("details");
	console.log("detailsTr",detailsTr)
	if (detailsTr.length < 10) {
		if (amountInput.value != '') {
			newRow.innerHTML = '<td class="pdl10 pdr10"></td>' +
				'<td class="pdl10 pdr10">' +
				'<select class="datatable-selector" name="deptno" id="deptno">' +
				'<option>물품구입비</option>' +
				'<option>잡비</option>' +
				'<option>회식비</option>' +
				'<option>식비</option>' +
				'<option>교통비</option>' +
				'<option>기타</option>' +
				'</select>' +
				'</td>' +
				'<td class="pdl10 pdr10"><input class="width100p height33px" type="text"></td>' +
				'<td class="pdl10 pdr10"><input name="amount" class="width100p height33px" type="text"></td>';
			// 마지막 <tr> 요소 앞에 새로운 <tr> 요소를 삽입
			tbody.insertBefore(newRow, lastRow);
		}
		else {
			console.log("값을 입력하세요")
		}
	}else{
		console.log("10개까지밖에 안돼용")
	}
}

function deleteExpenseDetail(){
	console.log(deleteExpenseDetail);
	lastDetail.remove();
}
