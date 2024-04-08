$(function() {
	function hideLoginUser() {
		var loginId = document.getElementById("loginId").value;
		var loginNode = $("#partTree").jstree("get_node", loginId);
		if (loginNode) {
			$("#partTree").jstree("hide_node", loginNode);
		}
	}

	// 모달이 열릴 때
	$("#partModal").on("shown.bs.modal", function(e) {
		hideLoginUser();
	});

	// Reference Tree
	$('#partTree').jstree({
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

	// 참조차 추가 버튼 클릭시
	$("#addPeople").on('click', function() {
		var sel = $("#partTree").jstree('get_selected');
		console.log("선택한 아이디 : ", sel);

		selectedIds.push(sel);
		console.log("아이디 리스트: ", selectedIds);

		var selectedNode = $("#partTree").jstree().get_node(sel);
		console.log("선택한 사원정보 : ", selectedNode);

		var selectedNodeText = $("#partTree").jstree().get_node(sel).text;
		console.log("선택한 사원명: ", selectedNodeText);

		selectedNodeTextName.push(selectedNodeText);
		console.log("이름 리스트: ", selectedNodeTextName);

		var children = $("#partTree").jstree().get_children_dom(selectedNode);
		console.log(children, children.length);

		if (children.length > 0) {
			children.each(function() {
				var childNode = $("#partTree").jstree().get_node($(this).attr('id'));
				console.log("childNode", childNode)
				var selText = $("#partTree").jstree().get_text(childNode);
				console.log(selText)
				$("#partTree").jstree('hide_node', childNode);
				if (!selText) {
					return;
				}
				var htmlCode = $("#people_chk").html();
				htmlCode += "<div class='part_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;'>" + selText +
					"<div name='delIcon' onclick='delPart(event)' style='margin-left:15px;'>" +
					"<svg style='pointer-events:none;' xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-trash-2' id='toastFeather'>" +
					"<polyline points='3 6 5 6 21 6'></polyline>" +
					"<path d='M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2'></path>" +
					"<line x1='10' y1='11' x2='10' y2='17'></line>" +
					"<line x1='14' y1='11' x2='14' y2='17'></line>" +
					"</svg>" +
					"</div>" +
					"<input type='hidden' name='id' value='" + childNode.id + "'>" +
					"<input type='hidden' name='name' value='" + childNode.text + "'>" +
					"</div>" +
					"</div>";
				$("#people_chk").html(htmlCode);
				$("#partTree").jstree('deselect_node', sel);
			})
		} else {
			$("#partTree").jstree('hide_node', sel);
			var selText = $("#partTree").jstree().get_text(sel);
			if (!selText) {
				return;
			}
			var htmlCode = $("#people_chk").html();
			htmlCode += "<div class='part_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;'>" + selText +
				"<div name='delIcon' onclick='delPart(event)' style='margin-left:15px;'>" +
				"<svg style='pointer-events:none;' xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-trash-2' id='toastFeather'>" +
				"<polyline points='3 6 5 6 21 6'></polyline>" +
				"<path d='M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2'></path>" +
				"<line x1='10' y1='11' x2='10' y2='17'></line>" +
				"<line x1='14' y1='11' x2='14' y2='17'></line>" +
				"</svg>" +
				"</div>" +
				"<input type='hidden' name='id' value='" + sel + "'>" +
				"<input type='hidden' name='name' value='" + selectedNodeText + "'>" +
				"</div>" +
				"</div>";
			$("#people_chk").html(htmlCode);
		}

		$("#partTree").jstree('deselect_node', sel);
		deletedPart = [];
	});

	// 트리를 처음부터 열린 상태로 보여줌
	$('#partTree').on('ready.jstree', function() {
		$(this).jstree('open_all');
	});

	var searchTimer;
	// 참조자 서치
	$('#search_input').keyup(function() {
		// 이전에 설정된 타이머가 있다면 클리어
		clearTimeout(searchTimer);

		// 300 밀리초 후에 검색 수행
		searchTimer = setTimeout(function() {
			var v = $('#search_input').val().trim();
			$('#partTree').jstree(true).search(v);
		}, 300);
	});
});


var selectedIds = [];
var selectedNodeTextName = [];

//참조자 삭제
function delPart(event) {
	// 클릭된 span의 parent div
	var parentDiv = event.target.parentElement;
	console.log("parentDiv", parentDiv)

	var text = parentDiv.textContent;
	console.log("text", text)

	deletedPart.push(parentDiv);

	// 삭제
	parentDiv.remove();

	var deletedNode = findTreeNodeByTextPart(text);
	console.log(deletedNode)
	$("#partTree").jstree('show_node', deletedNode.id);

}

var deletedPart = [];

function findTreeNodeByTextPart(text) {

	var chatTree = $("#partTree").jstree();
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
function partClean() {
	var jstree = $("#partTree").jstree();
	var allNodes = jstree.get_json(null, { flat: true });
	$("#people_chk").html("");
	//모든 노드 표시
	$("#partTree").jstree('show_all');
	for (var i = 0; i < allNodes.length; i++) {
		var iNode = $("#partTree").jstree().get_node(allNodes[i]);
		//모든 노드 enable
		$("#partTree").jstree('enable_node', iNode);
	}

	deletedPart = [];
}

var chkPart;


// 참조자 추가 완료버튼
function partDone() {
	var people_chk = document.getElementById("people_chk");
	var part_rows = people_chk.querySelectorAll(".part_row");

	var selectedIds = [];
	var selectedNames = [];
	part_rows.forEach(function(row) {
		var idInput = row.querySelector("input[name='id']");
		var nameInput = row.querySelector("input[name='name']");
		if (idInput) {
			selectedIds.push(idInput.value);
			selectedNames.push(nameInput.value);
		}
	});
	console.log("최종 아이디 리스트 : ", selectedIds);
	console.log("최종 이름 리스트 : ", selectedNames);

	var jsonArray = [];
	for (var i = 0; i < selectedIds.length; i++) {
		var name = selectedNames[i].split(" ")[0];

		var obj = {
			"id": selectedIds[i], // 각 배열 내의 첫 번째 요소를 아이디로 사용
			"name": name
		};
		jsonArray.push(obj);
	}
	console.log("참여자 json : ", jsonArray);

	document.getElementById("participants").value = JSON.stringify(jsonArray);
	
	var partShow = document.getElementById("partShow");
	partShow.innerHTML = ''; // 기존 내용 삭제
	selectedNames.forEach(function(name) {
		var button = document.createElement("button");
		button.textContent = name;
		button.classList.add("name_btn"); // 클래스 추가
		partShow.appendChild(button);
	});

	$("#scheduelModal").modal("show");
	console.log("일정 등록 모달");
}

// 참조자 확인 클릭
function getPartLine() {
	chkPart = document.getElementById("chkPart");
	chkPart.style.display = "block";
}

function partCancel() {
	
	 $("#scheduelModal").modal("show");
	    console.log("일정 등록 모달");
}