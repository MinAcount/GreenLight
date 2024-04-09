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
		<c:set var="count" value="0" />
		<c:forEach items="${list}" var="list">
			<c:if test="${list.estatus eq 'Y'}">
				<c:set var="count" value="${count + 1}" />
			</c:if>
		</c:forEach>
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">나의 근태현황</h1>
				<input type="hidden" id="hiddenMonth" value="${month}">
				<h2><input type="month" style="border: 0" id="MM" value="${month}"  onchange="updateMonth()"></h2>
				<div
					style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;">
				</div>
				<hr class="mt-0 mb-4">
				<div>
				<input type="button" class="btn btn-secondary" value="엑셀로 다운로드" onclick="location.href='./excel.do?in_date=' + '${month}'" style="float: right;">
				<table class="table">
					<thead>
						<tr>
							<td>연번</td>
							<td>날짜</td>
							<td>출근시간</td>
							<td>퇴근시간</td>
							<td>비고</td>
						</tr>
					</thead>
					<tbody>
								<c:choose>
					<c:when test="${empty attList}">
					<tr>
					    <td colspan="6" style="text-align: center;">
					        <p>근태 내용이 없습니다.</p>
					    </td>
					</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="lists" items="${attList}" varStatus="vr">
							<tr>
							 <td>${vr.count}</td>
							 <td>${lists.in_date.substring(0,11)}</td>
							 <td>${lists.in_date.substring(11,16)}</td>
							 <td>${lists.out_date.substring(11,16)}</td>
							 <td>${lists.att_status != null ? lists.att_status : '-'}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					</c:choose>
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
	window.location.href='./myAttendance.do?in_date='+encodedMonth;
}
	</script>

</body>
</html>