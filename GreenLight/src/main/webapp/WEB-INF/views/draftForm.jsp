<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="./se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body class="nav-fixed">

	<%@ include file='./include/mainHeader.jsp'%>

	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file='./include/mainSidenav.jsp'%>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<!-- litepicker  -->
			<div class="input-group input-group-joined" style="width: 14.5rem;">
    			<span class="input-group-text" id="litepickerSpan">
        			<i data-feather="calendar"></i>
    			</span>
   				<input class="form-control ps-0" id="litepickerRangePlugin" placeholder="Select date range..." />
			</div>
   			<script>
			    //총 4가지 모양의 달력.
			    window.addEventListener('DOMContentLoaded', event => {
			
			 
			    const litepickerDateRange2Months = document.getElementById('litepickerRangePlugin'); // 두달, 기간설정
			    if (litepickerRangePlugin) {
				    new Litepicker({
					    element: litepickerRangePlugin,
					    singleMode: false,
					    numberOfMonths: 2,
					    numberOfColumns: 2,
					    format: 'MMM DD, YYYY',
					    lang: "ko-KR" //한글로 변경
						});
					}
			 
				});
			</script>
			</div>
			</div>
			</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>