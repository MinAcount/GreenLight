<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="./se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body class="nav-fixed">
   <%@ include file='./include/mainHeader.jsp'%>

   <!-- 사이드나브바 & 콘텐트 영역 -->
   <div id="layoutSidenav">
      <%@ include file='./include/mainSidenav.jsp'%>

      <!-- 콘텐츠 영역 -->
      <div id="layoutSidenav_content">
         <div id="main_content">
            <h1 style="margin-bottom: 70px; text-align: center;">기안서 작성</h1>

            <hr class="mt-0 mb-5">
            <div style="display: flex; flex-direction: row; justify-content: space-between;">
                <!-- Modal -->
				<div class="modal fade" id="templateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
					<div class="modal-dialog">
						<div class="modal-content" style="width: 800px; height: 600px;">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">문서양식 선택</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body" style="display: flex; flex-direction: column; justify-content: space-between;">
								<div class="toast-body" style="display: flex; flex-direction: row; justify-content: space-around;">
									<!-- 문서양식목록(js tree) -->
									<div style="width: 395px; min-height: 450px; border-right: 1px solid black;">
										<div id="search_box">
											<input id="search_input" type="text">
										</div>
										<div id="JTSelectTemplate" style="max-height:450px; overflow-y: scroll;"></div>
										<style>
		                                 .jstree-node,
		                                 .jstree-children,
		                                 .jstree-container-ul {
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
		                                 .jstree-anchor,
		                                 .jstree-anchor:link,
		                                 .jstree-anchor:visited,
		                                 .jstree-anchor:active {
		                                   text-decoration: none;
		                                   color: inherit;
		                                 }
		                                 .jstree-anchor:hover{
		                                   background-color: rgba(66,138,70,0.2);
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
		                                 .jstree-leaf > .jstree-ocl {
		                                   cursor: default;
		                                 }
		                                 .jstree .jstree-open > .jstree-children {
		                                   display: block;
		                                 }
		                                 .jstree .jstree-closed > .jstree-children,
		                                 .jstree .jstree-leaf > .jstree-children {
		                                   display: none;
		                                 }
		                                 .jstree-anchor > .jstree-themeicon {
		                                   margin-right: 2px;
		                                 }
		                                 .jstree-no-icons .jstree-themeicon,
		                                 .jstree-anchor > .jstree-themeicon-hidden {
		                                   display: none;
		                                 }
		                                 .jstree-hidden,
		                                 .jstree-node.jstree-hidden {
		                                   display: none;
		                                 }
		                                 .jstree-rtl .jstree-anchor {
		                                   padding: 0 1px 0 4px;
		                                 }
		                                 .jstree-rtl .jstree-anchor > .jstree-themeicon {
		                                   margin-left: 2px;
		                                   margin-right: 0;
		                                 }
		                                 .jstree-rtl .jstree-node {
		                                   margin-left: 0;
		                                 }
		                                 .jstree-rtl .jstree-container-ul > .jstree-node {
		                                   margin-right: 0;
		                                 }
		                                 .jstree-wholerow-ul {
		                                   position: relative;
		                                   display: inline-block;
		                                   min-width: 100%;
		                                 }
		                                 .jstree-wholerow-ul .jstree-leaf > .jstree-ocl {
		                                   cursor: pointer;
		                                 }
		                                 .jstree-wholerow-ul .jstree-anchor,
		                                 .jstree-wholerow-ul .jstree-icon {
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
		                                 .vakata-context,
		                                 .vakata-context ul {
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
		                                 .vakata-context li > a {
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
		                                 .vakata-context li > a:hover {
		                                   position: relative;
		                                   background-color: rgba(66,138,70,0.2);
		                                   box-shadow: 0 0 2px #0a6aa1;
		                                 }
		                                 .vakata-context li > a.vakata-context-parent {
		                                   background-image: url("data:image/gif;base64,R0lGODlhCwAHAIAAACgoKP///yH5BAEAAAEALAAAAAALAAcAAAIORI4JlrqN1oMSnmmZDQUAOw==");
		                                   background-position: right center;
		                                   background-repeat: no-repeat;
		                                 }
		                                 .vakata-context li > a:focus {
		                                   outline: 0;
		                                 }
		                                 .vakata-context .vakata-context-no-icons {
		                                   margin-left: 0;
		                                 }
		                                 .vakata-context .vakata-context-hover > a {
		                                   position: relative;
		                                   background-color: rgba(66,138,70,0.2);
		                                   box-shadow: 0 0 2px #0a6aa1;
		                                 }
		                                 .vakata-context .vakata-context-separator > a,
		                                 .vakata-context .vakata-context-separator > a:hover {
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
		                                 .vakata-context .vakata-contextmenu-disabled a,
		                                 .vakata-context .vakata-contextmenu-disabled a:hover {
		                                   color: silver;
		                                   background-color: transparent;
		                                   border: 0;
		                                   box-shadow: 0 0 0;
		                                 }
		                                 .vakata-context .vakata-contextmenu-disabled > a > i {
		                                   filter: grayscale(100%);
		                                 }
		                                 .vakata-context li > a > i {
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
		                                 .vakata-context li > a > i:empty {
		                                   width: 2.4em;
		                                   line-height: 2.4em;
		                                 }
		                                 .vakata-context li > a .vakata-contextmenu-sep {
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
		                                 .vakata-context-rtl li > a.vakata-context-parent {
		                                   background-image: url("data:image/gif;base64,R0lGODlhCwAHAIAAACgoKP///yH5BAEAAAEALAAAAAALAAcAAAINjI+AC7rWHIsPtmoxLAA7");
		                                   background-position: left center;
		                                   background-repeat: no-repeat;
		                                 }
		                                 .vakata-context-rtl .vakata-context-separator > a {
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
		                                 .vakata-context-rtl li > a > i {
		                                   margin: 0 -2em 0 0;
		                                 }
		                                 .vakata-context-rtl li > a .vakata-contextmenu-sep {
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
		                                 #jstree-dnd .jstree-icon,
		                                 #jstree-dnd .jstree-copy {
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
		                                 .jstree-default .jstree-node,
		                                 .jstree-default .jstree-icon {
		                                   background-repeat: no-repeat;
		                                   background-color: transparent;
		                                 }
		                                 .jstree-default .jstree-anchor,
		                                 .jstree-default .jstree-animated,
		                                 .jstree-default .jstree-wholerow {
		                                   transition: background-color 0.15s, box-shadow 0.15s;
		                                 }
		                                 .jstree-default .jstree-hovered {
		                                   background: rgba(66,138,70,0.05);
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
		                                 .jstree-default .jstree-no-icons .jstree-anchor > .jstree-themeicon {
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
		                                 .jstree-default .jstree-disabled > .jstree-icon {
		                                   opacity: 0.8;
		                                   filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");
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
		                                 .jstree-default.jstree-checkbox-no-clicked .jstree-clicked.jstree-hovered {
		                                   background: #e7f4f9;
		                                 }
		                                 .jstree-default.jstree-checkbox-no-clicked > .jstree-wholerow-ul .jstree-wholerow-clicked {
		                                   background: transparent;
		                                 }
		                                 .jstree-default.jstree-checkbox-no-clicked > .jstree-wholerow-ul .jstree-wholerow-clicked.jstree-wholerow-hovered {
		                                   background: #e7f4f9;
		                                 }
		                                 .jstree-default > .jstree-striped {
		                                   min-width: 100%;
		                                   display: inline-block;
		                                   background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAkCAMAAAB/qqA+AAAABlBMVEUAAAAAAAClZ7nPAAAAAnRSTlMNAMM9s3UAAAAXSURBVHjajcEBAQAAAIKg/H/aCQZ70AUBjAATb6YPDgAAAABJRU5ErkJggg==") left top repeat;
		                                 }
		                                 .jstree-default > .jstree-wholerow-ul .jstree-hovered,
		                                 .jstree-default > .jstree-wholerow-ul .jstree-clicked {
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
		                                 .jstree-default .jstree-node,
		                                 .jstree-default .jstree-icon {
		                                   background-image: url("32px.png");
		                                 }
		                                 .jstree-default .jstree-node {
		                                   background-position: -292px -4px;
		                                   background-repeat: repeat-y;
		                                 }
		                                 .jstree-default .jstree-last {
		                                   background-image: none;
		                                 }
		                                 .jstree-default .jstree-open > .jstree-ocl {
		                                   background-position: -132px -4px;
		                                 }
		                                 .jstree-default .jstree-closed > .jstree-ocl {
		                                   background-position: -100px -4px;
		                                 }
		                                 .jstree-default .jstree-leaf > .jstree-ocl {
		                                   background-position: -68px -4px;
		                                 }
		                                 .jstree-default .jstree-themeicon {
		                                   background-position: -260px -4px;
		                                 }
		                                 .jstree-default > .jstree-no-dots .jstree-node,
		                                 .jstree-default > .jstree-no-dots .jstree-leaf > .jstree-ocl {
		                                   background: transparent;
		                                 }
		                                 .jstree-default > .jstree-no-dots .jstree-open > .jstree-ocl {
		                                   background-position: -36px -4px;
		                                 }
		                                 .jstree-default > .jstree-no-dots .jstree-closed > .jstree-ocl {
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
		                                 .jstree-default.jstree-checkbox-selection .jstree-clicked > .jstree-checkbox,
		                                 .jstree-default .jstree-checked > .jstree-checkbox {
		                                   background-position: -228px -4px;
		                                 }
		                                 .jstree-default.jstree-checkbox-selection .jstree-clicked > .jstree-checkbox:hover,
		                                 .jstree-default .jstree-checked > .jstree-checkbox:hover {
		                                   background-position: -228px -36px;
		                                 }
		                                 .jstree-default .jstree-anchor > .jstree-undetermined {
		                                   background-position: -196px -4px;
		                                 }
		                                 .jstree-default .jstree-anchor > .jstree-undetermined:hover {
		                                   background-position: -196px -36px;
		                                 }
		                                 .jstree-default .jstree-checkbox-disabled {
		                                   opacity: 0.8;
		                                   filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");
		                                   /* Firefox 10+ */
		                                   filter: gray;
		                                   /* IE6-9 */
		                                   -webkit-filter: grayscale(100%);
		                                   /* Chrome 19+ & Safari 6+ */
		                                 }
		                                 .jstree-default > .jstree-striped {
		                                   background-size: auto 48px;
		                                 }
		                                 .jstree-default.jstree-rtl .jstree-node {
		                                   background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==");
		                                   background-position: 100% 1px;
		                                   background-repeat: repeat-y;
		                                 }
		                                 .jstree-default.jstree-rtl .jstree-last {
		                                   background-image: none;
		                                 }
		                                 .jstree-default.jstree-rtl .jstree-open > .jstree-ocl {
		                                   background-position: -132px -36px;
		                                 }
		                                 .jstree-default.jstree-rtl .jstree-closed > .jstree-ocl {
		                                   background-position: -100px -36px;
		                                 }
		                                 .jstree-default.jstree-rtl .jstree-leaf > .jstree-ocl {
		                                   background-position: -68px -36px;
		                                 }
		                                 .jstree-default.jstree-rtl > .jstree-no-dots .jstree-node,
		                                 .jstree-default.jstree-rtl > .jstree-no-dots .jstree-leaf > .jstree-ocl {
		                                   background: transparent;
		                                 }
		                                 .jstree-default.jstree-rtl > .jstree-no-dots .jstree-open > .jstree-ocl {
		                                   background-position: -36px -36px;
		                                 }
		                                 .jstree-default.jstree-rtl > .jstree-no-dots .jstree-closed > .jstree-ocl {
		                                   background-position: -4px -36px;
		                                 }
		                                 .jstree-default .jstree-themeicon-custom {
		                                   background-color: transparent;
		                                   background-image: none;
		                                   background-position: 0 0;
		                                 }
		                                 .jstree-default > .jstree-container-ul .jstree-loading > .jstree-ocl {
		                                   background: url("throbber.gif") center center no-repeat;
		                                 }
		                                 .jstree-default .jstree-file {
		                                   background: url("32px.png") -100px -68px no-repeat;
		                                 }
		                                 .jstree-default .jstree-folder {
		                                   background: url("32px.png") -260px -4px no-repeat;
		                                 }
		                                 .jstree-default > .jstree-container-ul > .jstree-node {
		                                   margin-left: 0;
		                                   margin-right: 0;
		                                 }
		                                 #jstree-dnd.jstree-default {
		                                   line-height: 24px;
		                                   padding: 0 4px;
		                                 }
		                                 #jstree-dnd.jstree-default .jstree-ok,
		                                 #jstree-dnd.jstree-default .jstree-er {
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
		                                   background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==");
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
		                                 .jstree-default-small .jstree-node,
		                                 .jstree-default-small .jstree-icon {
		                                   background-image: url("32px.png");
		                                 }
		                                 .jstree-default-small .jstree-node {
		                                   background-position: -295px -7px;
		                                   background-repeat: repeat-y;
		                                 }
		                                 .jstree-default-small .jstree-last {
		                                   background-image: none;
		                                 }
		                                 .jstree-default-small .jstree-open > .jstree-ocl {
		                                   background-position: -135px -7px;
		                                 }
		                                 .jstree-default-small .jstree-closed > .jstree-ocl {
		                                   background-position: -103px -7px;
		                                 }
		                                 .jstree-default-small .jstree-leaf > .jstree-ocl {
		                                   background-position: -71px -7px;
		                                 }
		                                 .jstree-default-small .jstree-themeicon {
		                                   background-position: -263px -7px;
		                                 }
		                                 .jstree-default-small > .jstree-no-dots .jstree-node,
		                                 .jstree-default-small > .jstree-no-dots .jstree-leaf > .jstree-ocl {
		                                   background: transparent;
		                                 }
		                                 .jstree-default-small > .jstree-no-dots .jstree-open > .jstree-ocl {
		                                   background-position: -39px -7px;
		                                 }
		                                 .jstree-default-small > .jstree-no-dots .jstree-closed > .jstree-ocl {
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
		                                 .jstree-default-small.jstree-checkbox-selection .jstree-clicked > .jstree-checkbox,
		                                 .jstree-default-small .jstree-checked > .jstree-checkbox {
		                                   background-position: -231px -7px;
		                                 }
		                                 .jstree-default-small.jstree-checkbox-selection .jstree-clicked > .jstree-checkbox:hover,
		                                 .jstree-default-small .jstree-checked > .jstree-checkbox:hover {
		                                   background-position: -231px -39px;
		                                 }
		                                 .jstree-default-small .jstree-anchor > .jstree-undetermined {
		                                   background-position: -199px -7px;
		                                 }
		                                 .jstree-default-small .jstree-anchor > .jstree-undetermined:hover {
		                                   background-position: -199px -39px;
		                                 }
		                                 .jstree-default-small .jstree-checkbox-disabled {
		                                   opacity: 0.8;
		                                   filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");
		                                   /* Firefox 10+ */
		                                   filter: gray;
		                                   /* IE6-9 */
		                                   -webkit-filter: grayscale(100%);
		                                   /* Chrome 19+ & Safari 6+ */
		                                 }
		                                 .jstree-default-small > .jstree-striped {
		                                   background-size: auto 36px;
		                                 }
		                                 .jstree-default-small.jstree-rtl .jstree-node {
		                                   background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==");
		                                   background-position: 100% 1px;
		                                   background-repeat: repeat-y;
		                                 }
		                                 .jstree-default-small.jstree-rtl .jstree-last {
		                                   background-image: none;
		                                 }
		                                 .jstree-default-small.jstree-rtl .jstree-open > .jstree-ocl {
		                                   background-position: -135px -39px;
		                                 }
		                                 .jstree-default-small.jstree-rtl .jstree-closed > .jstree-ocl {
		                                   background-position: -103px -39px;
		                                 }
		                                 .jstree-default-small.jstree-rtl .jstree-leaf > .jstree-ocl {
		                                   background-position: -71px -39px;
		                                 }
		                                 .jstree-default-small.jstree-rtl > .jstree-no-dots .jstree-node,
		                                 .jstree-default-small.jstree-rtl > .jstree-no-dots .jstree-leaf > .jstree-ocl {
		                                   background: transparent;
		                                 }
		                                 .jstree-default-small.jstree-rtl > .jstree-no-dots .jstree-open > .jstree-ocl {
		                                   background-position: -39px -39px;
		                                 }
		                                 .jstree-default-small.jstree-rtl > .jstree-no-dots .jstree-closed > .jstree-ocl {
		                                   background-position: -7px -39px;
		                                 }
		                                 .jstree-default-small .jstree-themeicon-custom {
		                                   background-color: transparent;
		                                   background-image: none;
		                                   background-position: 0 0;
		                                 }
		                                 .jstree-default-small > .jstree-container-ul .jstree-loading > .jstree-ocl {
		                                   background: url("throbber.gif") center center no-repeat;
		                                 }
		                                 .jstree-default-small .jstree-file {
		                                   background: url("32px.png") -103px -71px no-repeat;
		                                 }
		                                 .jstree-default-small .jstree-folder {
		                                   background: url("32px.png") -263px -7px no-repeat;
		                                 }
		                                 .jstree-default-small > .jstree-container-ul > .jstree-node {
		                                   margin-left: 0;
		                                   margin-right: 0;
		                                 }
		                                 #jstree-dnd.jstree-default-small {
		                                   line-height: 18px;
		                                   padding: 0 4px;
		                                 }
		                                 #jstree-dnd.jstree-default-small .jstree-ok,
		                                 #jstree-dnd.jstree-default-small .jstree-er {
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
		                                   background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAACAQMAAABv1h6PAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMHBgAAiABBI4gz9AAAAABJRU5ErkJggg==");
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
		                                 .jstree-default-large .jstree-node,
		                                 .jstree-default-large .jstree-icon {
		                                   background-image: url("32px.png");
		                                 }
		                                 .jstree-default-large .jstree-node {
		                                   background-position: -288px 0px;
		                                   background-repeat: repeat-y;
		                                 }
		                                 .jstree-default-large .jstree-last {
		                                   background-image: none;
		                                 }
		                                 .jstree-default-large .jstree-open > .jstree-ocl {
		                                   background-position: -128px 0px;
		                                 }
		                                 .jstree-default-large .jstree-closed > .jstree-ocl {
		                                   background-position: -96px 0px;
		                                 }
		                                 .jstree-default-large .jstree-leaf > .jstree-ocl {
		                                   background-position: -64px 0px;
		                                 }
		                                 .jstree-default-large .jstree-themeicon {
		                                   background-position: -256px 0px;
		                                 }
		                                 .jstree-default-large > .jstree-no-dots .jstree-node,
		                                 .jstree-default-large > .jstree-no-dots .jstree-leaf > .jstree-ocl {
		                                   background: transparent;
		                                 }
		                                 .jstree-default-large > .jstree-no-dots .jstree-open > .jstree-ocl {
		                                   background-position: -32px 0px;
		                                 }
		                                 .jstree-default-large > .jstree-no-dots .jstree-closed > .jstree-ocl {
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
		                                 .jstree-default-large.jstree-checkbox-selection .jstree-clicked > .jstree-checkbox,
		                                 .jstree-default-large .jstree-checked > .jstree-checkbox {
		                                   background-position: -224px 0px;
		                                 }
		                                 .jstree-default-large.jstree-checkbox-selection .jstree-clicked > .jstree-checkbox:hover,
		                                 .jstree-default-large .jstree-checked > .jstree-checkbox:hover {
		                                   background-position: -224px -32px;
		                                 }
		                                 .jstree-default-large .jstree-anchor > .jstree-undetermined {
		                                   background-position: -192px 0px;
		                                 }
		                                 .jstree-default-large .jstree-anchor > .jstree-undetermined:hover {
		                                   background-position: -192px -32px;
		                                 }
		                                 .jstree-default-large .jstree-checkbox-disabled {
		                                   opacity: 0.8;
		                                   filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");
		                                   /* Firefox 10+ */
		                                   filter: gray;
		                                   /* IE6-9 */
		                                   -webkit-filter: grayscale(100%);
		                                   /* Chrome 19+ & Safari 6+ */
		                                 }
		                                 .jstree-default-large > .jstree-striped {
		                                   background-size: auto 64px;
		                                 }
		                                 .jstree-default-large.jstree-rtl .jstree-node {
		                                   background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==");
		                                   background-position: 100% 1px;
		                                   background-repeat: repeat-y;
		                                 }
		                                 .jstree-default-large.jstree-rtl .jstree-last {
		                                   background-image: none;
		                                 }
		                                 .jstree-default-large.jstree-rtl .jstree-open > .jstree-ocl {
		                                   background-position: -128px -32px;
		                                 }
		                                 .jstree-default-large.jstree-rtl .jstree-closed > .jstree-ocl {
		                                   background-position: -96px -32px;
		                                 }
		                                 .jstree-default-large.jstree-rtl .jstree-leaf > .jstree-ocl {
		                                   background-position: -64px -32px;
		                                 }
		                                 .jstree-default-large.jstree-rtl > .jstree-no-dots .jstree-node,
		                                 .jstree-default-large.jstree-rtl > .jstree-no-dots .jstree-leaf > .jstree-ocl {
		                                   background: transparent;
		                                 }
		                                 .jstree-default-large.jstree-rtl > .jstree-no-dots .jstree-open > .jstree-ocl {
		                                   background-position: -32px -32px;
		                                 }
		                                 .jstree-default-large.jstree-rtl > .jstree-no-dots .jstree-closed > .jstree-ocl {
		                                   background-position: 0px -32px;
		                                 }
		                                 .jstree-default-large .jstree-themeicon-custom {
		                                   background-color: transparent;
		                                   background-image: none;
		                                   background-position: 0 0;
		                                 }
		                                 .jstree-default-large > .jstree-container-ul .jstree-loading > .jstree-ocl {
		                                   background: url("throbber.gif") center center no-repeat;
		                                 }
		                                 .jstree-default-large .jstree-file {
		                                   background: url("32px.png") -96px -64px no-repeat;
		                                 }
		                                 .jstree-default-large .jstree-folder {
		                                   background: url("32px.png") -256px 0px no-repeat;
		                                 }
		                                 .jstree-default-large > .jstree-container-ul > .jstree-node {
		                                   margin-left: 0;
		                                   margin-right: 0;
		                                 }
		                                 #jstree-dnd.jstree-default-large {
		                                   line-height: 32px;
		                                   padding: 0 4px;
		                                 }
		                                 #jstree-dnd.jstree-default-large .jstree-ok,
		                                 #jstree-dnd.jstree-default-large .jstree-er {
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
		                                   background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAACAQMAAAAD0EyKAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjgIIGBgABCgCBvVLXcAAAAABJRU5ErkJggg==");
		                                 }
		                                 .jstree-default-large.jstree-rtl .jstree-last {
		                                   background-image: none;
		                                 }
		                                 @media (max-width: 768px) {
		                                   #jstree-dnd.jstree-dnd-responsive {
		                                     line-height: 40px;
		                                     font-weight: bold;
		                                     font-size: 1.1em;
		                                     text-shadow: 1px 1px white;
		                                   }
		                                   #jstree-dnd.jstree-dnd-responsive > i {
		                                     background: transparent;
		                                     width: 40px;
		                                     height: 40px;
		                                   }
		                                   #jstree-dnd.jstree-dnd-responsive > .jstree-ok {
		                                     background-image: url("40px.png");
		                                     background-position: 0 -200px;
		                                     background-size: 120px 240px;
		                                   }
		                                   #jstree-dnd.jstree-dnd-responsive > .jstree-er {
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
		                                 @media (max-width: 768px) {
		                                   .jstree-default-responsive {
		                                     /*
		                                    .jstree-open > .jstree-ocl,
		                                    .jstree-closed > .jstree-ocl { border-radius:20px; background-color:white; }
		                                    */
		                                   }
		                                   .jstree-default-responsive .jstree-icon {
		                                     background-image: url("40px.png");
		                                   }
		                                   .jstree-default-responsive .jstree-node,
		                                   .jstree-default-responsive .jstree-leaf > .jstree-ocl {
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
		                                   .jstree-default-responsive .jstree-icon,
		                                   .jstree-default-responsive .jstree-icon:empty {
		                                     width: 40px;
		                                     height: 40px;
		                                     line-height: 40px;
		                                   }
		                                   .jstree-default-responsive > .jstree-container-ul > .jstree-node {
		                                     margin-left: 0;
		                                   }
		                                   .jstree-default-responsive.jstree-rtl .jstree-node {
		                                     margin-left: 0;
		                                     margin-right: 40px;
		                                     background: transparent;
		                                   }
		                                   .jstree-default-responsive.jstree-rtl .jstree-container-ul > .jstree-node {
		                                     margin-right: 0;
		                                   }
		                                   .jstree-default-responsive .jstree-ocl,
		                                   .jstree-default-responsive .jstree-themeicon,
		                                   .jstree-default-responsive .jstree-checkbox {
		                                     background-size: 120px 240px;
		                                   }
		                                   .jstree-default-responsive .jstree-leaf > .jstree-ocl,
		                                   .jstree-default-responsive.jstree-rtl .jstree-leaf > .jstree-ocl {
		                                     background: transparent;
		                                   }
		                                   .jstree-default-responsive .jstree-open > .jstree-ocl {
		                                     background-position: 0 0 !important;
		                                   }
		                                   .jstree-default-responsive .jstree-closed > .jstree-ocl {
		                                     background-position: 0 -40px !important;
		                                   }
		                                   .jstree-default-responsive.jstree-rtl .jstree-closed > .jstree-ocl {
		                                     background-position: -40px 0 !important;
		                                   }
		                                   .jstree-default-responsive .jstree-themeicon {
		                                     background-position: -40px -40px;
		                                   }
		                                   .jstree-default-responsive .jstree-checkbox,
		                                   .jstree-default-responsive .jstree-checkbox:hover {
		                                     background-position: -40px -80px;
		                                   }
		                                   .jstree-default-responsive.jstree-checkbox-selection .jstree-clicked > .jstree-checkbox,
		                                   .jstree-default-responsive.jstree-checkbox-selection .jstree-clicked > .jstree-checkbox:hover,
		                                   .jstree-default-responsive .jstree-checked > .jstree-checkbox,
		                                   .jstree-default-responsive .jstree-checked > .jstree-checkbox:hover {
		                                     background-position: 0 -80px;
		                                   }
		                                   .jstree-default-responsive .jstree-anchor > .jstree-undetermined,
		                                   .jstree-default-responsive .jstree-anchor > .jstree-undetermined:hover {
		                                     background-position: 0 -120px;
		                                   }
		                                   .jstree-default-responsive .jstree-anchor {
		                                     font-weight: bold;
		                                     font-size: 1.1em;
		                                     text-shadow: 1px 1px white;
		                                   }
		                                   .jstree-default-responsive > .jstree-striped {
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
		                                   .jstree-default-responsive .jstree-children .jstree-last > .jstree-wholerow {
		                                     box-shadow: inset 0 -6px 3px -5px #666666;
		                                   }
		                                   .jstree-default-responsive .jstree-children .jstree-open > .jstree-wholerow {
		                                     box-shadow: inset 0 6px 3px -5px #666666;
		                                     border-top: 0;
		                                   }
		                                   .jstree-default-responsive .jstree-children .jstree-open + .jstree-open {
		                                     box-shadow: none;
		                                   }
		                                   .jstree-default-responsive .jstree-node,
		                                   .jstree-default-responsive .jstree-icon,
		                                   .jstree-default-responsive .jstree-node > .jstree-ocl,
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
		                                   .jstree-default-responsive .jstree-leaf > .jstree-ocl {
		                                     background-position: -40px -120px;
		                                   }
		                                   .jstree-default-responsive .jstree-last > .jstree-ocl {
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
		                                   .jstree-default-responsive > .jstree-container-ul > .jstree-node {
		                                     margin-left: 0;
		                                     margin-right: 0;
		                                   }
		                                 }
		                              </style>
									</div>
									<!-- 선택된 문서양식 미리보기 -->
									<div style="width: 395px; min-height: 450px;"></div>
								</div>
								<div class="modal-footer">
									<button class="btn btn-secondary btn-sm" type="button" data-bs-dismiss="modal">취소</button>
									<button class="btn btn-primary btn-sm" type="button" style="margin-left: 10px;" data-bs-dismiss="modal" onclick="selectComplete()">완료</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
                  <button id="selectTemplateModal" class="btn btn-secondary btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#templateModal">문서양식 선택</button>
                  <button class="btn btn-secondary btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#approvalModal">결재선 설정</button>
                  
                  <div class="modal fade" id="approvalModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
                  <div class="modal-dialog">
                     <div class="modal-content" style="width: 800px; height: 600px;">
                        <div class="modal-header">
                           <h5 class="modal-title" id="exampleModalLabel">결재선 설정</h5>
                           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" style="display: flex; flex-direction: column; justify-content: space-between;">
                           <div class="toast-body" style="display: flex; flex-direction: row; justify-content: space-around;">
                              <!-- 결재자들(js tree) -->
                              <div style="width: 395px; min-height: 450px; border-right: 1px solid black">
                              </div>
                              <!-- 선택된 결재자들 -->
                              <div style="width: 395px; min-height: 450px;">
                                 
                              </div>
                           </div>
                           <div class="modal-footer">
                              <button class="btn btn-secondary btn-sm" type="button" data-bs-dismiss="modal">취소</button>
                              <button class="btn btn-primary btn-sm" type="button" style="margin-left: 10px;">완료</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               
                  <button class="btn btn-secondary btn-sm" type="button">참조자 추가</button>
               </div>
               <div>
                  <button class="btn btn-secondary btn-sm" type="button">임시저장</button>
                  <button class="btn btn-primary btn-sm" type="button" style="width: 73.6px;">상신</button>
               </div>
            </div>
            <div id="main_content">
				<div style="display: flex; flex-direction: row; padding: 20px;">
					<div id="templateArea">
						<div class="top" style="text-align: center; margin-bottom: 70px; padding-top: 30px;">
		                   <h2>휴가신청서</h2>
		                </div>
		                <div class="header" style="display: flex; flex-direction: row; justify-content: space-between;">
		                     <div>
		                        <table class="template">
		                           <tr>
		                              <th style="width: 80px;">기안자</th>
		                              <td id="draftWriter" style="width: 180px;" class="paddingL10"></td>
		                           </tr>
		                           <tr>
		                              <th>소속부서</th>
		                              <td class="paddingL10"></td>
		                           </tr>
		                           <tr>
		                              <th>기안일</th>
		                              <td class="paddingL10"></td>
		                           </tr>
		                           <tr>
		                              <th>문서번호</th>
		                              <td class="paddingL10"></td>
		                           </tr>
		                        </table>
		                     </div>
		                     <div style="display: flex; flex-direction: row;">
		                        <table id="WriterArea" class="template" style="height: 180px;">
		                           <tr>
		                              <th rowspan="3" class="width30" >신청</th>
		                              <td class="fontSize14" style="width: 90px; height: 20px;">사원</td>
		                           </tr>
		                           <tr>
		                              <td>
		                                 <div class="fontSize14">배강훈</div>
		                              </td>
		                           </tr>
		                           <tr>
		                              <td class="fontSize14" style="height: 20px;">2024.03.21</td>
		                           </tr>
		                        </table>
		                        <table id="approvalArea" class="template" style="margin-left: 10px; height: 180px;">
		                           <tr>
		                              <th rowspan="3" class="width30">승인</th>
		                              <td style="width: 90px; height: 20px;" class="fontSize14">대리</td>
		                           </tr>
		                           <tr>
		                              <td class="fontSize14">이혜원</td>
		                           </tr>
		                           <tr>
		                              <td style="height: 20px;" class="fontSize14">2024.03.21</td>
		                           </tr>
		                        </table>
		                     </div>
		                  </div>
					</div>
				</div>            
            </div>

            <%@ include file="./include/footer.jsp"%>
         </div>
      </div>
   </div>
   
   
   <script type="text/javascript">
   var oEditors = [];
   nhn.husky.EZCreator.createInIFrame({
       oAppRef: oEditors,
       elPlaceHolder: "ir1",
       sSkinURI: "./se2/SmartEditor2Skin.html",
       fCreator: "createSEditor2"
   });
   
   function submitContents(elClickedObj) {
       // 에디터의 내용이 textarea에 적용된다.
       oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

       // 에디터의 내용에 대한 값 검증은 이곳에서
       // document.getElementById("ir1").value를 이용해서 처리한다.

       try {
           elClickedObj.form.submit();
       } catch(e) {
          
       }
    }
   
   document.getElementById("startCheckbox").addEventListener("change", function(){
      var radios = document.getElementsByName("시작일");
      for(let i = 0; i < radios.length; i++){
         radios[i].disabled = !this.checked;
      }
   });
   
   document.getElementById("endCheckbox").addEventListener("change", function(){
      var radios = document.getElementsByName("종료일");
      for(let i = 0; i < radios.length; i++){
         radios[i].disabled = !this.checked;
      }
   });
   
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
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="js/scripts.js"></script>
</body>
</html>