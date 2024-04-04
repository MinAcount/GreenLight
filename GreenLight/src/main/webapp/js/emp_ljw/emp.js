function profileUpload(input) {
    if (!input.files || !input.files[0]) {
        input.value = '';
        document.getElementById('preview').src = 'assets/img/illustrations/profiles/profile-2.png';
        return;
    }

    console.log(input.files[0]);
    if (input.files[0].size > 500 * 1024) {
        alert("500KB 이하의 사진만 가능합니다.");
        input.value = '';
        document.getElementById('preview').src ='assets/img/illustrations/profiles/profile-2.png';
        return;
    }
    
    var fileExtension = input.files[0].name.split(".").pop().toLowerCase();
    if(fileExtension != 'png' && fileExtension != 'jpeg' && fileExtension != 'jpg' && fileExtension != 'gif'){
        input.value = '';
        document.getElementById('preview').src ='assets/img/illustrations/profiles/profile-2.png';
        alert("이미지 파일만 업로드 가능합니다.");
        return;
    }

    var reader = new FileReader();
    reader.onload = function(e) {
        document.getElementById('preview').src = e.target.result;
    };

    reader.readAsDataURL(input.files[0]);
}


//employeeAddForm.jsp
function checkUploadEmployee(){
	var profileInput = document.getElementById("profile");
	var name = document.getElementById("name").value;
	var gender = document.getElementById("gender").value;
	var deptno = document.getElementById("deptno").value;
	var join_day = document.getElementById("litepickerSingleDate").value;
	var spot = document.getElementById("spot").value;
	var etype = document.getElementById("etype").value;
	var email = document.getElementById("email").value;
	var address = document.getElementById("address").value;
	var phone = document.getElementById("phone").value;
	var birthday = document.getElementById("litepicker").value;

	const phoneREX = /^[0-9]+$/;
	const emailREX = /^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$/;
	
	if(name == "" || join_day == "" || email == "" || phone == ""){
		alert("필수사항을 모두 입력해주세요");
	}else if(!phoneREX.test(phone)){
		alert("전화번호는 숫자만 가능합니다");
	}else if(!emailREX.test(email)){
		alert("이메일 형식에 맞게 입력해주세요");
	}else if(new Date(join_day)>new Date() || new Date(birthday)>new Date()){
		alert("날짜는 오늘보다 늦은 날짜를 선택할 수 없습니다");
	}else{
		var formData = new FormData();
		if (profileInput.files.length > 0) {
		    var profile = profileInput.files[0];
		    formData.append("profile", profile);
		}else{
			formData.append("profile", "");
		}
		formData.append("name",name);
		formData.append("gender",gender);
		formData.append("deptno",deptno);
		formData.append("join_day",join_day);
		formData.append("spot",spot);
		formData.append("etype",etype);
		formData.append("email",email);
		formData.append("address",address);
		formData.append("phone",phone);
		formData.append("birthday",birthday);
		
		fetch("./employeeAdd.do",{
			method: 'POST',
			body: formData,
		})
		.then(data => data.json())
		.then(result =>{
			if(result.msg == "success"){
				alert("성공적으로 추가되었습니다");
			}else{
				alert("직원 등록에 실패하였습니다");
			}
			location.href="./employeeList.do";
		});
	}
}


