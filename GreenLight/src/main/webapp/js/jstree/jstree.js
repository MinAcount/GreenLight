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
				console.log("childNode", childNode)
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
					"<input type='hidden' name='id' value='" + childNode.id + "'>" +
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
		console.log("autoAppr_length", autoAppr_length)
		var apr_row_length = apr_row.length;
		var added_length = apr_row_length - autoAppr_length;
		console.log("autoAppr_length", autoAppr_length)
		if (added_length > 3 - autoAppr_length) {
			console.log("결재자는 최대 4명까지만 설정가능합니다");
			var newDiv = document.createElement("div");

			var newP = document.createElement("p");
			newDiv.setAttribute("id","apprLimit");
			newP.textContent = "결재자는 최대 4명까지만 설정 가능합니다";
			newP.style.textAlign = "center";
			newP.style.color = "red";
			newP.style.marginTop = "10px";
			newDiv.appendChild(newP);
			apr_chk.appendChild(newDiv);
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

	//    $("#JTSelectTemplate").on("click", "li.jstree-node", function(){
	//        console.log("클릭 이벤트 발생!!");
	//        
	//           let clicked = $("#JTSelectTemplate").jstree('get_selected');
	//         let clickedNode = $("#JTSelectTemplate").jstree().get_node(clicked);
	//         let tempno = clickedNode.original.tempno;
	//         
	//         console.log("clicked:",clicked);
	//         console.log("clickedNode:",clickedNode);
	//         console.log("tempno:",tempno);
	//    });

	// 문서양식선택 미리보기
	$("#JTSelectTemplate").on("click", "li.jstree-node", function(event) {
		event.stopPropagation(); // 이벤트 버블링 중지
		console.log("클릭 이벤트 발생!!");

		let clicked = $("#JTSelectTemplate").jstree('get_selected');
		let clickedNode = $("#JTSelectTemplate").jstree().get_node(clicked);
		let tempno = clickedNode.original.tempno;

		console.log("clicked:", clicked);
		console.log("clickedNode:", clickedNode);
		console.log("tempno:", tempno);

		fetch("./selectMainTemplate.do?tempno=" + tempno)
			.then(response => {
				if (!response.ok) {
					throw new Error('Network response was not ok');
				}
				return response.json();
			})
			.then(data => {
				console.log("data", data);
				let template_preview = document.querySelector("#template_preview");
				let templateImg = document.createElement("img");
				let payload = data.fVo.payload;
				console.log("data.fVo.payload:", data.fVo.payload);
				templateImg.src = "data:image/png;base64," + payload;
				templateImg.alt = "TemplatePreviewImg";
				templateImg.style.width = "100%"; // 너비를 부모 요소의 너비에 맞게 설정
				templateImg.style.height = "100%"; // 높이를 부모 요소의 높이에 맞게 설정
				templateImg.style.objectFit = "contain";
				template_preview.innerHTML = "";
				template_preview.appendChild(templateImg);
				var tempcode = document.getElementById("tempcode").value;
      
				if(tempcode == '01'){ ////////////////////////////////////////////수정

          let daterangepickerInput = document.getElementById("daterangepicker");
				daterangepickerInput.remove();
					
				console.log("div_before:", div_before);
				}
			})
			.catch(error => {
				console.error('There was a problem with the fetch operation:', error);
			})
	});

});



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
	
		var apprLimit = document.getElementById("apprLimit");
	if(apprLimit){
		console.log("지우자")
		apprLimit.remove();
	}
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
	
	var apr_chk = document.getElementById("apr_chk");
	var inputs = apr_chk.querySelectorAll("input");
	inputs.forEach(function(input){
		if(input.className != "autoAppr"){
			if(input.name == "id"){
				var enable_id = input.value;
				$("#apprJstree").jstree().show_node(enable_id);
			}
			input.parentElement.remove();
		}
	})
	var apprLimit = document.getElementById("apprLimit");
	apprLimit.remove();
	
