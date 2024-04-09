<%@page import="java.text.SimpleDateFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- <link rel="stylesheet" type="text/css" href="./css/cal.css"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
<style type="text/css">
	.mainAttBox{
		display: flex;
		padding: 12px;
	}
	.mainAttBox > .item{
		flex-grow: 1;
		flex-shrink:  1;
		flex-basis: 300px;
		margin: auto;
		text-align: center;
	}
	.fc-day-sun a {
	color: tomato;
	text-decoration: none;
	
}
.koHol {
    cursor: default;
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
				<div id="main"
					style="width: 100%; display: flex; flex-direction: column;">
					<!-- 출퇴근관리 -->
					<div class=" card"
						style="width: 100%; margin-bottom: 40px; height: 220px; display: flex; flex-direction: row;">
						<div style="width: 30%; height: 30%;">
							<div style="width: 100%; text-align: center; padding: 10px;" id="profileDiv">
								<p>${loginVo.name}</p>
							</div>
						</div>
						<div style="width: 70%; border-left: 1px solid #ddd;">
							<div class="card-header"
								style="width: 100%; height: 30%; display: flex; flex-direction: row; justify-content: center; background-color: rgba(66, 138, 70, 1); border-top-left-radius: 0px;">
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<h2 style="margin-right: 20px; margin-top: 5px; color: #fff;">
									<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 (E)" />
								</h2>
								<h2 style="margin-top: 5px; color: #fff;" id="time"></h2>
							</div>
							<div class="card-body"
								style="display: flex; flex-direction: column; width: 100%;">
								<div
									style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 5px;">
									<h4>출근시간 : ${attVo.in_date != null ? attVo.in_date.substring(11,16) : '미등록'}</h4>
									<h4>퇴근시간 : ${attVo.out_date != null ? attVo.out_date.substring(11,16) : '미등록'}</h4>
									<h4>상태 : ${attVo.att_status}</h4>
								</div>
								<div
									style="margin-top: 15px; display: flex; justify-content: center;">
									<c:choose>
										<c:when
											test="${attVo.in_date == null && attVo.out_date == null}">
											<button style="width: 120px;" class="btn btn-primary"
												id="attendanceButton" onclick="location.href='in.do'">출근하기</button>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${attVo.out_date == null}">
													<button style="width: 120px;" id="leaveButton"
														type="button" class="btn btn-danger"
														onclick="location.href='out.do'">퇴근하기</button>
												</c:when>
												<c:otherwise>
													<button style="width: 120px;" id="leaveButton"
														type="button" class="btn btn-danger"
														onclick="alert('이미 퇴근되었습니다.')">퇴근하기</button>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
					<div id="lowerBox"
						style="width: 100%; display: flex; flex-direction: row; justify-content: space-between;">
						<div id="calendarBox" class="card" style="width: 49%;">
                     		<div id="addSchedule" style="padding: 15px;"></div>
                  		</div>
						<div id="apprBox" class="card" style="width: 49%;  padding: 20px; text-align: center;">
							<div style="display: flex; flex-direction: row; justify-content: space-between; margin-bottom: 30px; margin-top: 3px;">
								<div id="urgency1" onclick="location.href = './draftDetail.do?docno=${urgencyLists[0].docno}'" class="card" style="min-height: 230px; width: 49%; box-shadow: 0 0.15rem 1rem 0 rgba(33, 40, 50, 0.15); padding: 15px;">
									<span class="badge badge-danger" style="width: 50px; margin-bottom: 15px; margin-top: 10px;">긴급</span>
									<h5 style="margin-bottom: 15px;">${urgencyLists[0].title}</h5>
									<p>기안자 : ${urgencyLists[0].empVo.name}</p>
									<p>기안일 : <script>
											        var dDate = formatDate("${urgencyLists[0].draft_date}" );
											        document.write(dDate);
								    			</script></p>
									<p>문서유형 : ${urgencyLists[0].commVo.code_name}</p>
								</div>
								<div id="urgency2" onclick="location.href = './draftDetail.do?docno=${urgencyLists[1].docno}'" class="card" style="min-height: 230px; width: 49%; box-shadow: 0 0.15rem 1rem 0 rgba(33, 40, 50, 0.15); padding: 15px;">
									<span class="badge badge-danger" style="width: 50px; margin-bottom: 15px; margin-top: 10px;">긴급</span>
									<h5 style="margin-bottom: 15px;">${urgencyLists[1].title}</h5>
									<p>기안자 : ${urgencyLists[1].empVo.name}</p>
									<p>기안일 : <script>
											        var dDate = formatDate("${urgencyLists[1].draft_date}" );
											        document.write(dDate);
								    			</script></p>
									<p>문서유형 : ${urgencyLists[1].commVo.code_name}</p>
								</div>
							</div>
							<div class="card"
								style="box-shadow: 0 0.15rem 1rem 0 rgba(33, 40, 50, 0.15);">
								<div class="card-header"
									style="display: flex; flex-direction: row; justify-content: space-between; padding: 5px; background-color: rgba(66,138,70,1);">
									<p style="width: 40%; text-align: center; margin-bottom: 0px; color: #fff;">제목</p>
									<p style="width: 25%; text-align: center; margin-bottom: 0px; color: #fff;">기안일</p>
									<p style="width: 15%; text-align: center; margin-bottom: 0px; color: #fff;">작성자</p>
									<p style="width: 25%; text-align: center; margin-bottom: 0px; color: #fff;">문서양식</p>
								</div>
								<div class="card-body" style="display: flex; flex-direction: column; padding: 10px;">
									<c:forEach var="doc" items="${docLists}">
										<div style="display: flex; flex-direction: row; margin-bottom: 10px; border-bottom: 1px solid #ddd">
											<p style="width: 40%; text-align: center; margin-bottom: 0px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 40%;"><a href="./draftDetail.do?docno=${doc.docno}">${doc.title}</a></p>
											<p style="width: 25%; text-align: center; margin-bottom: 0px;">
												<script>
											        var dDate = formatDate("${doc.draft_date}" );
											        document.write(dDate);
								    			</script>
								    		</p>
											<p style="width: 15%; text-align: center; margin-bottom: 0px;">${doc.empVo.name}</p>
											<p style="width: 25%; text-align: center; margin-bottom: 0px;">${doc.commVo.code_name}</p>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>





			<%@ include file="./include/footer.jsp"%>
		</div>
	</div>

<script type="text/javascript">
window.onload = function() {
    initClock();
};

function initClock() {
    var timeElement = document.getElementById("time");

    function updateClock() {
        const now = new Date();
        const hours = String(now.getHours()).padStart(2, "0");
        const minutes = String(now.getMinutes()).padStart(2, "0");
        const seconds = String(now.getSeconds()).padStart(2, "0");
        timeElement.textContent = hours + ":" + minutes + ":" + seconds;
    }

    updateClock(); // 페이지 로드 시 한 번 실행
    setInterval(updateClock, 1000); // 1초마다 업데이트
    
    var profileO = document.querySelector("img[alt='프로필사진']");
    var profileDiv = document.getElementById("profileDiv");
    var name = profileDiv.querySelector("p");
    var profile = profileO.cloneNode(true);
    name.setAttribute("style","margin-top:15px;")
    profile.setAttribute("style","width:150px; border:1px solid #ddd; border-radius: 50%; margin-top : 7px;");
    profileDiv.insertBefore(profile, name);
   
}

</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
	<script type="text/javascript" src="js/main_cal.js"></script>
</body>
</html>