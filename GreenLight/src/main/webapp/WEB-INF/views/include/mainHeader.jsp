<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!-- DropZone -->
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">

<script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.29.1/feather.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/bootstrap-icons.svg" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/litepicker/dist/litepicker.js"></script>
<script type="text/javascript" src="./js/document.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script type="text/javascript"
	src="./js/daterangepicker/daterangepicker.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.15/jstree.min.js"></script>
<!-- DropZone -->
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
<!-- 알림 -->
<script src="js/notification_ljw/noti.js" type="module"></script>
<script src="js/notification_ljw/header_noti.js"></script>


<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="./js/jstree/jstree.js"></script>

</head>
<body>
	<input type="hidden" value="${loginVo.id}" id="loginVoId">
	<nav
		class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white"
		id="sidenavAccordion">

		<!-- 사이드나브바 토글 버튼-->
		<button
			class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0"
			id="sidebarToggle">
			<i data-feather="menu"></i>
		</button>

		<!-- 로고 -->
		<a class="navbar-brand pe-3 ps-4 ps-lg-2" href="./main.do">GreenLight</a>


		<!-- 상단나브바 -->
		<ul class="navbar-nav align-items-center ms-auto">
			<li>${loginVo.name} ${loginVo.spot}&nbsp;&nbsp;&nbsp;</li>
			<!-- 상단 나브바 알림-->
			<li
				class="nav-item dropdown no-caret d-none d-sm-block me-3 dropdown-notifications">
				<a class="btn btn-icon btn-transparent-dark dropdown-toggle"
				id="navbarDropdownAlerts" href="javascript:void(0);" role="button"
				data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i data-feather="bell"></i>
			</a>
				<div
					class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up"
					aria-labelledby="navbarDropdownAlerts" id ="notiZone" style="min-width: 18rem;">
					<h6 class="dropdown-header dropdown-notifications-header">
						<i class="me-2" data-feather="bell"></i> 최근 알림
						<c:if test="${fn:length(notiList) ne 0}">
							<a style="margin-left: 11rem; border: 2px solid white; padding: 5px;" onclick="allReadNoti()">전체읽기</a>
						</c:if>
					</h6>
					<c:if test="${fn:length(notiList) eq 0}">
						<a class="dropdown-item dropdown-notifications-item">
							<div class="dropdown-notifications-item-content" style="font-size: 12px;">최근 알림이 없습니다</div>
						</a>
					</c:if>
					<c:if test="${fn:length(notiList) ne 0}">
						<c:forEach items="${notiList}" var="noti" varStatus="vs">
							<c:if test="${noti.ntype eq '02'}">
								<a class="dropdown-item dropdown-notifications-item"
									href="month.do" onclick="readNoti('${noti.noti_id}', '${vs}')">
									<div class="dropdown-notifications-item-icon bg-warning">
										<i data-feather="calendar"></i>
									</div>
									<div class="dropdown-notifications-item-content">
										<div class="dropdown-notifications-item-content-details">
											${noti.alert_time}</div>
										<div class="dropdown-notifications-item-content-text" style="font-size: 12px;">
											${noti.content}</div>
									</div>
								</a>
							</c:if>
							<c:if test="${noti.ntype eq '03'}">
								<a class="dropdown-item dropdown-notifications-item"
									href="draftDetail.do?docno=${noti.gubun}" onclick="readNoti('${noti.noti_id}', '${vs}')">
									<div class="dropdown-notifications-item-icon bg-info">
										<i data-feather="clipboard"></i>
									</div>
									<div class="dropdown-notifications-item-content">
										<div class="dropdown-notifications-item-content-details">
											${noti.alert_time}</div>
										<div class="dropdown-notifications-item-content-text" style="font-size: 12px;">
											${noti.content}</div>
									</div>
								</a>
							</c:if>
							<c:if test="${noti.ntype eq '04'}">
								<a class="dropdown-item dropdown-notifications-item"
									href="myReserve.do" onclick="readNoti('${noti.noti_id}', '${vs}')">
									<div class="dropdown-notifications-item-icon bg-info">
										<i data-feather="clock"></i>
									</div>
									<div class="dropdown-notifications-item-content">
										<div class="dropdown-notifications-item-content-details">
											${noti.alert_time}</div>
										<div class="dropdown-notifications-item-content-text" style="font-size: 12px;">
											${noti.content}</div>
									</div>
								</a>
							</c:if>
						</c:forEach>
					</c:if>
					<a class="dropdown-item dropdown-notifications-item" href='allNoti.do'>
						<div class="dropdown-notifications-item-content" style="font-size: 12px;">알림 전체보기</div>
					</a>
				</a>

					<!-- 유저 드롭다운 -->
					<li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
						<a class="btn btn-icon btn-transparent-dark dropdown-toggle"
						id="navbarDropdownUserImage" href="javascript:void(0);"
						role="button" data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <c:if
								test="${loginVo.profile eq null && loginVo.gender eq 'F'}">
								<img class="img-fluid"
									src="./assets/img/illustrations/profiles/profile-1.png"
									alt="프로필사진" />
							</c:if> <c:if test="${loginVo.profile eq null && loginVo.gender eq 'M'}">
								<img class="img-fluid"
									src="./assets/img/illustrations/profiles/profile-2.png"
									alt="프로필사진" />
							</c:if> <c:if test="${loginVo.profile ne null}">
								<img class="img-fluid"
									src="data:image/png;base64,${loginVo.profile}" alt="프로필사진" />
							</c:if>
					</a>
						<div
							class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up"
							aria-labelledby="navbarDropdownUserImage">
							<a class="dropdown-item" href="./mypage.do">
								<div class="dropdown-item-icon">
									<i data-feather="settings"></i>
								</div> 마이페이지
							</a> <a class="dropdown-item" href="./logout.do">
								<div class="dropdown-item-icon">
									<i data-feather="log-out"></i>
								</div> 로그아웃
							</a>
						</div>
					</li>
		</ul>
	</nav>
	
