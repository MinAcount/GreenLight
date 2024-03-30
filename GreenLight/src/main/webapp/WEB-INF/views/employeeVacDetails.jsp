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
									<div class="card-header">${vacVo.empVo.id}</div>
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
													<input class="form-control" id="hidden_etype" value="${vacVo.empVo.spot}" disabled="disabled">
												</div>
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-12">
												<label class="small mb-1" for="email">이메일*</label>
												<input class="form-control" id="email" name="email" placeholder="이메일" value="${vo.email}" disabled="disabled">
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-12">
												<label class="small mb-1" for="address">주소</label>
												<input class="form-control" id="address" name="address" placeholder="주소" value="${vo.address}" disabled="disabled">
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="phone">전화번호*</label>
												<input class="form-control" id="phone" name="phone" placeholder="전화번호 ex)01012345678" maxlength="11" value="${vo.phone}" disabled="disabled">
											</div>
											<div class="col-md-6">
												<label class="small mb-1" for="birthday">생년월일</label>
												<fmt:parseDate value="${vo.birthday}" pattern = "yyyy-MM-dd HH:mm:ss" var="fmtBirthday"/>
												<input class="form-control" value="<fmt:formatDate value="${fmtBirthday}" pattern = "yyyy-MM-dd"/>" disabled="disabled">
											</div>
											<div class="col-md-6">
												<label class="small mb-1" for="join_day">입사일*</label>
												<fmt:parseDate value="${vo.join_day}" pattern = "yyyy-MM-dd HH:mm:ss" var="fmtJoinDay"/>
												<input class="form-control" id="hidden_join_day" value="<fmt:formatDate value="${fmtJoinDay}" pattern = "yyyy-MM-dd"/>" disabled="disabled">
												<div id="join_day" style="display: none;">
													<div class="input-group input-group-joined"
														style="width: 14.5rem;">
														<span class="input-group-text" id="litepickerSpan">
															<i data-feather="calendar"></i>
														</span> <input class="form-control ps-0"
															id="litepickerSingleDate" name="join_day"
															placeholder="YYYY-MM-DD" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<label class="small mb-1" for="join_day">퇴사일</label>
												<fmt:parseDate value="${vo.exit_day}" pattern = "yyyy-MM-dd HH:mm:ss" var="fmtExitDay"/>
												<input id="hidden_exit_day" class="form-control" value="<fmt:formatDate value="${fmtExitDay}" pattern = "yyyy-MM-dd"/>" disabled="disabled">
												<div id="exit_day" style="display: none;">
													<div class="input-group input-group-joined"
														style="width: 14.5rem;">
														<span class="input-group-text" id="litepickerSpan">
															<i data-feather="calendar"></i>
														</span> <input class="form-control ps-0"
															id="litepickerDate" name="exit_day"
															placeholder="YYYY-MM-DD" />
													</div>
												</div>
											</div>
										</div>
										<p style="font-size: 7px; position:absolute; right: 20px;">* 필수입력사항입니다.</p>
										
										<c:if test="${vo.estatus eq 'N'}">
											<button class="btn btn-danger" type="button" id="checkExitDayBtn" onclick="checkExitEmployee('N')">퇴사일 수정</button>
											<button class="btn btn-primary" style="display: none;" type="button" id="updateExitDayBtn" onclick="updateExitDay('${vo.id}')">수정 완료</button>
											<button class="btn btn-secondary" style="display: none;" type="button" id="cancelBtn" onclick="btnClean()">취소</button>
										</c:if>
										<c:if test="${vo.estatus eq 'Y'}">
											<button class="btn btn-primary" type="button" id="employeeModifyBtn" onclick="checkModifyEmployee()">수정</button>
											<button class="btn btn-danger" type="button" id="employeeExitBtn" onclick="checkExitEmployee('Y')">퇴사</button>
											<button class="btn btn-primary" style="display: none;" type="button" id="updateEmployeeBtn" onclick="updateEmployee('${vo.id}')">수정 완료</button>
											<button class="btn btn-primary" style="display: none;" type="button" id="updateExitBtn" onclick="updateExit('${vo.id}')">퇴사 결정</button>
											<button class="btn btn-secondary" style="display: none;" type="button" id="cancelBtn" onclick="btnClean()">취소</button>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>

				
				<div>
				<form id="editForm" action="./attUpdate.do" method="post">
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
							        <td>${vlist.bigo}</td>
							    </tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
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