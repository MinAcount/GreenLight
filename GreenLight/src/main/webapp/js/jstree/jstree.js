$(function() {
	var selectTemplateModal = document.querySelector("#selectTemplateModal");

	selectTemplateModal.addEventListener("click", function() {
		console.log("selectTemplateModal()");

		$("#JTSelectTemplate").jstree({
			plugins: ['types', 'search'],
			core: {
				check_callback: true,
				data: {
					url: './JTSelectTemplate.do',
					method: 'get',
					dataType: 'json',
					success: function(data) {
						console.log(data);
						data.forEach(function(node) {
							node.text
						});
					},
					error: function() {
						alert("Error..")
					}
				}
			},

		});

		$("#JTSelectTemplate").on("ready.jstree", function() {
			$(this).jstree('open_all');
		});
	});





	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

	// Reference Tree
	$('#refJstree').jstree({
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




	//apprJstree
	$("#apr_chk").sortable({
	});

	$('#apprJstree').jstree({
		//types : 각 노드의 유형을 정의, search : 검색, dnd : 드래그 앤 드롭
		plugins: ['types', 'search'],
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
						} else {
							node.state = { disabled: true };
						}
					});
				},
				error: function() {
					alert('데이터 전송 실패');
				}
			}
		}
	});

	// Add Reference Button Click
	$("#addRef").on('click', function() {
		// Selected node id
		var sel = $("#refJstree").jstree('get_selected');
		console.log("sel----------", sel)
		var selectedNode = $("#refJstree").jstree().get_node(sel);
				console.log(selectedNode)
		var children = $("#refJstree").jstree().get_children_dom(selectedNode);
				console.log(children, children.length)

		if (children.length > 0) {
			children.each(function() {
				var childNode = $("#refJstree").jstree().get_node($(this).attr('id'));
							console.log("childNode",childNode)
				var selText = $("#refJstree").jstree().get_text(childNode);
							console.log(selText)
				// Hide selected node
				$("#refJstree").jstree('hide_node', childNode);
				if (!selText) {
					return;
				}
				var htmlCode = $("#ref_chk").html();
				htmlCode += "<div class='ref_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;'>" + selText +
					"<div name='delIcon' onclick='delRef(event)' style='margin-left:15px;'>" +
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
				$("#ref_chk").html(htmlCode);
				$("#refJstree").jstree('deselect_node', sel);
			})
		} else {
			// Hide selected node
			$("#refJstree").jstree('hide_node', sel);
			// Selected node text
			var selText = $("#refJstree").jstree().get_text(sel);
			if (!selText) {
				return;
			}
			var htmlCode = $("#ref_chk").html();
			htmlCode += "<div class='ref_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;'>" + selText +
				"<div name='delIcon' onclick='delRef(event)' style='margin-left:15px;'>" +
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
			$("#ref_chk").html(htmlCode);
		}


		$("#refJstree").jstree('deselect_node', sel);
		deletedRef = [];
	});


	// Add Employee Button Click
	$("#addEmp").on('click', function() {
		var sel = $("#apprJstree").jstree('get_selected');
		var apr_chk = document.getElementById("apr_chk");
		var apr_row = apr_chk.querySelectorAll(".apr_row");
		var autoAppr = apr_chk.querySelectorAll(".autoAppr");
		var autoAppr_length = autoAppr.length;
		console.log("autoAppr_length",autoAppr_length)
		var apr_row_length = apr_row.length;
		var added_length = apr_row_length-autoAppr_length;
		console.log("autoAppr_length",autoAppr_length)
		if (added_length>3-autoAppr_length) {
			console.log("결재자는 최대 4명까지만 설정가능합니다");
			return;
		}
		$("#apprJstree").jstree('hide_node', sel);
		var selText = $("#apprJstree").jstree().get_text(sel);
		if (!selText) {
			return;
		}
		var htmlCode = $("#apr_chk").html();
		htmlCode += "<div class='apr_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;'>" + selText +
			"<div name='delIcon' onclick='del(event)' style='margin-left:15px;'>" +
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
		$("#apr_chk").html(htmlCode);
		$("#apprJstree").jstree('deselect_node', sel);


	
		deletedAppr = [];
	});


	// 트리를 처음부터 열린 상태로 보여줌
	$('#apprJstree').on('ready.jstree', function() {
		$(this).jstree('open_all');
	});




	// 트리를 처음부터 열린 상태로 보여줌
	$('#refJstree').on('ready.jstree', function() {
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
			$('#refJstree').jstree(true).search(v);
		}, 300);
	});


	var searchTimer;
	// 결재자 서치
	$('#search_input').keyup(function() {
		// 이전에 설정된 타이머가 있다면 클리어
		clearTimeout(searchTimer);

		// 300 밀리초 후에 검색 수행
		searchTimer = setTimeout(function() {
			var v = $('#search_input').val().trim();
			$('#apprJstree').jstree(true).search(v);
		}, 300);
	});


	var searchTimer2;
	//문서양식 서치
	$('#search').on('keyup', function() {
		// 이전에 설정된 타이머가 있다면 클리어
		clearTimeout(searchTimer2);

		// 300 밀리초 후에 검색 수행
		searchTimer2 = setTimeout(function() {
			var v = $('#search').val().trim();
			$('#JTSelectTemplate').jstree(true).search(v);
		}, 300);
	});

});

