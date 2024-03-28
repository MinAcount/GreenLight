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

function insertSchedule() {
	$("#calendarModal").modal("show"); // modal 나타내기

	$("#addCalendar").on("click", function() {  // modal의 추가 버튼 클릭 시
		var groupid = $("#groupid").val();
		var title = $("#title").val();
		var content = $("#content").val();
		var start = $("#start").val();
		var end = $("#end").val();

		//내용 입력 여부 확인
		if (groupid == null || groupid == "") {
			alert("구분을 입력하세요.");
		} else if (title == null || title == "") {
			alert("제목을 입력하세요.");
		} else if (content == null || content == "") {
			alert("내용을 입력하세요.");
		} else if (start == "" || end == "") {
			alert("날짜를 입력하세요.");
		} else if (new Date(end) - new Date(start) < 0) { // date 타입으로 변경 후 확인
			alert("종료일이 시작일보다 먼저입니다.");
		} else { // 정상적인 입력 시
			var data = $("#form").serialize()

			fetch("./insertSchedule.do", {
				method: "POST",
				headers: {
					"Content-Type": "application/json"
				},
				body: JSON.stringify(data)
			})
				.then(response => {
					if (!response.ok) {
						throw new Error("Network response was not ok");
					}
					return response.json();
				})
				.then(msg => {
					console.log(msg);
					if (msg !== true) {
						alert("insert 실패!!");
						return false;
					} else {
						document.getElementById("form").reset(); // 폼 초기화
						document.getElementById("calendarModal").classList.remove("show");
						document.getElementById("calendarModal").style.display = "none";
						listAjax();
					}
				})
				.catch(error => {
					console.error("Error:", error);
					alert("jdbc로 넘기지도 못함");
				});

		}
	});
}

// 모달의 내용이 추가될 때마다 호출되는 함수
function expandModal() {
	var modalBody = document.getElementById("modalBody");
	modalBody.classList.add("expanded");
}

// 모달의 내용이 추가될 때 호출할 함수를 지정
document.getElementById("addCalendar").addEventListener("click", expandModal);

document.addEventListener("DOMContentLoaded", function() {
	var basicCalendarToggle = document.getElementById("basicCalendarToggle");
	var basicCalendarDetails = document.getElementById("basicCalendarDetails");

	basicCalendarToggle.addEventListener("click", function(event) {
		event.preventDefault();
		if (basicCalendarDetails.style.display === "none") {
			basicCalendarDetails.style.display = "block";
		} else {
			basicCalendarDetails.style.display = "none";
		}
	});
});

// 달력과 시간 선택을 위한 초기화
$(document).ready(function() {
	// 시작 날짜 선택을 위한 달력 초기화
	$('#start_datepicker').datepicker({
		dateFormat: 'yy-mm-dd', // 날짜 형식 설정
		onSelect: function(selectedDate) {
			// 종료 날짜 선택을 위한 달력 초기화
			$('#end_datepicker').datepicker('option', 'minDate', selectedDate);
		}
	});

	// 종료 날짜 선택을 위한 달력 초기화
	$('#end_datepicker').datepicker({
		dateFormat: 'yy-mm-dd', // 날짜 형식 설정
		onSelect: function(selectedDate) {
			// 시작 날짜 선택을 위한 달력 초기화
			$('#start_datepicker').datepicker('option', 'maxDate', selectedDate);
		}
	});

	// 시간 선택을 위한 초기화
	$('#timepicker').timepicker({
		timeFormat: 'HH:mm', // 시간 형식 설정
		interval: 15, // 시간 간격 설정
		dynamic: false, // 동적 시간 선택 비활성화
		dropdown: true, // 드롭다운 시간 선택 활성화
		scrollbar: true // 스크롤바 활성화
	});
});