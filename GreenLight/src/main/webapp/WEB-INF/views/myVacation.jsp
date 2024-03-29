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
				<hr>
				<h2></h2>
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
					        <td>${lists[0].empVo.name}</td>
					        <td>${lists[0].deptVo.dname}</td>
					        <td>${vlist.getsu}</td>
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



</body>
</html>