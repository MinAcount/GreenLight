<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
</head>
<body class="nav-fixed">
   
  <%@ include file="./mainHeader.jsp" %>
   
<!-- 사이드나브바 & 콘텐트 영역 -->
   <div id="layoutSidenav">
      <%@ include file="./mainSidenav.jsp" %>
      
<!-- 콘텐츠 영역 -->      
      <div id="layoutSidenav_content">
         <div id="main_content">
         
         
<!-- 테이블-->
			<table>
				<tbody>
					<tr class="trcss">
						<th class="thcss">작성자</th>
						<td><input type="text" class="form-control table-input"></td>
					</tr>
				</tbody>
			</table>
			<br>
			
			
<!-- 드롭다운 -->
	         <div class="dropdown">
	           	<button class="btn btn-primary dropdown-toggle" id="dropdownMenuButton" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown Button</button>
	               <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="">
		               <a class="dropdown-item" href="#!">Action</a>
		               <a class="dropdown-item" href="#!">Another action</a>
		               <a class="dropdown-item" href="#!">Something else here</a>
	              </div>
               </div>
                
               <br>
                
<!-- 버튼 -->
               <button class="btn btn-primary" type="button" style="margin-right:10px;" onclick="javascript:location.href='./templateAdd.do'">문서양식등록</button>
               <button class="btn btn-danger" type="button" style="margin-right:10px;">Danger</button>
               <button class="btn btn-secondary" type="button">Secondary</button>
               
               <br>
               <br>
               
<!-- 알림창 -->
			<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Launch Demo Modal</button>
			<div class="modal fade" data-bs-backdrop="static" id="staticBackdrop" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1;">
		        		<div class="modal-content">
		            		<div class="modal-header text-primary">
		                		<div class="modal-title" id="exampleModalLabel">
		                			<i data-feather="check-circle" id="toastFeather"></i>
				        			<strong class="me-auto">Primary Text Toast</strong>
		                		</div>
		                		<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
		            		</div>
		            		<div class="modal-body">This toast uses the primary text utility on the toast header.</div>
			        	</div>
			    	</div>
				</div>
				
				
				<br><br>
				
				
				
			<button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">Launch Demo Modal</button>
			<div class="modal fade" data-bs-backdrop="static" id="staticBackdrop1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1;">
		        		<div class="modal-content">
		            		<div class="modal-header text-danger">
		                		<div class="modal-title" id="exampleModalLabel">
		                			<i data-feather="check-circle" id="toastFeather"></i>
				        			<strong class="me-auto">Primary Text Toast</strong>
		                		</div>
		                		<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
		            		</div>
		            		<div class="modal-body">This toast uses the primary text utility on the toast header.</div>
			        	</div>
			    	</div>
				</div>
			
			<br><br><br>
			
<!-- confirm 모달 -->
            <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">confirm 모달</button>
			<div class="modal fade" data-bs-backdrop="static" id="staticBackdrop2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1;">
		        		<div class="modal-content">
		            		<div class="modal-header text-primary">
		                		<div class="modal-title" id="exampleModalLabel">
		                			<i data-feather="check-circle" id="toastFeather"></i>
				        			<strong class="me-auto">Primary Text Toast</strong>
		                		</div>
		                		<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
		            		</div>
		            		<div class="modal-body">This toast uses the primary text utility on the toast header.
		            			<br><br>
		            			<div class="modal-footer">
									<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Close</button>
								    <button style="margin-left: 10px;" class="btn btn-primary" type="button">Save changes</button>
							    </div>
		            		</div>
			        	</div>
			    	</div>
				</div>
				
				
				<br><br>
				
				
				
			<button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop3">confirm 모달</button>
			<div class="modal fade" data-bs-backdrop="static" id="staticBackdrop3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1;">
		        		<div class="modal-content">
		            		<div class="modal-header text-danger">
		                		<div class="modal-title" id="exampleModalLabel">
		                			<i data-feather="check-circle" id="toastFeather"></i>
				        			<strong class="me-auto">Primary Text Toast</strong>
		                		</div>
		                		<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
		            		</div>
		            		<div class="modal-body">This toast uses the primary text utility on the toast header.
		            			<br><br>
		            			<div class="modal-footer">
									<button class="btn btn-dsecondary" type="button" data-bs-dismiss="modal">Close</button>
								    <button style="margin-left: 10px;" class="btn btn-danger" type="button">Save changes</button>
							    </div>
		            		</div>
			        	</div>
			    	</div>
				</div>
			
			<br><br>
		
<!-- 알림 모달창 -->
			<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">alert 모달</button>
			
			
			<div class="modal fade" data-bs-backdrop="static" id="staticBackdrop" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1;">
		        		<div class="modal-content">
		            		<div class="modal-header text-primary">
		                		<div class="modal-title" id="exampleModalLabel">
		                			<i data-feather="check-circle" id="toastFeather"></i>
				        			<strong class="me-auto">Primary Text Toast</strong>
		                		</div>
		                		<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
		            		</div>
		            		<div class="modal-body">This toast uses the primary text utility on the toast header.</div>
			        	</div>
			    	</div>
				</div>
				
				
				<br><br>
				
				
				
				<button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">alert 모달</button>
			<div class="modal fade" data-bs-backdrop="static" id="staticBackdrop1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1;">
		        		<div class="modal-content">
		            		<div class="modal-header text-danger">
		                		<div class="modal-title" id="exampleModalLabel">
		                			<i data-feather="check-circle" id="toastFeather"></i>
				        			<strong class="me-auto">Primary Text Toast</strong>
		                		</div>
		                		<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
		            		</div>
		            		<div class="modal-body">This toast uses the primary text utility on the toast header.</div>
			        	</div>
			    	</div>
				</div>
			
			<br><br>
				