</body>
<style>
.jstree-node, .jstree-children, .jstree-container-ul {
	display: block;
	margin: 0;
	padding: 0;
	list-style-type: none;
	list-style-image: none;
}

.jstree-node {
	white-space: nowrap;
}

.jstree-anchor {
	display: inline-block;
	color: black;
	white-space: nowrap;
	padding: 0 4px 0 1px;
	margin: 0;
	vertical-align: top;
}

.jstree-anchor:focus {
	outline: 0;
}

.jstree-anchor, .jstree-anchor:link, .jstree-anchor:visited,
	.jstree-anchor:active {
	text-decoration: none;
	color: inherit;
}

.jstree-anchor:hover {
	background-color: rgba(66, 138, 70, 0.2);
}

.jstree-icon {
	display: inline-block;
	text-decoration: none;
	margin: 0;
	padding: 0;
	vertical-align: top;
	text-align: center;
}

.jstree-icon:empty {
	display: inline-block;
	text-decoration: none;
	margin: 0;
	padding: 0;
	vertical-align: top;
	text-align: center;
}

.jstree-ocl {
	cursor: pointer;
}

.jstree-leaf>.jstree-ocl {
	cursor: default;
}

.jstree .jstree-open>.jstree-children {
	display: block;
}

.jstree .jstree-closed>.jstree-children, .jstree .jstree-leaf>.jstree-children
	{
	display: none;
}

.jstree-anchor>.jstree-themeicon {
	margin-right: 2px;
}

.jstree-no-icons .jstree-themeicon, .jstree-anchor>.jstree-themeicon-hidden
	{
	display: none;
}

.jstree-hidden, .jstree-node.jstree-hidden {
	display: none;
}

.jstree-rtl .jstree-anchor {
	padding: 0 1px 0 4px;
}

.jstree-rtl .jstree-anchor>.jstree-themeicon {
	margin-left: 2px;
	margin-right: 0;
}

.jstree-rtl .jstree-node {
	margin-left: 0;
}

.jstree-rtl .jstree-container-ul>.jstree-node {
	margin-right: 0;
}

.jstree-wholerow-ul {
	position: relative;
	display: inline-block;
	min-width: 100%;
}

.jstree-wholerow-ul .jstree-leaf>.jstree-ocl {
	cursor: pointer;
}

.jstree-wholerow-ul .jstree-anchor, .jstree-wholerow-ul .jstree-icon {
	position: relative;
}

