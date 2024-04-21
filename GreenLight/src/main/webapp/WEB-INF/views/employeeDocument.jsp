<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
	tr:hover{
		cursor: pointer;
	}
	.modal.hide .modal-backdrop {
	  display: none;
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
					<table class="datatable-table" id="datatableDocument">
						<thead>
							<tr style="width: 100%;">
								<th style="width: 5%;"></th>
								<th style="width: 13%; text-align: center;">사원번호</th>
								<th style="width: 20%; text-align: center;">부서</th>
								<th style="width: 10%; text-align: center;">이름</th>
								<th style="width: 10%; text-align: right;">근로계약서</th>
								<th style="width: 10%; text-align: right;">신분증사본</th>
								<th style="width: 10%; text-align: right;">이력서</th>
								<th style="width: 10%; text-align: right;">통장사본</th>
							</tr>
						</thead>
						<tbody id="inputTableBody">
							<c:forEach var="vo" items="${empList}" varStatus="vs">
								<tr onclick="openFileList('${vo.id}', '${vo.name}')" data-bs-toggle='modal' class='empFileList' data-bs-target='#fileListModal'>
									<td style="text-align: center;">${vs.count}</td>
									<td class="empId" style="text-align: center;">${vo.id}</td>
									<c:forEach var="deptVo" items="${deptList}">
										<c:if test="${deptVo.deptno eq vo.deptno}">
											<td style="text-align: center;">${deptVo.dname}</td>
										</c:if>
									</c:forEach>
									<td style="text-align: center;">${vo.name}</td>
									<c:set var="startIdx" value="${vs.index * 4}" />
									<c:set var="endIdx" value="${vs.index * 4 + 3}" />
									<c:forEach var="file" begin="${startIdx}" end="${endIdx}"
										items="${fileList}" varStatus="fileStatus">
										<c:if test="${file.ref_id eq vo.id}">
											<c:if test="${vo.estatus eq 'Y'}">
												<td style="font-size: 12px; color: green; font-weight: bold; text-align: right;" class="file"><i data-feather='check-circle'></i>${file.comVo.code_name}</td>
											</c:if>
											<c:if test="${vo.estatus eq 'N'}">
												<td style="font-size: 12px; color: orange; font-weight: bold; text-align: right;" class="file"><i data-feather='check-circle'></i>${file.comVo.code_name}</td>
											</c:if>
										</c:if>
										<c:if test="${file.ref_id ne vo.id}">
											<td style="font-size: 12px; font-weight: 100; color: #ccc; text-align: right;" class="file">${file.comVo.code_name}</td>
										</c:if>
									</c:forEach>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal" id="fileListModal"
				aria-labelledby="exampleModalLabel" aria-hidden="true"
				data-bs-backdrop="static">
				<div class="modal-dialog file-modal" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalTitle">인사서류</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body"
							style="display: flex; flex-direction: column; justify-content: space-between;">
							<div class="toast-body"
								style="display: flex; flex-direction: row; justify-content: space-around;">
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
			<div class="modal" style="display: none;" data-bs-backdrop="static" tabindex="-1"
				id="dangerConfirmDocument" >
				<div class="modal-dialog alertModal">
					<div class="modal-content">
						<div class="modal-header text-danger">
							<div class="modal-title" id="exampleModalLabel">
								<i data-feather="alert-circle" id="toastFeather"></i> <strong
									class="me-auto" id="modalTitle"></strong>
							</div>
						</div>
						<div class="modal-body">
							<div id="modalContent" style="padding: 15px;"></div>
							<div class="modal-footer">
								<button id="firstBtn" class="btn btn-dsecondary" type="button">취소</button>
								<button id="secondBtn" style="margin-left: 10px;" class="btn btn-danger" type="button">확인</button>
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
			$('#datatableDocument').DataTable({
				"language" : {
					"emptyTable" : "직원이 없습니다",
					"lengthMenu" : " _MENU_",
					"info" : "_START_ - _END_ / _TOTAL_",
					"search" : "검색: ",
					"paginate" : {
						"next" : "다음",
						"previous" : "이전",
						"first" : "처음",
						"last" : "마지막"
					},
				},
				stateSave: true, //해당 페이지 상태 저장
				autoWidth : false,
				info : true, // 좌측하단 정보 표시 
				searching : true, // 검색 기능 
				ordering : false, // 정렬 기능
				destory : true,
				paging : true, // 페이징 기능 
				lengthChange : true, //  좌상단 몇 건씩 볼지 정하는 기능
				"lengthMenu" : [ 10, 20, 30, 50, 100 ],
				pagingType : "full_numbers" // 페이징 타입 설정 : simple =이전, 다음 /simple_numbers 숫자페이징+이전 다음 , /full_numbers = 처음, 마지막 추가
			});
		});
	</script>
</body>
</html>