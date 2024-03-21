<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/signature_pad/1.5.3/signature_pad.min.js"></script>
<link rel="stylesheet" href="./css/sign.css">
<title>서명입력</title>
</head>
<body>
<div id="container">
	<div style="text-align: center;">
		<canvas id="signpad" width="400" height="200" style="border: 1px solid black;"></canvas><br>
		<div>
			<button id="clear">지우기</button>
			<button id="save">저장</button>
			<p>대표서명으로지정 <input id="mainCheckbox" type="checkbox"></p>
		</div>
		<script type="text/javascript" src="./js/sign.js"></script> <!-- TODO waring : 이 설정스크립트는 꼭 canvas태그 아래에 둘것 -->
	</div>	
</div>
		
</body>
</html>