.jstree-wholerow-ul .jstree-wholerow {
	width: 100%;
	cursor: pointer;
	position: absolute;
	left: 0;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.jstree-contextmenu .jstree-anchor {
	-webkit-user-select: none;
	/* disable selection/Copy of UIWebView */
	-webkit-touch-callout: none;
	/* disable the IOS popup when long-press on a link */
	user-select: none;
}

.vakata-context {
	display: none;
}

.vakata-context, .vakata-context ul {
	margin: 0;
	padding: 2px;
	position: absolute;
	background: #f5f5f5;
	border: 1px solid #979797;
	box-shadow: 2px 2px 2px #999999;
}

.vakata-context ul {
	list-style: none;
	left: 100%;
	margin-top: -2.7em;
	margin-left: -4px;
}

.vakata-context .vakata-context-right ul {
	left: auto;
	right: 100%;
	margin-left: auto;
	margin-right: -4px;
}

.vakata-context li {
	list-style: none;
}

.vakata-context li>a {
	display: block;
	padding: 0 2em 0 2em;
	text-decoration: none;
	width: auto;
	color: black;
	white-space: nowrap;
	line-height: 2.4em;
	text-shadow: 1px 1px 0 white;
	border-radius: 1px;
}

.vakata-context li>a:hover {
	position: relative;
	background-color: rgba(66, 138, 70, 0.2);
	box-shadow: 0 0 2px #0a6aa1;
}

.vakata-context li>a.vakata-context-parent {
	background-image:
		url("data:image/gif;base64,R0lGODlhCwAHAIAAACgoKP///yH5BAEAAAEALAAAAAALAAcAAAIORI4JlrqN1oMSnmmZDQUAOw==");
	background-position: right center;
	background-repeat: no-repeat;
}

.vakata-context li>a:focus {
	outline: 0;
}

.vakata-context .vakata-context-no-icons {
	margin-left: 0;
}

.vakata-context .vakata-context-hover>a {
	position: relative;
	background-color: rgba(66, 138, 70, 0.2);
	box-shadow: 0 0 2px #0a6aa1;
}

.vakata-context .vakata-context-separator>a, .vakata-context .vakata-context-separator>a:hover
	{
	background: white;
	border: 0;
	border-top: 1px solid #e2e3e3;
	height: 1px;
	min-height: 1px;
	max-height: 1px;
	padding: 0;
	margin: 0 0 0 2.4em;
	border-left: 1px solid #e0e0e0;
	text-shadow: 0 0 0 transparent;
	box-shadow: 0 0 0 transparent;
	border-radius: 0;
}

.vakata-context .vakata-contextmenu-disabled a, .vakata-context .vakata-contextmenu-disabled a:hover
	{
	color: silver;
	background-color: transparent;
	border: 0;
	box-shadow: 0 0 0;
}

.vakata-context .vakata-contextmenu-disabled>a>i {
	filter: grayscale(100%);
}

.vakata-context li>a>i {
	text-decoration: none;
	display: inline-block;
	width: 2.4em;
	height: 2.4em;
	background: transparent;
	margin: 0 0 0 -2em;
	vertical-align: top;
	text-align: center;
	line-height: 2.4em;
}

.vakata-context li>a>i:empty {
	width: 2.4em;
	line-height: 2.4em;
}

.vakata-context li>a .vakata-contextmenu-sep {
	display: inline-block;
	width: 1px;
	height: 2.4em;
	background: white;
	margin: 0 0.5em 0 0;
	border-left: 1px solid #e2e3e3;
}

.vakata-context .vakata-contextmenu-shortcut {
	font-size: 0.8em;
	color: silver;
	opacity: 0.5;
	display: none;
}

.vakata-context-rtl ul {
	left: auto;
	right: 100%;
	margin-left: auto;
	margin-right: -4px;
}

.vakata-context-rtl li>a.vakata-context-parent {
	background-image:
		url("data:image/gif;base64,R0lGODlhCwAHAIAAACgoKP///yH5BAEAAAEALAAAAAALAAcAAAINjI+AC7rWHIsPtmoxLAA7");
	background-position: left center;
	background-repeat: no-repeat;
}

.vakata-context-rtl .vakata-context-separator>a {
	margin: 0 2.4em 0 0;
	border-left: 0;
	border-right: 1px solid #e2e3e3;
}

.vakata-context-rtl .vakata-context-left ul {
	right: auto;
	left: 100%;
	margin-left: -4px;
	margin-right: auto;
}

.vakata-context-rtl li>a>i {
	margin: 0 -2em 0 0;
}

.vakata-context-rtl li>a .vakata-contextmenu-sep {
	margin: 0 0 0 0.5em;
	border-left-color: white;
	background: #e2e3e3;
}

#jstree-marker {
	position: absolute;
	top: 0;
	left: 0;
	margin: -5px 0 0 0;
	padding: 0;
	border-right: 0;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-left: 5px solid;
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
}

#jstree-dnd {
	line-height: 16px;
	margin: 0;
	padding: 4px;
}

#jstree-dnd .jstree-icon, #jstree-dnd .jstree-copy {
	display: inline-block;
	text-decoration: none;
	margin: 0 2px 0 0;
	padding: 0;
	width: 16px;
	height: 16px;
}

#jstree-dnd .jstree-ok {
	background: green;
}

#jstree-dnd .jstree-er {
	background: red;
}

#jstree-dnd .jstree-copy {
	margin: 0 2px 0 2px;
}

.jstree-default .jstree-node, .jstree-default .jstree-icon {
	background-repeat: no-repeat;
	background-color: transparent;
}

.jstree-default .jstree-anchor, .jstree-default .jstree-animated,
	.jstree-default .jstree-wholerow {
	transition: background-color 0.15s, box-shadow 0.15s;
}

.jstree-default .jstree-hovered {
	background: rgba(66, 138, 70, 0.05);
	border-radius: 2px;
	box-shadow: inset 0 0 1px #cccccc;
}

.jstree-default .jstree-context {
	background: #e7f4f9;
	border-radius: 2px;
	box-shadow: inset 0 0 1px #cccccc;
}

.jstree-default .jstree-clicked {
	background: rgba(66, 138, 70, 0.2);
	border-radius: 2px;
}

.jstree-default .jstree-no-icons .jstree-anchor>.jstree-themeicon {
	display: none;
}

.jstree-default .jstree-disabled {
	background: transparent;
	color: #666666;
}

.jstree-default .jstree-disabled.jstree-hovered {
	background: transparent;
	box-shadow: none;
}

.jstree-default .jstree-disabled.jstree-clicked {
	background: #efefef;
}

.jstree-default .jstree-disabled>.jstree-icon {
	opacity: 0.8;
	filter:
		url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");
	/* Firefox 10+ */
	filter: gray;
	/* IE6-9 */
	-webkit-filter: grayscale(100%);
	/* Chrome 19+ & Safari 6+ */
}

.jstree-default .jstree-search {
	color: #428A46;
	font-weight: bold;
}

