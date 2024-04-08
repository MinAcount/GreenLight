$(function() {
	
	function hideLoginUser(){
		var loginId = document.getElementById("id").value;
		var loginNode = $("#chatTree").jstree("get_node", loginId);
		if(loginNode){
			$("#chatTree").jstree("hide_node", loginNode);
		}
	}
	
	$("#chatModal").on("shown.bs.modal", function(e){
		hideLoginUser();
	});
	
	
	// Reference Tree
	$('#chatTree').jstree({
		//types : 각 노드의 유형을 정의, search : 검색, dnd : 드래그 앤 드롭
		plugins: ['types', 'search', 'contextmenu'],
		// core : 핵심 기능을 구성하는 옵션(data, themes, animation, check_callback 등)
		core: {
			check_callback: true,
			data: {
				url: './apprJstreeView.do',
				method: 'get',
				dataType: 'json',
				success: function(data) {
					data.forEach(function(node) {
						if (node.spot != undefined) {
							if (node.spot === "01") {
								node.spot = "사원";
							} else if (node.spot === "02") {
								node.spot = "주임";
							} else if (node.spot === "03") {
								node.spot = "대리";
							} else if (node.spot === "04") {
								node.spot = "과장";
							} else if (node.spot === "05") {
								node.spot = "차장";
							} else if (node.spot === "06") {
								node.spot = "부장";
							} else if (node.spot === "07") {
								node.spot = "이사";
							}
							node.text = node.text + ' ' + node.spot;
						} else if (node.parent === "#") {
							node.state = { disabled: true };
						}
					});

				},
				error: function() {
					alert('데이터 전송 실패');
				}
			}
		},
	});

	


	// Add Reference Button Click
	$("#addPeople").on('click', function() {
		// Selected node id
		var sel = $("#chatTree").jstree('get_selected');
		console.log("sel----------", sel);
		selectedIds.push(sel);
		console.log(selectedIds);
		
		var selectedNode = $("#chatTree").jstree().get_node(sel);
		console.log(selectedNode);
		
		var selectedNodeText = $("#chatTree").jstree().get_node(sel).text;
		console.log(selectedNodeText);
		
		selectedNodeTextName.push(selectedNodeText);
		
		var children = $("#chatTree").jstree().get_children_dom(selectedNode);
		console.log(children, children.length);

		if (children.length > 0) {
			children.each(function() {
				var childNode = $("#chatTree").jstree().get_node($(this).attr('id'));
							console.log("childNode",childNode)
				var selText = $("#chatTree").jstree().get_text(childNode);
							console.log(selText)
				// Hide selected node
				$("#chatTree").jstree('hide_node', childNode);
				if (!selText) {
					return;
				}
				var htmlCode = $("#people_chk").html();
				htmlCode += "<div class='chat_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;'>" + selText +
					"<div name='delIcon' onclick='delChat(event)' style='margin-left:15px;'>" +
					"<svg style='pointer-events:none;' xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-trash-2' id='toastFeather'>" +
					"<polyline points='3 6 5 6 21 6'></polyline>" +
					"<path d='M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2'></path>" +
					"<line x1='10' y1='11' x2='10' y2='17'></line>" +
					"<line x1='14' y1='11' x2='14' y2='17'></line>" +
					"</svg>" +
					"</div>" +
					"<input type='hidden' name='id' value='" + sel + "'>" +
					"</div>" +
					"</div>";
				$("#people_chk").html(htmlCode);
				$("#chatTree").jstree('deselect_node', sel);
			})
		} else {
			// Hide selected node
			$("#chatTree").jstree('hide_node', sel);
			// Selected node text
			var selText = $("#chatTree").jstree().get_text(sel);
			if (!selText) {
				return;
			}
			var htmlCode = $("#people_chk").html();
			htmlCode += "<div class='chat_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;'>" + selText +
				"<div name='delIcon' onclick='delChat(event)' style='margin-left:15px;'>" +
				"<svg style='pointer-events:none;' xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-trash-2' id='toastFeather'>" +
				"<polyline points='3 6 5 6 21 6'></polyline>" +
				"<path d='M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2'></path>" +
				"<line x1='10' y1='11' x2='10' y2='17'></line>" +
				"<line x1='14' y1='11' x2='14' y2='17'></line>" +
				"</svg>" +
				"</div>" +
				"<input type='hidden' name='id' value='" + sel + "'>" +
				"</div>" +
				"</div>";
			$("#people_chk").html(htmlCode);
		}

		$("#chatTree").jstree('deselect_node', sel);
		deletedChat = [];
	});

	// 트리를 처음부터 열린 상태로 보여줌
	$('#chatTree').on('ready.jstree', function() {
		$(this).jstree('open_all');
	});

	var searchTimer3;
	// 참조자 서치
	$('#search_input2').keyup(function() {
		// 이전에 설정된 타이머가 있다면 클리어
		clearTimeout(searchTimer3);

		// 300 밀리초 후에 검색 수행
		searchTimer3 = setTimeout(function() {
			var v = $('#search_input2').val().trim();
			$('#chatTree').jstree(true).search(v);
		}, 300);
	});
});


