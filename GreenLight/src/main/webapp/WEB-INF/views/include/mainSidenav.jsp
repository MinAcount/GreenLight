<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<body>
	<div id="layoutSidenav_nav">
         <nav class="sidenav shadow-right sidenav-light">
            <div class="sidenav-menu">
               <div class="nav accordion" id="accordionSidenav">
                  <div class="sidenav-menu-heading d-sm-none">Account</div>
                  
                  <c:if test="${loginVo.auth =='02'}">
<!-- 인사팀 전용 메뉴 -->
                  <a class="nav-link collapsed" href="javascript:void(0);"
                     data-bs-toggle="collapse" data-bs-target="#collapseEmpl"
                     aria-expanded="false" aria-controls="collapseEmpl">
                     <div class="nav-link-icon">
                        <i data-feather="user"></i>
                     </div>
                     직원관리
                     <div class="sidenav-collapse-arrow">
                        <i class="fas fa-angle-down"></i>
                     </div>
                  </a>
                  <div class="collapse" id="collapseEmpl"
                     data-bs-parent="#accordionSidenav">
                     <nav class="sidenav-menu-nested nav">
                        <a class="nav-link" href="./employeeAddForm.do">직원 추가</a> 
                        <a class="nav-link" href="./employeeList.do">직원 정보</a> 
                        <a class="nav-link" href="wizard.html">휴가 관리</a>
                        <a class="nav-link" href="wizard.html">근태 관리</a>
                        <a class="nav-link" href="wizard.html">인사서류 관리</a>
                     </nav>
                  </div>
                  <a class="nav-link" href="charts.html"><div class="nav-link-icon">
                  	<i data-feather="users"></i></div>
                    부서관리
                  </a>
                  
                  <hr style="margin-top:10px; margin-bottom:10px; margin-left:8px; margin-right:8px;">
                  </c:if>
<!-- 전자결재 -->
                  <a class="nav-link" href="charts.html"><div class="nav-link-icon">
                  	<i data-feather="file"></i></div>
                    새 기안서 작성
                  </a>
                  
                  
                  <a class="nav-link collapsed" href="javascript:void(0);"
                     data-bs-toggle="collapse" data-bs-target="#collapseBoxes"
                     aria-expanded="false" aria-controls="collapseBoxes">
                     <div class="nav-link-icon">
                        <i data-feather="archive"></i>
                     </div> 
                     개인문서함
                     <div class="sidenav-collapse-arrow">
                        <i class="fas fa-angle-down"></i>
                     </div>
                  </a>
                  <div class="collapse" id="collapseBoxes" data-bs-parent="#accordionSidenav">
                     <nav class="sidenav-menu-nested nav">
                        <a class="nav-link" href="./tempDraftList.do">임시저장함</a> 
                        <a class="nav-link" href="./draftList.do">기안문서함</a>
                        <a class="nav-link" href="wizard.html">결재문서함</a>
                        <a class="nav-link" href="wizard.html">참조문서함</a>
                        <a class="nav-link" href="wizard.html">열람문서함</a>
                        <a class="nav-link" href="wizard.html">결재대기 문서함</a>
                     </nav>
                  </div>
                  
                  
                  <hr style="margin-top:10px; margin-bottom:10px; margin-left:8px; margin-right:8px;">
                  
<!-- 채팅 -->
                  <a class="nav-link" href="charts.html">
                  	<div class="nav-link-icon">
                  		<i data-feather="message-circle"></i>
                  	</div>
                    채팅
                  </a>
                  
                  <hr style="margin-top:10px; margin-bottom:10px; margin-left:8px; margin-right:8px;">
                  
<!-- 일정 -->
                  <a class="nav-link" href="#">
                     <div class="nav-link-icon">
                        <i data-feather="calendar"></i>
                     </div> 일정
                  </a>
                  
                  <hr style="margin-top:10px; margin-bottom:10px; margin-left:8px; margin-right:8px;">
                  
<!-- 예약 -->
                  <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse"
                  	data-bs-target="#collapseResv" aria-expanded="false" aria-controls="collapseResv">
                     <div class="nav-link-icon">
                        <i data-feather="check"></i>
                     </div> 예약
                     <div class="sidenav-collapse-arrow">
                        <i class="fas fa-angle-down"></i>
                     </div>
                  </a>
                  <div class="collapse" id="collapseResv" data-bs-parent="#accordionSidenav">
                     <nav class="sidenav-menu-nested nav">
                        <a class="nav-link" href="multi-tenant-select.html">회의실 예약</a> 
                        <a class="nav-link" href="multi-tenant-select.html">예약가능 회의실</a> 
                        <a class="nav-link" href="multi-tenant-select.html">나의 예약 현황</a> 
                     </nav>
                  </div>
                  
                  <hr style="margin-top:10px; margin-bottom:10px; margin-left:8px; margin-right:8px;">

<!-- 자신의 근태관리 -->
                  <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse"
                  	data-bs-target="#collapseAttd" aria-expanded="false" aria-controls="collapseAttd">
                     <div class="nav-link-icon">
                        <i data-feather="briefcase"></i>
                     </div> 근태관리
                     <div class="sidenav-collapse-arrow">
                        <i class="fas fa-angle-down"></i>
                     </div>
                  </a>
                  <div class="collapse" id="collapseAttd" data-bs-parent="#accordionSidenav">
                     <nav class="sidenav-menu-nested nav">
                        <a class="nav-link" href="multi-tenant-select.html">내 근태관리</a> 
                        <a class="nav-link" href="multi-tenant-select.html">내 휴가관리</a> 
                     </nav>
                  </div>
                  
                  
                  <hr style="margin-top:10px; margin-bottom:10px; margin-left:8px; margin-right:8px;">
                  
                  
				  <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" 
                	data-bs-target="#collapseApr" aria-expanded="false" aria-controls="collapseApr">
					<div class="nav-link-icon">
                        <i data-feather="tool"></i>
                    </div> 설정
                    <div class="sidenav-collapse-arrow">
                    	<i class="fas fa-angle-down"></i>
                    </div>
                  </a>
                  <div class="collapse" id="collapseApr"
                     data-bs-parent="#accordionSidenav">
                     <nav class="sidenav-menu-nested nav">
                        <a class="nav-link" href="signature.do">전자서명 관리</a> 
                     </nav>
                  </div>
			 </div>    
         </nav>
      </div>
</body>
</html>