<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body class="nav-fixed">

	<%@ include file='./include/mainHeader.jsp'%>

	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file='./include/mainSidenav.jsp'%>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1>CKEditor</h1>
				<form action="" method="POST">
					<textarea name="text" id="editor"></textarea>
					<p>
						<input type="submit" value="전송">
					</p>
				</form>

				<!-- <head>요소 안에 스크립트가 있을때는 HTML문서의 내용이 아직 로드되지 않았으므로, document.querySelector('#editor')가 null을 반환 -->
				<script type="text/javascript">
//     	var draftHTML = "<h1>Hello world!</h1><table><thead><tr><td>이름</td><td>생년월일</td><td>키/몸무게</td><td>소속팀</td></tr></thead><tbody><tr><td>정우영</td><td>1999.09.20</td><td>180cm/70kg</td><td>VfB 슈투트가르트(독일)</td></tr><tr><td>조규성</td><td>1998.01.25</td><td>189cm/82kg</td><td>FC 미트윌란</td></tr><tr><td>주민규</td><td>1990.04.13</td><td>183cm/79kg</td><td>울산HDFC</td></tr><tr><td>백승호</td><td>1997.03.17</td><td>182cm/72kg</td><td>버밍엄 시티 FC</td></tr></tbody></table>";
    	var draftHTML = '<div class="table"> <div class="row header"> <p class="cell">이름</p> <p class="cell">생년월일</p> <p class="cell">키/몸무게</p> <p class="cell">소속팀</p> </div> <div class="row"> <p class="cell">정우영</p> <p class="cell">1999.09.20</p> <p class="cell">180cm/70kg</p> <p class="cell">VfB 슈투트가르트(독일)</p> </div> <div class="row"> <p class="cell">조규성</p> <p class="cell">1998.01.25</p> <p class="cell">189cm/82kg</p> <p class="cell">FC 미트윌란</p> </div> <div class="row"> <p class="cell">주민규</p> <p class="cell">1990.04.13</p> <p class="cell">183cm/79kg</p> <p class="cell">울산HDFC</p> </div> <div class="row"> <p class="cell">백승호</p> <p class="cell">1997.03.17</p> <p class="cell">182cm/72kg</p> <p class="cell">버밍엄 시티 FC</p> </div> </div>';
    	
		ClassicEditor.create( document.querySelector( '#editor' ), {
			allowedContent:true,
			extraAllowedContent:'*(*)[id,class]',
			language:"ko"
		})
		.then(editor=>{
			editor.setData(draftHTML);
		})
		.catch(error=>{
			console.error(error);
		});
	</script>
			</div>
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>

</body>
</html>