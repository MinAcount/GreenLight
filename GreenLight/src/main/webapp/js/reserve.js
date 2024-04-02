function oneReserveView(reserveno) {
	console.log("예약 상세 조회 모달창");
	fetch('./oneReserve.do?reserveno=' + reserveno)
		.then(response => {
			if (!response.ok) {
				throw new Error('서버 응답 실패');
			}
			return response.json();
		})
		.then(data => {
			var modalContent = `
             <div class="modal fade" id="reserveModal" tabindex="-1" aria-labelledby="reserveModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="reserveModalLabel">예약상세</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div>
                                	<p><strong style="padding-right: 6px;">예약번호</strong> ${data.reserveno}</p>
                                	<p><strong style="padding-right: 20px;">예약자</strong> 임주영</p>
                                	<p><strong style="padding-right: 34px;">장소</strong> ${data.conferenceVo.cname} &nbsp;
                                	<button type="button" class="btn btn-sm btn-secondary" id="viewRoomBtn">회의실보기</button></p>
                                    <p><strong style="padding-right: 20px;">이용일</strong> ${new Date(data.reservationVo.reserve_date).toLocaleString()}</p>
                                    <p><strong style="padding-right: 6px;">사용목적</strong> ${data.reservationVo.meetingtitle}</p>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">저장</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <script>
				document.getElementById("viewRoomBtn").addEventListener("click", function() {
    			window.location.href = "./roomOne.do?conf_id=${data.conf_id}";
				});
			</script>
        `;
			$('body').append(modalContent);
			$('#reserveModal').modal('show');
		})
		.catch(error => {
			console.error('오류:', error);
		});
}

// 나의 예약 전체조회
function allReserveList(val) {
	var id = val
	console.log("전체조회 : " + val)

	fetch('./myReserve.do', {
		method: 'POST',
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({
			id: id
		}),
	})
		.then(response => response.json())
		.then(result => {
			console.log("result:", result);
			if (result != null) {
				lists(result)
			} else {
				alert('예약된 목록이 없습니다')
			}
		});

	function lists(result) {
		var tableBody = document.getElementById('tableBody');
		var tableHTML = '';

		tableBody.innerHTML = '';

		result.forEach(function(item) {
			tableHTML += '<tr>';
			tableHTML += '<td style="text-align: center;">' + item.reserveno + '</td>';
			tableHTML += '<td style="text-align: center;">' + item.conferenceVo.cname + '</td>';
			tableHTML += '<td style="text-align: center;">' + formatDate(item.reservationVo.reserve_date) + '</td>';
			tableHTML += '<td style="text-align: center;">' + item.reservationVo.meetingtitle + '</td>';

			var reservationTime = new Date(item.reservationVo.reserve_date).getTime();
			var currentTime = new Date().getTime();
			var classToApply = reservationTime > currentTime ? 'green-text' : '';
			var statusText = reservationTime > currentTime ? '예정' : '완료';

			tableHTML += '<td style="text-align: center;" class="' + classToApply + '">' + statusText + '</td>';

			tableHTML += '</tr>';
		});
		tableBody.innerHTML = tableHTML;
	}
}

// 나의 예약 선택조회
function reserveListStatus(val) {
	console.log("선택조회 : " + val);

	fetch('./myReserve.do', {
		method: 'POST',
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({
			id: val
		}),
	})
		.then(response => response.json())
		.then(result => {
			console.log("result:", result);
			if (result != null) {
				lists(result, val); // lists 함수를 호출할 때 id도 함께 전달
			} else {
				alert('예약된 목록이 없습니다');
			}
		});

	var element = document.getElementById("완료");
	console.log(element);
	function lists(result, element) {
		var tableBody = document.getElementById('tableBody');
		var tableHTML = '';
		var currentTime = new Date().getTime();

		tableBody.innerHTML = '';

		result.forEach(function(item) {
			var reservationTime = new Date(item.reservationVo.reserve_date).getTime();
			var classToApply = reservationTime > currentTime ? 'green-text' : '';
			var statusText = reservationTime > currentTime ? '예정' : '완료';

			// val 값에 따라 상태를 필터링
			if ((element === '완료' && statusText === '완료') || (element === '예정' && statusText === '예정')) {
				tableHTML += '<tr>';
				tableHTML += '<td style="text-align: center;">' + item.reserveno + '</td>';
				tableHTML += '<td style="text-align: center;">' + item.conferenceVo.cname + '</td>';
				tableHTML += '<td style="text-align: center;">' + formatDate(item.reservationVo.reserve_date) + '</td>';
				tableHTML += '<td style="text-align: center;">' + item.reservationVo.meetingtitle + '</td>';
				tableHTML += '<td style="text-align: center;" class="' + classToApply + '">' + statusText + '</td>';
				tableHTML += '</tr>';
			}
		});

		tableBody.innerHTML = tableHTML;
	}
}




