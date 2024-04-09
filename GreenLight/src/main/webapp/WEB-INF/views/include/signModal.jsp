<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal" style="display: none;" data-bs-backdrop="static"
		id="dangerConfirm" >
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
	<div class="modal" style="display: none;" data-bs-backdrop="static"
		id="primaryConfirm" >
		<div class="modal-dialog alertModal">
			<div class="modal-content">
				<div class="modal-header text-primary">
					<div class="modal-title" id="exampleModal">
						<i data-feather="check-circle" id="toastFeather"></i> <strong
							class="me-auto" id="modalTitle"></strong>
					</div>
				</div>
				<div class="modal-body">
					<div id="modalContent" style="padding: 15px;"></div>
					<div class="modal-footer">
						<button id="firstBtn" class="btn btn-secondary" type="button">취소</button>
						<button id="secondBtn" style="margin-left: 10px;" class="btn btn-primary"
							type="button">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" style="display: none;" data-bs-backdrop="static"
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
						<button id="secondBtn" style="margin-left: 10px;" class="btn btn-danger"
							type="button">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" style="display: none;" data-bs-backdrop="static"
		id="primaryAlert" >
		<div class="modal-dialog alertModal">
			<div class="modal-content">
				<div class="modal-header text-primary">
					<div class="modal-title" id="exampleModal">
						<i data-feather="check-circle" id="toastFeather"></i> <strong
							class="me-auto" id="modalTitle"></strong>
					</div>
				</div>
				<div class="modal-body">
					<div id="modalContent" style="padding: 15px;"></div>
					<div class="modal-footer">
						<button id="secondBtn" style="margin-left: 10px;" class="btn btn-primary"
							type="button">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>