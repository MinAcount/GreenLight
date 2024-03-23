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
            <textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
            <hr>
				<!-- 모달 창 -->
				<div
					style="display: flex; justify-content: center; align-items: center; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 1000;">
					<div
						style="width: 800px; height: 600px; background-color: #fff; border-radius: 10px; padding: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);">
						<div
							style="display: flex; justify-content: space-between; height: calc(100% - 100px); padding: 10px;">
							<div
								style="width: 400px; border: 1px solid #ccc; border-radius: 5px; padding: 10px; box-sizing: border-box;">
								<h3>문서양식선택</h3>
								<!-- 왼쪽 영역의 내용 -->
							</div>
							<div
								style="width: 400px; border: 1px solid #ccc; border-radius: 5px; padding: 10px; box-sizing: border-box;">
								<h3>미리보기</h3>
								<!-- 오른쪽 영역의 내용 -->
							</div>
						</div>
						<div style="text-align: right; padding: 10px 20px 0;">
							<button
								style="padding: 10px 20px; margin: 0 5px; border: none; border-radius: 5px; cursor: pointer; background-color: #ccc;">취소</button>
							<button
								style="padding: 10px 20px; margin: 0 5px; border: none; border-radius: 5px; cursor: pointer; background-color: #007bff; color: #fff;">확인</button>
						</div>
					</div>
				</div>
				<hr>
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