//상신 유효성 검사
function submissionValidation() {
	console.log("submissionValidation()");

	//입력받는값
	//제목
	//   let title = document.querySelector("#title");
	let title = document.querySelector("[name='title']");
	console.log("title:", title.value);

	//기간 및 일시
	let daterangepicker = document.querySelector("#daterangepicker");
	console.log("daterangepicker:", daterangepicker.value);
	let daterpickers = daterangepicker.value.split("~");
	let start_day = daterpickers[0];
	console.log("start_day:", start_day)
	let end_day = daterpickers[1];
	console.log("end_day:", end_day);
	//   document.querySelector("#start_day").value = start_day;
	//   document.querySelector("#end_day").value = end_day;   

	//반차 여부
	//체크된 radio 탐색 <-- start, end 별로 저장
	var start_day_half;
	var end_day_half;
	var start_day_halfs = document.querySelectorAll("input[name='start_day_half']:checked");
	var end_day_halfs = document.querySelectorAll("input[name='end_day_half']:checked");
	if (start_day_halfs.length > 0) {
		//radio의 부모의 자식중 checkbox탐색(radio가 체크되었다면 checkbox는 무조건 체크되어있음)
		for (let i = 0; i < start_day_halfs.length; i++) {
			let start_day_half_div = start_day_halfs[i].parentElement;
			let start_day_checked_checkbox = start_day_half_div.querySelector("input[id='start_day_half']:checked");
			if (start_day_checked_checkbox) {
				//체크된 checkbox와 radio의 value를 저장
				start_day_half = start_day_checked_checkbox.value + "-" + start_day_halfs[i].value;
			}
		}
	}
	console.log("start_day_half:", start_day_half);

	if (end_day_halfs.length > 0) {
		//radio의 부모의 자식중 checkbox탐색(radio가 체크되었다면 checkbox는 무조건 체크되어있음)
		for (let i = 0; i < end_day_halfs.length; i++) {
			let end_day_half_div = end_day_halfs[i].parentElement;
			let end_day_checked_checkbox = end_day_half_div.querySelector("input[id='end_day_half']:checked");
			if (end_day_checked_checkbox) {
				//체크된 checkbox와 radio의 value를 저장
				end_day_half = end_day_checked_checkbox.value + "-" + end_day_halfs[i].value;
			}
		}
	}
	console.log("end_day_half:", end_day_half);

	//신청연차
	let getsu = document.querySelector("#getsu");
	console.log("getsu:", getsu.textContent);

	//긴급 여부
	let urgency = document.querySelector("#urgency").value;
	console.log("urgency:", urgency);

	//null체크
	if (title.value == '') {
		alert("제목을 입력하세요..");
		title.focus();
	} else if (document.querySelector("#start_day").value == '' || document.querySelector("#end_day").value == '') {
		alert("기간 및 일시를 선택하세요..");
		daterangepicker.focus();
	}

	insertDocument();

}

//임시저장 유효성 검사
function temporaryValidation() {
	console.log("temporaryValidation()");
}

//기안서 상신을 위해 Controller에 넘겨줄 값 탐색
function insertDocument() {
	console.log("insertDocument()");

	//input들 value 값 저장하기
	var templateArea = document.getElementById("templateArea");
	var inputs = templateArea.querySelectorAll("input[type='text']");
	console.log("inputs", inputs)
	inputs.forEach(function(input) {
		console.log(input.value);
		var newPTag = document.createElement("P");
		input.parentElement.appendChild(newPTag);
		console.log("input", input.parentElement);
		if (input.value != null) {
			newPTag.textContent = input.value;
			console.log("newPTag", newPTag.textContent);
		}
		input.remove();
		//      input.setAttribute("value",input.value);
		//      input.setAttribute("readonly", "readonly");
	})

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
	var titleTd = document.getElementById("title");
	var titleP = titleTd.getElementsByTagName("p")[0];
	var title = titleP.textContent;
	var draft_date = document.getElementById("draft_date").textContent;
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
	var getsu = document.getElementById("getsu").textContent;

	console.log("start_day:", start_day);
	console.log("end_day:", end_day);
	console.log("getsu:", getsu);

	//기간 및 일시 태그 대체
	var dateRange = templateArea.querySelector("#dateRange");

	var newP = document.createElement("p");
	newP.textContent = start_day + " ~ " + end_day;
	console.log("newP", newP.textContent)

	dateRange.innerHTML = "";
	dateRange.appendChild(newP);



	content = templateArea.innerHTML;

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
			orderno: orderno[i],
			appr_status: "01"
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
	console.log("writerVo", writerVo)

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

	//알림
	notify('전자결재', title + " 문서가 상신되었습니다");
}

