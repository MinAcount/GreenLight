<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body class="nav-fixed">
   
  <%@ include file="./include/mainHeader.jsp" %>
   
   
   
<!-- 사이드나브바 & 콘텐트 영역 -->
   <div id="layoutSidenav">
      <%@ include file="./include/mainSidenav.jsp" %>
      
<!-- 콘텐츠 영역 -->      
      <div id="layoutSidenav_content">
         <div id="main_content">
         	<h1 style="margin-bottom: 50px; text-align: center;">문서양식등록</h1>
         	<hr>
		<div style="margin-top: 50px;">        
	         <table style="margin: auto; width: 800px;">
					<tbody>
						<tr class="trcss">
							<th class="thcss">작성자</th>
							<td><input type="text" class="form-control" readonly="readonly"></td>
						</tr>
						<tr class="trcss">
							<th class="thcss">작성일</th>
							<td><input type="text" class="form-control" readonly="readonly"></td>
						</tr>
						<tr>
							<th>문서양식유형</th>
							<td>
								<select class="form-control">
						            <option value="none">선택</option>
						            <option value="휴가신청서">휴가신청서</option>
						            <option value="부서발령신청서">부서발령신청서</option>
						            <option value="지출결의서">지출결의서</option>
						        </select>
							</td>
						</tr>
						<tr class="trcss">
							<th class="thcss">제목</th>
							<td><input type="text" class="form-control"></td>
						</tr>
						<tr class="trcss">
							<th class="thcss">내용</th>
							<td><textarea cols="70" rows="25" class="form-control" style="margin-top: 10px" id="exampleFormControlTextarea1" rows="3"></textarea></td>
						</tr>
					</tbody>
					<tfoot>
					<tr>
						<td colspan="2">
							<button class="btn btn-secondary" type="button">취소</button>
							<button class="btn btn-primary" type="button" style="margin-left:15px;">등록</button>
						</td>
					</tr>
						
						
					</tfoot>
				</table>
			</div>
			<br>

		</div>
         <%@ include file="./include/footer.jsp" %>
      </div>
   </div>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="js/scripts.js"></script>

   
</body>
</html>