<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>draftFormTest.jsp</title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
	<input type="text" id="daterangepicker" name="daterangepicker" value="" />
	<input type="hidden" id="start_day" name="start_day" value="">
	<input type="hidden" id="end_day" name="end_day" value="">
	<script>
	// dadtarangepicker를 위한 api를 적용

	var start_day = document.getElementById("start_day").value;
	console.log("start_day", start_day);
	var end_day = document.getElementById("end_day").value;
	console.log("end_day", end_day);
	$('#daterangepicker').daterangepicker({
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
		"startDate": new Date(),
		"endDate": new Date(),
		"drops": "down"
	})

	</script>
</body>
</html>