<!-- 체크박스 -->
			<div class="form-check">
			    <input class="form-check-input" id="flexCheckDefault" type="checkbox" value="">
			    <label class="form-check-label" for="flexCheckDefault">Default checkbox</label>
			</div>
			<div class="form-check">
			    <input class="form-check-input" id="flexCheckChecked" type="checkbox" value="" checked>
			    <label class="form-check-label" for="flexCheckChecked">Checked checkbox</label>
			</div>
			<div class="form-check">
			    <input class="form-check-input" id="flexCheckDisabled" type="checkbox" value="" disabled>
			    <label class="form-check-label" for="flexCheckDisabled">Disabled checkbox</label>
			</div>
			
			<br>
				
<!-- 라디오 버튼 -->
			<div class="form-check">
			    <input class="form-check-input" id="flexRadioDefault1" type="radio" name="flexRadioDefault">
			    <label class="form-check-label" for="flexRadioDefault1">Default radio</label>
			</div>
			<div class="form-check">
			    <input class="form-check-input" id="flexRadioDefault2" type="radio" name="flexRadioDefault" checked>
			    <label class="form-check-label" for="flexRadioDefault2">Default checked radio</label>
			</div>
			<div class="form-check">
			    <input class="form-check-input" id="flexRadioDefault3" type="radio" name="flexRadioDefault" disabled>
			    <label class="form-check-label" for="flexRadioDefault3">Default disabled radio</label>
			</div>
			
			<br>
			
<!-- litepicker  -->
			<div class="input-group input-group-joined" style="width: 14.5rem;">
    			<span class="input-group-text" id="litepickerSpan">
        			<i data-feather="calendar"></i>
    			</span>
   				<input class="form-control ps-0" id="litepickerRangePlugin" placeholder="Select date range..." />
			</div>
   			<script>
			    //총 4가지 모양의 달력.
			    window.addEventListener('DOMContentLoaded', event => {
			
			 
			    const litepickerDateRange2Months = document.getElementById('litepickerRangePlugin'); // 두달, 기간설정
			    if (litepickerRangePlugin) {
				    new Litepicker({
					    element: litepickerRangePlugin,
					    singleMode: false,
					    numberOfMonths: 2,
					    numberOfColumns: 2,
					    format: 'MMM DD, YYYY',
					    lang: "ko-KR" //한글로 변경
						});
					}
			 
				});
			</script>
			<!-- <script>
    //총 4가지 모양의 달력.
    window.addEventListener('DOMContentLoaded', event => {

    const litepickerSingleDate = document.getElementById('litepickerSingleDate'); // 한달, 하루 선택
    if (litepickerSingleDate) {
    new Litepicker({
    element: litepickerSingleDate,
    format: 'YYYY-MM-DD'
});
}

    const litepickerDateRange = document.getElementById('litepickerDateRange');
    if (litepickerDateRange) {
    new Litepicker({
    element: litepickerDateRange,
    singleMode: false,
    format: 'MMM DD, YYYY'
});
}

    const litepickerDateRange2Months = document.getElementById('litepickerDateRange2Months');
    if (litepickerDateRange2Months) {
    new Litepicker({
    element: litepickerDateRange2Months,
    singleMode: false,
    numberOfMonths: 2,
    numberOfColumns: 2,
    format: 'MMM DD, YYYY'
});
}

    const litepickerRangePlugin = document.getElementById('litepickerRangePlugin');
    if (litepickerRangePlugin) {
    new Litepicker({
    element: litepickerRangePlugin,
    startDate: new Date(),
    endDate: new Date(),
    singleMode: false,
    numberOfMonths: 2,
    numberOfColumns: 2,
    format: 'MMM DD, YYYY',
    plugins: ['ranges']
});
}
});

</script> -->
				
<!-- 페이징바 -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination pagination-sm justify-content-center">
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
			
			<br>
			
<!-- 검색창 -->
			<input class="form-control" type="text" placeholder="Search..." aria-label="Search" style="width:200px;">		
				
<!-- 로그인창 -->
            <div class="card shadow-lg border-0 rounded-lg mt-5" id="loginForm">
	            <div class="card-header justify-content-center"><h3 class="fw-light my-4">로그인</h3></div>
	            <div class="card-body">
	            	<form>
            
<!-- 이메일-->
		           		<div class="mb-3">
		            		<label class="small mb-1" for="inputId">아이디</label>
		            		<input class="form-control" id="inputId" type="text" placeholder="Enter email address">
		            	</div>
            
<!-- 비밀번호-->
			            <div class="mb-3">
			            	<label class="small mb-1" for="inputPassword">비밀번호</label>
			            	<input class="form-control" id="inputPassword" type="password" placeholder="Enter password">
			            </div>
            
<!-- 비밀번호 저장-->
			            <div class="mb-3">
			            	<div class="form-check">
			            		<input class="form-check-input" id="rememberPasswordCheck" type="checkbox" value="">
			            		<label class="form-check-label" for="rememberPasswordCheck">비밀번호 저장</label>
			            	</div>
			            </div>
	            
<!-- 로그인 박스-->
			            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
			            	<a class="small" href="#">비밀번호 찾기</a>
			            	<a class="btn btn-primary" href="#">로그인</a>
			            </div>
					</form>
				</div>
			</div>
			

		</div>
         <%@ include file="./footer.jsp" %>
      </div>
   </div>
   	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   	<script src="js/scripts.js"></script>
	<script type="text/javascript" src="js/cal.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
	<script type="text/javascript" src="js/jstree/schedule_jstree.js"></script>

</body>
</html>