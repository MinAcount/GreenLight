

function checkUploadEmployee(){
	console.log("Employee Add in");
}


function openPassword(val){
	console.log(val);
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

function closePassword(val){
	console.log(val);
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

function modifyPassword(){
	console.log("비밀번호 수정 전 체크");
	var currentPassword = document.getElementById('currentPassword').value;
	var newPassword = document.getElementById('newPassword').value;
	var confirmPassword = document.getElementById('confirmPassword').value;
	
	const reg = /[0-9a-zA-Z]/;
	
	if(currentPassword == "" || newPassword == "" || confirmPassword == ""){
		alert("모든 사항을 입력해주세요");
	}else if(newPassword != confirmPassword){
		alert("입력하신 비밀번호와 확인하신 비밀번호가 다릅니다.");
	}else if(currentPassword == newPassword){
		alert("새로운 비밀번호는 기존의 비밀번호와 달라야 합니다.");
	}else if(newPassword.length < 6 || reg.test(newPassword) == false){
		alert("비밀번호는 최소 6자이상이고, 최소한 하나 이상의 영문자, 숫자, 특수문자를 포함해야 합니다.");
	}
} 