//	
//	parent_apr_row = document.getElementsByClassName("apr_row");
//
//	//   console.log(parent_apr_row,parent_apr_row.length)
//	
//	
//	var parent_apr_row_clone = Array.from(parent_apr_row);
//	for (let i = 0; i < parent_apr_row.length; i++) {
//		children_apr_row = parent_apr_row_clone[i].querySelector("[name='delIcon']");
//		if (children_apr_row) {
//			deletedAppr.push(parent_apr_row_clone[i]);
//			parent_apr_row_clone[i].remove();
//			//         console.log("parent_apr_row_clone",parent_apr_row_clone[i])
//			var enable_id = parent_apr_row_clone[i].querySelector("[name='id']").value;
//			console.log("enable_id", enable_id)
//			$("#apprJstree").jstree().show_node(enable_id);
//		}
//	}
//
//	console.log("cleanAppr", cleanAppr);
	deletedAppr = [];
//	var apprLimit = document.getElementById("apprLimit");
//	apprLimit.remove();
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
	apr_chk_apr_rows.forEach(function(apr_chk_apr_row) {
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
		//      console.log("ref_find_node-------------", ref_find_node.id);
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
	console.log("ref_chk_apr_rows", ref_chk_apr_rows)
	ref_chk_apr_rows.forEach(function(ref_chk_apr_row) {
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

	deletedAppr.forEach(function(appr) {
		apr_chk.append(appr);
		console.log("appr", appr);
		var id = appr.querySelector("[name='id']").value;
		console.log("id", id)
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

	deletedRef.forEach(function(ref) {
		ref_chk.append(ref);
		console.log("ref", ref);
		var id = ref.querySelector("[name='id']").value;
		console.log("id", id)
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

		var loginVo_id = document.getElementById("loginVo_id").value;
		console.log("loginVo_id", loginVo_id)
		try {
			const response1 = await fetch("./selectMainTemplate.do?tempno=" + tempno + "&id=" + loginVo_id);
			const data1 = await response1.json();
			         console.log(data1);
			var templateArea = document.getElementById("templateArea");
			templateArea.innerHTML = data1.vo.content;
      
			         document.getElementById("tempcode").value = data1.vo.tempcode;
         var save_sign = data1.sVo.save_sign;
         document.getElementById("save_sign").value = save_sign;
         var tempcode = document.getElementById("tempcode").value;
            console.log("tempcode",tempcode);
            
            // input hidden 태그에 뿌려줄 값 조회
         var loginVo_name = document.getElementById("loginVo_name").value;
         var deptVo_dname = document.getElementById("deptVo_dname").value;
         var loginVo_id = document.getElementById("loginVo_id").value;
         var loginVo_spot = document.getElementById("loginVo_spot").value;
         
         
         console.log("save_sign", save_sign)
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
         writer_id.value = loginVo_id;

         // 기안 뿌리기
         var today = new Date();

         // 연도, 월, 일을 문자열로 변환하여 조합
         var year = today.getFullYear();
         var month = ('0' + (today.getMonth() + 1)).slice(-2);
         var day = ('0' + today.getDate()).slice(-2);
         var dateString = year + '-' + month + '-' + day;
         console.log("dateString", dateString)

         // input 요소의 value에 할당
         document.querySelector("#draft_date").textContent = dateString;
         
         
         
         // 기안란 직위, 이름, 기안일 textContent
         document.querySelector("#drafter_spot").textContent = loginVo_spot;
         document.querySelector("#drafter_name").textContent = loginVo_name;
         document.querySelector("#drafter_draft_date").textContent = dateString;
            
         
         
         
            
         if (tempcode == '01') {
            
            var vacVo_remaining_leave = document.getElementById("vacVo_remaining_leave");
            console.log("vacVo_remaining_leave:", vacVo_remaining_leave.value);
            document.querySelector("#remaining_leave").textContent = vacVo_remaining_leave.value;
            

				var getsu = 0;
				var weekendCount = 0;

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
					$('#start_day').val(start.format('YYYY-MM-DD HH:mm'));
					$('#end_day').val(end.format('YYYY-MM-DD HH:mm'));
					var halfStatus = document.getElementById("halfStatus");
					var halfStatusCheckboxes = halfStatus.querySelectorAll("input[type='checkbox']");
					halfStatusCheckboxes.forEach(function(halfStatusCheckbox) {
						halfStatusCheckbox.checked = false;
						halfStatusCheckbox.parentElement.querySelectorAll("input[type='radio']").forEach(function(radio) {
							radio.checked = false;
							radio.disabled = true;
							getsu = Math.floor(getsu_date / (1000 * 60 * 60 * 24)) + 1;

						})
					})

					console.log("============================================================== typeof start:", typeof start);
					console.log('New date range selected: ' + start.format('YYYY-MM-DD HH:mm') + ' to ' + end.format('YYYY-MM-DD HH:mm') + ' (predefined range: ' + label + ')');


					var start_date = new Date(start);
					var end_date = new Date(end);
					var formattedStartDate = start_date.getFullYear() + "-" + ("0" + (start_date.getMonth() + 1)).slice(-2) + "-" + ("0" + start_date.getDate()).slice(-2);
					var formattedEndDate = end_date.getFullYear() + "-" + ("0" + (end_date.getMonth() + 1)).slice(-2) + "-" + ("0" + end_date.getDate()).slice(-2);

					// 사용자에 의해 선택된 두 날짜 사이에 주말을 제외한 일수 
					var currentDate = new Date(start);
					while (currentDate <= end) {
						if (currentDate.getDay() === 0 || currentDate.getDay() === 6) {
							weekendCount += 1;
						}
						currentDate.setDate(currentDate.getDate() + 1);
					}
					console.log("weekendCount:", weekendCount);

					var getsu_date = end_date.getTime() - start_date.getTime();
					console.log("getsu_date", getsu_date);
					getsu = Math.floor(getsu_date / (1000 * 60 * 60 * 24)) + 1;
					console.log("getsu:", getsu);
					document.getElementById("getsu").textContent = parseInt(getsu) - weekendCount;
					console.log("start_date:", start_date);
					console.log("end_date:", end_date);

					//사용자에 의해 선택된 시작일, 종료일이 같다면 id가 인 checkbox는 비활성화
					if (formattedStartDate == formattedEndDate) {
						console.log("formattedStartDate", formattedStartDate);
						console.log("formattedEndDate", formattedEndDate);

						console.log("종료일 비활성화")
						var end_day_half = document.getElementById("end_day_half");
						console.log("end_day_half", end_day_half);
						end_day_half.disabled = true;
						let start_day_half_checkbox = document.getElementById("start_day_half");


						start_day_half_checkbox.addEventListener("change", function() {
							if (start_day_half_checkbox.checked) {
								document.getElementsByName("start_day_half")[0].checked = true;
								getsu -= 0.5;
								document.getElementById("getsu").textContent = getsu - weekendCount;


							} else {
								let radios = document.getElementsByName("start_day_half");
								radios.forEach(function(radio) {
									if (radio.checked) {
										radio.checked = false;
									}
								})
								getsu += 0.5;
								document.getElementById("getsu").textContent = getsu - weekendCount;

							}
						})

					} else { // 시작일 - 오후만, 종료일 - 오전만 체크 가능
						document.querySelector("#end_day_half").disabled = false;
						console.log("시작일 - 오후, 종료일 - 오전만 체크가능")
						// 시작일
						//					let start_day_half_div = document.querySelector("#start_day_half").parentElement;
						//					console.log("start_day_half_div:",start_day_half_div);

						let start_day_half_checkbox = document.getElementById("start_day_half");
						console.log("start_day_half_checkbox:", start_day_half_checkbox);
						let end_day_half_checkbox = document.getElementById("end_day_half");
						console.log("end_day_half_checkbox:", end_day_half_checkbox);
						var start_day_half_radio = document.getElementsByName("start_day_half")[1];
						console.log("start_day_half_radio:", start_day_half_radio);
						var end_day_half_radio = document.getElementsByName("end_day_half")[0];
						console.log("end_day_half_radio:", end_day_half_radio);

						start_day_half_checkbox.addEventListener("change", function() {
							if (start_day_half_checkbox.checked) {
								document.getElementsByName("start_day_half")[0].disabled = true;
								console.log("오전 라디오 disabled")
								document.getElementsByName("start_day_half")[1].checked = true;
								getsu -= 0.5;
								console.log("시작일 체크박스 체크 & 라디오 체크")
								document.getElementById("getsu").textContent = getsu - weekendCount;
							} else if (!start_day_half_checkbox.checked) {
								let radios = document.getElementsByName("start_day_half");
								radios[1].checked = false;
								getsu += 0.5;
								console.log("시작일 체크박스 체크 해제 & 라디오 해제")
								document.getElementById("getsu").textContent = getsu - weekendCount;
							}

						});
						end_day_half_checkbox.addEventListener("change", function() {
							if (end_day_half_checkbox.checked) {
								document.getElementsByName("end_day_half")[1].disabled = true;
								console.log("오전 라디오 disabled")
								document.getElementsByName("end_day_half")[0].checked = true;
								getsu -= 0.5;
								console.log("시작일 체크박스 체크 & 라디오 체크")
								document.getElementById("getsu").textContent = getsu - weekendCount;
							} else if (!end_day_half_checkbox.checked) {
								let radios = document.getElementsByName("end_day_half");
								radios[0].checked = false;
								getsu += 0.5;
								console.log("시작일 체크박스 체크 해제 & 라디오 해제")
								document.getElementById("getsu").textContent = getsu - weekendCount;

							}
						});
						//					start_day_half_radio.addEventListener("change", changeEvent);
						//					end_day_half_radio.addEventListener("change", changeEvent);


					}
				});

			}
      
      
			if (tempcode == '02') { ////////////////////////////////////////수정
	            var write_date = document.querySelector("#write_date"); /////////////////////////////////////////////수정
	            write_date.textContent = dateString; /////////////////////////////////////////////수정
	            console.log("write_date", write_date); /////////////////////////////////////////////수정
	            console.log("tempcode", tempcode)
	         
			}
	         document.getElementById("apr_chk").innerHTML = "";
	         //         console.log("tempcode:",data1.tempcode)

			


			

			

			if (tempcode == '01') { /////////////////////////////////////////////수정
            // 공가 선택시 신청연차 초기화
            document.querySelector("#getsuFlag").addEventListener("change", function() {
               console.log("getsuFlag()");
               console.log("this.value:", this.value);
               if (this.value == 'Y') {//공가
                  console.log("공가선택")
                  document.getElementById("getsu").textContent = '0';
               } else {
                  console.log("연차선택")
                  if (isNaN(parseInt(getsu))) {
                     document.getElementById("getsu").textContent = 0;
                  } else { // NaN - weekendCount는 NaN 이기 때문에 else문으로 처리한다
                     document.getElementById("getsu").textContent = parseInt(getsu) - weekendCount;
                  }
				}
            });
         }/////////////////////////////////////////////수정

		} catch (error) {
			console.log("Error..", error);
		}
	}
	// 로그인 세션 아이디
	var sessionId = document.getElementById("loginVo_id").value;
	//    console.log("sessionId",sessionId, typeof sessionId);
	try {

		const response2 = await fetch("./autoAppr.do?sessionId=" + sessionId + "&tempcode=" + document.getElementById("tempcode").value);
		const data2 = await response2.json();
		console.log("data2", data2);
		console.log("tempcode", document.getElementById("tempcode").value)

		var autoApprHtml = $("#apr_chk").html();

		console.log("--------------------------")
		var ids = new Array();
		ids.push(data2[0].empVo[0].id)
		autoApprHtml += "<div class='apr_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;' name='aprDone'>" + data2[0].empVo[0].name + " " + data2[0].comVo.code_name +
			"<input type='hidden' class='autoAppr' name='id' value='" + data2[0].empVo[0].id + "'>" +
			"</div>";

		$("#apprJstree").jstree().hide_node(data2[0].empVo[0].id);

		data2.forEach(function(list) {
			console.log("data2 foreach")
			ids.forEach(function(id) {
				console.log("ids", ids)
				if (list.empVo[0].id != id || id == null) {
					console.log("list.empVo.id", list.empVo[0].id)
					ids.push(list.empVo[0].id);
					autoApprHtml += "<div class='apr_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;' name='aprDone'>" + list.empVo[0].name + " " + list.comVo.code_name +
						"<input type='hidden' class='autoAppr' name='id' value='" + list.empVo[0].id + "'>" +
						"</div>";
					$("#apprJstree").jstree().hide_node(list.empVo[0].id);
					
					console.log("list.empVo[0].id",list.empVo[0].id)
				}
			})
		})
		$("#apr_chk").html(autoApprHtml);

		var apprLine = document.getElementById("apr_chk");
		var apr_rows = apprLine.querySelectorAll(".apr_row");

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
