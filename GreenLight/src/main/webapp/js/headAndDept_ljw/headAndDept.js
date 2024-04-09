window.onload = function(){
	changeBG();
}

function changeBG(){
	var allTr = document.querySelectorAll('#inputTableBody tr');
	
	allTr.forEach(function(clickTr){
		clickTr.addEventListener("click", function(){
			allTr.forEach(function(tr) {
                tr.style.backgroundColor = 'white';
            });
            clickTr.style.backgroundColor = '#EFF5F2';
		})
	})
}

//headAndDept.jsp
function selectHeadList(){
	var selectedHeadNo = document.getElementById("headno").value;
	var selectedHead = document.getElementById("headno");
	var selectedHeadName = document.getElementById("headno").options[selectedHead.selectedIndex].innerText;
	console.log(document.getElementById("hname"));
	document.getElementById("hname").innerHTML = selectedHeadName;
	document.getElementById("infoZone").style = "display: none;";
	document.getElementById("headAndDeptInfo").style = "display:block";
	fetch("./selectdeptList.do",{
		method:"POST",
		body:selectedHeadNo
	})
	.then(data => data.json())
	.then(result => {
		addDeptList(result);
		selectHead(selectedHeadNo);
		changeBG();
	});
}

//headAndDept.jsp
function addDeptList(result){
	console.log(result);
	var headNo = document.getElementById("headno").value;
	var headName =document.getElementById("hname").innerHTML;
	var inputTableBody = document.getElementById("inputTableBody");
    var tableHTML = '';
    inputTableBody.innerHTML = '';
    tableHTML += "<tr style='width: 24%; background-color: #EFF5F2'  onclick='selectHead("+headNo+")'><th style='border-right: 1px solid #ccc;' rowspan='"+(result.list.length+1)+"' id='hname'>"+headName+"</th></tr>";
    result.list.forEach(function (item) {
		tableHTML += "<tr style='width: 25%' onclick='selectDept("+item.deptno+")'>";
		tableHTML += "<th class='dname'>"+item.dname+"</th>";
		tableHTML += "</tr>";
    });
    inputTableBody.innerHTML = tableHTML;
    
    var managerHubo = document.getElementById("managerHubo");
    managerHubo.innerHTML ='';
    var huboHTML = '';
    if(result.headMgrHubo.length == 0){
		huboHTML += "<tr><td>본부장 후보가 없습니다</td></tr>"
		document.getElementById("modalSubmitBtn").style ="display:none;";
	}else{
	    result.headMgrHubo.forEach(function (item) {
			huboHTML += "<tr>";
			huboHTML += "<td><input class='form-check-input' id='flexRadioDefault' type='radio' name='flexRadioDefault' value='"+item.id+"'></td>";
			huboHTML += "<td> ";
			result.list.forEach(function(dept){
				if(dept.deptno == item.deptno){
					huboHTML += "("+dept.dname+") " ;
				}
			});
			huboHTML += item.name+" "+item.spot+"</td>";
			huboHTML += "</tr>";
		});
		document.getElementById("modalSubmitBtn").style ="display:block; margin-left: 10px;";
	}
	managerHubo.innerHTML = huboHTML;
}

//headAndDept.jsp
function selectDept(val){
	let deptno = val.toString().padStart(2, '0');
	document.getElementById("infoZone").style = "width: 67%; float: right; display: block; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;";
	fetch("./selectdept.do",{
		method:"POST",
		body:deptno
	})
	.then(data => data.json())
	.then(result => {
		getDept(result);
		changeBG();
	});
}

//headAndDept.jsp
function getDept(result){
	console.log(result)
	document.getElementById("nameZone").innerHTML = result.dname+" ("+(result.empVo != null ? result.empVo.length : 0)+")";
	var inputTableHead = document.getElementById("inputListTableHead");
	var inputTableBody = document.getElementById("inputListTableBody");
	var xIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x-circle"><circle cx="12" cy="12" r="10"></circle><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>';
    var tableHTML = '';
    inputTableHead.innerHTML = "<tr><th></th><th>사원번호</th><th>이름</th><th>소속부서</th><th>직위</th><th>부서장</th></tr>";
    if(result.empVo != null){
	    result.empVo.forEach(function (item) {
			if(result.dept_mgr != null){
				if(result.dept_mgr == item.id){
					document.getElementById("managerZone").innerHTML = "부서장 : " + "("+ result.dname +") " +item.name +" "+ item.spot;
				}
			}else{
				document.getElementById("managerZone").innerHTML = "부서장 : -";
			}
			tableHTML += "<tr>";
			if(item.position == "부서원"){
				tableHTML += "<td class='dept_mgr_hubo'><input class='form-check-input' id='flexRadioDefault' type='radio' name='flexRadioDefault'></td>";
			}else{
				tableHTML += "<td>"+xIcon+"</td>";
			}
			tableHTML += "<td class='dept_mgr_hubo_id'>"+item.id+"</td>";
			tableHTML += "<td>"+item.name+"</td>";
			tableHTML += "<td>"+result.dname+"</td>";
			tableHTML += "<td>"+item.spot+"</td>";
			tableHTML += "<td>"+item.position+"</td>";
			tableHTML += "</tr>";
	    });
	}else{
		document.getElementById("managerZone").innerHTML = "부서장 : -";
	}
    inputTableBody.innerHTML = tableHTML;
    if(document.querySelectorAll("input[type='radio']").length > 0){
		document.querySelectorAll("input[type='radio']")[0].checked = true;
	}
    
    var buttonZone = document.getElementById("buttonZone");
    buttonZone.innerHTML = "";
    var buttonHTML = "";
    if(result.dept_mgr != null){
		buttonHTML += "<button class='btn btn-primary' type='button' style='margin-right:10px;' onclick='modifyDeptManager("+result.deptno+")'>부서장 수정</button>"
	}else{
		if(document.querySelectorAll("input[type='radio']").length > 0){
	    	buttonHTML += "<button class='btn btn-primary' type='button' style='margin-right:10px;' onclick='modifyDeptManager("+result.deptno+")'>부서장 등록</button>"
	    }
	}
	buttonZone.innerHTML = buttonHTML;
}