//modifyPassword.jsp
function openPassword(val){
	var openEye0 = document.getElementsByClassName('openEye')[0];
	var openEye1 = document.getElementsByClassName('openEye')[1];
	var openEye2 = document.getElementsByClassName('openEye')[2];
	var closeEye0 = document.getElementsByClassName('closeEye')[0];
	var closeEye1 = document.getElementsByClassName('closeEye')[1];
	var closeEye2 = document.getElementsByClassName('closeEye')[2];
	var currentPassword = document.getElementById('currentPassword');
	var newPassword = document.getElementById('newPassword');
	var confirmPassword = document.getElementById('confirmPassword');
	if(val == '0'){
		closeEye0.style = "position: absolute; top:30%; left:90%; display: block;";
		openEye0.style = "display:none";
		currentPassword.type = "text";
	}else if(val == '1'){
		closeEye1.style = "position: absolute; top:51%; left:90%; display: block;";
		openEye1.style = "display:none";
		newPassword.type = "text";
	}else if(val == '2'){
		closeEye2.style = "position: absolute; top:71%; left:90%; display: block;";
		openEye2.style = "display:none";
		confirmPassword.type = "text";
	}
}
//modifyPassword.jsp
function closePassword(val){
	var openEye0 = document.getElementsByClassName('openEye')[0];
	var openEye1 = document.getElementsByClassName('openEye')[1];
	var openEye2 = document.getElementsByClassName('openEye')[2];
	var closeEye0 = document.getElementsByClassName('closeEye')[0];
	var closeEye1 = document.getElementsByClassName('closeEye')[1];
	var closeEye2 = document.getElementsByClassName('closeEye')[2];
	var currentPassword = document.getElementById('currentPassword');
	var newPassword = document.getElementById('newPassword');
	var confirmPassword = document.getElementById('confirmPassword');
	if(val == '0'){
		closeEye0.style = "display:none";
		openEye0.style = "position: absolute; top:30%; left:90%; display: block;";
		currentPassword.type = "password";
	}else if(val == '1'){
		closeEye1.style = "display:none";
		openEye1.style = "position: absolute; top:51%; left:90%; display: block;";
		newPassword.type = "password";
	}else if(val == '2'){
		closeEye2.style = "display:none";
		openEye2.style = "position: absolute; top:71%; left:90%; display: block;";
		confirmPassword.type = "password";
	}
}
//modifyPassword.jsp
function modifyPassword(){
	var currentPassword = document.getElementById('currentPassword').value;
	var newPassword = document.getElementById('newPassword').value;
	var confirmPassword = document.getElementById('confirmPassword').value;
	var passwordCheckId = document.getElementById('sessionId').value;
	
	
	
	const reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$/;
	const spaceNo = /\s/g;
	
	if(currentPassword == "" || newPassword == "" || confirmPassword == ""){
		alert("모든 사항을 입력해주세요");
	}else if(newPassword != confirmPassword){
		alert("입력하신 비밀번호와 확인하신 비밀번호가 다릅니다.");
	}else if(currentPassword == newPassword){
		alert("새로운 비밀번호는 기존의 비밀번호와 달라야 합니다.");
	}else if(newPassword.match(spaceNo)){
		alert("비밀번호에 공백은 들어갈 수 없습니다.");
	}else if(!reg.test(newPassword)){
		alert("비밀번호는 최소 6자이상이고, 최소한 하나 이상의 영문자, 숫자, 특수문자를 포함해야 합니다.");
	}else{
		fetch('./passwordCheck.do', {
			method: 'POST',
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify({
				id: passwordCheckId,
				password: currentPassword,
				confirmPassword: confirmPassword
			}),
		})
		.then(data => data.json())
		.then(result => {
			console.log(result);
			if (result.msg == 'SUCCESS') {
				alert("비밀번호 수정이 완료되었습니다.");
				location.href="./mypage.do";
			}else if (result.msg == 'FAIL'){
				alert("기존 비밀번호가 맞지 않습니다.");
			}else if (result.msg == 'UPDATEFAIL'){
				alert("비밀번호 변경에 실패하였습니다");
			}
		});
	}
} 

//employeeList.jsp
function selectByStatus(val,gubun){
	fetch("./employeeListByEstatus.do", {
		method:"POST",
		body:val,
	})
	.then(data => data.json())
	.then(result => {
		if(gubun == 'emp'){
			updateList(result);
		}else if(gubun == 'doc'){
			updateDocList(result);
		}
	});
}

