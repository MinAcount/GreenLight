$(function () {
	$('#apprJstree').jstree({
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
							if(node.spot === "01"){
								node.spot = "사원";
							} else if(node.spot === "02"){
								node.spot="주임";
							} else if(node.spot === "03"){
								node.spot="대리";
							} else if(node.spot === "04"){
								node.spot="과장";
							} else if(node.spot === "05"){
								node.spot="차장";
							} else if(node.spot === "06"){
								node.spot="부장";
							} else if(node.spot === "07"){
								node.spot="이사";
							} 
							node.text = node.text + ' ' + node.spot;

						}

					});

					//               data.forEach(function(node) {
					//                  if(myPositionFlag > parseInt(node.position_flag) && node.position != null) {
					//                     node.state = {disabled : true};
					//                  }
					//               });
					//               console.log(myPositionFlagText, myPositionFlag)
				},
				error: function() {
					alert('데이터 전송 실패');
				}
			}
		},
	});
	
	$("#addEmp").on('click',function () {
		// 선택된 노드의 id 가져옴
		var sel = $("#apprJstree").jstree('get_selected');
		
		//선택된 노드 숨김
		$("#apprJstree").jstree('hide_node', sel);

		//선택된 노드의 텍스트 내용을 가져옴
		var selText = $("#apprJstree").jstree().get_text(sel);
		console.log(selText);

		var htmlCode = $("#apr_chk").html();
		
		//  #apr_chk div에 선택한 노드 추가
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


		//선택된 노드 선택 해제하기
		$("#apprJstree").jstree('deselect_node', sel);

		//jstree에서 트리에 있는 모든 노드의 정보를 가져와서 변수에 저장
		//null : 첫 번째 매개변수는 가져올 노드의 ID, null을 사용하면 모든 노드를 가지고 오게 됨
		//flat : 모든 노드가 트리 구조를 유지하면서 하나의 배열에 포함 됨
		var allNodes = jstree.get_json(null, { flat: true });

		//모든 노드와 선택된 노드의 position_flag 비교 후 disable 해줌
		for (var i = 0; i < allNodes.length; i++) {
			var iNode = jstree.get_node(allNodes[i]);
			var iPosition_flag = parseInt(iNode.original.position_flag);
			if (iPosition_flag < position_flag) {
				$("#apprJstree").jstree('disable_node', iNode);
			}
		}

	});
		
	



	// 트리를 처음부터 열린 상태로 보여줌
	$('#apprJstree').on('ready.jstree', function() {
		$(this).jstree('open_all');
	});


	var searchTimer;

	$('#search_input').keyup(function() {
		// 이전에 설정된 타이머가 있다면 클리어
		clearTimeout(searchTimer);

		// 300 밀리초 후에 검색 수행
		searchTimer = setTimeout(function() {
			var v = $('#search_input').val().trim();
			$('#apprJstree').jstree(true).search(v);
		}, 300);
	});

	/*// changed.jstree 이벤트 핸들링
	$('#apprJstree').on('changed.jstree', function(e, data) {
	   console.log('변경된 노드 ID:', data.selected);
	});
 
	// open_node.jstree 이벤트 핸들링
	$('#apprJstree').on('open_node.jstree', function(e, data) {
	   console.log('노드가 열렸습니다:', data.node.text);
	});
 
	// close_node.jstree 이벤트 핸들링
	$('#apprJstree').on('close_node.jstree', function(e, data) {
	   console.log('노드가 닫혔습니다:', data.node.text);
	});
 
	// select_node.jstree 이벤트 핸들링
	$('#apprJstree').on('select_node.jstree', function(e, data) {
	   console.log('노드가 선택되었습니다:', data.node.text);
	});
 
	// deselect_node.jstree 이벤트 핸들링
	$('#apprJstree').on('deselect_node.jstree', function(e, data) {
	   console.log('노드 선택이 해제되었습니다:', data.node.text);
	});*/
 
});