.jstree-default .jstree-no-checkboxes .jstree-checkbox {
	display: none !important;
}

.jstree-default.jstree-checkbox-no-clicked .jstree-clicked {
	background: transparent;
	box-shadow: none;
}

.jstree-default.jstree-checkbox-no-clicked .jstree-clicked.jstree-hovered
	{
	background: #e7f4f9;
}

.jstree-default.jstree-checkbox-no-clicked>.jstree-wholerow-ul .jstree-wholerow-clicked
	{
	background: transparent;
}

.jstree-default.jstree-checkbox-no-clicked>.jstree-wholerow-ul .jstree-wholerow-clicked.jstree-wholerow-hovered
	{
	background: #e7f4f9;
}

.jstree-default>.jstree-striped {
	min-width: 100%;
	display: inline-block;
	background:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAkCAMAAAB/qqA+AAAABlBMVEUAAAAAAAClZ7nPAAAAAnRSTlMNAMM9s3UAAAAXSURBVHjajcEBAQAAAIKg/H/aCQZ70AUBjAATb6YPDgAAAABJRU5ErkJggg==")
		left top repeat;
}

.jstree-default>.jstree-wholerow-ul .jstree-hovered, .jstree-default>.jstree-wholerow-ul .jstree-clicked
	{
	background: transparent;
	box-shadow: none;
	border-radius: 0;
}

.jstree-default .jstree-wholerow {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.jstree-default .jstree-wholerow-hovered {
	background: #e7f4f9;
}

.jstree-default .jstree-wholerow-clicked {
	background: #beebff;
	background: -webkit-linear-gradient(top, #beebff 0%, #a8e4ff 100%);
	background: linear-gradient(to bottom, #beebff 0%, #a8e4ff 100%);
}

.jstree-default .jstree-node {
	min-height: 24px;
	line-height: 24px;
	margin-left: 24px;
	min-width: 24px;
}

.jstree-default .jstree-anchor {
	line-height: 24px;
	height: 24px;
}

.jstree-default .jstree-icon {
	width: 24px;
	height: 24px;
	line-height: 24px;
}

.jstree-default .jstree-icon:empty {
	width: 24px;
	height: 24px;
	line-height: 24px;
}

.jstree-default.jstree-rtl .jstree-node {
	margin-right: 24px;
}

.jstree-default .jstree-wholerow {
	height: 24px;
}

.jstree-default .jstree-node, .jstree-default .jstree-icon {
	background-image: url("32px.png");
}

.jstree-default .jstree-node {
	background-position: -292px -4px;
	background-repeat: repeat-y;
}

.jstree-default .jstree-last {
	background-image: none;
}

.jstree-default .jstree-open>.jstree-ocl {
	background-position: -132px -4px;
}

.jstree-default .jstree-closed>.jstree-ocl {
	background-position: -100px -4px;
}

.jstree-default .jstree-leaf>.jstree-ocl {
	background-position: -68px -4px;
}

.jstree-default .jstree-themeicon {
	background-position: -260px -4px;
}

.jstree-default>.jstree-no-dots .jstree-node, .jstree-default>.jstree-no-dots .jstree-leaf>.jstree-ocl
	{
	background: transparent;
}

.jstree-default>.jstree-no-dots .jstree-open>.jstree-ocl {
	background-position: -36px -4px;
}

.jstree-default>.jstree-no-dots .jstree-closed>.jstree-ocl {
	background-position: -4px -4px;
}

.jstree-default .jstree-disabled {
	background: transparent;
}

.jstree-default .jstree-disabled.jstree-hovered {
	background: transparent;
}

.jstree-default .jstree-disabled.jstree-clicked {
	background: #efefef;
}

.jstree-default .jstree-checkbox {
	background-position: -164px -4px;
}

.jstree-default .jstree-checkbox:hover {
	background-position: -164px -36px;
}

.jstree-default.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox,
	.jstree-default .jstree-checked>.jstree-checkbox {
	background-position: -228px -4px;
}

.jstree-default.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox:hover,
	.jstree-default .jstree-checked>.jstree-checkbox:hover {
	background-position: -228px -36px;
}

.jstree-default .jstree-anchor>.jstree-undetermined {
	background-position: -196px -4px;
}

.jstree-default .jstree-anchor>.jstree-undetermined:hover {
	background-position: -196px -36px;
}

.jstree-default .jstree-checkbox-disabled {
	opacity: 0.8;
	filter:
		url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");
	/* Firefox 10+ */
	filter: gray;
	/* IE6-9 */
	-webkit-filter: grayscale(100%);
	/* Chrome 19+ & Safari 6+ */
}

.jstree-default>.jstree-striped {
	background-size: auto 48px;
}

.jstree-default.jstree-rtl .jstree-node {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==");
	background-position: 100% 1px;
	background-repeat: repeat-y;
}

.jstree-default.jstree-rtl .jstree-last {
	background-image: none;
}

.jstree-default.jstree-rtl .jstree-open>.jstree-ocl {
	background-position: -132px -36px;
}

.jstree-default.jstree-rtl .jstree-closed>.jstree-ocl {
	background-position: -100px -36px;
}

.jstree-default.jstree-rtl .jstree-leaf>.jstree-ocl {
	background-position: -68px -36px;
}

.jstree-default.jstree-rtl>.jstree-no-dots .jstree-node, .jstree-default.jstree-rtl>.jstree-no-dots .jstree-leaf>.jstree-ocl
	{
	background: transparent;
}

.jstree-default.jstree-rtl>.jstree-no-dots .jstree-open>.jstree-ocl {
	background-position: -36px -36px;
}

.jstree-default.jstree-rtl>.jstree-no-dots .jstree-closed>.jstree-ocl {
	background-position: -4px -36px;
}

.jstree-default .jstree-themeicon-custom {
	background-color: transparent;
	background-image: none;
	background-position: 0 0;
}

.jstree-default>.jstree-container-ul .jstree-loading>.jstree-ocl {
	background: url("throbber.gif") center center no-repeat;
}

.jstree-default .jstree-file {
	background: url("32px.png") -100px -68px no-repeat;
}

.jstree-default .jstree-folder {
	background: url("32px.png") -260px -4px no-repeat;
}

.jstree-default>.jstree-container-ul>.jstree-node {
	margin-left: 0;
	margin-right: 0;
}

#jstree-dnd.jstree-default {
	line-height: 24px;
	padding: 0 4px;
}

#jstree-dnd.jstree-default .jstree-ok, #jstree-dnd.jstree-default .jstree-er
	{
	background-image: url("32px.png");
	background-repeat: no-repeat;
	background-color: transparent;
}

#jstree-dnd.jstree-default i {
	background: transparent;
	width: 24px;
	height: 24px;
	line-height: 24px;
}

#jstree-dnd.jstree-default .jstree-ok {
	background-position: -4px -68px;
}