function updateList(result) {
	var inputTableBody = document.getElementById("inputTableBody");
    var tableHTML = '';
    inputTableBody.innerHTML = '';
    var count = 1;
    result.list.forEach(function (item) {
		document.querySelector("#selectEstatus .nav-link.active").innerText = document.querySelector("#selectEstatus .nav-link.active").innerText.split("(")[0].trim() + "("+count+")";
        tableHTML += "<tr onclick=\"location.href='./employeeOne.do?id=" + item.id + "'\">";
        tableHTML += "<td style='text-align: center;'>" + count + "</td>";
        tableHTML += "<td>" + item.id + "</td>";
		result.deptList.forEach(function(deptVo) {
		    if (deptVo.deptno == item.deptno) {
		        tableHTML += "<td>" + deptVo.dname + "</td>";
		    }
		});
        tableHTML += "<td>" + item.name + "</td>";
        tableHTML += "<td>" + item.spot + "</td>";
        tableHTML += "<td>" + (item.position ? item.position : '-') + "</td>";
        tableHTML += "<td>" + (item.estatus == 'Y' ? '재직중' : '퇴사') + "</td>";
        tableHTML += "</tr>";
        count++;
    });
    inputTableBody.innerHTML = tableHTML;
}

function updateDocList(result) {
	var inputTableBody = document.getElementById("inputTableBody");
    var tableHTML = '';
    inputTableBody.innerHTML = '';
    var count = 1;
    result.list.forEach(function (item) {
		document.querySelector("#selectEstatus .nav-link.active").innerText = document.querySelector("#selectEstatus .nav-link.active").innerText.split("(")[0].trim() + "("+count+")";
        tableHTML += "<tr onclick=\"openFileList('"+item.id+"', '"+item.name+"')\" data-bs-toggle='modal' data-bs-target='#fileListModal'>";
        tableHTML += "<td style='text-align: center;'>" + count + "</td>";
        tableHTML += "<td>" + item.id + "</td>";
		result.deptList.forEach(function(deptVo) {
		    if (deptVo.deptno == item.deptno) {
		        tableHTML += "<td>" + deptVo.dname + "</td>";
		    }
		});
        tableHTML += "<td>" + item.name + "</td>";
        tableHTML += "<td>" + item.spot + "</td>";
        tableHTML += "<td>" + (item.position ? item.position : '-') + "</td>";
        tableHTML += "<td>" + (item.estatus == 'Y' ? '재직중' : '퇴사') + "</td>";
        tableHTML += "</tr>";
        count++;
    });
    inputTableBody.innerHTML = tableHTML;
}

//employeeList.jsp
function searchEmployee(event){
	var option = document.querySelector("#searchOpt option:checked").value;
	var activeEstatus = document.querySelector("#selectEstatus .nav-link.active").getAttribute("value");
	var keyword = document.querySelector("#keyword").value;
	if(event.key == 'Enter'){
		if(keyword == ""){
			alert("조회할 키워드를 입력해주세요");
			return;
		}
		fetch("./searchEmployee.do",{
			method:"POST",
			headers:{"Content-type":"application/json"},
			body:JSON.stringify({
				opt:option,
				keyword:keyword
			})
		})
		.then(data => data.json())
		.then(result => {
			console.log(result);
			document.querySelector("#keyword").value = "";
			searchList(result, activeEstatus);
		});
	}
}

//employeeOneModify.jsp
function searchList(result, selectEstatus){
	console.log(selectEstatus);
	var inputTableBody = document.getElementById("inputTableBody");
    var tableHTML = '';
    inputTableBody.innerHTML = '';
    var count = 0;
    result.forEach(function (res) {
		res.empVo.forEach(function(item){
			if(selectEstatus == 'A'){
				tableHTML += "<tr onclick=\"location.href='./employeeOne.do?id=" + item.id + "'\">";
				tableHTML += "<td style='text-align: center;'>" + (count+1) + "</td>";
				tableHTML += "<td>" + item.id + "</td>";
				tableHTML += "<td>" + res.dname + "</td>";
				tableHTML += "<td>" + item.name + "</td>";
				tableHTML += "<td>" + item.spot + "</td>";
				tableHTML += "<td>" + (item.position ? item.position : '-') + "</td>";
				tableHTML += "<td>" + (item.estatus == 'Y' ? '재직중' : '퇴사') + "</td>";
				tableHTML += "</tr>";
				count++;
			}
			if(item.estatus == selectEstatus){
				tableHTML += "<tr onclick=\"location.href='./employeeOne.do?id=" + item.id + "'\">";
				tableHTML += "<td style='text-align: center;'>" + (count+1) + "</td>";
				tableHTML += "<td>" + item.id + "</td>";
				tableHTML += "<td>" + res.dname + "</td>";
				tableHTML += "<td>" + item.name + "</td>";
				tableHTML += "<td>" + item.spot + "</td>";
				tableHTML += "<td>" + (item.position ? item.position : '-') + "</td>";
				tableHTML += "<td>" + (item.estatus == 'Y' ? '재직중' : '퇴사') + "</td>";
				tableHTML += "</tr>";
				count++;
			}
			
		})
    });
	document.querySelector("#selectEstatus .nav-link.active").innerText = document.querySelector("#selectEstatus .nav-link.active").innerText.split("(")[0].trim() + "("+count+")";
    inputTableBody.innerHTML = tableHTML;
}

