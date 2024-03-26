// 현재 월을 가져오는 함수
function getCurrentMonth() {
	var currentDate = new Date();
	var month = currentDate.getMonth() + 1; // getMonth()는 0부터 시작하므로 1을 더해줍니다.
	var year = currentDate.getFullYear();
	return year + '.' + ('0' + month).slice(-2); // 두 자리 숫자로 포맷팅합니다.
}

// 현재 월을 기준으로 해당 월의 달력을 표시하는 함수
function showCurrentMonthCalendar() {
	var currentMonthElement = document.getElementById('currentMonth');
	var currentMonth = currentMonthElement.textContent; // 현재 월 가져오기
	var [year, month] = currentMonth.split('.'); // 년도와 월 분리

	// AJAX를 통해 해당 월의 일정 데이터 가져오기
	$.ajax({
		type: "get",
		url: "./ajaxView.do", // 서버에서 JSON 데이터를 반환하는 URL
		data: {
			year: year,
			month: month
		},
		dataType: "json",
		success: function(data) {
			var events = []; // FullCalendar에 전달할 이벤트 배열 초기화

			// 받은 데이터를 순회하며 FullCalendar 이벤트 객체로 변환하여 배열에 추가
			data.forEach(function(eventData) {
				var event = {
					title: eventData.title,
					start: eventData.start_date,
					end: eventData.end_date,
					category: eventData.category,
					alarm: eventData.alarm
				};
				events.push(event);
			});
			renderCalendar(events); // 일정 데이터를 이용하여 달력 표시
		},
		error: function() {
			console.error("Schedule을 가져오지 못했습니다.");
		}
	});
}

// 페이지가 로드될 때 실행되는 함수
window.onload = function() {
	var currentMonthElement = document.getElementById('currentMonth');
	currentMonthElement.textContent = getCurrentMonth(); // 현재 월 표시

	// 현재 월을 기준으로 해당 월의 달력을 표시하는 함수 호출
	showCurrentMonthCalendar();

	// 이전 월 버튼에 이벤트 추가
	document.getElementById('prev').addEventListener('click', moveToPreviousMonth);

	// 다음 월 버튼에 이벤트 추가
	document.getElementById('next').addEventListener('click', moveToNextMonth);
};

// 이전 월로 이동하는 함수
function moveToPreviousMonth() {
	var currentMonthElement = document.getElementById('currentMonth');
	var currentMonth = currentMonthElement.textContent; // 현재 월 가져오기
	var [year, month] = currentMonth.split('.'); // 년도와 월 분리
	month = parseInt(month) - 1; // 이전 월로 변경
	if (month === 0) { // 1월에서 이전 월로 이동 시 작년 12월로 변경
		year = parseInt(year) - 1;
		month = 12;
	}
	currentMonthElement.textContent = year + '.' + ('0' + month).slice(-2); // 변경된 월 표시

	// 이전 월로 변경된 후 해당 월의 달력을 표시하는 함수 호출
	showCurrentMonthCalendar();
}

// 다음 월로 이동하는 함수
function moveToNextMonth() {
	var currentMonthElement = document.getElementById('currentMonth');
	var currentMonth = currentMonthElement.textContent; // 현재 월 가져오기
	var [year, month] = currentMonth.split('.'); // 년도와 월 분리
	month = parseInt(month) + 1; // 다음 월로 변경
	if (month === 13) { // 12월에서 다음 월로 이동 시 내년 1월로 변경
		year = parseInt(year) + 1;
		month = 1;
	}
	currentMonthElement.textContent = year + '.' + ('0' + month).slice(-2); // 변경된 월 표시

	// 다음 월로 변경된 후 해당 월의 달력을 표시하는 함수 호출
	showCurrentMonthCalendar();
}

// 달력을 표시하는 함수
function renderCalendar(events) {
	var scheduleEl = document.getElementById('addSchedule');

	var calendar = new FullCalendar.Calendar(scheduleEl, {
		// FullCalendar 설정
		googleCalendarApiKey: 'AIzaSyC2cgtxbwgWkXWXUbsIXgP5NSE7tLNQq9E',
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
		events: events,
		eventRender: function(info) {
			var startTime = info.event.start;
			var title = info.event.title;
			var hour = startTime.getHours();
			var formattedHour = ('0' + hour).slice(-2);
			var formattedMinutes = ('0' + startTime.getMinutes()).slice(-2);
		}
	});

	calendar.render();
}


////////////////////////////////////////////////////////////////////////

function insertSchedule() {
    console.log("일정 입력 모달창");
    fetch('./insertSchedule.do', {
        method: 'POST' // HTTP 메소드를 POST로 변경
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('서버 응답 실패');
            }
            return response.json();
        })
        .then(data => {
            var modalContent = `
                <div class="modal fade" id="addScheduleModal" tabindex="-1" aria-labelledby="addScheduleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addScheduleModalLabel">일정 추가</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="addScheduleForm">
                                    <div class="mb-3">
                                        <label for="scheduleTitle" class="form-label">일정 제목</label>
                                        <input type="text" class="form-control" id="scheduleTitle" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="scheduleDate" class="form-label">일정 날짜</label>
                                        <input type="date" class="form-control" id="scheduleDate" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="scheduleTime" class="form-label">일정 시간</label>
                                        <input type="time" class="form-control" id="scheduleTime" required>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary" id="saveScheduleBtn">저장</button>
                            </div>
                        </div>
                    </div>
                </div>
            `;
            $('body').append(modalContent);
            $('#addScheduleModal').modal('show'); // 모달 ID 수정
        })
        .catch(error => {
            console.error('오류:', error);
            // 오류 메시지를 처리하는 로직 추가
        });
}