//headAndDept.jsp
function selectHead(val){
	let headno = val.toString().padStart(2, '0');
	document.getElementById("infoZone").style = "width: 67%; float: right; display: block; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;";
	fetch("./selectHead.do",{
		method:"POST",
		body:headno
	})
	.then(data => data.json())
	.then(result => {
		getDeptList(result);
	});
}

//headAndDept.jsp
function getDeptList(result){
	console.log(result);
	var headName = document.getElementById("hname").innerHTML;
	var dLength = document.getElementsByClassName("dname").length;
	document.getElementById("nameZone").innerHTML = headName+"("+dLength+")";
	var inHTML = "";
	if(result.head_mgr != null){
		result.deptVo.forEach(function (dept){
			if(dept.deptno == result.empVo.deptno){
				inHTML += "("+dept.dname+") ";
			}
		})
		inHTML += result.empVo.name+" "+result.empVo.spot;
	}else{
		inHTML += "-";
		}
	document.getElementById("managerZone").innerHTML = "본부장 : "+ inHTML;
	var inputTableHead = document.getElementById("inputListTableHead");
	var inputTableBody = document.getElementById("inputListTableBody");
    var tableHTML = '';
    inputTableHead.innerHTML = "<tr><th>부서번호</th><th>부서명</th><th>소속본부</th><th>부서장명</th></tr>";
    result.deptVo.forEach(function (item) {
		if(item.delflag != 'Y'){
			tableHTML += "<tr>";
			tableHTML += "<td>"+item.deptno+"</td>";
			tableHTML += "<td>"+item.dname+"</td>";
			tableHTML += "<td>"+headName+"</td>";
			if(item.dept_mgr != null){
				item.empVo.forEach(function (emp){
					if(item.dept_mgr == emp.id){
						tableHTML += "<td>"+emp.name+"</td>";
					}
				})
			}else{
				tableHTML += "<td>-</td>";
			}
			tableHTML += "</tr>";
		}
    });
    inputTableBody.innerHTML = tableHTML;
    
    var buttonZone = document.getElementById("buttonZone");
    buttonZone.innerHTML = "";
    var buttonHTML = "";
    if(result.head_mgr != null){
		buttonHTML += "<button class='btn btn-primary' type='button' style='margin-right:10px;' data-bs-toggle='modal' data-bs-target='#headManagerModal' onclick='modifyManager("+result.headno+")'>본부장 수정</button>"
	}else{
	    buttonHTML += "<button class='btn btn-primary' type='button' style='margin-right:10px;' data-bs-toggle='modal' data-bs-target='#headManagerModal' onclick='modifyManager("+result.headno+")'>본부장 등록</button>"
	}
	buttonZone.innerHTML = buttonHTML;
	
}

//headAndDept.jsp
function modifyManager(val){
	let heanno = val.toString().padStart(2, '0');
	console.log("변경할 manager가 속한 곳의 번호 : ",heanno);
	if(document.querySelectorAll("#managerHubo input[type='radio']").length > 0){
		document.querySelectorAll("#managerHubo input[type='radio']")[0].setAttribute("checked","checked");
	}
	document.getElementById("modalSubmitBtn").addEventListener("click",function(){
		modifyHeadManager(val);
	})
}

