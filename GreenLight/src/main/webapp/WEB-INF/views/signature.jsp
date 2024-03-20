<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body class="nav-fixed">

	<%@ include file="./include/mainHeader.jsp"%>

	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file="./include/mainSidenav.jsp"%>
		
		<c:set var="count" value="0" />
		<c:forEach items="${list}" var="list">
		    <c:if test="${list.estatus eq 'Y'}">
		        <c:set var="count" value="${count + 1}" />
		    </c:if>
		</c:forEach>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">서명 정보</h1>
				<div
					style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;">
				</div>
				<hr class="mt-0 mb-4">
					<div>
		<table class="table">
			<tbody>
				<c:forEach var="lists" items="${signlist}" varStatus="vr">
					<tr>
						<td>${vr.count}</td>
						<td>${lists.getId()}</td>
						<td><a href="./selectOneSign.do?s_seq=${lists.getS_seq()}">${lists.getS_title()}</a></td>
						<td>${lists.getS_indate()}</td>
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