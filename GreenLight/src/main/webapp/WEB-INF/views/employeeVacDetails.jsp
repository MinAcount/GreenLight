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
				<h1 style="margin-bottom: 70px; text-align: center;">${vacVo.empVo.name} 연차현황</h1>
				<input type="hidden" value="${EVo.id}" name="id">
				<input type="hidden" id="hiddenMonth" value="${month}">
				<h2><input type="month" style="border: 0" id="MM" value="${month}"  onchange="updateMonth()"></h2>
				<div
					style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;">
				</div>
				<hr class="mt-0 mb-4">
				
				<form>
					<div class="container-xl px-4 mt-4">
						<div class="row">
							<div class="col-xl-4" style="width: 60%; margin: 0 auto;">
							</div>
							<div class="col-xl-8" style="width: 100%; margin: 10px auto;">
								<div class="card mb-4">
									<div class="card-header" id="id">${vacVo.empVo.id}</div>
									<div class="card-body">
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="etype">이름</label>
												<div class="datatable-dropdown">
													<input class="form-control" id="hidden_etype" value="${vacVo.empVo.name}" disabled="disabled">
												</div>
											</div>
											<div class="col-md-6">
												<label class="small mb-1" for="gender">부서</label>
												<div class="datatable-dropdown">
													<input class="form-control" id="hidden_etype" value="${vacVo.deptVo.dname}" disabled="disabled">
												</div>
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="etype">사원번호</label>
												<div class="datatable-dropdown">
													<input class="form-control" id="hidden_etype" value="${vacVo.empVo.id}" disabled="disabled">
												</div>
											</div>
											<div class="col-md-6">
												<label class="small mb-1" for="etype">직위</label>
												<div class="datatable-dropdown">
													<c:forEach var="EVo" items="${elists}">
														<c:if test="${EVo.id eq vacVo.empVo.id}">
															<input class="form-control" id="hidden_etype" value="${EVo.spot}" disabled="disabled">
														</c:if>
													</c:forEach>
												</div>
											</div>
										</div>
										<div class="row gx-3 mb-3">
										<div class="col-md-6">
												<label class="small mb-1" for="leave">총연차</label>
											<div class="datatable-dropdown">
												<input class="form-control" id="leave" name="leave" placeholder="총연차" value="${vacVo.empVo.leave}" disabled="disabled">
											</div>
										</div>
										<div class="col-md-6">
												<label class="small mb-1" for="Used_Leave">사용연차</label>
											<div class="datatable-dropdown">
												<input class="form-control" id="Used_Leave" name="Used_Leave" placeholder="사용연차" value="${vacVo.used_leave}" disabled="disabled">
											</div>
										</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-12">
												<label class="small mb-1" for="Used_Leave">잔여연차</label>
												<input class="form-control" id="Used_Leave" name="Used_Leave" placeholder="잔여연차" value="${vacVo.remaining_leave}" disabled="disabled">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>

				<hr class="mt-0 mb-4">
				<div>
					<table class="table">
						<thead>
							<tr>
								<td>휴가종류</td>
								<td>연차사용기간</td>
								<td>사용연차</td>
								<td>내용</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vlist" items="${vacationList}" varStatus="vr">
							    <tr>
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
							        <td>
							        ${vlist.bigo}
										<c:if test="${vacVo.empVo.join_day.substring(5,10) > vlist.start_day.substring(5,10)}">
										    (전 연차 사용분)
										</c:if>
							        </td>
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
	var id = document.getElementById('id').innerText;
	window.location.href='./employeeVacDetails.do?id='+id+'&in_date='+encodedMonth;
}
	</script>

</body>
</html>