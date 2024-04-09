function showCurrentMonthCalendar() {
	var currentDate = new Date();
	var currentMonth = currentDate.getMonth() + 1;
	var currentYear = currentDate.getFullYear();
	var viewmonth = currentYear + '-' + ('0' + currentMonth).slice(-2);
	console.log("달력이 호출됨 : " + viewmonth);
	renderCalendar(viewmonth, selectedCalendars = []);
}

function updateFilter() {
	var selectedCalendars = [];

	if (document.getElementById('basicCheck').checked) {
		var basicElements = document.getElementsByName('basicCheck');
		var backgroundColor = window.getComputedStyle(basicElements[0]).getPropertyValue('background-color');
		selectedCalendars.push({
			name: document.getElementById('basicCheck').value,
			color: backgroundColor
		});
	}
	if (document.getElementById('vacationCheck').checked) {
		var vacationElements = document.getElementsByName('vacationCheck');
		var backgroundColor = window.getComputedStyle(vacationElements[0]).getPropertyValue('background-color');
		selectedCalendars.push({
			name: document.getElementById('vacationCheck').value,
			color: backgroundColor
		});
	}
	if (document.getElementById('compenyCheck').checked) {
		var compenyElements = document.getElementsByName('compenyCheck');
		var backgroundColor = window.getComputedStyle(compenyElements[0]).getPropertyValue('background-color');
		selectedCalendars.push({
			name: document.getElementById('compenyCheck').value,
			color: backgroundColor
		});
	}
	if (document.getElementById('deptCheck').checked) {
		var deptElements = document.getElementsByName('deptCheck');
		var backgroundColor = window.getComputedStyle(deptElements[0]).getPropertyValue('background-color');
		selectedCalendars.push({
			name: document.getElementById('deptCheck').value,
			color: backgroundColor
		});
	}
	console.log("선택된 캘린더 값들:", selectedCalendars);

	var titleElement = document.querySelector('.fc-toolbar-title');
	var titleText = titleElement.textContent;
	var year = titleText.split(' ')[0].replace('년', '');
	var month = titleText.split(' ')[1].replace('월', '');
	var viewmonth = year + '-' + ('0' + month).slice(-2);

	renderCalendar(viewmonth, selectedCalendars);
}

function renderCalendar(viewmonth, selectedCalendars) {
	console.log("render 진입", selectedCalendars);
	var scheduleEl = document.getElementById('addSchedule');

	var calendar = new FullCalendar.Calendar(scheduleEl, {
		height: '100%',
		googleCalendarApiKey: 'AIzaSyC2cgtxbwgWkXWXUbsIXgP5NSE7tLNQq9E',
		initialView: 'dayGridMonth',
		firstDay: 1,
		headerToolbar: {
			right: 'prev,next,today'
		},
		titleFormat: function(date) {
			year = date.date.year;
			month = date.date.month + 1;

			return year + "년 " + month + "월";
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
				monthDiff += 12;
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
						if (selectedCalendars.some(calendar => calendar.name === eventData.label_name)) {
							var addEvent = {
								schedule_id: eventData.schedule_id,
								label_name: eventData.label_name,
								title: eventData.title,
								start: eventData.start_date,
								end: eventData.end_date,
								id: eventData.schedule_id,
								usertype: eventData.usertype,
								alarm: eventData.alarm
							};

							var calendar = selectedCalendars.find(calendar => calendar.name === eventData.label_name);
							if (calendar) {
								addEvent.color = calendar.color;
								addEvent.textColor = '#212831';
							}

							events.push(addEvent);
						}
					});
					successCallback(events);
				})
				.catch(error => {
					failureCallback();
					console.error('서버에서 데이터를 가져오는 동안 오류가 발생했습니다:', error);
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
	updateFilter()
});



//------------------------------------------------------------------------------------------------

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
    fetch("./oneSchedule.do?schedule_id=" + schedule_id)
        .then(function(response) {
            if (!response.ok) {
                throw new Error('서버 응답 실패');
            }
            return response.json(); // JSON 형식으로 데이터 받기
        })
        .then(data => {
            console.log('서버에서 받은 데이터:', data); // 데이터 확인
            const startDate = new Date(data.start_date);
            const endDate = new Date(data.end_date);
            const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' };
            const formattedStartDate = startDate.toLocaleDateString('ko-KR', options);
            const formattedEndDate = endDate.toLocaleDateString('ko-KR', options);
            const participants = JSON.parse(data.participants);

            var modalContent = `
            <div class="modal fade" id="oneScheduleView" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered custom-class">
                    <div class="modal-content" style="width: 550px;"> 
                        <div class="modal-body" style="padding: 50px;">
                            <div class="row">
                                <div>
                                    <h3 class="modal-title viewcal" id="detailModalLabel">${data.title}&nbsp;&nbsp;&nbsp;${data.visibility === 'Y' ? '<i class="fa-solid fa-lock-open"></i>' : '<i class="fa-solid fa-lock"></i>'}</h3>
                                    ${data.start_date != null ? `<p><strong class="viewcal" style="padding-right: 6px;"></strong> ${formattedStartDate} ~ ${formattedEndDate}</p>` : ''}
                                    ${data.label_name != null ? `<p><strong class="viewcal" style="padding-right: 6px;"><i class="fa-regular fa-calendar"></i></strong> ${data.label_name}</p>` : ''}
                                    ${data.location != null ? `<p><strong class="viewcal" style="padding-right: 6px;"><i class="fa-solid fa-location-dot"></i></strong> ${data.location}</p>` : ''}
                                    ${data.priority != null ? `<p><strong class="viewcal" style="padding-right: 6px;"><i class="fa-solid fa-business-time"></i></strong> ${data.priority}</p>` : ''}
                                    ${data.memo != null ? `<p><strong class="viewcal" style="padding-right: 6px;"><i class="fa-solid fa-business-time"></i></strong> ${data.memo}</p>` : ''}
                                    <p><strong class="viewcal" style="padding-right: 6px;">등록자</strong> ${data.creator}</p>
                                    ${participants != null ? `<p><strong class="viewcal" style="padding-right: 6px;">참석자</strong> 
                                    ${participants.map(participant => `<button type="button" class="name_btn">${participant.name}</button>`).join(' ')}</p>` : ''}
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" id="closeModalBtn" data-bs-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
            `;
            // 모달이 이미 열려 있는 경우, 모달을 완전히 제거하고 다시 생성하여 열기
            if ($('#oneScheduleView').length) {
                $('#oneScheduleView').remove();
                $('body').append(modalContent);
            } else { // 모달이 열려 있지 않은 경우, 새로운 모달을 생성하여 열기
                $('body').append(modalContent);
            }

            $('#oneScheduleView').modal('show'); // 모달 열기

            // 닫기 버튼 클릭 이벤트 처리
            $('#closeModalBtn').click(function() {
                $('#oneScheduleView').modal('hide'); // 모달을 숨김
            });
        })
        .catch(error => {
            console.error('오류:', error);
        });
}



document.getElementById('sidebarToggle').addEventListener('click', function() {
	updateFilter()
});