//headAndDept.jsp
function modifyHeadManager(val){
	let headno = val.toString().padStart(2, '0');
	var headHubo = document.querySelectorAll("#managerHubo input[type='radio']");
	var selectedHeadHubo = document.querySelector("#managerHubo input[type='radio']:checked").parentNode.nextElementSibling.innerText;
	headHubo.forEach(function(head){
		if(head.checked){
			document.getElementById("primaryConfirm").style.display = "block";
			document.getElementById("primaryConfirm").style.zIndex = "9999";
			document.querySelector("#primaryConfirm #modalTitle").innerText = "본부장 변경";
			document.querySelector("#primaryConfirm #modalContent").innerText = "선택한 사람을 본부장으로 등록하시겠습니까?";
			document.querySelector("#primaryConfirm").style.display = "block";
			document.querySelector("#primaryConfirm #firstBtn").addEventListener("click", function() {
				document.querySelector("#primaryConfirm").style.display = "none";
			})
			document.querySelector("#primaryConfirm #secondBtn").addEventListener("click", function() {
				document.querySelector("#primaryConfirm").style.display = "none";
				document.querySelector("#headManagerModal").style.display = "none";
				fetch("./updateHeadManager.do",{
					method:"POST",
					headers:{"content-type":"application/json"},
					body:JSON.stringify({
						id:head.value,
						headno:headno
					})
				})
				.then(data => data.json())
				.then(result => {
					console.log(result);
					closeModal();
					document.getElementById("primaryAlert").style.display = "block";
					document.getElementById("primaryAlert").style.zIndex = "9999";
					document.querySelector("#primaryAlert #modalTitle").innerText = "수정 성공";
					document.querySelector("#primaryAlert #modalContent").innerText = "본부장 변경이 완료되었습니다";
					document.querySelector("#primaryAlert").style.display = "block";
					document.querySelector("#primaryAlert #secondBtn").addEventListener("click", function() {
						document.querySelector("#primaryAlert").style.display = "none";
						document.querySelector("#primaryConfirm").style.display = "none";
					})
					document.getElementById("managerZone").innerText = "본부장 : "+selectedHeadHubo;
					var managerHubo = document.getElementById("managerHubo");
   					managerHubo.innerHTML ='';
				    var huboHTML = '';
				    if(result.length == 0){
						huboHTML += "<tr><td>본부장 후보가 없습니다</td></tr>"
						document.getElementById("modalSubmitBtn").style ="display:none;";
					}else{
					    result.newHubo.forEach(function (item) {
							huboHTML += "<tr>";
							huboHTML += "<td><input class='form-check-input' id='flexRadioDefault' type='radio' name='flexRadioDefault' value='"+item.id+"'></td>";
							huboHTML += "<td> ";
							result.deptList.forEach(function(dept){
								if(dept.deptno == item.deptno){
									huboHTML += "("+dept.dname+") " ;
								}
							});
							huboHTML += item.name+" "+item.spot+"</td>";
							huboHTML += "</tr>";
						});
						document.getElementById("modalSubmitBtn").style ="display:block; margin-left: 10px;";
					}
					managerHubo.innerHTML = huboHTML;
				})

			})
		}
	})
}

//headAndDept.jsp
function modifyDeptManager(val) {
	let deptno = val.toString().padStart(2, '0');
	var deptHubo = document.querySelector(".dept_mgr_hubo input[type='radio']:checked");
	let deptHuboId = '';
	if(deptHubo == null){
		deptHuboId = '';
	}else{
		deptHuboId = deptHubo.closest('tr').querySelector(".dept_mgr_hubo_id").innerText;
	}
	document.getElementById("primaryConfirm").style.display = "block";
	document.getElementById("primaryConfirm").style.zIndex = "9999";
	document.querySelector("#primaryConfirm #modalTitle").innerText = "부서장 등록";
	document.querySelector("#primaryConfirm #modalContent").innerText = "선택한 사람을 부서장으로 등록하시겠습니까?";
	document.querySelector("#primaryConfirm").style.display = "block";
	document.querySelector("#primaryConfirm #firstBtn").addEventListener("click", function() {
		document.querySelector("#primaryConfirm").style.display = "none";
	})
	document.querySelector("#primaryConfirm #secondBtn").addEventListener("click", function() {
		document.querySelector("#primaryConfirm").style.display = "none";
		document.querySelector("#headManagerModal").style.display = "none";
		fetch("./updateDeptManager.do", {
			method: "POST",
			headers: { "content-type": "application/json" },
			body: JSON.stringify({
				id: deptHuboId,
				deptno: deptno
			})
		})
		.then(data => data.text())
		.then(result => {
			console.log(result);
			selectDept(deptno);
			document.getElementById("primaryAlert").style.display = "block";
			document.getElementById("primaryAlert").style.zIndex = "9999";
			document.querySelector("#primaryAlert #modalTitle").innerText = "수정 성공";
			document.querySelector("#primaryAlert #modalContent").innerText = "부서장 변경이 완료되었습니다";
			document.querySelector("#primaryAlert").style.display = "block";
			document.querySelector("#primaryAlert #secondBtn").addEventListener("click", function() {
				document.querySelector("#primaryAlert").style.display = "none";
				document.querySelector("#primaryConfirm").style.display = "none";
			})
		})
	})
}

//모달 닫히는 function
function closeModal() {
        var modal = document.getElementById('headManagerModal');
        var backdrop = document.querySelector('.modal-backdrop');
        modal.classList.remove('show');
        modal.style.display = 'none';
        backdrop.remove();
    }