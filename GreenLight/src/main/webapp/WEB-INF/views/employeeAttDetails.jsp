<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body class="nav-fixed">

	<%@ include file="./include/mainHeader.jsp"%>

	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file="./include/mainSidenav.jsp"%>


		<!-- 콘텐츠 영역 -->
		<c:set var="count" value="0" />
		<c:forEach items="${list}" var="list">
			<c:if test="${list.estatus eq 'Y'}">
				<c:set var="count" value="${count + 1}" />
			</c:if>
		</c:forEach>
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">${EVo.name} 근무현황</h1>
				<input type="hidden" value="${EVo.id}" name="id">
				<input type="hidden" id="hiddenMonth" value="${month}">
				<h2><input type="month" style="border: 0" id="MM" value="${month}"  onchange="updateMonth()"></h2>
					<input type="button" class="btn btn-secondary" id="editButton" value="수정" onclick="toggleEdit()" style="float: right; display: ${editMode ? 'none' : 'block'};">
					<input type="button" class="btn btn-primary" id="completeButton" value="수정 완료" onclick="submitForm()" style="float: right; display: ${editMode ? 'block' : 'none'};">
				<div
					style="display: flex; justify-content: space-between; margin-top: 50px; height: 60.8px;">
				</div>
				<hr class="mt-0 mb-4">
				<div>
				<form id="editForm" action="./attUpdate.do" method="post">
					<table class="table">
						<thead>
							<tr>
								<td></td>
								<td>날짜</td>
								<td>출근시간</td>
								<td>퇴근시간</td>
								<td>비고</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="lists" items="${lists}" varStatus="vr">
								<tr>
								 <td><input type="radio" name="option"></td>
								 <td>${lists.in_date.substring(0,10)}<input type="hidden" value="${lists.in_date.substring(0,10)}" name="in_date"></td>
								 <td><input type="time" name="in_time" value="${lists.in_date.substring(11,16)}" style="border: 0" readonly="readonly"></td>
								 <td><input type="time" name="out_time" value="${lists.out_date.substring(11,16)}" style="border: 0" readonly="readonly"></td>
								 <td>${lists.att_status != null ? lists.att_status : '-'}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
				</div>
			</div>
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script type="text/javascript">
	var editMode = false;

	function toggleEdit() {
		  // 수정 버튼을 누른 라디오 버튼을 찾기
		  var checkedRadio = document.querySelector('input[name="option"]:checked');
		  
		  // 라디오 버튼이 체크되어 있는지 확인
		  if (!checkedRadio) {
		    alert("수정할 항목을 선택해주세요.");
		    return;
		  }

		  // 라디오 버튼의 부모 요소가 tr인지 확인하고, tr 찾기
		  var trElement = checkedRadio.closest('tr');
		    
		  // 찾은 tr 요소에 대해 원하는 작업 수행
		  if (trElement) {
		      // 부모 요소의 모든 자식 요소 가져오기
		      var allTrElements = Array.from(trElement.parentNode.children);
		      // tr 요소의 인덱스 찾기
		      var index = allTrElements.indexOf(trElement);
		      
		      // 인덱스 출력
		      console.log("수정 버튼을 누른 라디오 버튼이 포함된 행(tr)의 인덱스:", index);
		  } else {
		      console.log("수정 버튼을 누른 라디오 버튼이 포함된 행(tr)을 찾을 수 없습니다.");
		  }

	    var editButton = document.getElementById("editButton");
	    var completeButton = document.getElementById("completeButton");
	    var inputs = document.querySelectorAll("input[type='time']");
		var in_time = document.getElementsByName("in_time")[index];
		var out_time = document.getElementsByName("out_time")[index];
		var in_date = document.getElementsByName("in_date")[index];

	    editMode = !editMode; // 수정 모드를 토글

	    editButton.style.display = editMode ? "none" : "block";
	    completeButton.style.display = editMode ? "block" : "none";
	    
	    // 수정 버튼이 활성화되면 해당 행의 시간 입력 필드를 수정 가능하게 만들기
	    in_time.readOnly = !editMode;
	    out_time.readOnly = !editMode;

	    // 수정 모드가 활성화되면 다른 라디오 버튼을 비활성화
	    var radioButtons = document.querySelectorAll('input[name="option"]');
	    radioButtons.forEach(function(radioButton) {
	        radioButton.disabled = editMode;
	    });
	}

	function submitForm() {
	    // 선택된 날짜의 값을 가져옴
// 	    var in_date = document.querySelector('input[name="option"]:checked').parentNode.nextElementSibling.innerText.trim();
	    var checkedRadio = document.querySelector('input[name="option"]:checked');
	    var trElement = checkedRadio.closest('tr');
	    var allTrElements = Array.from(trElement.parentNode.children);
	    var index = allTrElements.indexOf(trElement);
	    
		var in_time = document.getElementsByName("in_time")[index].value;
		var out_time = document.getElementsByName("out_time")[index].value;
		var in_date = document.getElementsByName("in_date")[index].value;
		var id = document.getElementsByName("id")[0].value;
		
		fetch('./attUpdate.do', {
			method: 'POST',
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify({
				in_time: in_time,
				out_time: out_time,
				in_date: in_date,
				id: id
			}),
		})
		.then(data => data.json())
		.then(result => {
			console.log(result);
			if (result.msg == 'SUCCESS') {
				alert("수정이 완료되었습니다.");
				window.location.reload();
			}else if (result.msg == 'UPDATEFAIL'){
				alert("수정이 실패하였습니다.");
			}
		});
	}
		function updateMonth(){
		var id = document.getElementsByName("id")[0].value;
		var hiddenMonth = document.getElementById('hiddenMonth').value;
		var selectMonth = document.getElementById('MM').value;
		var encodedMonth = encodeURIComponent(selectMonth);
		var dateYear = new Date().getFullYear();
		var dateMonth = new Date().getMonth()+1;
		if(new Date(selectMonth) > new Date()){
			alert("현재보다 나중 날짜는 선택할 수 없습니다");
			console.log(dateYear+"-"+dateMonth)
			document.getElementById('MM').value = hiddenMonth;
			return false;
		}
		window.location.href='./employeeAttDetails.do?in_date='+encodedMonth+"&id="+id;
	}


	</script>
</body>
</html>
