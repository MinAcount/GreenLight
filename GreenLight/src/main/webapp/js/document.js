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
			tableHTML += '<tr>';
			tableHTML += '<td class="chkbox-td"><input class="form-check-input" type="checkbox"></td>';
			tableHTML += '<td>' + item.docno + '</td>';
			tableHTML += '<td><a href="#">' + item.title + '</a></td>';
			tableHTML += '<td>' + (item.urgency === 'Y' ? '긴급' : '-') + '</td>';
			tableHTML += '<td>' + item.empVo.name + '</td>';
			tableHTML += '<td>' + formatDate(item.draft_date) + '</td>';
			tableHTML += '<td>' + (item.appr_date != null ? formatDate(item.appr_date) : '-') + '</td>';
			tableHTML += '<td>' + item.tempno + '</td>';
			tableHTML += '<td>' + item.file_count + '</td>';
			tableHTML += '<td>' + item.doc_status + '</td>';
			tableHTML += '</tr>';
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
			tableHTML += '<tr>';
			tableHTML += '<td class="chkbox-td"><input class="form-check-input" type="checkbox"></td>';
			tableHTML += '<td>' + item.docno + '</td>';
			tableHTML += '<td><a href="#">' + item.title + '</a></td>';
			tableHTML += '<td>' + (item.urgency === 'Y' ? '긴급' : '-') + '</td>';
			tableHTML += '<td>' + item.empVo.name + '</td>';
			tableHTML += '<td>' + formatDate(item.draft_date) + '</td>';
			tableHTML += '<td>' + (item.appr_date != null ? formatDate(item.appr_date) : '-') + '</td>';
			tableHTML += '<td>' + item.tempno + '</td>';
			tableHTML += '<td>' + item.file_count + '</td>';
			tableHTML += '<td>' + item.doc_status + '</td>';
			tableHTML += '</tr>';
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
			tableHTML += '<tr>';
			tableHTML += '<td class="chkbox-td"><input class="form-check-input" type="checkbox"></td>';
			tableHTML += '<td>' + item.docno + '</td>';
			tableHTML += '<td><a>' + item.title + '</a></td>';
			tableHTML += '<td>' + (item.urgency === 'Y' ? '긴급' : '-') + '</td>';
			tableHTML += '<td>' + item.empVo.name + '</td>';
			tableHTML += '<td>' + new Date(item.draft_date).toLocaleDateString() + '</td>'; // draft_date 형식 변경
			tableHTML += '<td>' + (item.appr_date ? new Date(item.appr_date).toLocaleDateString() : '-') + '</td>'; // appr_date 형식 변경 또는 '-'
			tableHTML += '<td>' + item.tempno + '</td>';
			tableHTML += '<td>' + item.file_count + '</td>';
			tableHTML += '<td>' + item.doc_status + '</td>';
			tableHTML += '</tr>';
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
			tableHTML += '<tr>';
			tableHTML += '<td class="chkbox-td"><input class="form-check-input" type="checkbox"></td>';
			tableHTML += '<td>' + item.docno + '</td>';
			tableHTML += '<td><a>' + item.title + '</a></td>';
			tableHTML += '<td>' + (item.urgency === 'Y' ? '긴급' : '-') + '</td>';
			tableHTML += '<td>' + item.empVo.name + '</td>';
			tableHTML += '<td>' + new Date(item.draft_date).toLocaleDateString() + '</td>'; // draft_date 형식 변경
			tableHTML += '<td>' + (item.appr_date ? new Date(item.appr_date).toLocaleDateString() : '-') + '</td>'; // appr_date 형식 변경 또는 '-'
			tableHTML += '<td>' + item.tempno + '</td>';
			tableHTML += '<td>' + item.file_count + '</td>';
			tableHTML += '<td>' + item.doc_status + '</td>';
			tableHTML += '</tr>';
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