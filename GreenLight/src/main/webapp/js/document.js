window.onload = function() {
	var docno = document.getElementById("docno").textContent;
	console.log("docno", docno);

	//draftDetail.jsp 이미지 다운로드
	var fileTd = document.getElementById("fileTd");
	console.log("fileTd", fileTd);
	var fileTdImgs = fileTd.getElementsByTagName("img");
	for (let i = 0; i < fileTdImgs.length; i++) {
		console.log("fileTdImg", fileTdImgs[i]);
		fileTdImgs[i].addEventListener("click", function() {
			if (confirm("파일을 다운로드 받으시겠습니까??")) {
				console.log("파일 다운로드")
				//downloadFile(data);
				//window.location = 'data:png/image;base64,' + data.payload;
				console.log("fileTdImg click()");
				console.log("fileTdImg.alt", fileTdImgs[i].alt);
				location.href = "./getFiles.do?docno="+docno+"&origin_name="+fileTdImgs[i].alt;

//				fetch('./getFiles.do?docno=' + docno + '&origin_name=' + fileTdImgs[i].alt)
//					.then(response => {
//						if (!response.ok) {
//							throw new Error('Network response was not ok');
//						}
//						return response.blob(); // JSON 형식으로 응답 데이터를 파싱
//					})
//					.then(data => {
//						console.log("data", data); // 응답 데이터 출력
//					})
//					.catch(error => {
//						console.error('There was a problem with your fetch operation:', error);
//					});
				}

		})
	}
}

//// 파일 다운로드 함수
//function downloadFile(data) {
////	console.log(data.payload);
//	console.log(data.origin_name);
////	return false;
//    // 파일 이름 및 타입 설정
//    const fileName = data.origin_name;
//    const fileType = 'text/png';
//
//    // 데이터를 Blob으로 변환
//    const blob = new Blob([data], { type: fileType });
//
//    // a 태그를 생성하여 다운로드
//    const a = document.createElement('a');
//    a.href = URL.createObjectURL(blob);
//    a.download = fileName;
//    document.body.appendChild(a);
//    a.click();
//    document.body.removeChild(a);
//}

//clob타입 파일 다운로드 fetch
//function fileDownload(data){
//	fetch(url, {
//		method: 'POST',
//		headers: {
//			'Content-Type': 'application/json', // 요청 본문의 타입을 지정
//			// 다른 필요한 헤더들을 추가할 수 있습니다.
//		},
//		body: JSON.stringify(data) // 요청 본문에 보낼 데이터를 JSON 문자열로 변환하여 설정
//	})
//		.then(response => {
//			// 응답 처리
//		})
//		.catch(error => {
//			// 오류 처리
//		});
//}

// 카테고리별 기안문서함 조회
function draftListByDocStatus(val) {
   var doc_status = val
   console.log("val", val)
   var id = document.getElementById('id').value;
   console.log("id", id)

   fetch('./draftListByDocStatus.do', {
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
         id: id,
         doc_status: doc_status
      }),
   })
      .then(response => response.json())
      .then(result => {
         console.log("result:", result);
         if (result != null) {
            lists1(result)
         } else {
            alert('실패..')
         }
      });
   function lists1(result) {
      console.log("12qwessdsads::::", result);
      var tableBody = document.getElementById('tableBody');
      var tableHTML = "";

      tableBody.innerHTML = "";

      result.forEach(function(item) {
         tableHTML += "<tr>" +
            "<td>" + (item.urgency === "Y" ? "<span style='margin-right: 7px;' class='badge badge-danger'>긴급</span>" : "") +
            "<a href='./draftDetail.do?docno=" + item.docno + "'>" + item.title;

         if (item.file_count > 0) {
            tableHTML += "&nbsp;&nbsp;[<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-paperclip'><path d='M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48'></path></svg>" + item.file_count + "]</a></td>";
         } else {
            tableHTML += "</a></td>";
         }

         tableHTML += "<td>" + item.empVo.name + "</td>" +
            "<td>" + formatDate(item.draft_date) + "</td>" +
            "<td>" + item.tempcode + "</td>" +
            "<td>" + item.doc_status + "</td>" +
            "</tr>";
      });
      
      tableBody.innerHTML = tableHTML;
   }
}

