<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>GreenLight</title>
<link href="css/styles.css" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
<script data-search-pseudo-elements defer
   src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"
   crossorigin="anonymous"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.1/feather.js"
   crossorigin="anonymous"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/bootstrap-icons.svg"
   crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/litepicker.js"></script>
   <script src="https://cdn.ckeditor.com/ckeditor5/41.2.0/classic/ckeditor.js"></script>
</head>
<body>
<nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
      
<!-- 사이드나브바 토글 버튼-->
      <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle">
         <i data-feather="menu"></i>
      </button>

<!-- 로고 -->
      <a class="navbar-brand pe-3 ps-4 ps-lg-2" href="index.html">GreenLight</a>
      
      
<!-- 상단나브바 -->
      <ul class="navbar-nav align-items-center ms-auto">
 		<li>${loginVo.name} ${loginVo.spot} &nbsp;&nbsp;&nbsp;</li>
<!-- 상단 나브바 알림-->
         <li class="nav-item dropdown no-caret d-none d-sm-block me-3 dropdown-notifications">
            <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownAlerts" href="javascript:void(0);" 
            	role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            	<i data-feather="bell"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownAlerts">
               <h6 class="dropdown-header dropdown-notifications-header">
                  <i class="me-2" data-feather="bell"></i> Alerts Center
               </h6>
               
<!-- 알림 드롭다운 예시 1-->
               <a class="dropdown-item dropdown-notifications-item" href="#!">
                  <div class="dropdown-notifications-item-icon bg-warning">
                     <i data-feather="activity"></i>
                  </div>
                  <div class="dropdown-notifications-item-content">
                     <div class="dropdown-notifications-item-content-details">
                     	December 29, 2021
                     </div>
                     <div class="dropdown-notifications-item-content-text">
                     	This is an alert message. It's nothing serious, but it requires your attention.
                     </div>
                  </div>
               </a>
               
<!-- 알림 드롭다운 예시 2-->
               <a class="dropdown-item dropdown-notifications-item" href="#!">
                  <div class="dropdown-notifications-item-icon bg-info">
                     <i data-feather="bar-chart"></i>
                  </div>
                  <div class="dropdown-notifications-item-content">
                     <div class="dropdown-notifications-item-content-details">
                     	December 22, 2021
                     </div>
                     <div class="dropdown-notifications-item-content-text">
                     	A new monthly report is ready. Click here to view!
                     </div>
                  </div>
               </a>
               
<!-- 알림 드롭다운 예시 3-->
               <a class="dropdown-item dropdown-notifications-item" href="#!">
                  <div class="dropdown-notifications-item-icon bg-danger">
                     <i class="fas fa-exclamation-triangle"></i>
                  </div>
                  <div class="dropdown-notifications-item-content">
                     <div class="dropdown-notifications-item-content-details">
                     	December 8, 2021
                     </div>
                     <div class="dropdown-notifications-item-content-text">
                     	Critical system failure, systems shutting down.
                     </div>
                  </div>
               </a>
               
<!-- 알림 드롭다운 예시 4-->
               <a class="dropdown-item dropdown-notifications-item" href="#!">
                  <div class="dropdown-notifications-item-icon bg-success">
                     <i data-feather="user-plus"></i>
                  </div>
                  <div class="dropdown-notifications-item-content">
                     <div class="dropdown-notifications-item-content-details">
                     	December 2, 2021
                     </div>
                     <div class="dropdown-notifications-item-content-text">
                     	New user request. Woody has requested access to the organization.
                     </div>
                  </div>
               </a>
               <a class="dropdown-item dropdown-notifications-footer" href="#!">View All Alerts</a>
            </div>
         </li>
         
<!-- 유저 드롭다운 -->
         <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
            <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);"
            	role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="img-fluid"
               	src="assets/img/illustrations/profiles/profile-1.png" /></a>
            <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
               <a class="dropdown-item" href="#!">
                  <div class="dropdown-item-icon">
                     <i data-feather="settings"></i>
                  </div> Account
               </a>
               <a class="dropdown-item" href="#!">
                  <div class="dropdown-item-icon">
                     <i data-feather="log-out"></i>
                  </div> Logout
               </a>
            </div>
         </li>
      </ul>
   </nav>
</body>
</html>