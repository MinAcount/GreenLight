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
							<th style="width: 35%; text-align: center;">제목</th>
		                     <th style="width: 17.5%; text-align: center;">생성일</th>
		                     <th style="width: 20%; text-align: center;">문서양식유형</th>
		                     <th style="width: 15%; text-align: center;">기안서상태</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
						<c:when test="${empty lists || lists.size() eq 0 }">
						<tr>
							<td style="text-align: center;" colspan="5"><b>표시할 기안서가 없습니다..</b></td>
						</tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="vo" items="${lists}" varStatus="vs">
							<tr>
								<td>
									<a href="./tempDraftDetail.do?docno=${vo.docno}">
										<c:choose>
							                <c:when test="${vo.urgency eq 'Y'}">
							                    <span style="margin-right: 7px;" class="badge badge-danger">긴급</span>
							                </c:when>
							                <c:otherwise>
							                    
							                </c:otherwise>
							            </c:choose>
										${vo.title}  
										<c:choose>
							                <c:when test="${vo.file_count > 0}">
							                    &nbsp;&nbsp;[<i data-feather="paperclip"></i>${vo.file_count}]
							                </c:when>
							                <c:otherwise>
							                    
							                </c:otherwise>
							            </c:choose>
									</a>
									<input id="docno" type="hidden" value="${vo.docno}">
									</td>
									<td style="text-align: center;">
										<script>
									        var dDate = formatDate("${vo.draft_date}" );
									        document.write(dDate);
									    </script>
									</td>
								<td style="text-align: center;">${vo.tempcode}</td>
                        		<td style="text-align: center;">${vo.doc_status}</td>
							</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
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