#jstree-dnd.jstree-default .jstree-er {
	background-position: -36px -68px;
}

.jstree-default .jstree-ellipsis {
	overflow: hidden;
}

.jstree-default .jstree-ellipsis .jstree-anchor {
	width: calc(100% - 24px + 5px);
	text-overflow: ellipsis;
	overflow: hidden;
}

.jstree-default.jstree-rtl .jstree-node {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==");
}

.jstree-default.jstree-rtl .jstree-last {
	background-image: none;
}

.jstree-default-small .jstree-node {
	min-height: 18px;
	line-height: 18px;
	margin-left: 18px;
	min-width: 18px;
}

.jstree-default-small .jstree-anchor {
	line-height: 18px;
	height: 18px;
}

.jstree-default-small .jstree-icon {
	width: 18px;
	height: 18px;
	line-height: 18px;
}

.jstree-default-small .jstree-icon:empty {
	width: 18px;
	height: 18px;
	line-height: 18px;
}

.jstree-default-small.jstree-rtl .jstree-node {
	margin-right: 18px;
}

.jstree-default-small .jstree-wholerow {
	height: 18px;
}

.jstree-default-small .jstree-node, .jstree-default-small .jstree-icon {
	background-image: url("32px.png");
}

.jstree-default-small .jstree-node {
	background-position: -295px -7px;
	background-repeat: repeat-y;
}

.jstree-default-small .jstree-last {
	background-image: none;
}

.jstree-default-small .jstree-open>.jstree-ocl {
	background-position: -135px -7px;
}

.jstree-default-small .jstree-closed>.jstree-ocl {
	background-position: -103px -7px;
}

.jstree-default-small .jstree-leaf>.jstree-ocl {
	background-position: -71px -7px;
}

.jstree-default-small .jstree-themeicon {
	background-position: -263px -7px;
}

.jstree-default-small>.jstree-no-dots .jstree-node,
	.jstree-default-small>.jstree-no-dots .jstree-leaf>.jstree-ocl {
	background: transparent;
}

.jstree-default-small>.jstree-no-dots .jstree-open>.jstree-ocl {
	background-position: -39px -7px;
}

.jstree-default-small>.jstree-no-dots .jstree-closed>.jstree-ocl {
	background-position: -7px -7px;
}

.jstree-default-small .jstree-disabled {
	background: transparent;
}

.jstree-default-small .jstree-disabled.jstree-hovered {
	background: transparent;
}

.jstree-default-small .jstree-disabled.jstree-clicked {
	background: #efefef;
}

.jstree-default-small .jstree-checkbox {
	background-position: -167px -7px;
}

.jstree-default-small .jstree-checkbox:hover {
	background-position: -167px -39px;
}

.jstree-default-small.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox,
	.jstree-default-small .jstree-checked>.jstree-checkbox {
	background-position: -231px -7px;
}

.jstree-default-small.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox:hover,
	.jstree-default-small .jstree-checked>.jstree-checkbox:hover {
	background-position: -231px -39px;
}

.jstree-default-small .jstree-anchor>.jstree-undetermined {
	background-position: -199px -7px;
}

.jstree-default-small .jstree-anchor>.jstree-undetermined:hover {
	background-position: -199px -39px;
}

.jstree-default-small .jstree-checkbox-disabled {
	opacity: 0.8;
	filter:
		url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");
	/* Firefox 10+ */
	filter: gray;
	/* IE6-9 */
	-webkit-filter: grayscale(100%);
	/* Chrome 19+ & Safari 6+ */
}