function radioActiveS(chk) {
	console.log("radioActive()")
	console.log(chk);

	let start_day_halfs = document.getElementsByName("start_day_half");
	for (let i = 0; i < start_day_halfs.length; i++) {
		start_day_halfs[i].disabled = !chk;
	}
}

function radioActiveE(chk) {
	console.log("radioActive()")
	console.log(chk);

	let end_day_halfs = document.getElementsByName("end_day_half");
	for (let i = 0; i < end_day_halfs.length; i++) {
		end_day_halfs[i].disabled = !chk;
	}
}

var lastDetail;
function addExpenseDetail() {
	console.log("addExpenseDetail()")
	var expenseDetail = document.getElementById("expenseDetail");
	var tbody = expenseDetail.lastElementChild;
	var lastRow = tbody.lastElementChild;
	console.log("lastRow", lastRow)

	// 새로운 <tr> 생성
	var newRow = document.createElement("tr");
	newRow.setAttribute("class", "details");

	var tbodyTrs = tbody.getElementsByTagName("tr");
	lastDetail = tbodyTrs[tbodyTrs.length - 2];
	console.log("lastDetail", lastDetail)


	var amountInput = lastDetail.querySelector("[name='amount']");
	// input 요소에 input 이벤트 리스너를 추가
	amountInput.addEventListener("input", function(event) {
		// 입력된 값 가져오기
		var inputValue = event.target.value;

		// 입력된 값을 콘솔에 출력
		console.log("사용자 입력:", inputValue);
	});

	var detailsTr = document.getElementsByClassName("details");
	console.log("detailsTr", detailsTr)
	if (detailsTr.length < 10) {
		if (amountInput.value != '') {
			newRow.innerHTML = '<td class="pdl10 pdr10">' +
				'<input class="width100p height33px" type="text">' +
				'</td>' +
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
	} else {
		console.log("10개까지밖에 안돼용")
	}
}

function deleteExpenseDetail() {
	console.log(deleteExpenseDetail);
	var expenseDetail = document.getElementById("expenseDetail");
	console.log("expenseDetail", expenseDetail);
	var tbody = expenseDetail.getElementsByTagName("tbody")[0];
	console.log("tbody", tbody);
	var tbodyTrs = tbody.querySelectorAll(".details");
	console.log("tbodyTrs", tbodyTrs);
	var delLastDetail = tbodyTrs[tbodyTrs.length - 1];
	console.log("delLastDetail", delLastDetail);

	if (tbodyTrs.length > 1) {
		delLastDetail.remove();
	}
}

async function rejectApproval(){
   var rejectApproval = document.getElementById("rejectApproval");
   console.log("rejectApproval",rejectApproval);
   var rejectCommentValue = rejectApproval.getElementsByClassName("comment")[0].value;
   console.log("rejectCommentValue",rejectCommentValue);
   
   var loginVo_id = document.getElementById("loginVo_id").value;
   console.log("loginVo_id",loginVo_id);
   
   var docno = document.getElementById("docno").value;
   console.log("docno",docno);
   
   
   var appr_status = "03";
   var doc_status = "03";
   
   
   var formData = new FormData();
   formData.append("comment", rejectCommentValue);
   formData.append("emp_id", loginVo_id);
   formData.append("docno",docno);
   formData.append("doc_status", doc_status);
   formData.append("appr_status", appr_status);
   
   /*fetch post*/
   try {
      const response1 = await fetch("./updateApproval.do", {
         method: 'POST',
         body: formData
      });

      if (!response1.ok) {
         throw new Error('네트워크 에러..');
      }

      const data1 = await response1.json();
      console.log('data1:', data1);

      var loginVo_name = document.getElementById("loginVo_name");
      var secondTr = document.getElementById("secondTr");
      var tds = secondTr.querySelectorAll("td");
      var thirdTr = document.getElementById("thirdTr");
      var tdss = thirdTr.querySelectorAll("td");
      tds.forEach(function(td, i) {
         console.log("td.textContent", td.textContent)
         console.log("loginVo_name", loginVo_name)
         if (td.textContent == loginVo_name.value) {
            var newImg = document.createElement("img");
            newImg.setAttribute("src", data1.save_sign);
            newImg.setAttribute("style", "width:50px");
            td.appendChild(newImg);
            var today = new Date();
            var year = today.getFullYear();
            var month = String(today.getMonth() + 1).padStart(2, '0');
            var day = String(today.getDate()).padStart(2, '0');

            var formattedDate = year + '-' + month + '-' + day;
            console.log(formattedDate);

            tdss[i].innerHTML = formattedDate;
            console.log("바뀌었어요")
         }

      })
      var content = document.getElementById("templateArea").innerHTML;
      console.log("content",content)
      formData.append("content", content);
      formData.append("docno", docno);

      const response2 = await fetch("./updateContent.do", {
         method: 'POST',
         body: formData
      });

      if (!response2.ok) {
         throw new Error('네트워크 에러..');
      }

      const data2 = await response2.json();
      console.log('data2:', data2);
   } catch (error) {
      console.error('오류 발생:', error);
   }
}

//알림
function notify(title, content, url) {
   if(Notification.permission == "default" ||Notification.permission == "denied"){
      alert("알림을 허용해주세요");
      Notification.requestPermission(); // default일때만 가능
      return;
   }else{
      let notification = new Notification(
         title, // 제목 
         {
         body: content, // 메세지
         icon: "./assets/img/grn.png", // 아이콘
         image: "./assets/img/logo_grn.png", // 배경이미지
         requireInteraction: true, //닫기버튼 [닫기]를 누르기 전까지 사라지지 않음
         silent:true, //소리설정 (true:무음)
         }
      );
      
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

async function approve(){
   var approve = document.getElementById("approve");
   console.log("approve",approve);
   var approveCommentValue = approve.getElementsByClassName("comment")[0].value;
   console.log("approveCommentValue",approveCommentValue);
   
   var loginVo_id = document.getElementById("loginVo_id").value;
   console.log("loginVo_id",loginVo_id);
   
   var docno = document.getElementById("docno").value;
   console.log("docno",docno);
   
   var appr_status = "02";
   var doc_status = "02";

	var writer_id = document.getElementById("writer_id").value;
	   console.log("writer_id",writer_id)
	   
	   var chkAppr = document.getElementById("chkAppr");
	   var ids = chkAppr.querySelectorAll("[name='id']");
	   var nextId;
	   ids.forEach(function(id){
		console.log(id)
		if(id.value == loginVo_id){
			var parent = id.parentElement;
			console.log("parent",parent);
			var orderno = parent.querySelector("[name='orderno']").value;
			console.log("orderno",orderno, typeof orderno);
			
			var nextOrderno = parseInt(orderno)+1;
			console.log("nextOrderno",nextOrderno, typeof nextOrderno);
			var ordernos = chkAppr.querySelectorAll("[name='orderno']");
			ordernos.forEach(function(orderno){
				if(nextOrderno == parseInt(orderno.value)){
					console.log("찾음")
					var oParent = orderno.parentElement;
					nextId = oParent.querySelector("[name='id']").value;
					console.log("nextId",nextId)
				}
			})
		}
	})
   var formData = new FormData();
   formData.append("comment", approveCommentValue);
   formData.append("emp_id", loginVo_id);
   formData.append("docno",docno);
   formData.append("doc_status", doc_status);
   formData.append("appr_status", appr_status);
   formData.append("nextId", nextId);
   formData.append("writer_id", writer_id);
   
   try {
      const response1 = await fetch("./updateApproval.do", {
         method: 'POST',
         body: formData
      });

      if (!response1.ok) {
         throw new Error('네트워크 에러..');
      }

      const data1 = await response1.json();
      console.log('data1:', data1);

      var loginVo_name = document.getElementById("loginVo_name");
      var secondTr = document.getElementById("secondTr");
      var tds = secondTr.querySelectorAll("td");
      var thirdTr = document.getElementById("thirdTr");
      var tdss = thirdTr.querySelectorAll("td");
      tds.forEach(function(td, i) {
         console.log("td.textContent", td.textContent)
         console.log("loginVo_name", loginVo_name)
         if (td.textContent == loginVo_name.value) {
            var newImg = document.createElement("img");
            newImg.setAttribute("src", data1.save_sign);
            newImg.setAttribute("style", "width:50px");
            td.appendChild(newImg);
            var today = new Date();
            var year = today.getFullYear();
            var month = String(today.getMonth() + 1).padStart(2, '0');
            var day = String(today.getDate()).padStart(2, '0');

            var formattedDate = year + '-' + month + '-' + day;
            console.log(formattedDate);

            tdss[i].innerHTML = formattedDate;
            console.log("바뀌었어요")
         }

      })
      var content = document.getElementById("templateArea").innerHTML;
      console.log("content",content)
      formData.append("content", content);
      formData.append("docno", docno);

      const response2 = await fetch("./updateContent.do", {
         method: 'POST',
         body: formData
      });

      if (!response2.ok) {
         throw new Error('네트워크 에러..');
      }
      

      const data2 = await response2.json();
      console.log('data2:', data2);
   } catch (error) {
      console.error('오류 발생:', error);
   }
}