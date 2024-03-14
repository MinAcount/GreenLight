<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body class="nav-fixed">
   
  <%@ include file="./include/adminHeader.jsp" %>
   
   
   
<!-- 사이드나브바 & 콘텐트 영역 -->
   <div id="layoutSidenav">
      <%@ include file="./include/adminSidenav.jsp" %>
      
<!-- 콘텐츠 영역 -->      
      <div id="layoutSidenav_content">
         <div id="main_content">
         	<h1 style="margin-bottom: 50px; text-align: center;">문서양식함</h1>
         	<hr>
         	<div style="display: flex; justify-content: space-between; margin-top: 50px;">
				<div class="datatable-dropdown">
	                <select class="datatable-selector">
		               	<option value="5">5</option>
		               	<option value="10" selected="">10</option>
		               	<option value="15">15</option>
		               	<option value="20">20</option>
		               	<option value="25">25</option>
	               	</select> 
	       		</div>
				<input class="form-control" type="text" placeholder="Search..." aria-label="Search" style="width:200px;">
			</div>
			<div style="margin-top: 20px;">
				<table class="datatable-table">
					<thead>
						<tr>
							<th class="chkbox-td"><input class="form-check-input" id="flexCheckDefault" type="checkbox" value=""></th>
							<th class="title-td">제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="chkbox-td"><input class="form-check-input" id="flexCheckDefault" type="checkbox" value=""></td>
							<td class="title-td">휴가신청서</td>
							<td>관리자</td>
							<td>2024.03.13</td>
						</tr>
						<tr>
							<td class="chkbox-td"><input class="form-check-input" id="flexCheckDefault" type="checkbox" value=""></td>
							<td class="title-td">부서발령신청서</td>
							<td>관리자</td>
							<td>2024.03.13</td>
						</tr>
						<tr>
							<td class="chkbox-td"><input class="form-check-input" id="flexCheckDefault" type="checkbox" value=""></td>
							<td class="title-td">지출결의서</td>
							<td>관리자</td>
							<td>2024.03.13</td>
						</tr>
					</tbody>
				</table>
				<div style="margin-top: 50px; text-align: right;">
					<button class="btn btn-secondary" type="button" data-bs-toggle="modal" data-bs-target="#templateCat">문서양식유형관리</button>
					<div data-bs-backdrop="static" class="modal fade" id="templateCat" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			    		<div class="modal-dialog" role="document" style="max-width: 800px;">
			        		<div class="modal-content">
			            		<div class="modal-header">
			                		<h5 class="modal-title" id="exampleModalLabel">
			                			<i style="margin-top: 2px; margin-right: 2px;" class="feather-lg" data-feather="settings"></i>
			                			문서양식유형 관리
			                		</h5>
			                		<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
			            		</div>
			            		<div class="modal-body">
			            			<div style="text-align: right; margin-top: 30px; margin-left: 10px;">
			            				<button class="btn btn-primary btn-sm" type="button">추가</button>
			            			</div>
			            			<table class="datatable-table" style="margin-top:10px; margin-bottom: 20px;">
										<thead>
											<tr style="width: 100%;">
												<th style="width: 20%;">코드</th>
												<th style="width: 55%;">이름</th>
												<th style="width: 25%;">수정 및 삭제</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>01</td>
												<td><input class="edit-input" type="text" value="휴가신청서" readonly="readonly"></td>
												<td style="text-align: center;">
													<button class="btn btn-secondary btn-sm" type="button">수정</button>
													<button class="btn btn-danger btn-sm" type="button" style="margin-left:20px;">삭제</button>
												</td>
											</tr>
											<tr>
												<td>02</td>
												<td><input class="edit-input" type="text" value="발령신청서" readonly="readonly"></td>
												<td style="text-align: center;">
													<button class="btn btn-secondary btn-sm" type="button">수정</button>
													<button class="btn btn-danger btn-sm" type="button" style="margin-left:20px;">삭제</button>
												</td>
											</tr>
											<tr>
												<td>03</td>
												<td><input class="edit-input" type="text" value="지출결의서" readonly="readonly"></td>
												<td style="text-align: center;">
													<button class="btn btn-secondary btn-sm" type="button">수정완료</button>
													<button class="btn btn-danger btn-sm" type="button" style="margin-left:20px;">삭제</button>
												</td>
											</tr>
										</tbody>
									</table>
									<div style="text-align: left; margin-bottom: 30px; margin-left: 10px;">
			            				<button class="btn btn-primary btn-sm" type="button">추가</button>
			            			</div>
			            		</div>
				        	</div>
				    	</div>
					</div>
					<button style="margin-left: 10px;" class="btn btn-primary" type="button" onclick="javascript:location.href='./templateAdd.do'">문서양식등록</button>
				</div>
			</div>

		</div>
         <%@ include file="./include/footer.jsp" %>
      </div>
   </div>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="js/scripts.js"></script>

   
</body>
</html>