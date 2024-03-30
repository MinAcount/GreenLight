<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body class="nav-fixed">

	<%@ include file="./include/mainHeader.jsp"%>

	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file="./include/mainSidenav.jsp"%>


		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">나의 휴가현황</h1>
				<input type="hidden" id="hiddenMonth" value="${month}">
				<h2><input type="month" style="border: 0" id="MM" value="${month}"  onchange="updateMonth()"></h2>
				<div
					style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;">
				</div>
				<hr class="mt-0 mb-4">
				<div>
				<table class="table">
					<thead>
						<tr>
							<td>이름</td>
							<td>부서</td>
							<td>휴가종류</td>
							<td>연차사용기간</td>
							<td>사용연차</td>
							<td>내용</td>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach var="vlist" items="${vacationList}" varStatus="vr">
					    <tr>
					        <td>${lists.empVo.name}</td>
					        <td>${lists.deptVo.dname}</td>
							<c:choose>
								<c:when test="${vlist.half eq 'A'}">
							        <td>오전반차</td>
								</c:when>
								<c:when test="${vlist.half eq 'P'}">
							        <td>오후반차</td>
								</c:when>
								<c:otherwise>
							        <td>연차</td>
								</c:otherwise>
							</c:choose>					        
					        
 					        <td>${vlist.start_day.substring(0,10)}~${vlist.end_day.substring(0,10)}</td> 
					        <td>${vlist.getsu}</td>
					        <td>${vlist.bigo}</td>
					    </tr>
					</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script type="text/javascript">
function updateMonth(){
	var hiddenMonth = document.getElementById('hiddenMonth').value;
	var selectMonth = document.getElementById('MM').value;
	var encodedMonth = encodeURIComponent(selectMonth);
	var dateYear = new Date().getFullYear();
	var dateMonth = new Date().getMonth()+1;
	if(new Date(selectMonth) > new Date()){
		alert("현재보다 나중 날짜는 선택할 수 없습니다");
		console.log(dateYear+"-"+dateMonth)
		document.getElementById('MM').value = hiddenMonth;
		return false;
	}
	window.location.href='./myVacation.do?in_date='+encodedMonth;
}
	</script>


</body>
</html>