.jstree-default-small>.jstree-striped {
	background-size: auto 36px;
}

.jstree-default-small.jstree-rtl .jstree-node {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==");
	background-position: 100% 1px;
	background-repeat: repeat-y;
}

.jstree-default-small.jstree-rtl .jstree-last {
	background-image: none;
}

.jstree-default-small.jstree-rtl .jstree-open>.jstree-ocl {
	background-position: -135px -39px;
}

.jstree-default-small.jstree-rtl .jstree-closed>.jstree-ocl {
	background-position: -103px -39px;
}

.jstree-default-small.jstree-rtl .jstree-leaf>.jstree-ocl {
	background-position: -71px -39px;
}

.jstree-default-small.jstree-rtl>.jstree-no-dots .jstree-node,
	.jstree-default-small.jstree-rtl>.jstree-no-dots .jstree-leaf>.jstree-ocl
	{
	background: transparent;
}

.jstree-default-small.jstree-rtl>.jstree-no-dots .jstree-open>.jstree-ocl
	{
	background-position: -39px -39px;
}

.jstree-default-small.jstree-rtl>.jstree-no-dots .jstree-closed>.jstree-ocl
	{
	background-position: -7px -39px;
}

.jstree-default-small .jstree-themeicon-custom {
	background-color: transparent;
	background-image: none;
	background-position: 0 0;
}

.jstree-default-small>.jstree-container-ul .jstree-loading>.jstree-ocl {
	background: url("throbber.gif") center center no-repeat;
}

.jstree-default-small .jstree-file {
	background: url("32px.png") -103px -71px no-repeat;
}

.jstree-default-small .jstree-folder {
	background: url("32px.png") -263px -7px no-repeat;
}

.jstree-default-small>.jstree-container-ul>.jstree-node {
	margin-left: 0;
	margin-right: 0;
}

#jstree-dnd.jstree-default-small {
	line-height: 18px;
	padding: 0 4px;
}

#jstree-dnd.jstree-default-small .jstree-ok, #jstree-dnd.jstree-default-small .jstree-er
	{
	background-image: url("32px.png");
	background-repeat: no-repeat;
	background-color: transparent;
}

#jstree-dnd.jstree-default-small i {
	background: transparent;
	width: 18px;
	height: 18px;
	line-height: 18px;
}

#jstree-dnd.jstree-default-small .jstree-ok {
	background-position: -7px -71px;
}

#jstree-dnd.jstree-default-small .jstree-er {
	background-position: -39px -71px;
}

.jstree-default-small .jstree-ellipsis {
	overflow: hidden;
}

.jstree-default-small .jstree-ellipsis .jstree-anchor {
	width: calc(100% - 18px + 5px);
	text-overflow: ellipsis;
	overflow: hidden;
}

.jstree-default-small.jstree-rtl .jstree-node {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAACAQMAAABv1h6PAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMHBgAAiABBI4gz9AAAAABJRU5ErkJggg==");
}

.jstree-default-small.jstree-rtl .jstree-last {
	background-image: none;
}

.jstree-default-large .jstree-node {
	min-height: 32px;
	line-height: 32px;
	margin-left: 32px;
	min-width: 32px;
}

.jstree-default-large .jstree-anchor {
	line-height: 32px;
	height: 32px;
}

.jstree-default-large .jstree-icon {
	width: 32px;
	height: 32px;
	line-height: 32px;
}

.jstree-default-large .jstree-icon:empty {
	width: 32px;
	height: 32px;
	line-height: 32px;
}

.jstree-default-large.jstree-rtl .jstree-node {
	margin-right: 32px;
}

.jstree-default-large .jstree-wholerow {
	height: 32px;
}

.jstree-default-large .jstree-node, .jstree-default-large .jstree-icon {
	background-image: url("32px.png");
}

.jstree-default-large .jstree-node {
	background-position: -288px 0px;
	background-repeat: repeat-y;
}

.jstree-default-large .jstree-last {
	background-image: none;
}

.jstree-default-large .jstree-open>.jstree-ocl {
	background-position: -128px 0px;
}

.jstree-default-large .jstree-closed>.jstree-ocl {
	background-position: -96px 0px;
}

.jstree-default-large .jstree-leaf>.jstree-ocl {
	background-position: -64px 0px;
}

.jstree-default-large .jstree-themeicon {
	background-position: -256px 0px;
}

.jstree-default-large>.jstree-no-dots .jstree-node,
	.jstree-default-large>.jstree-no-dots .jstree-leaf>.jstree-ocl {
	background: transparent;
}

.jstree-default-large>.jstree-no-dots .jstree-open>.jstree-ocl {
	background-position: -32px 0px;
}

.jstree-default-large>.jstree-no-dots .jstree-closed>.jstree-ocl {
	background-position: 0px 0px;
}

.jstree-default-large .jstree-disabled {
	background: transparent;
}

.jstree-default-large .jstree-disabled.jstree-hovered {
	background: transparent;
}

.jstree-default-large .jstree-disabled.jstree-clicked {
	background: #efefef;
}

