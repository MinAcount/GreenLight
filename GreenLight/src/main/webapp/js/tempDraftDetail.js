document.addEventListener('DOMContentLoaded', function() {


	var sessionId = document.getElementById("loginVo_id").value;
	fetch("./autoAppr.do?sessionId=" + sessionId + "&tempcode=" + document.getElementById("tempCode").value)
		.then(response => response.json())
		.then(data => {
			console.log("data", data);

			var autoApprHtml = $("#apr_chk").html();
			console.log("--------------------------");
			var ids = new Array();
			ids.push(data[0].empVo[0].id);
			autoApprHtml += "<div class='apr_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;' name='aprDone'>" + data[0].empVo[0].name + " " + data[0].comVo.code_name +
				"<input type='hidden' class='autoAppr' name='id' value='" + data[0].empVo[0].id + "'>" +
				"</div>";

			$("#apprJstree").jstree().hide_node(data[0].empVo[0].id);

			data.forEach(function(list) {
				console.log("data2 foreach");
				ids.forEach(function(id) {
					console.log("ids", ids);
					if (list.empVo[0].id != id || id == null) {
						console.log("list.empVo.id", list.empVo[0].id);
						ids.push(list.empVo[0].id);
						autoApprHtml += "<div class='apr_row' style='display:flex; flex-direction:row; justify-content:center; margin-top:10px;' name='aprDone'>" + list.empVo[0].name + " " + list.comVo.code_name +
							"<input type='hidden' class='autoAppr' name='id' value='" + list.empVo[0].id + "'>" +
							"</div>";
						$("#apprJstree").jstree().hide_node(list.empVo[0].id);
					}
				});
			});
			$("#apr_chk").html(autoApprHtml);

			var apprLine = document.getElementById("apr_chk");

			var chkAppr = document.getElementById("chkAppr");
			var chkApprClone1 = apprLine.cloneNode(true);
			var apprCloneList = Array.from(chkApprClone1.querySelectorAll(".apr_row"));

			while (chkAppr.firstChild) {
				chkAppr.firstChild.remove();
			}

			apprCloneList.forEach(function(item) {
				chkAppr.appendChild(item);
			});

		})
		.catch(error => {
			console.error('오류 발생:', error);
		});

	//사용자에 의해 선택된 시작일, 종료일이 같다면 id가 인 checkbox는 비활성화
	if (formattedStartDate == formattedEndDate) {
		console.log("종료일 비활성화")
		document.querySelector("#end_day_half").disabled = true;
		let start_day_half_div = document.querySelector("#start_day_half").parentElement;
		let start_day_half_checkbox = start_day_half_div.querySelector("input[type='checkbox']");
		start_day_half_checkbox.addEventListener("change", function() {
			if (start_day_half_checkbox.checked) {
				let start_day_half_radios = start_day_half_div.querySelectorAll("input[type='radio']");
				for (let i = 0; i < start_day_half_radios.length; i++) {
					start_day_half_radios[i].addEventListener("change", function() {
						if (start_day_half_radios[i].checked) {
							getsu -= 0.5;
							document.getElementById("getsu").textContent = getsu - weekendCount;
						}
					})
				}
			} else {
				getsu += 0.5;
				document.getElementById("getsu").textContent = getsu - weekendCount;
			}
		})
	} else { // 시작일 - 오후만, 종료일 - 오전만 체크 가능
		document.querySelector("#end_day_half").disabled = false;
		console.log("시작일 - 오후, 종료일 - 오전만 체크가능")
		// 시작일
		let start_day_half_div = document.querySelector("#start_day_half").parentElement;
		//					console.log("start_day_half_div:",start_day_half_div);
		let start_day_half_checkbox = start_day_half_div.querySelector("input[type='checkbox']");
		//					console.log("start_day_half_checkbox:",start_day_half_checkbox);
		start_day_half_checkbox.addEventListener("change", function() {
			if (start_day_half_checkbox.checked) {
				let start_day_half_radios = start_day_half_div.querySelectorAll("input[type='radio']");
				//							console.log("start_day_half_radios:",start_day_half_radios);
				start_day_half_radios[0].disabled = true;
				start_day_half_radios[1].addEventListener("change", function() {
					if (start_day_half_radios[1].checked) {
						getsu -= 0.5;
						console.log("getsu:", getsu)
						document.getElementById("getsu").textContent = getsu - weekendCount;
					}
				});
			} else {
				console.log("start checkbox 체크해제됨")
				getsu += 0.5;
				console.log("getsu:", getsu)
				document.getElementById("getsu").textContent = getsu - weekendCount;
			}
		})

		// 종료일
		let end_day_half_div = document.querySelector("#end_day_half").parentElement;
		let end_day_half_checkbox = end_day_half_div.querySelector("input[type='checkbox']");
		end_day_half_checkbox.addEventListener("change", function() {
			if (this.checked) {
				let end_day_half_radios = end_day_half_div.querySelectorAll("input[type='radio']");
				end_day_half_radios[1].disabled = true;
				end_day_half_radios[0].addEventListener("change", function() {
					if (end_day_half_radios[0].checked) {
						getsu -= 0.5;
						document.getElementById("getsu").textContent = getsu - weekendCount;
					}
				});
			} else {
				console.log("end checkbox 체크해제됨")
				getsu += 0.5;
				document.getElementById("getsu").textContent = getsu - weekendCount;
			}
		})
	}

})