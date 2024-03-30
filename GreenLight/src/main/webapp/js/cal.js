function showCurrentMonthCalendar() {
	var currentDate = new Date();
	var currentMonth = currentDate.getMonth() + 1;
	var currentYear = currentDate.getFullYear();
	var viewmonth = currentYear + '-' + ('0' + currentMonth).slice(-2);
	console.log("달력이 호출됨 : " + viewmonth);
	renderCalendar(viewmonth);
}

function renderCalendar(viewmonth) {
	var scheduleEl = document.getElementById('addSchedule');

	var calendar = new FullCalendar.Calendar(scheduleEl, {
		// FullCalendar 설정
		googleCalendarApiKey: 'AIzaSyC2cgtxbwgWkXWXUbsIXgP5NSE7tLNQq9E',
		initialView: 'dayGridMonth',
		headerToolbar: {
			left: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek',
			center: 'title',
			right: 'prev,next,today'
		},
		eventSources: [{
			googleCalendarId: "ko.south_korea.official#holiday@group.v.calendar.google.com",
			className: "koHol",
			color: "white",
			borderColor: "white",
			textColor: "tomato"
		}],
		navLinks: false,
		editable: true,
		selectable: false,
		nowIndicator: true,
		dayMaxEvents: true,
		events: function(info, successCallback, failureCallback) {
			var startMonth = info.start.getMonth(); // 시작 월
			var endMonth = info.end.getMonth(); // 종료 월

			// 시작 월과 종료 월의 차이를 구합니다.
			var monthDiff = endMonth - startMonth;

			// 시작 월과 종료 월의 차이가 음수인 경우, 연도를 넘어간 경우입니다.
			if (monthDiff < 0) {
				monthDiff += 12; // 음수를 양수로 변환하기 위해 12를 더합니다.
			}

			// 다음 달을 계산합니다. 현재 월에 차이를 더하고 12로 나눈 나머지를 구합니다.
			var nextMonth = (startMonth + monthDiff) % 12;

			// 다음 달이 0인 경우, 12월로 설정합니다.
			if (nextMonth === 0) {
				nextMonth = 12;
			}

			// 시작 날짜의 연도를 구합니다.
			var year = info.start.getFullYear();

			// 다음 달이 1월인 경우, 연도를 증가시킵니다.
			if (nextMonth === 1 && monthDiff !== 0) {
				year += 1;
			}
			// 다음 달의 두 자리로 만들어줍니다.
			var formattedNextMonth = ('0' + nextMonth).slice(-2);

			// 다음 달과 연도를 합쳐서 viewmonth를 만듭니다.
			var viewmonth = year + '-' + formattedNextMonth;

			console.log("전달될 값: " + viewmonth);

			fetch('./ajaxView.do?viewmonth=' + viewmonth)
				.then(response => response.json())
				.then(data => {
					var events = [];
					data.forEach(eventData => {
						var addEvent = {
							title: eventData.title,
							start: eventData.start_date,
							end: eventData.end_date,
							id: eventData.schedule_id,
							usertype: eventData.usertype,
							alarm: eventData.alarm
						};
						events.push(addEvent);
					});
					successCallback(events);
				})
				.catch(error => {
					failureCallback();
					console.error('Error occurred while fetching data from server:', error);
				});
		}

	});

	calendar.render();
}

// 페이지 로드 시 현재 월의 달력 표시
document.addEventListener("DOMContentLoaded", function() {
	showCurrentMonthCalendar();
});

// 일정 입력 모달
document.getElementById("insertSchedule").addEventListener("click", function() {
	$("#scheduelModal").modal("show");
	console.log("일정 등록 모달");
	// addSchedule 버튼 클릭 이벤트 리스너 등록
	//    document.getElementById("addSchedule").addEventListener("click", addScheduleHandler);
});

