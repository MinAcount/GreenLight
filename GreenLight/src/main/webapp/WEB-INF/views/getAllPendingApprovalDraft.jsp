<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getAllPendingApprovalDraft</title>
</head>
<body class="nav-fixed">
	<%@ include file="./include/mainHeader.jsp"%>
	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav" style="display: flex;">
		<%@ include file="./include/mainSidenav.jsp"%>
		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">결재대기문서함</h1>
				<div>
					<table class="datatable-table">
						<colgroup>
							<col style="width: 40%">
							<col style="width: 12%">
							<col style="width: 12%">
							<col style="width: 12%">
							<col style="width: 12%">
							<col style="width: 12%">
						</colgroup>
						<thead>
							<tr style="width: 100%">
								<th>제목</th>
								<th>기안일</th>
								<th>긴급</th>
								<th>작성자</th>
								<th>문서양식유형</th>
								<th>첨부</th>
							</tr>
						</thead>
						<tbody id="tableBody">
							<c:forEach var="vo" items="${lists}" varStatus="vs">
							<tr class="item">
								<td><a href="./draftDetail.do?docno=${vo.docno}">${vo.title}</a></td>
								<td>${vo.draft_date}</td>
								<td>
									<c:choose>
									<c:when test="${vo.urgency eq 'Y'}">
									긴급!
									</c:when>
									<c:otherwise>
									-
									</c:otherwise>
									</c:choose>
								</td>
								<td>${vo.empVo.getName()}</td>
								<td>${vo.commVo.code_name}</td>
								<td>${vo.file_count}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div style="margin-top: 50px;">
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