//employeeOneModify.jsp
function checkExitEmployee(val){
	document.getElementById("hidden_exit_day").style = "display:none;";
	document.getElementById("exit_day").style = "display:block;";
	if(val == 'N'){
		document.getElementById("litepickerDate").value = document.getElementById("hidden_exit_day").value;
		document.getElementById("updateExitDayBtn").style = "display:inline-block;";
		document.getElementById("checkExitDayBtn").style = "display:none;";
		document.getElementById("cancelBtn").style.display = "inline-block";
	}else if(val == 'Y'){
		document.getElementById("updateExitBtn").style = "display:inline-block;";
		document.getElementById("employeeExitBtn").style = "display:none;";
		document.getElementById("employeeModifyBtn").style = "display:none;";
		document.getElementById("cancelBtn").style.display = "inline-block";
	}
}

//employeeOneModify.jsp
function btnClean(){
	if(document.getElementById("hidden_exit_day").value != ""){
		document.getElementById("checkExitDayBtn").style = "display:block;";
		document.getElementById("updateExitDayBtn").style = "display:none;";
		document.getElementById("cancelBtn").style = "display:none";
		document.getElementById("exit_day").style = "display:none";
		document.getElementById("hidden_exit_day").style = "display:block";
	}else{
		document.getElementById("name").setAttribute("disabled","disabled");
		document.getElementById("hidden_deptno").style = "display:block";
		document.getElementById("deptno").style = "display:none";
		document.getElementById("hidden_spot").style = "display:block";
		document.getElementById("spot").style = "display:none";
		document.getElementById("hidden_etype").style = "display:block";
		document.getElementById("etype").style = "display:none";
		document.getElementById("email").setAttribute("disabled","disabled");
		document.getElementById("address").setAttribute("disabled","disabled");
		document.getElementById("phone").setAttribute("disabled","disabled");
		document.getElementById("hidden_join_day").style = "display:block";
		document.getElementById("hidden_exit_day").style = "display:block";
		document.getElementById("join_day").style = "display:none";
		document.getElementById("exit_day").style = "display:none";
		document.getElementById("modifyProfile").style = "display:none";
		document.getElementById("employeeModifyBtn").style = "display:inline-block";
		document.getElementById("employeeExitBtn").style = "display:inline-block";
		document.getElementById("updateEmployeeBtn").style = "display:none";
		document.getElementById("updateExitBtn").style = "display:none";
		document.getElementById("cancelBtn").style = "display:none";
	}
}

//employeeOneModify.jsp
function updateExitDay(id){
	var exit_day = document.getElementById("litepickerDate").value;
	var join_day = document.getElementById("hidden_join_day").value;
	if(new Date(exit_day)>new Date()){
		alert("날짜는 오늘보다 늦은 날짜를 선택할 수 없습니다");
	}else if(new Date(exit_day)<new Date(join_day)){
		alert("퇴사일이 입사일보다 먼저일 수 없습니다");
	}else{
		location.href="./updateExitDay.do?id="+id+"&exit_day="+exit_day;
		alert("퇴사일 수정이 완료되었습니다");
	}
}