// 전체 기안문서함 조회
function allDraftList(val) {
   var id = val
   console.log(val)

   fetch('./allDraftList.do', {
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
         id: id
      }),
   })
      .then(response => response.json())
      .then(result => {
         console.log("result:", result);
         if (result != null) {
            lists2(result)
         } else {
            alert('실패..')
         }
      });

   function lists2(result) {
      var tableBody = document.getElementById('tableBody');
      var tableHTML = "";

      tableBody.innerHTML = "";

      result.forEach(function(item) {
         tableHTML += "<tr>" +
            "<td>" + (item.urgency === "Y" ? "<span style='margin-right: 7px;' class='badge badge-danger'>긴급</span>" : "") +
            "<a href='./draftDetail.do?docno=" + item.docno + "'>" + item.title;

         if (item.file_count > 0) {
            tableHTML += "&nbsp;&nbsp;[<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-paperclip'><path d='M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48'></path></svg>" + item.file_count + "]</a></td>";
         } else {
            tableHTML += "</a></td>";
         }



         tableHTML += "<td>" + item.empVo.name + "</td>" +
            "<td>" + formatDate(item.draft_date) + "</td>" +
            "<td>" + item.tempcode + "</td>" +
            "<td>" + item.doc_status + "</td>" +
            "</tr>";
      });
      tableBody.innerHTML = tableHTML;
   }
}




// 결재문서함 전체조회
function allApprovalList(val) {
   var id = val
   console.log(val)

   fetch('./allApprList.do', {
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
         id: id
      }),
   })
      .then(response => response.json())
      .then(result => {
         console.log("result:", result);
         if (result != null) {
            lists3(result)
         } else {
            alert('실패..')
         }
      });

   function lists3(result) {
      var tableBody = document.getElementById('tableBody');
      var tableHTML = '';

      tableBody.innerHTML = '';

      result.forEach(function(item) {
        tableHTML += "<tr>" +
            "<td>" + (item.urgency === "Y" ? "<span style='margin-right: 7px;' class='badge badge-danger'>긴급</span>" : "") +
            "<a href='./draftDetail.do?docno=" + item.docno + "'>" + item.title;

         if (item.file_count > 0) {
            tableHTML += "&nbsp;&nbsp;[<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-paperclip'><path d='M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48'></path></svg>" + item.file_count + "]</a></td>";
         } else {
            tableHTML += "</a></td>";
         }
         tableHTML += "<td>" + item.empVo.name + "</td>" +
            "<td>" + formatDate(item.draft_date) + "</td>" +
            "<td>" + (item.appr_date != null ? formatDate(item.appr_date) : '-') + "</td>" +
            "<td>" + item.tempcode + "</td>" +
            "<td>" + item.doc_status + "</td>" +
            "</tr>";
      });

      tableBody.innerHTML = tableHTML;
   }
}



// 결재문서함 기안서상태별 전체조회
function approvalListByDocStatus(val) {
   var doc_status = val
   console.log("val", val)
   var id = document.getElementById('id').value;
   console.log("id", id)

   fetch('./apprListByDocStatus.do', {
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
         id: id,
         doc_status: doc_status
      }),
   })
      .then(response => response.json())
      .then(result => {
         console.log("result:", result);
         if (result != null) {
            lists4(result)
         } else {
            alert('실패..')
         }
      });
   function lists4(result) {
      var tableBody = document.getElementById('tableBody');
      var tableHTML = '';

      tableBody.innerHTML = '';

      result.forEach(function(item) {
         tableHTML += "<tr>" +
            "<td>" + (item.urgency === "Y" ? "<span style='margin-right: 7px;' class='badge badge-danger'>긴급</span>" : "") +
            "<a href='./draftDetail.do?docno=" + item.docno + "'>" + item.title;

         if (item.file_count > 0) {
            tableHTML += "&nbsp;&nbsp;[<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-paperclip'><path d='M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48'></path></svg>" + item.file_count + "]</a></td>";
         } else {
            tableHTML += "</a></td>";
         }
         tableHTML += "<td>" + item.empVo.name + "</td>" +
            "<td>" + formatDate(item.draft_date) + "</td>" +
            "<td>" + (item.appr_date != null ? formatDate(item.appr_date) : '-') + "</td>" +
            "<td>" + item.tempcode + "</td>" +
            "<td>" + item.doc_status + "</td>" +
            "</tr>";
      });
      tableBody.innerHTML = tableHTML;
   }
}


