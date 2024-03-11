<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
<div id="layoutSidenav_nav">
         <nav class="sidenav shadow-right sidenav-dark">
            <div class="sidenav-menu">
               <div class="nav accordion" id="accordionSidenav">
                  <div class="sidenav-menu-heading d-sm-none">Account</div>
                  
                  
<!-- 일정 -->
                  <a class="nav-link collapsed" href="javascript:void(0);"
                     data-bs-toggle="collapse" data-bs-target="#collapseCal"
                     aria-expanded="false" aria-controls="collapseCal">
                     <div class="nav-link-icon">
                        <i data-feather="calendar"></i>
                     </div>
                     일정
                     <div class="sidenav-collapse-arrow">
                        <i class="fas fa-angle-down"></i>
                     </div>
                  </a>
                  <div class="collapse" id="collapseCal"
                     data-bs-parent="#accordionSidenav">
                     <nav class="sidenav-menu-nested nav">
                        <a class="nav-link" href="wizard.html">기념일/공휴일</a>
                     </nav>
                  </div>
                  
                  <hr style="margin-top:10px; margin-bottom:10px; margin-left:8px; margin-right:8px;">
                  
<!-- 예약 -->
                  <a class="nav-link collapsed" href="javascript:void(0);"
                     data-bs-toggle="collapse" data-bs-target="#collapseReservation"
                     aria-expanded="false" aria-controls="collapseReservatioon">
                     <div class="nav-link-icon">
                        <i data-feather="check"></i>
                     </div> 
                     예약
                     <div class="sidenav-collapse-arrow">
                        <i class="fas fa-angle-down"></i>
                     </div>
                  </a>
                  <div class="collapse" id="collapseReservation" data-bs-parent="#accordionSidenav">
                     <nav class="sidenav-menu-nested nav">
                        <a class="nav-link" href="wizard.html">회의실 목록</a>
                        <a class="nav-link" href="wizard.html">예약관리</a>
                     </nav>
                  </div>
                  
                  
                  <hr style="margin-top:10px; margin-bottom:10px; margin-left:8px; margin-right:8px;">
                  
<!-- 문서양식함관리 -->
                  <a class="nav-link" href="charts.html"><div class="nav-link-icon">
                  	<i data-feather="file"></i></div>
                    문서양식함 관리
                  </a>
                  

			 </div>    
         </nav>
      </div>
</body>
</html>