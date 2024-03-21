<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body class="nav-fixed">
   
  <%@ include file="./include/mainHeader.jsp" %>

<!-- 사이드나브바 & 콘텐트 영역 -->
   <div id="layoutSidenav">
      <%@ include file="./include/mainSidenav.jsp" %>
      
<!-- 콘텐츠 영역 -->      
      <div id="layoutSidenav_content">
         <div id="main_content">
         	<h1 style="margin-bottom: 70px; text-align: center;">나의 예약 현황</h1>
         	<div style="display: flex; justify-content: flex-end; margin-top: 50px; height: 60.8px;">
         		<div style="display: flex; flex-direction: row;">
					<input class="form-control" type="text" placeholder="Search..." aria-label="Search" style="width:200px; margin-right: 15px; height: 42px;">
					<div class="datatable-dropdown">
		                <select class="datatable-selector">
			               	<option value="5">월</option>
			               	<option value="10" selected="">10</option>
			               	<option value="15"></option>
			               	<option value="20">20</option>
			               	<option value="25">25</option>
		               	</select> 
		       		</div>
	       		</div>
			</div>
         	<hr class="mt-0 mb-5">
			<div>
				<table class="datatable-table">
					<thead>
						<tr style="width: 100%;">
							<th style="width: 15%; text-align: center;">예약번호</th>
							<th style="width: 15%; text-align: center;">회의실명</th>
							<th style="width: 30%; text-align: center;">예약시간</th>
							<th style="width: 20%; text-align: center;">목적</th>
							<th style="width: 10%; text-align: center;">상태</th>
							<th style="width: 10%; text-align: center;">취소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${lists}" varStatus="vs">
							<tr>
								<td style="text-align: center;">${vo.reservationVo.reserveno}</td>
									<!-- reserveno 속성에 접근 -->
								<td style="text-align: center;">${vo.conferenceVo.cname}</td>
								<td style="text-align: center;">
    								<fmt:formatDate value="${vo.reservationVo.reserve_date}" pattern="yyyy-MM-dd HH:mm" var="formattedDate" />
        							<c:out value="${formattedDate}" />
								</td>
								<td style="text-align: center;">${vo.reservationVo.meetingtitle}</td>
								<td style="text-align: center;">
        							사용예정
   			 					</td>
   			 					<td style="text-align: center;">
        							<button style="width: 80px;" class="btn btn-primary btn-sm" type="button">취소</button>
   			 					</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>	
		</div>
         <%@ include file="./include/footer.jsp" %>
      </div>
   </div>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="js/scripts.js"></script>

   
</body>
</html>