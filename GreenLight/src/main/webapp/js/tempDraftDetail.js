$(function() {


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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			var start_day = document.getElementById("start_day").value;
	console.log("start_day", start_day);
	var end_day = document.getElementById("end_day").value;
	console.log("end_day", end_day);
	var getsu = 0;
			var weekendCount = 0;

			// dadtarangepicker를 위한 api를 적용
			$('#tempdaterangepicker').daterangepicker({
				"locale": {
					"format": "YYYY-MM-DD",
					"separator": " ~ ",
					"applyLabel": "확인",
					"cancelLabel": "취소",
					"fromLabel": "From",
					"toLabel": "To",
					"customRangeLabel": "Custom",
					"weekLabel": "W",
					"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
					"monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				},
				"startDate": start_day,
				"endDate": end_day,
				"drops": "down"
			}, function(start, end, label) {
				$('#start_day').val(start.format('YYYY-MM-DD'));
				$('#end_day').val(end.format('YYYY-MM-DD'));
				var halfStatus = document.getElementById("halfStatus");
				var halfStatusCheckboxes = halfStatus.querySelectorAll("input[type='checkbox']");
				halfStatusCheckboxes.forEach(function(halfStatusCheckbox){
					halfStatusCheckbox.checked = false;
					halfStatusCheckbox.parentElement.querySelectorAll("input[type='radio']").forEach(function(radio){
						radio.checked = false;
						radio.disabled = true;
						getsu = Math.floor(getsu_date / (1000 * 60 * 60 * 24)) + 1;

					})
				})
				
				console.log("============================================================== typeof start:", typeof start);
				console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');

				var start_date = new Date(start);
				var end_date = new Date(end);
				var formattedStartDate = start_date.getFullYear() + "-" + ("0" + (start_date.getMonth() + 1)).slice(-2) + "-" + ("0" + start_date.getDate()).slice(-2);
				var formattedEndDate = end_date.getFullYear() + "-" + ("0" + (end_date.getMonth() + 1)).slice(-2) + "-" + ("0" + end_date.getDate()).slice(-2);

				// 사용자에 의해 선택된 두 날짜 사이에 주말을 제외한 일수 
				var currentDate = new Date(start);
				while (currentDate <= end) {
					if (currentDate.getDay() === 0 || currentDate.getDay() === 6) {
						weekendCount += 1;
					}
					currentDate.setDate(currentDate.getDate() + 1);
				}
				console.log("weekendCount:", weekendCount);

				var getsu_date = end_date.getTime() - start_date.getTime();
				console.log("getsu_date", getsu_date);
				getsu = Math.floor(getsu_date / (1000 * 60 * 60 * 24)) + 1;
				console.log("getsu:", getsu);
				document.getElementById("getsu").textContent = parseInt(getsu) - weekendCount;
				console.log("start_date:", start_date);
				console.log("end_date:", end_date);

				//사용자에 의해 선택된 시작일, 종료일이 같다면 id가 인 checkbox는 비활성화
				if (formattedStartDate == formattedEndDate) {
					console.log("formattedStartDate",formattedStartDate);
					console.log("formattedEndDate",formattedEndDate);
					
					console.log("종료일 비활성화")
					var end_day_half = document.getElementById("end_day_half");
					console.log("end_day_half",end_day_half);
					end_day_half.disabled = true;
					let start_day_half_checkbox = document.getElementById("start_day_half");
					
					
					start_day_half_checkbox.addEventListener("change", function(){
						if(start_day_half_checkbox.checked){
							document.getElementsByName("start_day_half")[0].checked = true;
							getsu -= 0.5;
							document.getElementById("getsu").textContent = getsu - weekendCount;
							

						} else {
							let radios = document.getElementsByName("start_day_half");
							radios.forEach(function(radio){
								if(radio.checked){
									radio.checked = false;
								}
							})
							getsu += 0.5;
							document.getElementById("getsu").textContent = getsu - weekendCount;

						}
					})
					
				} else { // 시작일 - 오후만, 종료일 - 오전만 체크 가능
					document.querySelector("#end_day_half").disabled = false;
					console.log("시작일 - 오후, 종료일 - 오전만 체크가능")
					// 시작일
					//					let start_day_half_div = document.querySelector("#start_day_half").parentElement;
					//					console.log("start_day_half_div:",start_day_half_div);

					let start_day_half_checkbox = document.getElementById("start_day_half");
					console.log("start_day_half_checkbox:", start_day_half_checkbox);
					let end_day_half_checkbox = document.getElementById("end_day_half");
					console.log("end_day_half_checkbox:", end_day_half_checkbox);
					var start_day_half_radio = document.getElementsByName("start_day_half")[1];
					console.log("start_day_half_radio:", start_day_half_radio);
					var end_day_half_radio = document.getElementsByName("end_day_half")[0];
					console.log("end_day_half_radio:", end_day_half_radio);

					start_day_half_checkbox.addEventListener("change", function(){
						if (start_day_half_checkbox.checked) {
							document.getElementsByName("start_day_half")[0].disabled = true;
							console.log("오전 라디오 disabled")
							document.getElementsByName("start_day_half")[1].checked = true;
							getsu -= 0.5;
							console.log("시작일 체크박스 체크 & 라디오 체크")
							document.getElementById("getsu").textContent = getsu - weekendCount;
						} else if (!start_day_half_checkbox.checked) {
							let radios = document.getElementsByName("start_day_half");
							radios[1].checked = false;
							getsu += 0.5;
							console.log("시작일 체크박스 체크 해제 & 라디오 해제")
							document.getElementById("getsu").textContent = getsu - weekendCount;
						} 
						
					});
					end_day_half_checkbox.addEventListener("change", function(){
						if (end_day_half_checkbox.checked) {
							document.getElementsByName("end_day_half")[1].disabled = true;
							console.log("오전 라디오 disabled")
							document.getElementsByName("end_day_half")[0].checked = true;
							getsu -= 0.5;
							console.log("시작일 체크박스 체크 & 라디오 체크")
							document.getElementById("getsu").textContent = getsu - weekendCount;
						} else if (!end_day_half_checkbox.checked) {
							let radios = document.getElementsByName("end_day_half");
							radios[0].checked = false;
							getsu += 0.5;
							console.log("시작일 체크박스 체크 해제 & 라디오 해제")
							document.getElementById("getsu").textContent = getsu - weekendCount;

						} 
					});
//					start_day_half_radio.addEventListener("change", changeEvent);
//					end_day_half_radio.addEventListener("change", changeEvent);


				}
			});
			
			
			// 공가 선택시 신청연차 초기화
			document.querySelector("#getsuFlag").addEventListener("change", function() {
				console.log("getsuFlag()");
				console.log("this.value:", this.value);
				if (this.value == 'Y') {//공가
					console.log("공가선택")
					document.getElementById("getsu").textContent = '0';
				} else {
					console.log("연차선택")
					if (isNaN(parseInt(getsu))) {
						document.getElementById("getsu").textContent = 0;
					} else { // NaN - weekendCount는 NaN 이기 때문에 else문으로 처리한다
						document.getElementById("getsu").textContent = parseInt(getsu) - weekendCount;
					}
				}
			});

})