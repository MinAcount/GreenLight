//headAndDept.jsp
function selectHeadList(){
	var selectedHeadNo = document.getElementById("headno").value;
	var selectedHead = document.getElementById("headno");
	var selectedHeadName = document.getElementById("headno").options[selectedHead.selectedIndex].innerText;
	console.log(document.getElementById("hname"));
	document.getElementById("hname").innerHTML = selectedHeadName;
	document.getElementById("infoZone").style = "display: none;";
	if(selectedHeadNo == "No"){
		document.getElementById("headAndDeptInfo").style = "display:none";
	}else{
		document.getElementById("headAndDeptInfo").style = "display:block";
	}
	fetch("./selectdeptList.do",{
		method:"POST",
		body:selectedHeadNo
	})
	.then(data => data.json())
	.then(result => {
		if(result == ""){
			console.log("선택을 선택함")
		}else{
			addDeptList(result);
		};
	});
}

//headAndDept.jsp
function addDeptList(result){
	var headNo = document.getElementById("headno").value;
	var headName =document.getElementById("hname").innerHTML;
	var inputTableBody = document.getElementById("inputTableBody");
    var tableHTML = '';
    inputTableBody.innerHTML = '';
    tableHTML += "<tr style='width: 25%;'  onclick='selectHead("+headNo+")'><th style='border-right: 1px solid #ccc;' rowspan='"+(result.length+1)+"' id='hname'>"+headName+"</th></tr>";
    result.forEach(function (item) {
		tableHTML += "<tr style='width: 25%' onclick='selectDept("+item.deptno+")'>";
		tableHTML += "<th class='dname'>"+item.dname+"</th>";
		tableHTML += "</tr>";
    });
    inputTableBody.innerHTML = tableHTML;
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
		if(result == ""){
			console.log("선택을 선택함")
		}else{
			getDept(result);
		};
	});
}

//headAndDept.jsp
function getDept(result){
	console.log(result)
	document.getElementById("nameZone").innerHTML = result.dname+"("+result.empVo.length+")";
	var inputTableHead = document.getElementById("inputListTableHead");
	var inputTableBody = document.getElementById("inputListTableBody");
    var tableHTML = '';
    inputTableHead.innerHTML = '';
    inputTableHead.innerHTML = "<tr><th></th><th>사원번호</th><th>이름</th><th>소속부서</th><th>직위</th><th>부서장</th></tr>";
    inputTableBody.innerHTML = '';
    result.empVo.forEach(function (item) {
		if(result.dept_mgr != null){
			if(result.dept_mgr == item.id){
				document.getElementById("managerZone").innerHTML = "부서장 : " + item.name
			}
		}else{
			document.getElementById("managerZone").innerHTML = "부서장 : -";
		}
		tableHTML += "<tr>";
		if(item.position == "부서원"){
			tableHTML += "<td><input class='form-check-input' id='flexRadioDefault' type='radio' name='flexRadioDefault'></td>";
		}else{
			tableHTML += "<td><input class='form-check-input' id='flexRadioDefault' type='radio' name='flexRadioDefault' disabled='disabled'></td>";
		}
		tableHTML += "<td>"+item.id+"</td>";
		tableHTML += "<td>"+item.name+"</td>";
		tableHTML += "<td>"+result.dname+"</td>";
		tableHTML += "<td>"+item.spot+"</td>";
		tableHTML += "<td>"+item.position+"</td>";
		tableHTML += "</tr>";
    });
    inputTableBody.innerHTML = tableHTML;
    
    var buttonZone = document.getElementById("buttonZone");
    buttonZone.innerHTML = "";
    var buttonHTML = "";
    if(result.dept_mgr != null){
		buttonHTML += "<button class='btn btn-primary' type='button' style='margin-right:10px;'>부서장 수정</button>";
		buttonHTML += "<button class='btn btn-danger' type='button' style='margin-right:10px;'>부서장 삭제</button>";
	}else{
	    buttonHTML += "<button class='btn btn-primary' type='button' style='margin-right:10px;'>부서장 조회</button>";
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
	document.getElementById("managerZone").innerHTML = "본부장 : "+ (result.head_mgr != null ? result.empVo.name : "-");
	var inputTableHead = document.getElementById("inputListTableHead");
	var inputTableBody = document.getElementById("inputListTableBody");
    var tableHTML = '';
    inputTableHead.innerHTML = '';
    inputTableHead.innerHTML = "<tr><th>부서번호</th><th>부서명</th><th>소속본부</th><th>부서장명</th></tr>";
    inputTableBody.innerHTML = '';
    result.deptVo.forEach(function (item) {
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
    });
    inputTableBody.innerHTML = tableHTML;
    
    var buttonZone = document.getElementById("buttonZone");
    buttonZone.innerHTML = "";
    var buttonHTML = "";
    if(result.head_mgr != null){
		buttonHTML += "<button class='btn btn-primary' type='button' style='margin-right:10px;'>본부장 수정</button>"
		buttonHTML += "<button class='btn btn-danger' type='button' style='margin-right:10px;'>본부장 삭제</button>"
	}else{
	    buttonHTML += "<button class='btn btn-primary' type='button' style='margin-right:10px;'>본부장 조회</button>"
	}
	buttonZone.innerHTML = buttonHTML;
}