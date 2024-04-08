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

// 일정 입력 모달
document.getElementById("insertSchedule").addEventListener("click", function() {
    $("#scheduelModal").modal("show");
    console.log("일정 등록 모달");
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
				window.location.reload();
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

function resetModal() {
    // 캘린더 선택 초기화
    var labelNameSelect = document.getElementById('label_name');
    labelNameSelect.selectedIndex = 0;
    
    // 제목 입력 필드 초기화
    var titleInput = document.getElementById('title');
    titleInput.value = '';

    // 날짜 선택 필드 초기화
    var daterangepickerInput = document.getElementById('daterangepicker');
    daterangepickerInput.value = '';

    // 종일/반복 체크박스 초기화
    var allDayCheckbox = document.getElementById('allDay');
    allDayCheckbox.checked = false;
    var recurCheckbox = document.getElementById('recur');
    recurCheckbox.checked = false;

    // 참여자 부분 초기화
    var partShowSpan = document.getElementById('partShow');
    partShowSpan.innerHTML = '';

    // 위치 입력 필드 초기화
    var locationInput = document.getElementById('location');
    locationInput.value = '';

    // 메모 텍스트 영역 초기화
    var memoTextarea = document.getElementById('memo');
    memoTextarea.value = '';

    // 추가정보 부분 초기화
    var basicCalendarDetailsDiv = document.getElementById('basicCalendarDetails');
    basicCalendarDetailsDiv.style.display = 'none';

    // 추가정보 선택값 초기화
    var categorySelect = document.getElementById('category');
    categorySelect.selectedIndex = 0;
    var prioritySelect = document.getElementById('priority');
    prioritySelect.selectedIndex = 0;
    var visibilitySelect = document.getElementById('visibility');
    visibilitySelect.selectedIndex = 0;
    var permissionSelect = document.getElementById('permission');
    permissionSelect.selectedIndex = 0;
    var alarmSelect = document.getElementById('alarm');
    alarmSelect.selectedIndex = 0;
}

function oneScheduleView(schedule_id) {
    console.log("일정 상세 모달 : ", schedule_id);
    // 이미 열려있는 모달 창이 있는지 확인
    var existingModal = $('#oneScheduleView');
    if (existingModal.length) {
        // 모달 창이 이미 열려있는 경우, 내용을 업데이트하고 보여줌
        fetch("./oneSchedule.do?schedule_id=" + schedule_id)
            .then(function(response) {
                if (!response.ok) {
                    throw new Error('서버 응답 실패');
                }
                return response.json(); // JSON 형식으로 데이터 받기
            })
            .then(data => {
                console.log('서버에서 받은 데이터:', data); // 데이터 확인
                // 모달 내용 업데이트
                existingModal.find('.modal-title').text(data.title);
                existingModal.find('.modal-body').html(`
                    <div class="row">
                        <div>
                            <p><strong style="padding-right: 6px;"></strong> ${data.start_date} ~ ${data.end_date}</p>
                            <p><strong style="padding-right: 6px;">작성자</strong> ${data.creator}</p>
                            <p><strong style="padding-right: 6px;">전화번호</strong> ${data.phone}</p>
                            <p><strong style="padding-right: 6px;">캘린더명</strong> ${data.label_name}</p>
                            <p><strong style="padding-right: 6px;">카테고리</strong> ${data.category}</p>
                            <p><strong style="padding-right: 6px;">중요도</strong> ${data.priority}</p>
                            <p><strong style="padding-right: 6px;">공개여부</strong> ${data.visibility}</p>
                        </div>
                    </div>
                `);
                existingModal.modal('show');
            })
            .catch(error => {
                console.error('오류:', error);
            });
    } else {
        // 모달 창이 열려있지 않은 경우, 새로운 모달 창 생성
        fetch("./oneSchedule.do?schedule_id=" + schedule_id)
            .then(function(response) {
                if (!response.ok) {
                    throw new Error('서버 응답 실패');
                }
                return response.json(); // JSON 형식으로 데이터 받기
            })
            .then(data => {
                console.log('서버에서 받은 데이터:', data); // 데이터 확인
                var modalContent = `
                    <div class="modal fade" id="oneScheduleView" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="detailModalLabel">${data.title}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div>
                                            <p><strong style="padding-right: 6px;"></strong> ${data.start_date} ~ ${data.end_date}</p>
                                            <p><strong style="padding-right: 6px;">작성자</strong> ${data.creator}</p>
                                            <p><strong style="padding-right: 6px;">전화번호</strong> ${data.phone}</p>
                                            <p><strong style="padding-right: 6px;">캘린더명</strong> ${data.label_name}</p>
                                            <p><strong style="padding-right: 6px;">카테고리</strong> ${data.category}</p>
                                            <p><strong style="padding-right: 6px;">중요도</strong> ${data.priority}</p>
                                            <p><strong style="padding-right: 6px;">공개여부</strong> ${data.visibility}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer"></div>
                            </div>
                        </div>
                    </div>
                `;
                $('body').append(modalContent);
                $('#oneScheduleView').modal('show');
            })
            .catch(error => {
                console.error('오류:', error);
            });
    }
}