.jstree-default-large .jstree-checkbox {
	background-position: -160px 0px;
}

.jstree-default-large .jstree-checkbox:hover {
	background-position: -160px -32px;
}

.jstree-default-large.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox,
	.jstree-default-large .jstree-checked>.jstree-checkbox {
	background-position: -224px 0px;
}

.jstree-default-large.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox:hover,
	.jstree-default-large .jstree-checked>.jstree-checkbox:hover {
	background-position: -224px -32px;
}

.jstree-default-large .jstree-anchor>.jstree-undetermined {
	background-position: -192px 0px;
}

.jstree-default-large .jstree-anchor>.jstree-undetermined:hover {
	background-position: -192px -32px;
}

.jstree-default-large .jstree-checkbox-disabled {
	opacity: 0.8;
	filter:
		url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");
	/* Firefox 10+ */
	filter: gray;
	/* IE6-9 */
	-webkit-filter: grayscale(100%);
	/* Chrome 19+ & Safari 6+ */
}

.jstree-default-large>.jstree-striped {
	background-size: auto 64px;
}

.jstree-default-large.jstree-rtl .jstree-node {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==");
	background-position: 100% 1px;
	background-repeat: repeat-y;
}

.jstree-default-large.jstree-rtl .jstree-last {
	background-image: none;
}

.jstree-default-large.jstree-rtl .jstree-open>.jstree-ocl {
	background-position: -128px -32px;
}

.jstree-default-large.jstree-rtl .jstree-closed>.jstree-ocl {
	background-position: -96px -32px;
}

.jstree-default-large.jstree-rtl .jstree-leaf>.jstree-ocl {
	background-position: -64px -32px;
}

.jstree-default-large.jstree-rtl>.jstree-no-dots .jstree-node,
	.jstree-default-large.jstree-rtl>.jstree-no-dots .jstree-leaf>.jstree-ocl
	{
	background: transparent;
}

.jstree-default-large.jstree-rtl>.jstree-no-dots .jstree-open>.jstree-ocl
	{
	background-position: -32px -32px;
}

.jstree-default-large.jstree-rtl>.jstree-no-dots .jstree-closed>.jstree-ocl
	{
	background-position: 0px -32px;
}

.jstree-default-large .jstree-themeicon-custom {
	background-color: transparent;
	background-image: none;
	background-position: 0 0;
}

.jstree-default-large>.jstree-container-ul .jstree-loading>.jstree-ocl {
	background: url("throbber.gif") center center no-repeat;
}

.jstree-default-large .jstree-file {
	background: url("32px.png") -96px -64px no-repeat;
}

.jstree-default-large .jstree-folder {
	background: url("32px.png") -256px 0px no-repeat;
}

.jstree-default-large>.jstree-container-ul>.jstree-node {
	margin-left: 0;
	margin-right: 0;
}

#jstree-dnd.jstree-default-large {
	line-height: 32px;
	padding: 0 4px;
}

#jstree-dnd.jstree-default-large .jstree-ok, #jstree-dnd.jstree-default-large .jstree-er
	{
	background-image: url("32px.png");
	background-repeat: no-repeat;
	background-color: transparent;
}

#jstree-dnd.jstree-default-large i {
	background: transparent;
	width: 32px;
	height: 32px;
	line-height: 32px;
}

#jstree-dnd.jstree-default-large .jstree-ok {
	background-position: 0px -64px;
}

#jstree-dnd.jstree-default-large .jstree-er {
	background-position: -32px -64px;
}

.jstree-default-large .jstree-ellipsis {
	overflow: hidden;
}

.jstree-default-large .jstree-ellipsis .jstree-anchor {
	width: calc(100% - 32px + 5px);
	text-overflow: ellipsis;
	overflow: hidden;
}

.jstree-default-large.jstree-rtl .jstree-node {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAACAQMAAAAD0EyKAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjgIIGBgABCgCBvVLXcAAAAABJRU5ErkJggg==");
}

.jstree-default-large.jstree-rtl .jstree-last {
	background-image: none;
}

@media ( max-width : 768px) {
	#jstree-dnd.jstree-dnd-responsive {
		line-height: 40px;
		font-weight: bold;
		font-size: 1.1em;
		text-shadow: 1px 1px white;
	}
	#jstree-dnd.jstree-dnd-responsive>i {
		background: transparent;
		width: 40px;
		height: 40px;
	}
	#jstree-dnd.jstree-dnd-responsive>.jstree-ok {
		background-image: url("40px.png");
		background-position: 0 -200px;
		background-size: 120px 240px;
	}
	#jstree-dnd.jstree-dnd-responsive>.jstree-er {
		background-image: url("40px.png");
		background-position: -40px -200px;
		background-size: 120px 240px;
	}
	#jstree-marker.jstree-dnd-responsive {
		border-left-width: 10px;
		border-top-width: 10px;
		border-bottom-width: 10px;
		margin-top: -10px;
	}
}

