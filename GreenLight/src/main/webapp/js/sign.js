var canvas = document.getElementById("signpad");
var signature = new SignaturePad(canvas, {
    minWidth: 2,
    maxWidth: 2,
    penColor: "rgb(0, 0, 0)"
}); // 펜 두께 색상 설정

var clear = document.querySelector("#clear");
clear.addEventListener("click", function() {
    console.log("작동");
    signature.clear();
});

var save = document.querySelector("#save");
save.addEventListener("click", function() {
    console.log("작동");
    var data = signature.toDataURL("image/png");
    var mainCheckbox = document.getElementById("mainCheckbox");
    var signData = {
        data: data,
        main: mainCheckbox.checked ? 'Y' : 'N'
    }
    if (signature.isEmpty()) {
        alert("내용이 없습니다.");
    } else {
        signData.data = data;
        console.log("sd",signData);
		fetch('./insertSign.do', {
		    method: "POST",
		    headers: {
		        "Content-Type": "application/json"
		    },
		    body: JSON.stringify(signData)
		})
		.then(response => {
		    console.log("res",response);
		    if (!response.ok) {
		        throw new Error("에러! :( ");
		    } else {
		    	self.close();
		    	window.opener.location.reload();
		        return response.json();
		    }
		})
		.then(data => {
		    console.log("da",data);
		    
		})
		.catch(err => { // 오류 발생시 오류를 담아서 보여줌
		    console.log('Fetch Error', err);
		});

    }
});
