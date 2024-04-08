//headAndDeptManage.jsp
function selectHeadAndDept() {
    var gubun = document.getElementById('gubun');
    var selectedGubunVal = gubun.value;
    var headAndDeptInfoZone = document.getElementById('headAndDeptInfoZone');
    var headPlusZone = document.getElementById('headPlusZone');
    var inputListTableHead = document.getElementById('inputListTableHead');
    var HeadListTableBody = document.querySelectorAll('.HeadListTableBody');
    var DeptListTableBody = document.querySelectorAll('.DeptListTableBody');
    inputListTableHead.innerHTML = '';

    var headerHTML = '';
    if (selectedGubunVal == 'dept') {
        headAndDeptInfoZone.style.display = 'block';
        headPlusZone.style.display = 'none';
        headerHTML += '<tr><th></th><th>부서명</th><th>본부명</th><th>부서장명</th><th>복구/삭제</th><th>완전삭제</th></tr>';
        HeadListTableBody.forEach(function(row) {
            row.style.display = 'none';
        });
        DeptListTableBody.forEach(function(row) {
            row.style.display = 'table-row';
        });
    } else if (selectedGubunVal == 'head') {
		window.location.reload();
        headAndDeptInfoZone.style.display = 'block';
        headPlusZone.style = 'float: right; display:block;';
        headerHTML += '<tr><th></th><th>본부명</th><th>본부장명</th><th>부서추가</th><th>복구/삭제</th><th>완전삭제</th></tr>';
        HeadListTableBody.forEach(function(row) {
            row.style.display = 'table-row'; 
        });
        DeptListTableBody.forEach(function(row) {
            row.style.display = 'none';
        });
        document.getElementById("inputHeadPlus").style.display = "none";
        document.getElementById("headPlusBtn").style.display = "none";
        document.getElementById("inputDeptPlus").style.display = "none";
        document.getElementById("deptPlusBtn").style.display = "none";
        document.getElementById("headBtn").style.display = "block";
        document.getElementById("cancelBtn").style.display = "none";
    }
    inputListTableHead.innerHTML = headerHTML;
}

//headAndDeptManage.jsp
function headPlus(){
	document.getElementById("inputHeadPlus").style.display = "inline-block";
	document.getElementById("inputDeptPlus").style.display = "none";
	document.getElementById("headPlusBtn").style.display = "inline-block";
	document.getElementById("deptPlusBtn").style.display = "none";
	document.getElementById("headBtn").style.display = "none";
	document.getElementById("cancelBtn").style.display = "inline-block";
}

//headAndDeptManage.jsp
function okHeadPlus(){
	let hname = document.getElementById("inputHeadPlus").value;
	if(hname == ""){
		alert("본부명을 입력해주세요");
    	return;
	}
	fetch("./insertHead.do", {
		method:"POST",
		body:hname
	})
	.then(data => data.json())
	.then(result => {
		console.log(result);
		if(result.length == 0){
			alert("같은 이름이 이미 존재합니다");
			return;
		}
		document.getElementById("inputHeadPlus").value = "";
		var inputListTableBody = document.getElementById("inputListTableBody");
		var editorIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>';
		var checkIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>';
		var delIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>'
		var completeDelIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>';
		var plusIcon = "<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-edit-3'><path d='M12 20h9'></path><path d='M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z'></path></svg>";
		var recycleIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-refresh-cw"><polyline points="23 4 23 10 17 10"></polyline><polyline points="1 20 1 14 7 14"></polyline><path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path></svg>';
		inputListTableBody.innerHTML = '';
		inputHTML = '';
		result.forEach(function(item){
			inputHTML += "<tr class='HeadListTableBody'>";
			inputHTML += "<td class='editIcon' onclick='editHeadName(this)'>"+editorIcon+"</td>";
			inputHTML += '<td class="okIcon" onclick="okHeadName(this,\'' + item.headno + '\')" style="display: none;">' + checkIcon + '</td>';
			inputHTML += "<td><input class='hname' value='"+item.hname+"' style='border: 0; background-color: rgba(66,138,70,0);' disabled='disabled'></td>";
			inputHTML += "<td>"+(item.head_mgr != null ? item.empVo.name : "")+"</td>";
			if(item.delflag == 'Y'){
				inputHTML += '<td></td>'
				inputHTML += '<td onclick="headRecycle(\''+item.headno+'\')">복구 '+recycleIcon+'</td>';
			}else{
				inputHTML += '<td onclick="deptPlus(\''+item.headno+'\')">부서추가 '+ plusIcon + '</td>';
				inputHTML += '<td onclick="headDel(\''+item.headno+'\',\'1\')">삭제 '+delIcon+'</td>';
			}
			inputHTML += '<td onclick="headDel(\''+item.headno+'\',\'2\')">완전삭제 '+completeDelIcon+"</td>";
			inputHTML += "</tr>";
		});
		inputListTableBody.innerHTML = inputHTML;
		document.getElementById("inputHeadPlus").style.display = "none";
    	document.getElementById("headPlusBtn").style.display = "none";
    	document.getElementById("headBtn").style.display = "block";
    	document.getElementById("deptPlusBtn").style.display = "none";
    	document.getElementById("cancelBtn").style.display = "none";
	});
}

