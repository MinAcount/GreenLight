<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
	.form-control:focus, .datatable-input:focus {
	  color: #69707a;
	  box-shadow: 0 0 0 0.25rem rgba(46, 125, 50, 0.2);
	}
</style>
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
				<h1 style="margin-bottom: 70px; text-align: center;">직원 전체 정보</h1>
<!-- 				<div -->
<!-- 					style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;"> -->
<!-- 					<div> -->
<!-- 						<nav class="nav nav-borders"> -->
<!-- 							<ul id="selectEstatus" -->
<!-- 								style="display: flex; flex-direction: row; height: 62px; margin-bottom: 0px; padding-top: 14px;"> -->
<!-- 								<li class="nav-link active ms-0" -->
<%-- 									onclick="selectByStatus('A','emp'); setActive(this)" value="A">전체(${fn:length(list)})</li> --%>
<!-- 								<li class="nav-link" -->
<%-- 									onclick="selectByStatus('Y','emp'); setActive(this)" value="Y">재직중(${count})</li> --%>
<!-- 								<li class="nav-link" -->
<%-- 									onclick="selectByStatus('N','emp'); setActive(this)" value="N">퇴사자(${fn:length(list) - count})</li> --%>
<!-- 							</ul> -->
<!-- 						</nav> -->

<!-- 					</div> -->
<!-- 				</div> -->
				<hr class="mt-0 mb-4">
				<div>
					<table class="datatable-table" id="datatablesSimple">
						<thead>
							<tr style="width: 100%;">
								<th style="width: 5%;"></th>
								<th style="width: 9%;">사원번호</th>
								<th style="width: 20%;">부서</th>
								<th style="width: 15%;">이름</th>
								<th style="width: 10%;">직위</th>
								<th style="width: 10%;">직책</th>
								<th style="width: 15%;">재직상태</th>
							</tr>
						</thead>
						<tbody id="inputTableBody">
							<c:forEach var="vo" items="${list}" varStatus="vs">
								<tr onclick="location.href='./employeeOne.do?id=${vo.id}'">
									<td style="text-align: center;">${vs.count}</td>
									<td>${vo.id}</td>
									<c:forEach var="deptVo" items="${deptList}">
										<c:if test="${deptVo.deptno eq vo.deptno}">
											<td>${deptVo.dname}</td>
										</c:if>
									</c:forEach>
									<td>${vo.name}</td>
									<td>${vo.spot}</td>
									<c:if test="${vo.position != null}">
										<td>${vo.position}</td>
									</c:if>
									<c:if test="${vo.position == null}">
										<td>-</td>
									</c:if>
									<c:if test="${vo.estatus eq 'Y'}">
										<td>재직중</td>
									</c:if>
									<c:if test="${vo.estatus eq 'N'}">
										<td>퇴사</td>
									</c:if>
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
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables/datatables-simple-demo.js"></script>
	<script src="js/emp_ljw/emp.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#datatablesSimple').DataTable({

				"language" : {
					"emptyTable" : "직원이 없습니다",
					"lengthMenu" : " _MENU_",
					"info" : "_START_ - _END_ / _TOTAL_",
					            "search": "검색: ",
					"paginate" : {
						"next" : "다음",
						"previous" : "이전",
						"first" : "처음",
						"last" : "마지막"
					},
				},

				info : true, // 좌측하단 정보 표시 
				searching : true, // 검색 기능 
				ordering : false, // 정렬 기능
				paging : true, // 페이징 기능 
				lengthChange : true, //  좌상단 몇 건씩 볼지 정하는 기능
				lengthMenu : [ 10, 20, 30, 50, 100 ],
				pagingType : "full_numbers" // 페이징 타입 설정 : simple =이전, 다음 /simple_numbers 숫자페이징+이전 다음 , /full_numbers = 처음, 마지막 추가
			});
		});
	</script>
</body>
</html>