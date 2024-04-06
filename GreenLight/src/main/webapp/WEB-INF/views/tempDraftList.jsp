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
         	<h1 style="margin-bottom: 70px; text-align: center;">임시저장함</h1>
         	<div style="display: flex; justify-content: flex-end; margin-top: 50px; height: 60.8px;">
         		<div style="display: flex; flex-direction: row;">
					<input class="form-control" type="text" placeholder="Search..." aria-label="Search" style="width:200px; margin-right: 15px; height: 42px;">
					<div class="datatable-dropdown">
		                <select class="datatable-selector">
			               	<option value="5">5</option>
			               	<option value="10" selected="">10</option>
			               	<option value="15">15</option>
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
							<th style="width: 2.5%;">
								<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
							</th>
							<th style="width: 35%;">제목</th>
							<th style="width: 17.5%;">생성일</th>
							<th style="width: 20%;">문서양식유형</th>
							<th style="width: 10%;">첨부</th>
							<th style="width: 15%;">기안서상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${lists}" varStatus="vs">
							<tr>
								<td class="chkbox-td">
									<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
								</td>
								<td><a href="./tempDraftDetail.do?docno=${vo.docno}">${vo.title}</a></td>
								<td>
									<fmt:parseDate var="dDate" value="${vo.draft_date}" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${dDate}"/>
								</td>
								<td>${vo.tempcode}</td>
								<td>${vo.file_count}</td>
								<td>${vo.doc_status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="margin-top: 50px;">
				<!-- 페이징바 -->
				<nav aria-label="Page navigation example">
				  <ul class="pagination pagination justify-content-center">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				        <span class="sr-only">Previous</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item"><a class="page-link" href="#">4</a></li>
				    <li class="page-item"><a class="page-link" href="#">5</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				        <span class="sr-only">Next</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>
         <%@ include file="./include/footer.jsp" %>
      </div>
   </div>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="js/scripts.js"></script>

   
</body>
</html>