// 전체 참조문서함 조회
function allRefList(val) {
   var id = val
   console.log(val)

   fetch('./allReferenceList.do', {
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
         id: id
      }),
   })
      .then(response => response.json())
      .then(result => {
         console.log("result:", result);
         if (result != null) {
            lists5(result)
         } else {
            alert('실패..')
         }
      });

   function lists5(result) {
      var tableBody = document.getElementById('tableBody');
      var tableHTML = '';

      tableBody.innerHTML = '';

      result.forEach(function(item) {
         tableHTML += "<tr>" +
            "<td>" + (item.urgency === "Y" ? "<span style='margin-right: 7px;' class='badge badge-danger'>긴급</span>" : "") +
            "<a href='./draftDetail.do?docno=" + item.docno + "'>" + item.title;

         if (item.file_count > 0) {
            tableHTML += "&nbsp;&nbsp;[<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-paperclip'><path d='M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48'></path></svg>" + item.file_count + "]</a></td>";
         } else {
            tableHTML += "</a></td>";
         }
         tableHTML += "<td>" + item.empVo.name + "</td>" +
            "<td>" + formatDate(item.draft_date) + "</td>" +
            "<td>" + (item.appr_date != null ? formatDate(item.appr_date) : '-') + "</td>" +
            "<td>" + item.tempcode + "</td>" +
            "<td>" + item.doc_status + "</td>" +
            "</tr>";
      });
      tableBody.innerHTML = tableHTML;
   }
}



// 참조문서함 기안서상태별 전체조회
function refListByDocStatus(val) {
   var doc_status = val
   console.log("val", val)
   var id = document.getElementById('id').value;
   console.log("id", id)

   fetch('./refListByDocStatus.do', {
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
         id: id,
         doc_status: doc_status
      }),
   })
      .then(response => response.json())
      .then(result => {
         console.log("result:", result);
         if (result != null) {
            lists6(result)
         } else {
            alert('실패..')
         }
      });
   function lists6(result) {
      var tableBody = document.getElementById('tableBody');
      var tableHTML = '';

      tableBody.innerHTML = '';

      result.forEach(function(item) {
        tableHTML += "<tr>" +
            "<td>" + (item.urgency === "Y" ? "<span style='margin-right: 7px;' class='badge badge-danger'>긴급</span>" : "") +
            "<a href='./draftDetail.do?docno=" + item.docno + "'>" + item.title;

         if (item.file_count > 0) {
            tableHTML += "&nbsp;&nbsp;[<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-paperclip'><path d='M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48'></path></svg>" + item.file_count + "]</a></td>";
         } else {
            tableHTML += "</a></td>";
         }
         tableHTML += "<td>" + item.empVo.name + "</td>" +
            "<td>" + formatDate(item.draft_date) + "</td>" +
            "<td>" + (item.appr_date != null ? formatDate(item.appr_date) : '-') + "</td>" +
            "<td>" + item.tempcode + "</td>" +
            "<td>" + item.doc_status + "</td>" +
            "</tr>";
      });
      tableBody.innerHTML = tableHTML;
   }
}






// 클릭한 li css 바꾸기
function setActive(clicked) {
   var lis = document.querySelectorAll("li.nav-link");
   lis.forEach(function(li) {
      li.classList.remove("active");
   });
   clicked.classList.add("active");
}



function formatDate(date) {
   var date = new Date(date);

   var day = date.getDate().toString().padStart(2, '0');
   var month = (date.getMonth() + 1).toString().padStart(2, '0');
   var year = date.getFullYear();

   return year + '.' + month + '.' + day;
}