//headAndDeptManage.jsp
function deptPlus(headno){
	if(document.getElementById("inputDeptPlus").style.display == "inline-block"||document.getElementById("inputHeadPlus").style.display == "inline-block"){
		alert("한번에 하나만 추가 가능합니다.");
		return;
	}
    document.getElementById("inputDeptPlus").style.display = "inline-block";
    document.getElementById("deptPlusBtn").style.display = "inline-block";
    document.getElementById("cancelBtn").style.display = "inline-block";
    document.getElementById("headBtn").style.display = "none";
    document.getElementById("inputHeadPlus").style.display = "none";
    document.getElementById("headPlusBtn").style.display = "none";
    
    document.getElementById("deptPlusBtn").addEventListener("click", function(){
        okDeptPlus(headno);
    })
}

//headAndDeptManage.jsp
function okDeptPlus(headno){
	let dname = document.getElementById("inputDeptPlus").value;
	if(dname == ""){
		alert("부서명을 입력해주세요");
	    return;
	}else{
		fetch("./insertDept.do", {
			method:"POST",
			headers: { "Content-Type": "application/json" },
			body:JSON.stringify({
				headno:headno,
				dname:dname
			})
		})
		.then(data => data.json())
		.then(result => {
			console.log(result);
			if(result.isc == "same"){
				alert("같은 이름이 존재합니다");
			}else if(result.isc == "fail"){
				alert("부서 등록에 실패하였습니다");
			}else if(result.isc == "success"){
				alert("부서 등록에 성공하였습니다");
				window.location.reload();
			}
		});
		document.getElementById("inputDeptPlus").value = "";
		document.getElementById("inputDeptPlus").style.display = "none";
	    document.getElementById("deptPlusBtn").style.display = "none";
	    document.getElementById("inputHeadPlus").style.display = "none";
		document.getElementById("headPlusBtn").style.display = "none";
		document.getElementById("cancelBtn").style.display = "none";
	    document.getElementById("headBtn").style.display = "block";
	}
}

function cancelPlus(){
	document.getElementById("inputDeptPlus").style.display = "none";
	document.getElementById("deptPlusBtn").style.display = "none";
	document.getElementById("inputHeadPlus").style.display = "none";
	document.getElementById("headPlusBtn").style.display = "none";
	document.getElementById("cancelBtn").style.display = "none";
	document.getElementById("headBtn").style.display = "block";
}


//headAndDeptManage.jsp
function editHeadName(element){
	var okIcons = document.querySelectorAll(".okIcon");
	okIcons.forEach(function(okicon){
		if(okicon.style.display == 'block'){
			alert("이름은 한번에 하나만 수정 가능합니다");
			document.getElementsByClassName('editIcon')[rowIndex-1].style = "display : block;"
			okicon.style.display = "none;"
			return;
		}
	})
	var table = element.closest('table');
	var rowIndex = Array.from(table.querySelectorAll('tr')).indexOf(element.closest('tr'));
	document.getElementsByClassName('hname')[rowIndex-1].removeAttribute('disabled');
	document.getElementsByClassName('hname')[rowIndex-1].focus();
	document.getElementsByClassName('editIcon')[rowIndex-1].style = "display : none;"
	document.getElementsByClassName('okIcon')[rowIndex-1].style = "display : block;"
	
}

//headAndDeptManage.jsp
function okHeadName(element, headno){
	var table = element.closest('table');
	var rowIndex = Array.from(table.querySelectorAll('tr')).indexOf(element.closest('tr'));
	var updateHeadname = document.getElementsByClassName('hname')[rowIndex-1].value;
	fetch("./updateHeadName.do", {
		method:"POST",
		headers: { "Content-Type": "application/json" },
		body:JSON.stringify({
			headno:headno,
			hname : updateHeadname
		})
	})
	.then(data => data.json())
	.then(result => {
		if(result.isc == "same"){
			alert("같은 이름으로 변경 불가합니다");
		}else if(result.isc == "fail"){
			alert("이름 수정이 실패하였습니다")
		}
		document.getElementsByClassName('hname')[rowIndex-1].setAttribute('disabled','disabled');
		document.getElementsByClassName('editIcon')[rowIndex-1].style = "display : block;"
		document.getElementsByClassName('okIcon')[rowIndex-1].style = "display : none;"
	});
}

//headAndDeptManage.jsp
function editDeptName(element){
	var HeadListTableBodyLength = document.getElementsByClassName("HeadListTableBody").length;
	var table = element.closest('table');
	var rowIndex = Array.from(table.querySelectorAll('tr')).indexOf(element.closest('tr'));
	document.getElementsByClassName('dname')[rowIndex-1- HeadListTableBodyLength].removeAttribute('disabled');
	document.getElementsByClassName('dname')[rowIndex-1- HeadListTableBodyLength].focus();
	document.getElementsByClassName('editIcon')[rowIndex-1].style = "display : none;"
	document.getElementsByClassName('okIcon')[rowIndex-1].style = "display : block;"
}


