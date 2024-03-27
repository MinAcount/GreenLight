$(function () {
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
	
	$("#addRef").on('click',function () {
		// 선택된 노드의 id 가져옴
		var sel = $("#refJstree").jstree('get_selected');
		
		//선택된 노드 숨김
		$("#refJstree").jstree('hide_node', sel);

		//선택된 노드의 텍스트 내용을 가져옴
		var selText = $("#refJstree").jstree().get_text(sel);
		console.log(selText);
		
		if(!selText){
			return;
		}
		
		var htmlCode = $("#ref_chk").html();
		
		//  #ref_chk div에 선택한 노드 추가
		htmlCode += "<div class='ref_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;'>" + selText + 
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

		$("#ref_chk").html(htmlCode);
		
	


		//선택된 노드 선택 해제하기
		$("#refJstree").jstree('deselect_node', sel);

		

	});
		
	



	// 트리를 처음부터 열린 상태로 보여줌
	$('#refJstree').on('ready.jstree', function() {
		$(this).jstree('open_all');
	});


	var searchTimer3;

	$('#search_input2').keyup(function() {
		// 이전에 설정된 타이머가 있다면 클리어
		clearTimeout(searchTimer3);

		// 300 밀리초 후에 검색 수행
		searchTimer = setTimeout(function() {
			var v = $('#search_input2').val().trim();
			$('#refJstree').jstree(true).search(v);
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


function delRef(event) {
	// 클릭된 span의 parent div
	var parentDiv = event.target.parentElement;
	console.log("parentDiv"+parentDiv)

	//#ref_chk div 탐색
	var chkDiv = parentDiv.parentNode;
	console.log(chkDiv)

	// 삭제
	parentDiv.remove();


	//sel_apr이라는 클래스를 가진 div 탐색
	var childDiv = parentDiv.querySelector('.sel_ref')
	
	//childDiv의 내용 저장
	var childText = childDiv.textContent
	
	//findTreeNodeByText function을 통해 childText와 같은 내용의 node 저장
	var treeNode = findTreeNodeByText2(childText);
	if (treeNode) {
		var jstree = $("#refJstree").jstree();
		var allNodes = jstree.get_json(null, { flat: true });
		
		//treeNode의 아이디로 hide 됐던 노드 다시 show 해주기
		$("#refJstree").jstree('show_node', treeNode.id);
		
		//#apr_chk div에 있던 것들이 삭제되면 다시 #apprJstree에서 직급에 따라 disable된것이 enable 처리
		for (var i = 0; i < allNodes.length; i++) {
         var iNode = jstree.get_node(allNodes[i]);
         var iPosition_flag = parseInt(iNode.original.position_flag);
         if (iPosition_flag >= chkDiv_last_p) {
            $("#refJstree").jstree('enable_node', iNode);
         }
      }
	}
}

function findTreeNodeByText2(text) {

	var jstree = $("#refJstree").jstree();

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
}

var chkRef;
var chkAppr;

function refDone(){
   
   
   var refLineOriginal = document.getElementById("ref_chk")
   var refLine = refLineOriginal.cloneNode(true)
   console.log(refLine)
   var delIcon = refLine.querySelectorAll('[name="delIcon"]');
   console.log(delIcon)
	delIcon.forEach(function(icon) {
    icon.remove();
});
	
	
	    
   console.log("last_refLine",refLine)
	
	
   
	var chkRefClone1 = refLine.cloneNode(true)
	
	var refCloneList = Array.from(chkRefClone1.querySelectorAll(".ref_row"));
	
	chkRef = document.getElementById("chkRef");
	
	while (chkRef.firstChild) {
        chkRef.firstChild.remove();
    } 
	
	refCloneList.forEach(function(item){
		chkRef.appendChild(item)
	})
	
	console.log("chkRef",chkRef)
	
	chkRef.style.display = "block";
	chkAppr = document.getElementById("chkAppr");
	chkAppr.style.display = "none";
	
	
	var referenceLi = document.getElementById("getReference");
	referenceLi.classList.add("active");

	var approvalLi = document.getElementById("getApproval");
	approvalLi.classList.remove("active");
}


function getRefLine(){
	chkRef = document.getElementById("chkRef");
	chkRef.style.display = "block";
	var chkAppr = document.getElementById("chkAppr");
	chkAppr.style.display = "none";
}