//employeeOneModify.jsp
function updateExit(id){
	var exit_day = document.getElementById("litepickerDate").value;
	var join_day = document.getElementById("hidden_join_day").value;
	if(exit_day == ""){
		alert("퇴사일을 입력해주세요")
	}else if(new Date(exit_day)>new Date()){
		alert("날짜는 오늘보다 늦은 날짜를 선택할 수 없습니다");
	}else if(new Date(exit_day)<new Date(join_day)){
		alert("퇴사일이 입사일보다 먼저일 수 없습니다");
	}else{
		var name = document.getElementById("name").value;
		var confirmResult = confirm("정말 "+name+"님을 퇴사시키시겠습니까?");
		
		if(confirmResult){
			//결재대기중인 문서가 있다면 퇴사 불가 => fetch를 통해 확인하기
			fetch("./updateExit.do",{
				method:"POST",
				headers:{"Content-type": "application/json"},
				body:JSON.stringify({
					id:id,
					exit_day:exit_day
				})
			})
			.then(data => data.text())
			.then(result => {
				console.log(result);
				if(result == "success"){
					alert(name+"님이 퇴사 처리되었습니다")
				}else if(result == "appr"){
					alert(name+"의 결재대기중인 문서가 있습니다 \n결재완료 후 퇴사처리를 진행해주세요");
				}else{
					alert("퇴사 처리에 실패하였습니다");
				}
				location.href='./employeeOne.do?id='+id;
			})
		}
	}
}

//employeeOneModify.jsp
function checkModifyEmployee(){
	document.getElementById("name").removeAttribute("disabled");
	document.getElementById("hidden_deptno").style = "display:none";
	document.getElementById("deptno").style = "display:block";
	document.getElementById("hidden_spot").style = "display:none";
	document.getElementById("spot").style = "display:block";
	document.getElementById("hidden_etype").style = "display:none";
	document.getElementById("etype").style = "display:block";
	document.getElementById("email").removeAttribute("disabled");
	document.getElementById("address").removeAttribute("disabled");
	document.getElementById("phone").removeAttribute("disabled");
	document.getElementById("hidden_join_day").style = "display:none";
	document.getElementById("litepickerSingleDate").value = document.getElementById("hidden_join_day").value;
	document.getElementById("litepickerSingleDate").placeholder = document.getElementById("hidden_join_day").value;
	document.getElementById("join_day").style = "display:block";
	document.getElementById("modifyProfile").style = "display:block";
	document.getElementById("employeeModifyBtn").style = "display:none";
	document.getElementById("employeeExitBtn").style = "display:none";
	document.getElementById("updateEmployeeBtn").style = "display:inline-block";
	document.getElementById("cancelBtn").style = "display:inline-block";

	var deptno = document.getElementById("deptno");
	var spot = document.getElementById("spot");
	var etype = document.getElementById("etype");
	for (var i = 0; i < deptno.options.length; i++) {
	    if (deptno.options[i].innerText == document.getElementById("hidden_deptno").value) {
	        deptno.options[i].selected = "selected";
	        break;
	    }
	}
	for (var i = 0; i < spot.options.length; i++) {
	    if (spot.options[i].innerText == document.getElementById("hidden_spot").value) {
	        spot.options[i].selected = "selected";
	        break;
	    }
	}
	for (var i = 0; i < etype.options.length; i++) {
	    if (etype.options[i].innerText == document.getElementById("hidden_etype").value) {
	        etype.options[i].selected = "selected";
	        break;
	    }
	}
}

