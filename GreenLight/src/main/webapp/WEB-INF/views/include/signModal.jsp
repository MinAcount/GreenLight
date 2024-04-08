<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal modal-backdrop" style="display: none;" data-bs-backdrop="static backdrop"
		id="dangerAlert" >
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
						<button id="firstBtn" class="btn btn-dsecondary" type="button"
							onclick="closeDangerAlert()">취소</button>
						<button id="secondBtn" style="margin-left: 10px;" class="btn btn-danger"
							type="button" onclick="location.href='./signature.do'">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>