@media ( max-width : 768px) {
	.jstree-default-responsive {
		/*
												.jstree-open > .jstree-ocl,
												.jstree-closed > .jstree-ocl { border-radius:20px; background-color:white; }
												*/
		
	}
	.jstree-default-responsive .jstree-icon {
		background-image: url("40px.png");
	}
	.jstree-default-responsive .jstree-node, .jstree-default-responsive .jstree-leaf>.jstree-ocl
		{
		background: transparent;
	}
	.jstree-default-responsive .jstree-node {
		min-height: 40px;
		line-height: 40px;
		margin-left: 40px;
		min-width: 40px;
		white-space: nowrap;
	}
	.jstree-default-responsive .jstree-anchor {
		line-height: 40px;
		height: 40px;
	}
	.jstree-default-responsive .jstree-icon, .jstree-default-responsive .jstree-icon:empty
		{
		width: 40px;
		height: 40px;
		line-height: 40px;
	}
	.jstree-default-responsive>.jstree-container-ul>.jstree-node {
		margin-left: 0;
	}
	.jstree-default-responsive.jstree-rtl .jstree-node {
		margin-left: 0;
		margin-right: 40px;
		background: transparent;
	}
	.jstree-default-responsive.jstree-rtl .jstree-container-ul>.jstree-node
		{
		margin-right: 0;
	}
	.jstree-default-responsive .jstree-ocl, .jstree-default-responsive .jstree-themeicon,
		.jstree-default-responsive .jstree-checkbox {
		background-size: 120px 240px;
	}
	.jstree-default-responsive .jstree-leaf>.jstree-ocl,
		.jstree-default-responsive.jstree-rtl .jstree-leaf>.jstree-ocl {
		background: transparent;
	}
	.jstree-default-responsive .jstree-open>.jstree-ocl {
		background-position: 0 0 !important;
	}
	.jstree-default-responsive .jstree-closed>.jstree-ocl {
		background-position: 0 -40px !important;
	}
	.jstree-default-responsive.jstree-rtl .jstree-closed>.jstree-ocl {
		background-position: -40px 0 !important;
	}
	.jstree-default-responsive .jstree-themeicon {
		background-position: -40px -40px;
	}
	.jstree-default-responsive .jstree-checkbox, .jstree-default-responsive .jstree-checkbox:hover
		{
		background-position: -40px -80px;
	}
	.jstree-default-responsive.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox,
		.jstree-default-responsive.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox:hover,
		.jstree-default-responsive .jstree-checked>.jstree-checkbox,
		.jstree-default-responsive .jstree-checked>.jstree-checkbox:hover {
		background-position: 0 -80px;
	}
	.jstree-default-responsive .jstree-anchor>.jstree-undetermined,
		.jstree-default-responsive .jstree-anchor>.jstree-undetermined:hover {
		background-position: 0 -120px;
	}
	.jstree-default-responsive .jstree-anchor {
		font-weight: bold;
		font-size: 1.1em;
		text-shadow: 1px 1px white;
	}
	.jstree-default-responsive>.jstree-striped {
		background: transparent;
	}
	.jstree-default-responsive .jstree-wholerow {
		border-top: 1px solid rgba(255, 255, 255, 0.7);
		border-bottom: 1px solid rgba(64, 64, 64, 0.2);
		background: #ebebeb;
		height: 40px;
	}
	.jstree-default-responsive .jstree-wholerow-hovered {
		background: #e7f4f9;
	}
	.jstree-default-responsive .jstree-wholerow-clicked {
		background: #beebff;
	}
	.jstree-default-responsive .jstree-children .jstree-last>.jstree-wholerow
		{
		box-shadow: inset 0 -6px 3px -5px #666666;
	}
	.jstree-default-responsive .jstree-children .jstree-open>.jstree-wholerow
		{
		box-shadow: inset 0 6px 3px -5px #666666;
		border-top: 0;
	}
	.jstree-default-responsive .jstree-children .jstree-open+.jstree-open {
		box-shadow: none;
	}
	.jstree-default-responsive .jstree-node, .jstree-default-responsive .jstree-icon,
		.jstree-default-responsive .jstree-node>.jstree-ocl,
		.jstree-default-responsive .jstree-themeicon,
		.jstree-default-responsive .jstree-checkbox {
		background-image: url("40px.png");
		background-size: 120px 240px;
	}
	.jstree-default-responsive .jstree-node {
		background-position: -80px 0;
		background-repeat: repeat-y;
	}
	.jstree-default-responsive .jstree-last {
		background-image: none;
	}
	.jstree-default-responsive .jstree-leaf>.jstree-ocl {
		background-position: -40px -120px;
	}
	.jstree-default-responsive .jstree-last>.jstree-ocl {
		background-position: -40px -160px;
	}
	.jstree-default-responsive .jstree-themeicon-custom {
		background-color: transparent;
		background-image: none;
		background-position: 0 0;
	}
	.jstree-default-responsive .jstree-file {
		background: url("40px.png") 0 -160px no-repeat;
		background-size: 120px 240px;
	}
	.jstree-default-responsive .jstree-folder {
		background: url("40px.png") -40px -40px no-repeat;
		background-size: 120px 240px;
	}
	.jstree-default-responsive>.jstree-container-ul>.jstree-node {
		margin-left: 0;
		margin-right: 0;
	}
}
</style>
</html>