var selectedIds = [];
var selectedNodeTextName = [];

//참조자 삭제
function delChat(event) {
	// 클릭된 span의 parent div
	var parentDiv = event.target.parentElement;
	console.log("parentDiv", parentDiv)

	var text = parentDiv.textContent;
	console.log("text", text)

	deletedChat.push(parentDiv);
	var index = selectedNodeTextName.indexOf(text);
	if(index != -1){
		selectedNodeTextName.splice(index,1);
	}
	// 삭제
	parentDiv.remove();

	var deletedNode = findTreeNodeByTextChat(text);
	console.log(deletedNode)
	$("#chatTree").jstree('show_node', deletedNode.id);

}

var deletedChat = [];

function findTreeNodeByTextChat(text) {

	var chatTree = $("#chatTree").jstree();

	//null : 첫 번째 매개변수는 가져올 노드의 ID, null을 사용하면 모든 노드를 가지고 오게 됨
	//flat : 모든 노드가 트리 구조를 유지하면서 하나의 배열에 포함 됨
	var allNodes = chatTree.get_json(null, { flat: true });
	for (var i = 0; i < allNodes.length; i++) {
		if (allNodes[i].text === text) {
			return allNodes[i];
		}
	}
	// 노드를 찾지 못한 경우
	return null;
}

// 초기화 버튼 기능
function cleanChat() {
	var jstree = $("#chatTree").jstree();
	console.log(jstree);
	var allNodes = jstree.get_json(null, { flat: true });
	console.log(allNodes);
	$("#people_chk").html("");
	//모든 노드 표시
	$("#chatTree").jstree('show_all');
	for (var i = 0; i < allNodes.length; i++) {
		var iNode = $("#chatTree").jstree().get_node(allNodes[i]);
		//모든 노드 enable
		$("#chatTree").jstree('enable_node', iNode);
	}
	
	deletedChat = [];
	selectedNodeTextName = [];
	selectedIds = [];
	hideLoginUser();
	console.log(deletedChat);
	console.log(selectedNodeTextName);
	
	function hideLoginUser(){
		var loginId = document.getElementById("id").value;
		var loginNode = $("#chatTree").jstree("get_node", loginId);
		if(loginNode){
			$("#chatTree").jstree("hide_node", loginNode);
		}
	}
}

var chkChat;


// 참조자 추가 완료버튼
function chatDone() {

    var chatName = document.getElementById("createChatName").value;
    console.log(selectedIds);
    
    var loginId = document.getElementById("id").value;
    console.log(loginId);
    
    var loginName = document.getElementById("name").value;
    var loginSpot = document.getElementById("spot").value;
    
    selectedIds.unshift(loginId);
    selectedNodeTextName.unshift(loginName + " " + loginSpot);
    console.log(selectedNodeTextName);
    
    if(chatName.trim() == ''){
    	alert("채팅방 이름은 필수값입니다. 다시 시도해주세요.")
    	return;
	}
    
    if(selectedIds.length == 1){
    	alert("최소 인원은 2명입니다.");
    	return;
    }
	    fetch("./insertChat.do", {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				id:selectedIds.join(','),
				roomname:chatName,
				groupno:'',
				name:selectedNodeTextName.join(',')
			})
		})
		.then(response => {
			if(!response.ok){
				throw new Error('Network response was not ok');
			}
			return response.text();
		})
		.then(data => {
			console.log("data : ", data);
		})
		.catch(error => {
			console.error("네트워크 오류:", error);
		});
}

