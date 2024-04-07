<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
	.form-control:focus, .datatable-input:focus {
		color: #69707a;
		box-shadow: 0 0 0 0.25rem rgba(46, 125, 50, 0.2);
	}
</style>
</head>
<body class="nav-fixed">

	<%@ include file="./include/mainHeader.jsp"%>

	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file="./include/mainSidenav.jsp"%>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">인사 서류 관리</h1>
				<hr class="mt-0 mb-4">
				<div>
					<table class="datatable-table" id="datatableSimple" >
						<thead>
							<tr style="width: 100%;">
								<th style="width: 5%;"></th>
								<th style="width: 13%;">사원번호</th>
								<th style="width: 20%;">부서</th>
								<th style="width: 20%;">이름</th>
								<th style="width: 42%;" colspan="4">입사서류</th>
							</tr>
						</thead>
						<tbody id="inputTableBody">
							<c:forEach var="vo" items="${empList}" varStatus="vs">
								<tr onclick="openFileList('${vo.id}', '${vo.name}')" data-bs-toggle='modal' class='empFileList' data-bs-target='#fileListModal'>
									<td style="text-align: center;">${vs.count}</td>
									<td class="empId">${vo.id}</td>
									<c:forEach var="deptVo" items="${deptList}">
										<c:if test="${deptVo.deptno eq vo.deptno}">
											<td>${deptVo.dname}</td>
										</c:if>
									</c:forEach>
									<td>${vo.name}</td>
									<td style="font-size: 12px;" class="file">근로계약서</td>
									<td style="font-size: 12px;" class="file">신분증사본</td>
									<td style="font-size: 12px;" class="file">이력서</td>
									<td style="font-size: 12px;" class="file">통장사본</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal fade" id="fileListModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true"
				data-bs-backdrop="static">
				<div class="modal-dialog">
					<div class="modal-content" style="width: 500px;">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">인사서류</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body"
							style="display: flex; flex-direction: column; justify-content: space-between;">
							<div class="toast-body" style="display: flex; flex-direction: row; justify-content: space-around;">
								<table id="empFile" style="width: 100%;">
									<thead>
										<tr>
											<th style="text-align: center;">종류</th>
											<th style="text-align: center;">파일명</th>
											<th style="text-align: center;">구분</th>
										</tr>
									</thead>
									<tbody id="empFileTableBody"></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables/datatables-simple-demo.js"></script>
	<script src="js/emp_ljw/emp.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#datatableSimple').DataTable({

				"language" : {
					"emptyTable" : "직원이 없습니다",
					"lengthMenu" : " _MENU_",
					"info" : "_START_ - _END_ / _TOTAL_",
					            "search": "검색: ",
					"paginate" : {
						"next" : "다음",
						"previous" : "이전",
						"first" : "처음",
						"last" : "마지막"
					},
				},

				info : true, // 좌측하단 정보 표시 
				searching : true, // 검색 기능 
				ordering : false, // 정렬 기능
				paging : true, // 페이징 기능 
				lengthChange : true, //  좌상단 몇 건씩 볼지 정하는 기능
				lengthMenu : [ 10, 20, 30, 50, 100 ],
				pagingType : "full_numbers" // 페이징 타입 설정 : simple =이전, 다음 /simple_numbers 숫자페이징+이전 다음 , /full_numbers = 처음, 마지막 추가
			});
		});
		
		var empIdList = [];
		var allEmp = document.querySelectorAll(".empId");
		var empFileList = document.querySelectorAll(".empFileList");
		allEmp.forEach(function(eachEmp){
			empIdList.push(eachEmp.innerText);
		})
		console.log(empIdList);
		fetch("./getAllEmpFile.do", {
			method: 'POST',
			headers:{"content-type":"application/json"},
			body: JSON.stringify({
				ids:JSON.stringify({empIdList}),
				start:'03',
				end:'06'
			}),
		})
		.then(data => data.json())
		.then(result => {
			console.log(result);
			for(let i=0; i<result.length; i++){
				for(let j=0; j<4; j++){
					if(((result[i])[j]).payload != null){
						empFileList[i].querySelectorAll(".file")[j].style = "color:green; font-size:12px; font-weight:bold;";
					}
				}
			}
		});
	</script>
</body>
</html>