// addSchedule 이벤트 핸들러 함수 정의
function addScheduleHandler() {
	console.log("addSchedule 이벤트 발생");

	var label_name = document.getElementById("label_name").value;
	var category = document.getElementById("category").value;
	var title = document.getElementById("title").value;
	var memo = document.getElementById("memo").value;

	//    var start_date_value = document.getElementById("start_date").value;
	//    var start_time_value = document.getElementById("start_time").value;
	//    var start_date = new Date(start_date_value + ' ' + start_time_value);

	//    var end_date_value = document.getElementById("end_date").value;
	//    var end_time_value = document.getElementById("end_time").value;
	//    var end_date = new Date(end_date_value + ' ' + end_time_value);

	var start_date = document.getElementById("start_date").value;
	var end_date = document.getElementById("end_date").value;

	var location = document.getElementById("location").value;
	var priority = document.getElementById("priority").value;
	var recur = document.getElementById("recur").checked ? 'Y' : 'N'; // 체크된 경우 'Y', 아닌 경우 'N'으로 설정
	var visibility = document.getElementById("visibility").value;
	var permission = document.getElementById("permission").value;
	var alarm = document.getElementById("alarm").value;
	var participants = document.getElementById("participants").value;

	// participants가 빈값 또는 null인 경우, 빈 JSON 객체 {}를 할당
	if (!participants || participants.trim() === "") {
		participants = {}; // 빈 JSON 객체
	} else {
		participants = JSON.parse(participants); // participants가 문자열인 경우 파싱
	}

	console.log("label_name : ", label_name);
	console.log("category : ", category);
	console.log("title : ", title);
	console.log("memo : ", memo);

	console.log("start_date : ", start_date);
	console.log("end_date : ", end_date);

	console.log("location : ", location);
	console.log("priority : ", priority);
	console.log("recur : ", recur);
	console.log("visibility : ", visibility);
	console.log("permission : ", permission);
	console.log("alarm : ", alarm);
	console.log("participants : ", participants);

	var formData = new FormData();
	formData.append("label_name", label_name);
	formData.append("category", category);
	formData.append("title", title);
	formData.append("memo", memo);
	formData.append("start_date", start_date);
	formData.append("end_date", end_date);
	formData.append("location", location);
	formData.append("priority", priority);
	formData.append("recur", recur);
	formData.append("visibility", visibility);
	formData.append("permission", permission);
	formData.append("alarm", alarm);
	formData.append("participants", JSON.stringify(participants));

	// fetch를 사용하여 데이터를 서버로 전송
	fetch("./insertSchedule.do", {
		method: "POST",
		body: formData
	})
		.then(response => {
			if (!response.ok) {
				throw new Error("서버 응답 오류: " + response.status);
			}
			return response.text();
		})
		.then(result => {
			// 서버에서 반환한 결과를 정수형으로 파싱
			const isc = parseInt(result);
			console.log("일정 등록 결과:", isc);
			if (isc > 0) {
				console.log("일정 등록 성공");
				document.getElementById("scheduelForm").reset(); // 폼 초기화
				$("#scheduelModal").modal("hide"); // 모달 닫기
			} else {
				console.log("일정 등록 실패");
				alert("일정을 등록할 수 없습니다");
			}
		})
		.catch(error => {
			console.error("Error:", error);
			alert("일정을 등록하는 도중 오류가 발생했습니다");
		});
}

// 일정 등록시 추가 정보 토글
document.addEventListener("DOMContentLoaded", function() {
	var basicCalendarToggle = document.getElementById("basicCalendarToggle");
	var basicCalendarDetails = document.getElementById("basicCalendarDetails");

	basicCalendarDetails.style.display = "none";

	basicCalendarToggle.addEventListener("click", function(event) {
		event.preventDefault();
		if (basicCalendarDetails.style.display === "none" || basicCalendarDetails.style.display === "") {
			basicCalendarDetails.style.display = "block";
		} else {
			basicCalendarDetails.style.display = "none";
		}
	});
});

document.addEventListener("DOMContentLoaded", function() {
	$('#daterangepicker').daterangepicker({
		"locale": {
			"format": "YYYY-MM-DD hh:mm",
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
		timePicker: true,
		timePicker24Hour: true,
		startDate: moment().startOf('hour'),
		endDate: moment().startOf('hour').add(32, 'hour'),
		"drops": "down"
	}, function(start, end, label) {
		$('#start_date').val(start.format('YYYY-MM-DD hh:mm'));
		$('#end_date').val(end.format('YYYY-MM-DD hh:mm'));
		console.log('New date range selected: ' + start.format('YYYY-MM-DD hh:mm') + ' to ' + end.format('YYYY-MM-DD hh:mm') + ' (predefined range: ' + label + ')');
	});
});

// 시간 선택 활성화/비활성화 함수
function toggleTimeSelection(checkbox) {
	var start_time_input = document.getElementById('start_time');
	var end_time_input = document.getElementById('end_time');

	if (checkbox.checked) {
		start_time_input.disabled = true;
		end_time_input.disabled = true;
		start_time_input.value = "00:00";
		end_time_input.value = "00:00";
	} else {
		start_time_input.disabled = false;
		end_time_input.disabled = false;
	}
}