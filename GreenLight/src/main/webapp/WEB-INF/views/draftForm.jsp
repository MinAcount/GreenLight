<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="./se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body class="nav-fixed">

<%-- 	<%@ include file='./include/mainHeader.jsp'%> --%>

	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
<%-- 		<%@ include file='./include/mainSidenav.jsp'%> --%>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
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
	
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "ir1",
	    sSkinURI: "./se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	</script>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>