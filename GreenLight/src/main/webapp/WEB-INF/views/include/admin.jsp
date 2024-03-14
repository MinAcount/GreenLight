<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<body class="nav-fixed" style="background-color:rgba(255, 255, 255, 0.9)">

<%@ include file="./adminHeader.jsp" %>

<!-- 사이드나브바 & 콘텐트 영역 -->
   <div id="layoutSidenav">
      <%@ include file="./adminSidenav.jsp" %>
      
<!-- 콘텐츠 영역 -->      
      <div id="layoutSidenav_content">
         <div id="main_content">
 
<!-- 드롭다운 -->
	         <div class="dropdown">
	           	<button class="btn btn-primary btn-sm dropdown-toggle" id="dropdownMenuButton" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown Button</button>
	               <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="">
		               <a class="dropdown-item" href="#!">Action</a>
		               <a class="dropdown-item" href="#!">Another action</a>
		               <a class="dropdown-item" href="#!">Something else here</a>
	              </div>
               </div>
                
               <br>
                
<!-- 버튼 -->
               <button class="btn btn-primary btn-sm" type="button" style="margin-right:10px;">Primary</button>
               <button class="btn btn-danger btn-sm" type="button" style="margin-right:10px;">Danger</button>
               <button class="btn btn-secondary btn-sm" type="button">Secondary</button>
               
               <br>
               <br>
               
<!-- 알림창 -->
               <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1;">
			    <div class="toast-header text-primary">
			        <i data-feather="check-circle" id="toastFeather"></i>
			        <strong class="me-auto">Primary Text Toast</strong>
				       <button class="ml-2 mb-1 btn-close" type="button" data-bs-dismiss="toast" aria-label="Close">                                                            </button>
			   </div>
				<div class="toast-body">This toast uses the primary text utility on the toast header.</div>
			</div>
			<br><br>
			<div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1;">
			    <div class="toast-header text-danger">
			        <i data-feather="alert-circle" id="toastFeather"></i>
			        <strong class="me-auto">Danger Text Toast</strong>
			        <button class="ml-2 mb-1 btn-close" type="button" data-bs-dismiss="toast" aria-label="Close">                                                            </button>
			    </div>
			    <div class="toast-body">This toast uses the danger text utility on the toast header.</div>
			</div>
				
			<br><br>
			
<!-- confirm 모달 -->
            <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1;">
			    <div class="toast-header text-primary">
			        <i data-feather="check-circle" id="toastFeather"></i>
			        <strong class="me-auto">Primary Text Toast</strong>
				       <button class="ml-2 mb-1 btn-close" type="button" data-bs-dismiss="toast" aria-label="Close">                                                            </button>
			   </div>
				<div class="toast-body">This toast uses the primary text utility on the toast header.
					<br><br><br>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Close</button>
					    <button style="margin-left: 10px;" class="btn btn-primary" type="button">Save changes</button>
				    </div>
			    </div>
			</div>
			
			<br><br><br>
			
            <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1;">
			    <div class="toast-header text-danger">
			        <i data-feather="alert-circle" id="toastFeather"></i>
			        <strong class="me-auto">Danger Text Toast</strong>
				       <button class="ml-2 mb-1 btn-close" type="button" data-bs-dismiss="toast" aria-label="Close">                                                            </button>
			   </div>
				<div class="toast-body">This toast uses the danger text utility on the toast header.
					<br><br><br>
					<div class="modal-footer">
						<button class="btn btn-dsecondary" type="button" data-bs-dismiss="modal">Close</button>
					    <button style="margin-left: 10px;" class="btn btn-danger" type="button">Delete</button>
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
			
			 
			    const litepickerDateRange2Months = document.getElementById('litepickerRangePlugin');
			    if (litepickerRangePlugin) {
				    new Litepicker({
					    element: litepickerRangePlugin,
					    singleMode: false,
					    numberOfMonths: 2,
					    numberOfColumns: 2,
					    format: 'MMM DD, YYYY',
					    lang: "ko-KR"
						});
					}
			 
				});
			</script>
				
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
			<input class="form-control" type="text" placeholder="Search..." aria-label="Search" style="width:200px; height:35px;">		
				
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
			
<!-- 모달창 -->
			<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Launch Demo Modal</button>

			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    		<div class="modal-dialog" role="document">
	        		<div class="modal-content">
	            		<div class="modal-header">
	                		<h5 class="modal-title" id="exampleModalLabel">Default Bootstrap Modal</h5>
	                		<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
	            		</div>
	            		<div class="modal-body">...</div>
		            	<div class="modal-footer">
			            	<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Close</button>
			            	<button class="btn btn-primary" type="button">Save changes</button>
		            	</div>
		        	</div>
		    	</div>
			</div>
		</div>
         <%@ include file="./footer.jsp" %>
      </div>
   </div>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="js/scripts.js"></script>

   
</body>
</html>