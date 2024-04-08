<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

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
				<h1 style="margin-bottom: 70px; text-align: center;">서명 정보</h1>
				<hr class="mt-0 mb-4">
<div style="display: flex; justify-content: center;">
    <div style="display: flex; flex-wrap: wrap;">
    	<c:choose>
    		<c:when test="${empty signlist}">
    		                <p>등록된 서명이 없습니다</p>
    		</c:when>
    		<c:otherwise>
        <c:forEach var="lists" items="${signlist}" varStatus="vr">
            <div style="text-align: center; margin: 5px;">
                <img alt="서명" src="${lists.save_sign}" style="border: 1px solid;"><br>
                <input type="radio" name="signnoGroup" ${lists.main eq 'Y' ? 'checked' : ''} value="${lists.signno}" data-main="${lists.main}">
                &nbsp;&nbsp;${lists.main  eq 'Y' ? '대표서명' : '일반서명'} &nbsp;&nbsp;&nbsp;
            </div>
        </c:forEach>
    		</c:otherwise>
    	</c:choose>
    		
    </div>
</div>
					<br>
					<br>
				<%-- 	<table class="table">
						<tbody>
							<c:forEach var="lists" items="${signlist}" varStatus="vr">
								<tr>
									<td>${vr.count}</td>
									<td>${lists.id}</td>
									<td><img alt="서명" src="${lists.save_sign}"> <input type="radio"
										name="signnoGroup" ${lists.main eq 'Y' ? 'checked' : ''}
										value="${lists.signno}" data-main="${lists.main}"></td>
									<td>${lists.main}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table> --%>
							<input type="button" class="btn btn-secondary" value="대표서명으로 지정" onclick="mainSign()">
							<input type="button" class="btn btn-primary" value="등록" onclick="openChildWindow()">
							<input type="button" class="btn btn-danger" value="삭제" onclick="delSign()">
			</div>
			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
<script type="text/javascript">
    function mainSign() {
        var selectedRadio = document.querySelector('input[name="signnoGroup"]:checked');
            var selectedValue = selectedRadio.value;
            var mainStatus = selectedRadio.getAttribute('data-main'); // 대표서명 상태 가져오기
            console.log(selectedValue);
            
            // 대표서명 상태가 'Y'이면 이미 대표서명으로 지정되어 있음을 알림
            if (mainStatus === 'Y') {
                alert('이미 대표서명으로 지정되어 있습니다.');
                return; // 함수 종료
            }

            fetch('./mainSign.do', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ signno : selectedValue })
            })
            .then(response => {
                if (response.ok) {
                    console.log('대표서명으로 지정 성공!');
                    window.location.reload();
                    alert('대표서명이 변경되었습니다.');
                } else {
                    console.error('대표서명으로 지정 실패...');
                }
            })
            .catch(error => {
                console.error('오류 발생:', error);
            });
    }
    
    function delSign(){
        var selectedRadio = document.querySelector('input[name="signnoGroup"]:checked');
        if(selectedRadio){
            var selectedValue = selectedRadio.value;
            var mainStatus = selectedRadio.getAttribute('data-main');
            
            // 대표서명인 경우 삭제할 수 없음
            if (mainStatus === 'Y') {
                alert('대표서명은 삭제할 수 없습니다.');
                return; 
            }
            
            if (confirm('정말로 삭제하시겠습니까?')) {
                executeDelSign(selectedValue);
            }
        }
    }

    function executeDelSign(selectedValue) {
        // 패치 요청
        fetch('./delSign.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ signno : selectedValue })
        })
        .then(response => {
            if (response.ok) {
                console.log('서명삭제 성공');
                window.location.reload(); // 페이지 새로고침
                alert('서명이 삭제되었습니다.');
            } else {
                console.error('서명삭제 실패');
            }
        })
        .catch(error => {
            console.error('오류 발생:', error);
        });
    }
    
    function openChildWindow() {
        // 등록된 서명 개수 확인
        var signCount = document.querySelectorAll('input[name="signnoGroup"]').length;
        
        // 등록된 서명이 3개 이상인 경우 경고 메시지 표시
        if (signCount >= 3) {
            alert('서명은 최대 3개까지만 등록할 수 있습니다.');
        } else {
            var childWindow = window.open('./insertSign.do', 'childWindow', 'width=600,height=400');
            
            if (childWindow) {
                childWindow.focus();
            } else {
                alert('팝업 창이 차단되었습니다. 팝업 창을 허용해주세요.');
            }
        }
    }


</script>


</body>
</html>