//employeeOneModify.jsp
function updateEmployee(id){
	var name = document.getElementById("name").value;
	var deptno = document.getElementById("deptno").value;
	var spot = document.getElementById("spot").value;
	var etype = document.getElementById("etype").value;
	var email = document.getElementById("email").value;
	var address = document.getElementById("address").value;
	var phone = document.getElementById("phone").value;
	var join_day = document.getElementById("litepickerSingleDate").value;
	var profileInput = document.getElementById("profile");
	
	const phoneREX = /^[0-9]+$/;
	const emailREX = /^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$/;
	
	
	if(name == "" || join_day == "" || email == "" || phone == ""){
		alert("필수사항을 모두 입력해주세요");
	}else if(!phoneREX.test(phone)){
		alert("전화번호는 숫자만 가능합니다");
	}else if(!emailREX.test(email)){
		alert("이메일 형식에 맞게 입력해주세요");
	}else if(new Date(join_day)>new Date()){
		alert("날짜는 오늘보다 늦은 날짜를 선택할 수 없습니다");
	}else{
		var formData = new FormData();
		if (profileInput.files.length > 0) {
            var profile = profileInput.files[0];
            formData.append("profile", profile);
		}
		        
		formData.append("id",id);
		formData.append("name",name);
		formData.append("deptno",deptno);
		formData.append("spot",spot);
		formData.append("etype",etype);
		formData.append("email",email);
		formData.append("address",address);
		formData.append("phone",phone);
		formData.append("join_day",join_day);
		
		fetch("./employeeUpdate.do",{
			method: 'POST',
			body: formData,
		})
		.then(data => data.json())
		.then(result =>{
			if(result.msg == "success"){
				alert("성공적으로 수정되었습니다");
			}else{
				alert("직원 수정에 실패하였습니다");
			}
			location.href="./employeeOne.do?id="+id;
		});
	}
}

//employeeOneModify.jsp
function passwordReset(id){
	var name = document.getElementById("name").value;
	var confirmResult = confirm(name+"님의 비밀번호를 초기화 하시겠습니까?");
	if(confirmResult){
		fetch("./passwordReset.do",{
				method: 'POST',
				body: id,
			})
			.then(data => data.text())
			.then(result =>{
				if(result == 'fail'){
					alert("비밀번호 초기화에 실패하였습니다");
				}else{
					alert("비밀번호는 "+result+" 입니다\n수정을 권장합니다");
				}
			});
	}
}

//employeeDocument.jsp
function openFileList(val, name){
	console.log(val);
	fetch("./getOneEmpFile.do", {
		method: 'POST',
		headers:{"content-type":"application/json"},
		body: JSON.stringify({
			id:val,
			start:'03',
			end:'06'
		}),
	})
	.then(data => data.json())
	.then(result => {
		document.getElementById("exampleModalLabel").innerText = name + "님의 인사서류";
		modalOpen(result, val, name);
	});
}

function modalOpen(result, val, name){
	var empFileTableBody = document.getElementById("empFileTableBody");
    var tableHTML = '';
    empFileTableBody.innerHTML = '';
    result.forEach(function(item){
	    tableHTML += "<tr>";
		tableHTML += "<td style='text-align: center;' class='code_name'>"+item.comVo.code_name+"</td>";
	    tableHTML += "<td style='text-align: center;' class='docUpload'>" + (item.stored_name != null ? item.stored_name +" "+
	    				'<svg onclick=\"fileDownload('+val+','+item.ftype+')\" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-download"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg>' : "-") + "</td>";
	    tableHTML += "<td style='text-align: center;' class='gubunBtn'>" + 
             (item.stored_name != null ? 
              "<button type='button' class='btn btn-danger' onclick=\"empFileDel('"+item.ref_id+"','"+item.ftype+"','"+name+"')\">삭제</button>" : 
              "<label for='fileInput_"+val+"_"+item.comVo.code+"' class='btn btn-primary'>등록<input id='fileInput_"+val+"_"+item.comVo.code+"' accept='image/jpeg, image/jpg, image/png, image/gif, .pdf, .hwp' type='file' style='display: none;' onchange=\"empFileUpload(this.files[0],'"+val+"','"+item.comVo.code+"')\"></label>"+
              "<button type='button' style='display:none;' class='btn btn-info' onclick=\"empFileInsert('"+val+"','"+item.comVo.code+"','"+name+"')\">완료</button>") + 
             "</td>";
	    tableHTML += "</tr>";
	    empFileTableBody.innerHTML = tableHTML;
    });
}

