<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
	td:hover{
		cursor: pointer;
	}
</style>
</head>
<body class="nav-fixed">

	<%@ include file="./include/mainHeader.jsp"%>

	<!-- 사이드나브바 & 콘텐트 영역 -->
	<div id="layoutSidenav">
		<%@ include file="./include/mainSidenav.jsp"%>

		<c:set var="count" value="0" />
		<c:forEach items="${list}" var="list">
			<c:if test="${list.estatus eq 'Y'}">
				<c:set var="count" value="${count + 1}" />
			</c:if>
		</c:forEach>

		<!-- 콘텐츠 영역 -->
		<div id="layoutSidenav_content">
			<div id="main_content">
				<h1 style="margin-bottom: 70px; text-align: center;">알림 센터</h1>
				<hr class="mt-0 mb-4">
				<div>
					<table class="datatable-table" id="datatablesSimple" style="width: 100%;">
						<thead>
							<tr>
								<th style="max-width: 2rem;"></th>
								<th style="max-width: 5rem;">종류</th>
								<th>발신자</th>
								<th style="max-width : 10rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">내용</th>
								<th>수신시간</th>
							</tr>
						</thead>
						<tbody id="inputTableBody">
							<c:forEach items="${allNoti}" var="noti" varStatus="vs">
								<c:if test="${noti.read eq 'N'}">
									<tr style="font-weight: 500; color: #000;" onclick="openNoti('${noti.gubun}','${noti.ntype}', '${noti.noti_id}')">
										<td>${vs.count}</td>
										<td>${noti.comVo.code_name}</td>
										<td>${noti.sender}</td>
										<td>${noti.content}</td>
										<fmt:parseDate value="${noti.alert_time}" pattern="yyyy-MM-dd HH:mm:ss" var="fmtNotiDate" />
										<td><fmt:formatDate value="${fmtNotiDate}" pattern = "yyyy-MM-dd HH:ss"/></td>
									</tr>
								</c:if>
								<c:if test="${noti.read eq 'Y'}">
									<tr style="font-weight: 100;" onclick="openNoti('${noti.gubun}','${noti.ntype}', '${noti.noti_id}')">
										<td>${vs.count}</td>
										<td>${noti.comVo.code_name}</td>
										<td>${noti.sender}</td>
										<td style="max-width : 15rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" data-bs-toggle="tooltip" data-bs-placement="top" title="${noti.content}">${noti.content}</td>
										<fmt:parseDate value="${noti.alert_time}" pattern="yyyy-MM-dd HH:mm:ss" var="fmtNotiDate" />
										<td><fmt:formatDate value="${fmtNotiDate}" pattern = "yyyy-MM-dd HH:ss"/></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
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
	<script type="text/javascript">
	$(document).ready( function () {
    	$('#datatablesSimple').DataTable({

    	"language": { 
            "emptyTable": "알림이 없습니다",
            "lengthMenu": " _MENU_",
            "info": "_START_ - _END_ / _TOTAL_",
//             "search": "검색: ",
            "paginate": {
                "next": "다음",
                "previous": "이전",
                "first": "처음",
                "last" : "마지막"
            },
//           https://datatables.net/reference/option/language   위를 더 디테일하게 수정하고싶으면 여기로~
        },
        stateSave: true, //해당 페이지 상태 저장
        info: true, // 좌측하단 정보 표시 
        searching: false, // 검색 기능 
        ordering: false, // 정렬 기능
        paging:true, // 페이징 기능 
        lengthChange: true, //  좌상단 몇 건씩 볼지 정하는 기능
		lengthMenu: [ 5, 10, 20, 30, 50],
        pagingType: "full_numbers" // 페이징 타입 설정 : simple =이전, 다음 /simple_numbers 숫자페이징+이전 다음 , /full_numbers = 처음, 마지막 추가
    });
});
        
    </script>
</body>
</html>