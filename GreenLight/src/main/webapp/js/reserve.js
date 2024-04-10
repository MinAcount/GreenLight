function formatReserveDate(reserveDate) {
	// 날짜 객체로부터 연도, 월, 일, 시간, 분을 추출
	const year = reserveDate.getFullYear();
	const month = reserveDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더함
	const date = reserveDate.getDate();
	let hour = reserveDate.getHours();

	// 오전/오후 구분
	const ampm = hour < 12 ? '오전' : '오후';

	// 시간을 12시간 형식으로 변환
	if (hour > 12) {
		hour -= 12;
	}

	// 시간을 오전/오후와 함께 반환
	return `${year}년 ${month}월 ${date}일 ${ampm} ${hour}시`;
}

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
			const reserveDate = new Date(data.reservationVo.reserve_date);
			const formattedDate = formatReserveDate(reserveDate);
			var modalContent = `
                <div class="modal fade" id="reserveModal" tabindex="-1" aria-labelledby="reserveModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered custom-class">
                        <div class="modal-content" style="width: 450px;">
                            <div class="modal-header">
                                <h5 class="modal-title" id="reserveModalLabel">예약상세</h5>
                            </div>
                            <div class="modal-body" style="padding-right: 30px; padding-left: 30px; padding-top: 30px;">
                                <div class="row">
                                    <div>
                                        <p><strong style="padding-right: 6px;">예약번호</strong> ${data.reserveno}</p>
                                        <p><strong style="padding-right: 20px;">예약자</strong> 임주영</p>
                                        <p><strong style="padding-right: 34px;">장소</strong> ${data.conferenceVo.cname} &nbsp;
                                            <button type="button" class="btn btn-sm btn-secondary" id="viewRoomBtn">회의실보기</button></p>
                                        <p><strong style="padding-right: 20px;">이용일</strong> ${formattedDate}</p>
                                        <p><strong style="padding-right: 6px;">사용목적</strong> 
                                        	<span>${data.reservationVo.meetingtitle}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-pen-to-square" onclick="updateReserveTitle('${data.reserveno}')"></span></i>
                                        	<input type="hidden" value="${data.reservationVo.meetingtitle}">
                                        </p>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <script>
                    document.getElementById("viewRoomBtn").addEventListener("click", function() {
                        window.location.href = "./roomOne.do?conf_id=${data.conf_id}";
                    });

                    $('#reserveModal').on('hidden.bs.modal', function () {
                        $(this).remove();
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

function updateReserveTitle(reserveno) {
	console.log("예약수정 : ", reserveno)
	var iconSpan = document.querySelector('#reserveModal .modal-body span');
	iconSpan.textContent = '';

	var inputField = document.querySelector('#reserveModal input[type="hidden"]');

	inputField.style.display = 'inline';
	inputField.removeAttribute('type');

	var saveButton = document.createElement('button');
	saveButton.textContent = '저장';
	saveButton.className = 'btn btn-primary';

	// 저장 버튼의 클릭 이벤트 리스너를 추가합니다.
	saveButton.addEventListener('click', function() {
		// 수정된 목적을 가져옵니다.
		var updatedMeetingTitle = inputField.value;

		// AJAX 요청을 보냅니다.
		fetch('./updateReserve.do?reserveno=' + reserveno, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				reserveno: reserveno,
				meetingtitle: updatedMeetingTitle
			})
		})
			.then(response => {
				if (!response.ok) {
					throw new Error('서버 응답 실패');
				}
				return response.json();
			})
			.then(data => {
				// 서버로부터 응답을 받은 후의 처리 작업을 여기에 추가합니다.
				console.log('예약 수정 완료:', data);
				// 모달을 닫습니다.
				$('#reserveModal').modal('hide');
				window.onload = function() {
					var reserveno = 'your_reserveno_value'; // 예약 번호 값
					window.location.href = './oneReserve.do?reserveno=' + reserveno;
				}
			})
			.catch(error => {
				console.error('오류:', error);
			});
	});

	// 저장 버튼을 삽입합니다.
	var container = document.querySelector('#reserveModal .modal-footer');
	container.innerHTML = ''; // 기존 내용을 비웁니다.
	container.appendChild(saveButton);
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
	var reservationEl = document.getElementById('reservation');
	var reservation = new FullCalendar.Calendar(reservationEl, {
		initialView: 'listWeek',
		headerToolbar: {
			left: 'prev',
			center: 'title',
			right: 'next'
		},
		titleFormat: function(date) {
			var year = date.date.year;
			var month = date.date.month + 1;
			var day = date.date.day;

			// 현재 날짜의 첫째 날의 요일을 구합니다. (0: 일요일, 1: 월요일, ..., 6: 토요일)
			var firstDayOfWeek = new Date(year, month - 1, 1).getDay();

			// 현재 날짜가 몇 주차에 속하는지 계산합니다.
			var week = Math.ceil((day + firstDayOfWeek) / 7);

			return year + "년 " + month + "월 " + week + "주";
		},

		eventSources: [{
			events: events.map(function(event) {
				return {
					reserveno: event.reserveno,
					cname: event.conferenceVo.cname,
					title: event.reservationVo.meetingtitle,
					start: event.reservationVo.reserve_date
				};
			}),
			color: '#428A46',
			textColor: 'white'
		}],
		/*찾기*/
		eventClick: function(info) {
			var reserveno = info.event.extendedProps.reserveno
			oneReserveView(reserveno);
		}
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
		cell.addEventListener('click', function(event) {
			var clickedDate = event.target.textContent; // 클릭한 날짜 가져오기
			var formattedMonth = ('0' + (currentMonth + 1)).slice(-2);
			selectedDateDiv.textContent = currentYear + '년 ' + formattedMonth + '월 ' + clickedDate.padStart(2, '0') + '일';
			calendarDiv.querySelectorAll('.calendar-cell').forEach(function(cell) {
				cell.classList.remove('selected');
			});
			event.target.classList.add('selected');
			dateClicked(); // 클릭한 날짜를 전달하여 dateClicked 함수 호출
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


var reserve_day;
var timeslot;

function searchReserveListWithDate(reserve_day, timeslot, locality, floor, capacity) {

	window.reserve_day = reserve_day;
	window.timeslot = timeslot;

	fetch('./reserveTime.do?reserve_day=' + reserve_day + '&timeslot=' + timeslot + '&locality=' + locality + '&floor=' + floor + '&capacity=' + capacity)
		.then(response => {
			if (!response.ok) {
				throw new Error('서버 응답 실패');
			}
			return response.json();
		})
		.then(data => displayReservationData(data))
		.catch(error => console.error('오류:', error));
}

// 조건을 선택하여 회의실 검색 (default : currentDay)
function searchReserveList() {
	console.log("예약 가능 회의실 검색");

	var currentDay = new Date();
	var year = currentDay.getFullYear();
	var month = ('0' + (currentDay.getMonth() + 1)).slice(-2);
	var day = ('0' + currentDay.getDate()).slice(-2);
	var reserve_day = year + '-' + month + '-' + day;

	console.log("처음 검색 시 reserve_day", reserve_day);

	var timeslot = document.querySelector('select[name="timeslot"]').value;
	if (timeslot.length === 1) {
		timeslot = '0' + timeslot;
	}
	var locality = document.querySelector('select[name="locality"]').value;
	var floor = document.querySelector('select[name="floor"]').value;
	var capacity = parseInt(document.querySelector('select[name="capacity"]').value);

	console.log("timeslot: ", timeslot);
	console.log("locality: ", locality);
	console.log("floor: ", floor);
	console.log("capacity: ", capacity);

	searchReserveListWithDate(reserve_day, timeslot, locality, floor, capacity);

	// id가 selectedDate인 요소를 찾아 오늘 날짜로 설정
	var selectedDateElement = document.getElementById('selectedDate');
	if (selectedDateElement) {
		selectedDateElement.textContent = year + '년 ' + month + '월 ' + day + '일';
	}

	// 달력의 클릭 상태 초기화
	var calendarCells = document.querySelectorAll('.calendar-cell');
	calendarCells.forEach(function(cell) {
		cell.classList.remove('selected');
	});
}



// "검색 조건은 그대로 유지"한채 날짜를 클릭시 가져오는 값이 다르다
function dateClicked() {
	var selectedDateElement = document.getElementById('selectedDate');
	if (selectedDateElement) {
		var selectedDateValue = selectedDateElement.textContent;
		console.log("선택된 날짜: ", selectedDateValue);

		var parts = selectedDateValue.split(' ');
		if (parts.length >= 3) {
			var year = parts[0].slice(0, 4);
			var month = parts[1].slice(0, -1);
			var day = parts[2].slice(0, -1);
			var reserve_day = year + '-' + month.padStart(2, '0') + '-' + day.padStart(2, '0'); // 포맷 변경

			console.log("변환된 날짜: ", reserve_day);

			var locality = document.querySelector('select[name="locality"]').value;
			var floor = document.querySelector('select[name="floor"]').value;
			var timeslot = document.querySelector('select[name="timeslot"]').value;
			if (timeslot.length === 1) {
				timeslot = '0' + timeslot;
			}
			var capacity = parseInt(document.querySelector('select[name="capacity"]').value);

			searchReserveListWithDate(reserve_day, timeslot, locality, floor, capacity);
		} else {
			console.error("날짜 형식이 올바르지 않습니다.");
		}
	} else {
		console.error("선택된 날짜 요소를 찾을 수 없습니다.");
	}

	// 오늘 날짜를 선택되어 있도록 설정
	var todayButton = document.getElementById('todayButton');
	todayButton.classList.add('active');
}

function displayReservationData(data) {
	console.log("리스트 호출 함수 진입");
	console.log("reserveTime에서 받은 date : ", data);

	var tableBody = document.getElementById('tableBody');
	tableBody.innerHTML = ''; // 기존 테이블 내용을 비웁니다.

	var availableRooms = 0; // 예약 가능 회의실 개수 초기화
	var hasAvailableRooms = false; // 예약 가능 회의실 존재 여부 초기화

	data.forEach(function(item, index) {
		// 예약 가능한 회의실인 경우만 처리
		if (item.conferenceVo.status === "예약가능") {
			availableRooms++;
			hasAvailableRooms = true; // 예약 가능한 회의실이 존재함을 표시

			// 리스트에 예약 가능한 회의실 정보 추가
			var row = document.createElement('tr');
			row.innerHTML = `
                <td style="text-align: center;">${availableRooms}</td> <!-- 예약 가능 회의실의 순서로 인덱스 표시 -->
                <td style="text-align: center;">${item.conferenceVo.cname}</td>
                <td style="text-align: center;">${item.conferenceVo.capacity}</td>
                <td style="text-align: center;">${item.conferenceVo.locality}</td>
                <td style="text-align: center;">${item.conferenceVo.ho}</td>
                <td style="text-align: center;"><button class="btn btn-outline-primary" onclick="reservationForm('${item.conferenceVo.conf_id}','${item.conferenceVo.cname}')">예약하기</button></td>
            `;
			tableBody.appendChild(row);
		}
	});

	// 예약 가능 회의실이 없는 경우 메시지 출력
	if (!hasAvailableRooms) {
		var noResultRow = document.createElement('tr');
		noResultRow.innerHTML = '<td colspan="5" style="text-align: center; height: 200px;">예약 가능 회의실이 없습니다</td>';
		tableBody.appendChild(noResultRow);
	}

	// 예약 가능 회의실 수 표시
	var roomCountElement = document.getElementById('roomCount');
	roomCountElement.textContent = `${availableRooms}`;
}

function reservationForm(conf_id, cname) {
	console.log("예약클릭");
	console.log("conf_id : ", conf_id);
	console.log("cname : ", cname);
	console.log("reserve_day : ", reserve_day);
	console.log("timeslot : ", timeslot);

	// reserve_day 및 timeslot을 조합하여 필요한 형식으로 변환
	var reserveDateTime = reserve_day + ' ' + timeslot + ':00:00'; // 초를 포함하여 형식을 변경
	console.log("변환된 예약일시 : ", reserveDateTime);
	// 예약 모달 창에 값 채우기
	document.getElementById('cname').value = cname;
	document.getElementById('reserve_day').value = formatDate(reserve_day);

	// 날짜 형식 변환 함수
	function formatDate(dateString) {
		const date = new Date(dateString);
		const year = date.getFullYear();
		const month = (date.getMonth() + 1).toString().padStart(2, '0');
		const day = date.getDate().toString().padStart(2, '0');
		return year + '년 ' + month + '월 ' + day + '일';
	}
	var timeslotStart = timeslot + ':00';
	var timeslotEnd = (parseInt(timeslot) + 2).toString() + ':00';
	document.getElementById('time').value = timeslotStart + ' - ' + timeslotEnd;

	// 모달 창 열기
	$('#reserveFormModal').modal('show');

	// addReserveHandler 버튼 클릭 이벤트 처리
	document.getElementById('addReserveHandler').addEventListener('click', function() {
		var meetingtitle = document.getElementById('meetingtitle').value;
		console.log("meetingtitle : ", meetingtitle);

		// AJAX 요청을 통해 서버로 데이터 전송
		fetch('./insertReserve.do', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				conf_id: conf_id,
				cname: cname,
				reserve_date: reserveDateTime,
				meetingtitle: meetingtitle
			}),
		})
			.then(response => response.json())
			.then(result => {
				const returnStatus = parseInt(result);
				console.log("회의실 예약 결과:", returnStatus);
				if (returnStatus == 1) {
					console.log("예약 성공");
					document.getElementById("reserveForm").reset();
					$("#reserveFormModal").modal("hide");
					var modalText = "예약되었습니다";
					alertModel(modalText);
				} else if (returnStatus == -1) {
					console.log("예약 실패");
					alert("중복된 예약이 있습니다");
				} else if (returnStatus == 0) {
					console.log("예약 실패");
					alert("회의실 정보가 없습니다");
				} else {
					console.log("예약 실패");
					alert("관리자에게 문의하세요");
				}

			})
			.catch(error => console.error('오류:', error));
	});
}

function alertModel(modalText) {
    var modalContent = `
        <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="reserveModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-centered custom-class">
		        <div class="modal-content" style="max-width: 300px;">
		            <div class="modal-body text-center" style="padding: 30px;">
		                <p style="margin-top: 30px; margin-bottom: 30px;">${modalText}</p>
		                <button type="button" id="close" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px; margin: auto;">닫기</button>
		            </div>
		        </div>
		    </div>
		</div>
    `;

    var modalElement = $(modalContent);
    modalElement.modal('show');

    // 모달이 표시된 후에 실행되는 코드
    modalElement.on('shown.bs.modal', function() {
        var modalDialog = modalElement.find('.modal-dialog');
        var windowHeight = $(window).height();
        var modalHeight = modalDialog.height();
        var topMargin = (windowHeight - modalHeight) / 2;
        modalDialog.css('margin-top', topMargin);
    });

    // 모달 닫기 버튼 클릭 시 실행되는 코드
     modalElement.find('#close').on('click', function() {
        window.location.reload();
    });
}


function showConfirmationModal(reserveno) {
	// 모달창에 예약번호를 전달
	document.getElementById('confirmationModal').dataset.reserveno = reserveno;
	// 모달창 띄우기
	$('#confirmationModal').modal('show');
}

function deleteReserve() {
	var reserveno = document.getElementById('confirmationModal').dataset.reserveno;
	fetch('./deleteReserve.do?reserveno=' + reserveno)
		.then(response => response.json())
		.then(data => {
			if (data === 1) {
				console.error('예약 삭제에 실패했습니다.');

			} else {
				console.log('예약이 성공적으로 삭제되었습니다.');
				$('#confirmationModal').modal('hide');
				$('#alertModal').modal('show');
				var modalText = "취소되었습니다";
				alertModel(modalText)
			}
		})
		.catch(error => {
			console.error('오류 발생:', error);
		});
}