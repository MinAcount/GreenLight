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
			orderno:orderno[i]
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

	//      console.log("input[name='start_day']");
	$("input[name='시작일']").prop("disabled", !chk);
}

function radioActiveE(chk) {
	console.log("radioActive()")
	console.log(chk);

	//      console.log("input[name='start_day']");
	$("input[name='종료일']").prop("disabled", !chk);
}