///////이혜원 작업시작 
//참조자 삭제
function delRef(event) {
	// 클릭된 span의 parent div
	var parentDiv = event.target.parentElement;
	console.log("parentDiv", parentDiv)

	var text = parentDiv.textContent;
	console.log("text", text)

	deletedRef.push(parentDiv);
	
	// 삭제
	parentDiv.remove();

	var deletedNode = findTreeNodeByText2(text);
	console.log(deletedNode)
	$("#refJstree").jstree('show_node', deletedNode.id);


}

var deletedAppr = [];
var deletedRef = [];
// 결재자 삭제
function del(event) {
	// 클릭된 span의 parent div
	var parentDiv = event.target.parentElement;
	console.log("parentDiv", parentDiv)

	var text = parentDiv.textContent;
	console.log("text", text)
	
	deletedAppr.push(parentDiv);
	// 삭제
	parentDiv.remove();

	var deletedNode = findTreeNodeByText2(text);
	console.log(deletedNode)
	$("#apprJstree").jstree('show_node', deletedNode.id);
	
}





function findTreeNodeByText2(text) {

	var refJstree = $("#refJstree").jstree();

	//null : 첫 번째 매개변수는 가져올 노드의 ID, null을 사용하면 모든 노드를 가지고 오게 됨
	//flat : 모든 노드가 트리 구조를 유지하면서 하나의 배열에 포함 됨
	var allNodes = refJstree.get_json(null, { flat: true });
	for (var i = 0; i < allNodes.length; i++) {
		if (allNodes[i].text === text) {
			return allNodes[i];
		}
	}
	// 노드를 찾지 못한 경우
	return null;
}



function findTreeNodeByText(text) {

	var apprJstree = $("#apprJstree").jstree();

	//null : 첫 번째 매개변수는 가져올 노드의 ID, null을 사용하면 모든 노드를 가지고 오게 됨
	//flat : 모든 노드가 트리 구조를 유지하면서 하나의 배열에 포함 됨
	var allNodes = apprJstree.get_json(null, { flat: true });
	for (var i = 0; i < allNodes.length; i++) {
		if (allNodes[i].text === text) {
			return allNodes[i];
		}
	}
	// 노드를 찾지 못한 경우
	return null;
}





// 초기화 버튼 기능
function cleanRef() {
	var jstree = $("#refJstree").jstree();
	var allNodes = jstree.get_json(null, { flat: true });
	$("#ref_chk").html("");
	//모든 노드 표시
	$("#refJstree").jstree('show_all');
	for (var i = 0; i < allNodes.length; i++) {
		var iNode = $("#refJstree").jstree().get_node(allNodes[i]);
		//모든 노드 enable
		$("#refJstree").jstree('enable_node', iNode);
	}
	
	deletedRef = [];
}

var children_apr_row;
var parent_apr_row;
// 초기화 버튼 기능
function clean() {
	parent_apr_row = document.getElementsByClassName("apr_row");
	
	//	console.log(parent_apr_row,parent_apr_row.length)
	var parent_apr_row_clone = Array.from(parent_apr_row);
	for (let i = 0; i < parent_apr_row.length; i++) {
		children_apr_row = parent_apr_row_clone[i].querySelector("[name='delIcon']");
		if (children_apr_row) {
			deletedAppr.push(parent_apr_row_clone[i]);
			parent_apr_row_clone[i].remove();
			//			console.log("parent_apr_row_clone",parent_apr_row_clone[i])
			var enable_id = parent_apr_row_clone[i].querySelector("[name='id']").value;
			console.log("enable_id", enable_id)
			$("#apprJstree").jstree().show_node(enable_id);
		}
	}
	
	console.log("cleanAppr",cleanAppr);
	deletedAppr = [];
}