//headAndDeptManage.jsp
function okDeptName(element, deptno){
	console.log(deptno);
	var HeadListTableBodyLength = document.getElementsByClassName("HeadListTableBody").length;
	var table = element.closest('table');
	var rowIndex = Array.from(table.querySelectorAll('tr')).indexOf(element.closest('tr'));
	var updateDeptname = document.getElementsByClassName('dname')[rowIndex-1- HeadListTableBodyLength].value;
	fetch("./updateDeptName.do", {
		method:"POST",
		headers: { "Content-Type": "application/json" },
		body:JSON.stringify({
			deptno:deptno,
			dname : updateDeptname
		})
	})
	.then(data => data.json())
	.then(result => {
		if(result.isc == "same"){
			alert("같은 이름으로 변경 불가합니다");
		}else if(result.isc == "fail"){
			alert("이름 수정이 실패하였습니다")
		}
		document.getElementsByClassName('dname')[rowIndex-1 - HeadListTableBodyLength].setAttribute('disabled','disabled');
		document.getElementsByClassName('editIcon')[rowIndex-1].style = "display : block;"
		document.getElementsByClassName('okIcon')[rowIndex-1].style = "display : none;"
	});
}


function headRecycle(headno){
	console.log(headno);
	location.href="./headRecycle.do?headno="+headno;
}

function headDel(headno, val){
	console.log(headno, val);
	var confirmResult = confirm("정말 삭제 하시겠습니까?");
	if(confirmResult){
		fetch("./headDel.do", {
			method:"POST",
			headers: { "Content-Type": "application/json" },
			body:JSON.stringify({
				headno:headno,
				val : val
			})
		})
		.then(data => data.json())
		.then(result => {
			if(result.isc == "dept"){
				alert("해당 본부 아래에 존재하는 부서가 있습니다");
			}else if(result.isc == "delSuccess"){
				alert("삭제가 완료되었습니다 \n다시 복구하여 이름을 재사용 할 수 있습니다");
			}else if(result.isc == "deleteSuccess"){
				alert("완전히 삭제되었습니다");
			}else{
				alert("해당 본부 아래에 완전히 삭제되지 않은 부서가 있습니다");
			}
			window.location.reload();
		});
	}
}



function deptRecycle(element, deptno){
	var delIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>';
    fetch("./deptRecycle.do?deptno="+deptno)
    .then(data => data.text())
    .then(result => {
		if(result>0){
			alert("복구가 완료되었습니다");
			var trElement = element.closest('tr');
			if (trElement) {
			    var tdElement = trElement.querySelector('.recycleIcon');
			    if (tdElement) {
			        tdElement.classList.remove('recycleIcon');
			        tdElement.classList.add('delIcon');
			        tdElement.setAttribute('onclick', "deptDel(this,"+deptno+", '1')");
			        tdElement.innerHTML = '삭제 '+delIcon;
			    }
			}
		}
    });
}




function deptDel(element, deptno, val){
	var recycleIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-refresh-cw"><polyline points="23 4 23 10 17 10"></polyline><polyline points="1 20 1 14 7 14"></polyline><path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path></svg>';
	console.log(deptno, val);
	var confirmResult = confirm("정말 삭제 하시겠습니까?");
	if(confirmResult){
		fetch("./deptDel.do", {
			method:"POST",
			headers: { "Content-Type": "application/json" },
			body:JSON.stringify({
				deptno:deptno,
				val : val
			})
		})
		.then(data => data.json())
		.then(result => {
			if(result.isc == "emp"){
				alert("해당 본부 아래에 존재하는 직원이 있습니다");
			}else if(result.isc == "delSuccess"){
				alert("삭제가 완료되었습니다 \n다시 복구하여 이름을 재사용 할 수 있습니다");
				var trElement = element.closest('tr');
				if (trElement) {
				    var tdElement = trElement.querySelector('.delIcon');
				    if (tdElement) {
				        tdElement.classList.remove('delIcon');
				        tdElement.classList.add('recycleIcon');
				        tdElement.setAttribute('onclick', "deptRecycle(this,"+deptno+")");
				        tdElement.innerHTML = '복구 '+recycleIcon;
				    }
				}
			}else if(result.isc == "deleteSuccess"){
				alert("완전히 삭제되었습니다");
				var trElement = element.closest('tr');
				if (trElement) {
				    var tdElement = trElement.querySelector('.allDelIcon');
				    if (tdElement) {
				        tdElement.classList.remove('allDelIcon');
				        tdElement.classList.remove('delIcon');
				        tdElement.classList.remove('recycleIcon');
				        tdElement.classList.remove('okIcon');
				        tdElement.classList.remove('editIcon');
				        trElement.style.display = "none";
				    }
				}
			}else{
				alert("삭제에 실패하였습니다");
			}
		});
	}
}