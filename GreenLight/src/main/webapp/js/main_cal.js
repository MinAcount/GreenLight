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
		firstDay: 1,
		headerToolbar: {
			left: '',
			center: 'title',
			right: ''
		},
		eventSources: [{
			googleCalendarId: "ko.south_korea.official#holiday@group.v.calendar.google.com",
			className: "koHol",
			color: "white",
			borderColor: "white",
			textColor: "tomato",
			eventClick: function(info) {
				info.jsEvent.preventDefault();
				return false;
			}
		}],
		navLinks: false,
		editable: true,
		selectable: false,
		nowIndicator: true,
		dayMaxEvents: true,
		events: function(info, successCallback, failureCallback) {
			var startMonth = info.start.getMonth(); // 시작 월
			var endMonth = info.end.getMonth(); // 종료 월

			var monthDiff = endMonth - startMonth;
			if (monthDiff < 0) {
				monthDiff += 12; // 음수를 양수로 변환하기 위해 12를 더합니다.
			}
			var nextMonth = (startMonth + monthDiff) % 12;
			if (nextMonth === 0) {
				nextMonth = 12;
			}
			var year = info.start.getFullYear();
			if (nextMonth === 1 && monthDiff !== 0) {
				year += 1;
			}
			var formattedNextMonth = ('0' + nextMonth).slice(-2);
			var viewmonth = year + '-' + formattedNextMonth;

			console.log("전달될 값: " + viewmonth);

			fetch('./ajaxView.do?viewmonth=' + viewmonth)
				.then(response => response.json())
				.then(data => {
					var events = [];
					data.forEach(eventData => {
						var addEvent = {
							schedule_id: eventData.schedule_id,
							title: eventData.title,
							start: eventData.start_date,
							end: eventData.end_date,
							id: eventData.schedule_id,
							usertype: eventData.usertype,
							alarm: eventData.alarm
						};
						addEvent.color = '#428A46';
						events.push(addEvent);
					});
					successCallback(events);
				})
				.catch(error => {
					failureCallback();
					console.error('Error occurred while fetching data from server:', error);
				});
		},
		eventClick: function(info) {
			var schedule_id = info.event.extendedProps.schedule_id;
			oneScheduleView(schedule_id);
		}

	});

	calendar.render();
}

// 페이지 로드 시 현재 월의 달력 표시
document.addEventListener("DOMContentLoaded", function() {
	showCurrentMonthCalendar();
});