function del(event) {
	// 클릭된 span의 parent div
	var parentDiv = event.target.parentElement;
	console.log("parentDiv"+parentDiv)

	//#apr_chk div 탐색
	var chkDiv = parentDiv.parentNode;
	console.log(chkDiv)

	// 삭제
	parentDiv.remove();


	//sel_apr이라는 클래스를 가진 div 탐색
	var childDiv = parentDiv.querySelector('.sel_apr')
	
	//childDiv의 내용 저장
	var childText = childDiv.textContent
	
	//findTreeNodeByText function을 통해 childText와 같은 내용의 node 저장
	var treeNode = findTreeNodeByText(childText);
	if (treeNode) {
		var jstree = $("#apprJstree").jstree();
		var allNodes = jstree.get_json(null, { flat: true });
		
		//treeNode의 아이디로 hide 됐던 노드 다시 show 해주기
		$("#apprJstree").jstree('show_node', treeNode.id);
		
		//#apr_chk div에 있던 것들이 삭제되면 다시 #apprJstree에서 직급에 따라 disable된것이 enable 처리
		for (var i = 0; i < allNodes.length; i++) {
         var iNode = jstree.get_node(allNodes[i]);
         var iPosition_flag = parseInt(iNode.original.position_flag);
         if (iPosition_flag >= chkDiv_last_p) {
            $("#apprJstree").jstree('enable_node', iNode);
         }
      }
	}
}

function findTreeNodeByText(text) {

	var jstree = $("#apprJstree").jstree();

	//null : 첫 번째 매개변수는 가져올 노드의 ID, null을 사용하면 모든 노드를 가지고 오게 됨
	//flat : 모든 노드가 트리 구조를 유지하면서 하나의 배열에 포함 됨
	var allNodes = jstree.get_json(null, { flat: true });
	for (var i = 0; i < allNodes.length; i++) {
		if (allNodes[i].text === text) {
			return allNodes[i];
		}
	}
	// 노드를 찾지 못한 경우
	return null;
}

// 초기화 버튼 기능
function clean() {
	var jstree = $("#apprJstree").jstree();
	var allNodes = jstree.get_json(null, { flat: true });
	$("#apr_chk").html("");
	//모든 노드 표시
	$("#apprJstree").jstree('show_all');
	for (var i = 0; i < allNodes.length; i++) {
		var iNode = $("#apprJstree").jstree().get_node(allNodes[i]);
		//모든 노드 enable
		$("#apprJstree").jstree('enable_node', iNode);
	}
}

var chkAppr; 
var chkApprClone1;

function apprDone(){
   
   
   var apprLineOriginal = document.getElementById("apr_chk")
   var apprLine = apprLineOriginal.cloneNode(true)
   console.log(apprLine)
   var delIcon = apprLine.querySelectorAll('[name="delIcon"]');
   console.log(delIcon)
	delIcon.forEach(function(icon) {
    icon.remove();
});
	
	// 결재순서 담은 input태그 추가
	var apr_rows = apprLine.querySelectorAll(".apr_row");
	
	apr_rows.forEach(function(row, i){
		var apprOrder = document.createElement("input");
	    apprOrder.setAttribute("type", "hidden");
	    apprOrder.setAttribute("name", "apr_no");
	    apprOrder.setAttribute("value", i + 1);
	    row.appendChild(apprOrder);
	    
	})
      	console.log("last_apprLine",apprLine)

	chkAppr = document.getElementById("chkAppr");
	chkApprClone1 = apprLine.cloneNode(true)
	chkAppr.innerHTML = chkApprClone1.innerHTML;
   console.log(chkAppr)
   
  
}


function getApprLine(){
	chkAppr.innerHTML = chkApprClone1.innerHTML;
}

function getRefLine(){
	var chkApprHTML = "<div>참조자!</div>";
	var chkApprClone2 = document.createElement("div")
	chkApprClone2.innerHTML = chkApprHTML;
	chkAppr.innerHTML = chkApprClone2.innerHTML;
}