// 참조자 확인 클릭
function getchatLine() {
	chkChat = document.getElementById("chkChat");
	chkChat.style.display = "block";
	var chkAppr = document.getElementById("chkAppr");
	chkAppr.style.display = "none";
}

// jstree 취소
function chatCancel() {
	var people_chk = document.getElementById("people_chk");
	var chat_rows = people_chk.querySelectorAll(".chat_row");
	console.log(chat_rows)
	chat_rows.forEach(function(chat_row) {
		if (chat_row.getAttribute("name") !== "chatDone") {
			var id = chat_row.querySelector("[name='id']").value;
			
			$("#chatTree").jstree().show_node(id);
			chat_row.remove();
		}

	})
	
	deletedChat.forEach(function(chat){
		people_chk.append(chat);
		console.log("chat",chat);
		var id = chat.querySelector("[name='id']").value;
		console.log("id",id)
		$("#chatTree").jstree().hide_node(id);
	})

	deletedChat = [];
	selectedNodeTextName = [];
	selectedIds = [];
}

async function selectComplete() {

	console.log("selectComplete()");
	var selectedNodes = $("#JTSelectTemplate").jstree("get_selected", true);
	if (selectedNodes.length > 0) {
		var tempno = selectedNodes[0].original.tempno;
		console.log(tempno);

		try {
			const response1 = await fetch("./selectMainTemplate.do?tempno=" + tempno);
			const data1 = await response1.json();
			//			console.log(data.content);
			var templateArea = document.getElementById("templateArea");
			templateArea.innerHTML = data1.content;
			
			var getsu = "";
			
			// dadtarangepicker를 위한 api를 적용
			$('#daterangepicker').daterangepicker({
				"locale": {
					"format": "YYYY-MM-DD",
					"separator": " ~ ",
					"applyLabel": "확인",
					"cancelLabel": "취소",
					"fromLabel": "From",
					"toLabel": "To",
					"customRangeLabel": "Custom",
					"weekLabel": "W",
					"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
					"monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				},
				"startDate": new Date(),
				"endDate": new Date(),
				"drops": "down"
			}, function(start, end, label) {
				$('#start_day').val(start.format('YYYY-MM-DD'));
				$('#end_day').val(end.format('YYYY-MM-DD'));
				console.log("============================================================== typeof start:", typeof start);
				console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');

				var start_date = new Date(start);
				var end_date = new Date(end);

				var getsu_date = end_date.getTime() - start_date.getTime();
				getsu = Math.floor(getsu_date / (1000 * 60 * 60 * 24)) + 1;
				console.log("getsu:", getsu);
				document.getElementById("getsu").textContent = getsu;
			});
			
			document.getElementById("apr_chk").innerHTML = "";
			//			console.log("tempcode:",data1.tempcode)
			document.getElementById("tempCode").value = data1.tempcode;

			// input hidden 태그에 뿌려줄 값 조회
			var loginVo_name = document.getElementById("loginVo_name").value;
			var deptVo_dname = document.getElementById("deptVo_dname").value;
			var loginVo_id = document.getElementById("loginVo_id").value;
			var loginVo_spot = document.getElementById("loginVo_spot").value;
			console.log("loginVo_name:", loginVo_name);
			console.log("deptVo_dname:", deptVo_dname);
			console.log("loginVo_id:", loginVo_id);
			console.log("loginVo_spot:", loginVo_spot);

			// 값이 뿌려질 input hidden 태그 탐색
			var name = document.getElementById("name");
			var dname = document.getElementById("dname");
			var writer_id = document.getElementById("writer_id");
			console.log("name:", name);
			console.log("dname:", dname);
			console.log("writer_id:", writer_id);

			name.textContent = loginVo_name;
			dname.textContent = deptVo_dname;
			writer_id.textContent = loginVo_id;

			// 기안 뿌리기
			var today = new Date();

			// 연도, 월, 일을 문자열로 변환하여 조합
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = year + '-' + month + '-' + day;
			console.log(dateString)

			// input 요소의 value에 할당
			document.querySelector("#draft_date").textContent = dateString;
			
			// 기안란 직위, 이름, 기안일 textContent
			document.querySelector("#drafter_spot").textContent = loginVo_spot;
			document.querySelector("#drafter_name").textContent = loginVo_name;
			document.querySelector("#drafter_draft_date").textContent = dateString;

			// 공가 선택시 신청연차 초기화
			document.querySelector("#getsuFlag").addEventListener("change", function() {
				console.log("getsuFlag()");
				console.log("this.value:", this.value);
				if (this.value == 'Y') {//공가
					console.log("공가선택")
					document.getElementById("getsu").textContent = '0';
				} else {
					console.log("연차선택")
					document.getElementById("getsu").textContent = getsu;
				}
			});

//			// dadtarangepicker를 위한 api를 적용
//			$('#daterangepicker').daterangepicker({
//				"locale": {
//					"format": "YYYY-MM-DD",
//					"separator": " ~ ",
//					"applyLabel": "확인",
//					"cancelLabel": "취소",
//					"fromLabel": "From",
//					"toLabel": "To",
//					"customRangeLabel": "Custom",
//					"weekLabel": "W",
//					"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
//					"monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
//				},
//				"startDate": new Date(),
//				"endDate": new Date(),
//				"drops": "down"
//			}, function(start, end, label) {
//				$('#start_day').val(start.format('YYYY-MM-DD'));
//				$('#end_day').val(end.format('YYYY-MM-DD'));
//				console.log("============================================================== typeof start:", typeof start);
//				console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
//
//				var start_date = new Date(start);
//				var end_date = new Date(end);
//
//				var getsu_date = end_date.getTime() - start_date.getTime();
//				var getsu = Math.floor(getsu_date / (1000 * 60 * 60 * 24));
//				console.log("getsu:", getsu);
//				document.getElementById("getsu").textContent = getsu;
//			});

		} catch (error) {
			console.log("Error..", error);
		}
	}

	// 로그인 세션 아이디
	var sessionId = document.getElementById("loginVo_id").value;
	//    console.log("sessionId",sessionId, typeof sessionId);
	try {

		const response2 = await fetch("./autoAppr.do?sessionId=" + sessionId + "&tempcode=" + document.getElementById("tempCode").value);
		const data2 = await response2.json();
		console.log("data2", data2);
		console.log("tempCode", document.getElementById("tempCode").value)
		
		var autoApprHtml = $("#apr_chk").html();
		
		console.log("--------------------------")
		var ids = new Array();
		ids.push(data2[0].empVo[0].id)
		autoApprHtml += "<div class='apr_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;' name='aprDone'>" + data2[0].empVo[0].name + " " + data2[0].comVo.code_name +
				"<input type='hidden' class='autoAppr' name='id' value='" + data2[0].empVo[0].id + "'>" +
				"</div>";
				
		$("#apprJstree").jstree().hide_node(data2[0].empVo[0].id);
		
		data2.forEach(function(list){
			console.log("data2 foreach")
			ids.forEach(function(id){
				console.log("ids", ids)
				if (list.empVo[0].id != id || id == null) {
					console.log("list.empVo.id", list.empVo[0].id)
					ids.push(list.empVo[0].id);
					autoApprHtml += "<div class='apr_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;' name='aprDone'>" + list.empVo[0].name + " " + list.comVo.code_name +
						"<input type='hidden' class='autoAppr' name='id' value='" + list.empVo[0].id + "'>" +
						"</div>";
					$("#apprJstree").jstree().hide_node(list.empVo[0].id);
				}
			})
		})
		$("#apr_chk").html(autoApprHtml);
		
//		for (let i = 0; i < data2.length; i++) {
//			var code_name = data2[i].comVo.code_name;
//			var id = data2[i].empVo[0].id;
//			var name = data2[i].empVo[0].name;
//
//
//			var list = { code_name: code_name, id: id, name: name };
//			set.add(list);
//		}
//		console.log("set", set);
//
//
//		set.forEach(function(obj) {
//			var code_name = obj.code_name;
//			var id = obj.id;
//			var name = obj.name;
//			
//		})

		//			for (let j = i + 1; j < data2.length; j++) {
		//				console.log(id)
		//				console.log(data2[i].empVo[0].id)
		//				console.log(data2[j].empVo[0].id)
		//				if (id[i] === data2[j].empVo[0].id) {
		//					console.log("똑같은 id"[i], data2[j].empVo[0].id);
		//
		//					var apr_chk_div = document.getElementById("apr_chk");
		//					var autoApprInputs = apr_chk_div.querySelectorAll(".autoAppr");
		//					console.log("autoApprInputs", autoApprInputs);
		//
		////					autoApprInputs.forEach(function(autoApprInput) {
		////						console.log(autoApprInput.value);
		////						if (autoApprInput.value === id) {
		////							remove(autoApprInput);
		////						}
		////					})
		//				}
		//
		//			}

		var apprLine = document.getElementById("apr_chk");
		var apr_rows = apprLine.querySelectorAll(".apr_row");

		//					apr_rows.forEach(function(row, i) {
		//						var apprOrder = document.createElement("input");
		//						apprOrder.setAttribute("type", "hidden");
		//						apprOrder.setAttribute("name", "apr_no");
		//						apprOrder.setAttribute("value", i + 1);
		//						row.appendChild(apprOrder);
		//					});

		var chkAppr = document.getElementById("chkAppr");
		var chkApprClone1 = apprLine.cloneNode(true);
		var apprCloneList = Array.from(chkApprClone1.querySelectorAll(".apr_row"));

		while (chkAppr.firstChild) {
			chkAppr.firstChild.remove();
		}

		apprCloneList.forEach(function(item) {
			chkAppr.appendChild(item);
		});

		chkAppr.style.display = "block";
		var chkChat = document.getElementById("chkChat");
		chkChat.style.display = "none";

		var referenceLi = document.getElementById("getReference");
		referenceLi.classList.remove("active");

		var approvalLi = document.getElementById("getApproval");
		approvalLi.classList.add("active");

		var apr_row_text = [];

		apr_rows.forEach(function(row) {
			apr_row_text.push(row.textContent);
		});

		console.log("apr_row_text", apr_row_text);

		var firstTr = document.getElementById("firstTr");
		var secondTr = document.getElementById("secondTr");
		var thirdTr = document.getElementById("thirdTr");
		var apprTh = document.getElementById("apprTh");

		for (let i = 0; i < apr_rows.length; i++) {
			var str = apr_row_text[i];
			var index = str.indexOf(' ');
			var name = str.substring(0, index);
			var spot = str.substring(index + 1);
			console.log(name);
			console.log(spot);

			var newTd1 = document.createElement('td');
			var newTd2 = document.createElement('td');
			var newTd3 = document.createElement('td');

			firstTr.appendChild(newTd1);
			newTd1.setAttribute('style', 'width: 90px; height: 20px;');
			newTd1.setAttribute('class', 'fontSize14');
			newTd1.textContent = spot;

			secondTr.appendChild(newTd2);
			newTd2.setAttribute('class', 'fontSize14');
			newTd2.textContent = name;

			thirdTr.appendChild(newTd3);
			newTd3.setAttribute('style', 'height: 20px;');
			newTd3.setAttribute('class', 'fontSize14');
		}
		apprTh.style.display = "";

		// 출력
		

	} catch (error) {
		console.log("Error..", error);
	}

}