// formatDate 함수도 유지됩니다.

//function oneReserveView(reserveno) {
//    // 모달 창을 만들기 위해 모달 내용을 구성
//    var modalContent = `
//        <div class="modal fade" id="reserveModal" tabindex="-1" aria-labelledby="reserveModalLabel" aria-hidden="true">
//            <div class="modal-dialog modal-dialog-centered">
//                <div class="modal-content">
//                    <div class="modal-header">
//                        <h5 class="modal-title" id="reserveModalLabel">예약상세보기</h5>
//                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
//                    </div>
//                    <div class="modal-body">
//                        This toast uses the primary text utility on the toast header. <br>
//                        <br>
//                        <br>
//                    </div>
//                    <div class="modal-footer">
//                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
//                        <button type="button" class="btn btn-primary">저장 후 닫기</button>
//                    </div>
//                </div>
//            </div>
//        </div>
//    `;
//
//    // 모달을 body 요소에 추가
//    $('body').append(modalContent);
//
//    // 모달을 표시
//    $('#reserveModal').modal('show');
//
//    // toast.js 스크립트 추가
//    var toastScript = document.createElement('script');
//    toastScript.src = 'js/toast.js';
//    document.body.appendChild(toastScript);
//}

// 'del' 함수 정의
function del(val) {
	console.log(val); // val 값 출력
	location.href = "./boardDelete.do?seq=" + val; // 해당 URL로 이동
}

// 'modify' 함수 정의
function modify(val) {
	console.log("수정 modal 버튼 클릭 : " + val); // "수정 modal 버튼 클릭 : "과 val 값 출력
	var id = "[href*=collapse" + val + "]"; // id 변수에 CSS 선택자 할당
	$(id).closest("tr").css("background", "yellow"); // 선택된 요소의 부모 tr의 배경색을 노란색으로 변경
	ajaxModify(val); // ajaxModify 함수 호출
	$("#modify").modal({ backdrop: "static", keyboard: "false" }); // id가 'modify'인 모달 창을 보여줌
}

// 'ajaxModify' 함수 정의
var ajaxModify = function(val) {
	// AJAX 요청
	$.ajax({
		url: "./modifyForm.do", // 요청할 URL
		method: "post", // HTTP 메서드 (POST)
		data: "seq=" + val, // 전송할 데이터 (seq 값)
		success: function(data) { // 성공 시 실행될 함수
			console.log("조회된 결과", typeof data, "//", data); // 결과 데이터 타입과 내용 출력
			var json = JSON.parse(data); // JSON 형식의 데이터를 JavaScript 객체로 변환하여 json 변수에 할당
			console.log("JSON 객체 변환", json); // 변환된 JSON 객체 출력

			// HTML 구성
			html = "";
			html += "<div class='form-group'>";
			html += "<label for='id'>아이디:</label>";
			html += "<input type='hidden' name = 'seq' id='seq' value=" + json.seq + ">";
			html += "<b class='form-control'>" + json.id + "</b>";
			html += "</div>";

			html += "<div class='form-group'>";
			html += "<label for='regdate'>작성일:</label>";
			html += "<b class='form-control'>" + json.regdate + "</b>";
			html += "</div>";

			html += "<div class='form-group'>";
			html += "<label for='title'>제목:</label>";
			html += "<input type='text' class='form-control' name ='title' id='title' required value=" + json.title + ">";
			html += "</div>";

			html += "<div class='form-group'>";
			html += "<label for='content'>내용:</label>";
			html += "<textarea class='form-control' row='5' name='content' id='content'>" + json.content + "</textarea>";
			html += "</div>";

			html += "<div class='modal-footer'>";
			html += "<input type='button' class='btn btn-success' value='글수정' onclick='modifyVal()'>";
			html += "<input type='reset'  class='btn btn-info' value='초기화'>";
			html += "<button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>";
			html += "</div>";

			// HTML을 id가 'frmModify'인 요소에 추가
			$("#frmModify").html(html);
		},
		error: function(e) { // 오류 발생 시 실행될 함수
			console.log("잘못된 요청값 : " + e); // 오류 내용 출력
		}
	});
}