function empFileDel(id, type, name){
	console.log(id);
	console.log(type);
	var confirmResult = confirm("정말 삭제하시겠습니까?\n삭제하신 파일은 복구할 수 없습니다");
	if(confirmResult){
		fetch("./empFileDel.do",{
			method : "POST",
			headers : {"content-type" : "application/json"},
			body : JSON.stringify({
				id:id,
				ftype:type
			})
		})
		.then(data => data.json())
		.then(result => {
			console.log(result);
			if(result.isc == 'fail'){
				alert("삭제에 실패하였습니다");
			}else{
				alert("정상적으로 삭제되었습니다");
				modalOpen(result, id, name);
			}
		})
	}
}

function empFileUpload(file, id, type){
	var fileExtension = file.name.split(".")[1];
	if(fileExtension != 'png' && fileExtension != 'jpeg' && fileExtension != 'jpg' && fileExtension != 'gif' && fileExtension != 'hwp' && fileExtension != 'pdf'){
		alert("정해진 파일이 아닙니다");
		document.getElementById("fileInput_"+id+"_"+type).value = '';
		return;
	}
	var fileInput = document.getElementById("fileInput_"+id+"_"+type).closest("tr");
	fileInput.querySelector(".docUpload").innerText = file.name;
	fileInput.querySelector(".btn-primary").style.display = "none";
	fileInput.querySelector(".btn-info").style.display = "inline-block";
	var buttons = document.querySelectorAll("input[type = file]");
	var buttonss = document.querySelectorAll(".btn-danger");
	for (var i = 0; i < buttons.length; i++) {
		if (!buttons[i].classList.contains("btn-info")) {
			buttons[i].setAttribute("disabled", "disabled");
		}
	}
	for (var i = 0; i < buttonss.length; i++) {
		if (!buttonss[i].classList.contains("btn-info")) {
			buttonss[i].setAttribute("disabled", "disabled");
		}
	}
	console.log(fileInput);
}

function empFileInsert(id, type, name){
	console.log(id);
	console.log(type);
	document.getElementById("fileInput_"+id+"_"+type).removeAttribute("disabled");
	var fileStoredName = document.getElementById("fileInput_"+id+"_"+type).closest("tr").querySelector(".code_name").innerText;
	var fileInput = document.getElementById("fileInput_"+id+"_"+type).files[0];
	var fileExtension = fileInput.name.split(".")[1];
	var fileData = new FormData();
	fileData.append("payload", fileInput);
	fileData.append("ref_id", id);
	fileData.append("ftype", type);
	fileData.append("origin_name", fileInput.name);
	fileData.append("stored_name", name+"_"+fileStoredName+"."+fileExtension);
	fileData.append("fsize", fileInput.size);
	
	fetch("./empFileInsert.do", {
		method: 'POST',
		body: fileData,
	})
	.then(data => data.json())
	.then(result => {
		console.log(result);
		if(result.isc == 'fail'){
			alert("등록에 실패하였습니다");
		}else{
			alert("정상적으로 등록되었습니다");
			modalOpen(result, id, name);
			checkFile();
		}
	});
}

function fileDownload(val, type){
	let ftype = String(type).padStart(2, '0');
	console.log(val);
	console.log(ftype);
	location.href = "./empFileDownload.do?id="+val+"&ftype="+ftype;
}

window.onload = function(){
	checkFile();
}

function checkFile(){
	var empIdList = [];
	var allEmp = document.querySelectorAll(".empId");
	var empFileList = document.querySelectorAll(".empFileList");
	allEmp.forEach(function(eachEmp){
		empIdList.push(eachEmp.innerText);
	})
	console.log(empIdList);
	fetch("./getAllEmpFile.do", {
		method: 'POST',
		headers:{"content-type":"application/json"},
		body: JSON.stringify({
			ids:JSON.stringify({empIdList}),
			start:'03',
			end:'06'
		}),
	})
	.then(data => data.json())
	.then(result => {
		console.log(result);
		for(let i=0; i<result.length; i++){
			for(let j=0; j<4; j++){
				if(((result[i])[j]).payload != null){
					empFileList[i].querySelectorAll(".file")[j].style = "color:green; font-size:12px; font-weight:bold;";
				}
			}
		}
	});
}