var chkAppr;
// 결재자 설정 완료 버튼
function apprDone() {
	chkAppr = document.getElementById("chkAppr");
	chkAppr.innerHTML = "";

	var apprLineOriginal = document.getElementById("apr_chk")
	var apprLine = apprLineOriginal.cloneNode(true)
	console.log("apprLine", apprLine)
	var delIcon = apprLine.querySelectorAll('[name="delIcon"]');
	console.log(delIcon)
	delIcon.forEach(function(icon) {
		icon.remove();
	});


	


	console.log("last_apprLine", apprLine)

	chkAppr = document.getElementById("chkAppr");
	var chkApprClone1 = apprLine.cloneNode(true)

	var apprCloneList = Array.from(chkApprClone1.querySelectorAll(".apr_row"));

	while (chkAppr.firstChild) {
		chkAppr.firstChild.remove();
	}

	apprCloneList.forEach(function(item) {
		chkAppr.appendChild(item)
	})

	chkAppr.style.display = "block";
	var chkRef = document.getElementById("chkRef");
	chkRef.style.display = "none";

	var referenceLi = document.getElementById("getReference");
	referenceLi.classList.remove("active");

	var approvalLi = document.getElementById("getApproval");
	approvalLi.classList.add("active");

	var apr_row_text = [];

	var apr_rows = chkAppr.querySelectorAll(".apr_row")
	apr_rows.forEach(function(row) {
		apr_row_text.push(row.textContent);
	})
	console.log("apr_row_text", apr_row_text)





	var firstTr = document.getElementById("firstTr");
	var secondTr = document.getElementById("secondTr");
	var thirdTr = document.getElementById("thirdTr");
	var apprTh = document.getElementById("apprTh");


	var tds = firstTr.querySelectorAll("td");
	tds.forEach(function(td) {
		firstTr.removeChild(td);
	});

	while (secondTr.firstChild) {
		secondTr.removeChild(secondTr.firstChild);
	}

	while (thirdTr.firstChild) {
		thirdTr.removeChild(thirdTr.firstChild);
	}


	for (var i = 0; i < apr_rows.length; i++) {
		var str = apr_row_text[i];
		var index = str.indexOf(' ');
		var name = str.substring(0, index);
		var spot = str.substring(index + 1);
		console.log(name)
		console.log(spot)

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
	
	
	var apr_chk_apr_rows = apprLineOriginal.querySelectorAll(".apr_row");
	apr_chk_apr_rows.forEach(function(apr_chk_apr_row){
		apr_chk_apr_row.setAttribute('name', 'aprDone');
	})
	
}


var chkRef;
// 참조자 추가 완료버튼
function refDone() {


	var refLineOriginal = document.getElementById("ref_chk")
	var refLine = refLineOriginal.cloneNode(true)
	console.log(refLine)
	var delIcon = refLine.querySelectorAll('[name="delIcon"]');
	console.log(delIcon)
	delIcon.forEach(function(icon) {
		icon.remove();
	});



	console.log("last_refLine", refLine)



	var chkRefClone1 = refLine.cloneNode(true)

	var refCloneList = Array.from(chkRefClone1.querySelectorAll(".ref_row"));

	chkRef = document.getElementById("chkRef");

	while (chkRef.firstChild) {
		chkRef.firstChild.remove();
	}

	refCloneList.forEach(function(item) {
		chkRef.appendChild(item)
	})

	console.log("chkRef", chkRef)

	chkRef.style.display = "block";
	chkAppr = document.getElementById("chkAppr");
	chkAppr.style.display = "none";


	var referenceLi = document.getElementById("getReference");
	referenceLi.classList.add("active");

	var approvalLi = document.getElementById("getApproval");
	approvalLi.classList.remove("active");

	var chkRef = document.getElementById("chkRef");
	var ref_rows = chkRef.querySelectorAll(".ref_row");
	var ref_id = [];
	ref_rows.forEach(function(ref_row) {
		var ref_find_node = findTreeNodeByText2(ref_row.textContent);
		//		console.log("ref_find_node-------------", ref_find_node.id);
		ref_id.push(ref_find_node.id);
	})
	console.log(ref_id)




	// 결재순서 담은 input태그 추가
	var apr_rows = document.getElementById("apr_chk").querySelectorAll(".apr_row");

	apr_rows.forEach(function(row, i) {
		var apprOrder = document.createElement("input");
		apprOrder.setAttribute("type", "hidden");
		apprOrder.setAttribute("name", "apr_no");
		apprOrder.setAttribute("value", i + 1);
		row.appendChild(apprOrder);

	})
	
	var ref_chk_apr_rows = document.getElementById("ref_chk").querySelectorAll(".ref_row");
	console.log("ref_chk_apr_rows",ref_chk_apr_rows)
	ref_chk_apr_rows.forEach(function(ref_chk_apr_row){
		ref_chk_apr_row.setAttribute('name', 'refDone');
	})
	
	
	
}




// 참조자 확인 클릭
function getRefLine() {
	chkRef = document.getElementById("chkRef");
	chkRef.style.display = "block";
	var chkAppr = document.getElementById("chkAppr");
	chkAppr.style.display = "none";
}

// 결재자 확인 클릭
function getApprLine() {
	document.getElementById("chkAppr").style.display = "block";
	var chkRef = document.getElementById("chkRef");
	chkRef.style.display = "none";
}


function apprCancel() {
	var apr_chk = document.getElementById("apr_chk");
	var apr_rows = apr_chk.querySelectorAll(".apr_row");
	apr_rows.forEach(function(apr_row) {
		if (apr_row.getAttribute("name") !== "aprDone") {
			var id = apr_row.querySelector("[name='id']").value;
			$("#apprJstree").jstree().show_node(id);
			apr_row.remove();
		}

	})
	
	deletedAppr.forEach(function(appr){
		apr_chk.append(appr);
		console.log("appr",appr);
		var id = appr.querySelector("[name='id']").value;
		console.log("id",id)
		$("#apprJstree").jstree().hide_node(id);
	})

	deletedAppr = [];
}


function refCancel() {
	var ref_chk = document.getElementById("ref_chk");
	var ref_rows = ref_chk.querySelectorAll(".ref_row");
	console.log(ref_rows)
	ref_rows.forEach(function(ref_row) {
		if (ref_row.getAttribute("name") !== "refDone") {
			var id = ref_row.querySelector("[name='id']").value;
			
			$("#refJstree").jstree().show_node(id);
			ref_row.remove();
		}

	})
	
	deletedRef.forEach(function(ref){
		ref_chk.append(ref);
		console.log("ref",ref);
		var id = ref.querySelector("[name='id']").value;
		console.log("id",id)
		$("#refJstree").jstree().hide_node(id);
	})

	deletedRef = [];
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
			document.getElementById("apr_chk").innerHTML = "";
			//			console.log("tempcode:",data1.tempcode)
			document.getElementById("tempCode").value = data1.tempcode;

			// input hidden 태그에 뿌려줄 값 조회
			var loginVo_name = document.getElementById("loginVo_name").value;
			var deptVo_dname = document.getElementById("deptVo_dname").value;
			var loginVo_id = document.getElementById("loginVo_id").value;
			console.log("loginVo_name:", loginVo_name);
			console.log("deptVo_dname:", deptVo_dname);
			console.log("loginVo_id:", loginVo_id);

			// 값이 뿌려질 input hidden 태그 탐색
			var name = document.getElementById("name");
			var dname = document.getElementById("dname");
			var writer_id = document.getElementById("writer_id");
			console.log("name:", name);
			console.log("dname:", dname);
			console.log("writer_id:", writer_id);

			name.value = loginVo_name;
			dname.value = deptVo_dname;
			writer_id.value = loginVo_id;

			// 기안 뿌리기
			var today = new Date();

			// 연도, 월, 일을 문자열로 변환하여 조합
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = year + '-' + month + '-' + day;
			console.log(dateString)

			// input 요소의 value에 할당
			document.querySelector("#draft_date").value = dateString;

			// 공가 선택시 신청연차 초기화
			document.querySelector("#getsuFlag").addEventListener("change", function() {
				console.log("getsuFlag()");
				console.log("this.value:", this.value);
				if (this.value == 'Y') {//공가
					document.getElementById("getsu").value = "";
				}
			});

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
				var getsu = Math.floor(getsu_date / (1000 * 60 * 60 * 24));
				console.log("getsu:", getsu);
				document.getElementById("getsu").value = getsu;
			});


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
		var chkRef = document.getElementById("chkRef");
		chkRef.style.display = "none";

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