// 'modifyVal' 함수 정의
var modifyVal = function() {
	var frm = $("#frmModify"); // id가 'frmModify'인 요소를 변수 frm에 할당
	var idx = $(".active").text(); // 클래스가 'active'인 요소의 텍스트 값을 변수 idx에 할당
}

document.addEventListener('DOMContentLoaded', function() {
	console.log("예약 리스트 Loaded 준비");
	renderReserve();
});

function renderReserve() {
	console.log("예약 리스트 랜더 준비");
	fetch('./reserveListView.do', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('이벤트 발생 어려움');
			}
			return response.json();
		})
		.then(result => {
			initializeCalendar(result); // 예약 리스트 데이터 전달
		})
		.catch(error => {
			console.error('오류 발생:', error);
		});
}

function initializeCalendar(events) {
	console.log("예약 리스트 값 : ", events);
	var reservationEl = document.getElementById('reservation');

	var reservation = new FullCalendar.Calendar(reservationEl, {
		googleCalendarApiKey: 'AIzaSyC2cgtxbwgWkXWXUbsIXgP5NSE7tLNQq9E',
		initialView: 'timeGridDay',
		resources: [
			{ id: 'room1', title: '회의실 A' },
			{ id: 'room2', title: '회의실 B' },
			{ id: 'room3', title: '회의실 C' }
		],
		events: [
			{ id: 'event1', resourceId: 'room1', start: '2024-04-04T09:00:00', end: '2024-04-04T11:00:00', title: '회의실 A 예약' },
			{ id: 'event2', resourceId: 'room2', start: '2024-04-04T10:00:00', end: '2024-04-04T12:00:00', title: '회의실 B 예약' },
			{ id: 'event3', resourceId: 'room3', start: '2024-04-04T11:00:00', end: '2024-04-04T13:00:00', title: '회의실 C 예약' }
		],
		headerToolbar: {
			left: 'addEventButton'
		},
		titleFormat: function(date) {
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		},
		eventSources: [
			{
				googleCalendarId: "ko.south_korea.official#holiday@group.v.calendar.google.com",
				className: "koHol",
				color: "red",
				textColor: "white"
			},
			{
				events: events.map(function(event) {
					return {
						title: event.reservationVo.meetingtitle, // 예약 제목을 이벤트 제목으로 설정
						start: event.reservationVo.reserve_date // 예약 날짜를 이벤트 시작 날짜로 설정
					};
				}),
				color: '#428A46',
				textColor: 'white'
			}
		],
		eventTimeFormat: {
			hour: 'numeric',
			minute: '2-digit',
			hour12: false
		},
		slotMinTime: '09:00:00', // 슬롯의 최소 시간을 아침 9시로 설정
		slotMaxTime: '21:00:00', // 슬롯의 최대 시간을 저녁 9시로 설정
		allDayText: false, // allDay 텍스트 숨기기
		slotLabelInterval: '1:00', // 슬롯 레이블 간격 조정 (1시간 간격)
		customButtons: {
			addEventButton: {
				text: "일정 추가",
				click: function() {
					insert();
				}
			}
		},
		dateClick: function() {
			insert();
		},
		eventClick: function(info) {
			var seq = info.event.extendedProps.seq;
			detail(seq);
		},
		editable: false,
		droppable: false,
		displayEventTime: false,
		dayMaxEvents: true
	});

	reservation.render();
}






