$(document).ready(function(){
	// 언어를 한국어로 변경
	$.datetimepicker.setLocale('ko');
	 $("#start, #end").datetimepicker({//input 태그 클릭시 이벤트 처리
        disabledWeekDays: [0, 6], // 0: 일요일, 6: 토요일 // 주말 선택 불가
        minDate: 0, // 오늘 이후 날짜만 선택 가능
        allowTimes: ['09:00','09:30', '10:00','10:30', '11:00','11:30','12:00','12:30',
         '13:00','13:30','14:00','14:30','15:00','15:30','16:00','16:30','17:00','17:30',
         '18:00','18:30','19:00','19:30','20:00','20:30','21:00'] // 선택 가능한 시간
    });

// datetimepicker 생성
$("#start").datetimepicker({
	
});

$("#end").datetimepicker({
	
});


$("#imagebutton").click(function(){
	$("#start").datetimepicker('show');
});

$("#imagebutton2").click(function(){
	$("#end").datetimepicker('show');
});
})



