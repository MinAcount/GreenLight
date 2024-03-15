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
         	<h1 style="margin-bottom: 70px; text-align: center;">기안문서함</h1>
         	<div style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;">
         		<div>
         			<nav class="nav nav-borders">
         				<ul style="display: flex; flex-direction: row; height: 62px; margin-bottom: 0px; padding-top: 14px;">
                            <li class="nav-link active ms-0" onclick="location.href='#'">전체</li>
                            <li class="nav-link">진행</li>
                            <li class="nav-link">승인</li>
                            <li class="nav-link">반려</li>
                        </ul>
                    </nav>
                    
         		</div>
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
         	<hr class="mt-0 mb-4">
			<div>
				<table class="datatable-table">
					<thead>
						<tr style="width: 100%;">
							<th style="width: 2.5%;">
								<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
							</th>
							<th style="width: 9%;">문서번호</th>
							<th style="width: 20.5%;">제목</th>
							<th style="width: 5%;">긴급</th>
							<th style="width: 9%;">작성자</th>
							<th style="width: 15%;">기안일</th>
							<th style="width: 12%;">문서양식유형</th>
							<th style="width: 8%;">첨부</th>
							<th style="width: 9%;">기안서상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="chkbox-td">
								<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="chkbox-td">
								<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="chkbox-td">
								<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="chkbox-td">
								<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="chkbox-td">
								<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="chkbox-td">
								<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="chkbox-td">
								<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="chkbox-td">
								<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="chkbox-td">
								<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="chkbox-td">
								<input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
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