function detail(seq) {
	console.log(seq);
	$.ajax({
		url: "./detail.do",
		method: "POST",
		data: { seq: seq },
		dataType: "json", // seq를 key로 하는 객체를 전송
		success: function(data) {
			$("#groupid1").text(data.groupid);
			$("#title1").text(data.title);
			$("#content1").text(data.content);
			$("#start1").text(data.start);
			$("#end1").text(data.end);
			// 모달 창 표시
			$("#detailModal").modal("show");
		},
		error: function() {
			console.log("오류임");
		}
	});
}

function insert() {
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

			$.ajax({
				url: "./insert.do",
				data: data,
				type: "post",
				dataType: "json",
				success: function(msg) {
					console.log(msg);
					if (msg != true) {
						alert("insert 실패!!")
						return false;
					} else {
						$("#form")[0].reset(); // 폼 초기화
						$("#calendarModal").modal("hide");
						renderReserve();

					}
				},
				error: function() {
					alert("jdbc로 넘기지도 못함");
				}
			});
		}
	});
}


var calendarDiv = document.getElementById('calendar');
var selectedDateDiv = document.getElementById('selectedDate');
var currentYearMonthDiv = document.getElementById('currentYearMonth');
var prevMonthBtn = document.getElementById('prevMonthBtn');
var nextMonthBtn = document.getElementById('nextMonthBtn');

// 현재 날짜를 가져오기
var currentDate = new Date();
var currentYear = currentDate.getFullYear();
var currentMonth = currentDate.getMonth();
var daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();

// 년도와 월 표시
function displayYearMonth() {
    currentYearMonthDiv.innerHTML = '<div style="font-size: 14px;">' + currentYear + '년</div><div style="font-size: 24px;">' + (currentMonth + 1) + '월</div>';
}
displayYearMonth();

// 달력 생성 함수
function generateCalendar() {
	calendarDiv.innerHTML = '';
	// 이번 달의 첫째 날의 요일 구하기 (0: 일요일, 1: 월요일, ..., 6: 토요일)
	var firstDayOfWeek = new Date(currentYear, currentMonth, 1).getDay();
	// 이번 달의 마지막 날짜 구하기
	var daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();

	// 이전 달의 마지막 날짜 구하기
	var daysInPrevMonth = new Date(currentYear, currentMonth, 0).getDate();

	// 이전 달의 남은 일자 추가
	for (var i = firstDayOfWeek - 1; i >= 0; i--) {
		var cell = document.createElement('div');
		cell.classList.add('calendar-cell');
		cell.textContent = daysInPrevMonth - i;
		cell.classList.add('prev-month');
		calendarDiv.appendChild(cell);
	}

	// 이번 달의 날짜 추가
	for (var i = 1; i <= daysInMonth; i++) {
		var cell = document.createElement('div');
		cell.classList.add('calendar-cell');
		cell.textContent = i;
		cell.addEventListener('click', function() {
			var clickedDate = this.textContent;
			selectedDateDiv.textContent = currentYear + '년 ' + (currentMonth + 1) + '월 ' + clickedDate + '일';
			calendarDiv.querySelectorAll('.calendar-cell').forEach(function(cell) {
				cell.classList.remove('selected');
			});
			this.classList.add('selected');
		});
		calendarDiv.appendChild(cell);
	}
}
generateCalendar();

// 다음 달로 이동
nextMonthBtn.addEventListener('click', function() {
	currentMonth++;
	if (currentMonth > 11) {
		currentMonth = 0;
		currentYear++;
	}
	displayYearMonth();
	generateCalendar();
});

// 이전 달로 이동
prevMonthBtn.addEventListener('click', function() {
	currentMonth--;
	if (currentMonth < 0) {
		currentMonth = 11;
		currentYear--;
	}
	displayYearMonth();
	generateCalendar();
});