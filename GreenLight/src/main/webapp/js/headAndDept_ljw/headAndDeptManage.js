//headAndDeptManage.jsp
function selectHeadAndDept() {
    var gubun = document.getElementById("gubun");
    var selectedGubunVal = gubun.value;
    var headAndDeptInfoZone = document.getElementById("headAndDeptInfoZone");
    var headPlusBtn = document.getElementById("headPlusBtn");
    var inputListTableHead = document.getElementById("inputListTableHead");
    var HeadListTableBody = document.querySelectorAll(".HeadListTableBody");
    var DeptListTableBody = document.querySelectorAll(".DeptListTableBody");
    inputListTableHead.innerHTML = '';

    var headerHTML = '';
    if (selectedGubunVal == "No") {
        headAndDeptInfoZone.style.display = "none";
        headPlusBtn.style.display = "none";
    } else if (selectedGubunVal == "dept") {
        headAndDeptInfoZone.style.display = "block";
        headPlusBtn.style.display = "none";
        headerHTML += "<tr><th></th><th>본부명</th><th>부서명</th><th>부서장명</th><th>복구/삭제</th><th>완전삭제</th></tr>";
        HeadListTableBody.forEach(function(row) {
            row.style.display = "none";
        });
        DeptListTableBody.forEach(function(row) {
            row.style.display = "table-row";
        });
    } else if (selectedGubunVal == "head") {
        headAndDeptInfoZone.style.display = "block";
        headPlusBtn.style = "float: right; display:block;";
        headerHTML += "<tr><th></th><th>본부명</th><th>본부장명</th><th>부서추가</th><th>복구/삭제</th><th>완전삭제</th></tr>";
        HeadListTableBody.forEach(function(row) {
            row.style.display = "table-row"; 
        });
        DeptListTableBody.forEach(function(row) {
            row.style.display = "none";
        });
    }

    inputListTableHead.innerHTML = headerHTML;
}

//headAndDeptManage.jsp
function editHeadName(element, headno){
	console.log(headno);
	var table = element.closest('table');
	var rowIndex = Array.from(table.querySelectorAll('tr')).indexOf(element.closest('tr'));
	document.getElementsByClassName("hname")[rowIndex-1].removeAttribute("disabled");
	document.getElementsByClassName("editIcon")[rowIndex-1].innerHTML = "<i data-feather='check-circle'></i>";
}