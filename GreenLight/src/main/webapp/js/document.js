// 카테고리별 기안문서함 조회
		function draftListByDocStatus(val){
			var doc_status = val
			console.log("val",val)
			var id = document.getElementById('id').value;
			console.log("id",id)
			
			fetch('./draftListByDocStatus.do', {
				method:'POST',
				headers:{"Content-Type":"application/json"},
				body: JSON.stringify({
					id:id, 
					doc_status:doc_status
				}),
			})
			.then(response => response.json())
			.then(result => {
				console.log("result:",result);
				if(result != null){
					lists(result)
				}else{
					alert('실패..')
				}
			});
			function lists(result){
				var tableBody = document.getElementById('tableBody');
				var tableHTML = '';
				
				tableBody.innerHTML = '';
				
				result.forEach(function(item){
					tableHTML += '<tr>';
			        tableHTML += '<td class="chkbox-td"><input class="form-check-input" type="checkbox"></td>';
			        tableHTML += '<td>' + item.docno + '</td>';
			        tableHTML += '<td><a href="#">' + item.title + '</a></td>';
			        tableHTML += '<td>' + (item.urgency === 'Y' ? '긴급' : '-') + '</td>';
			        tableHTML += '<td>' + item.empVo.name + '</td>';
			        tableHTML += '<td>' + formatDate(item.draft_date) + '</td>';
			        tableHTML += '<td>' + item.tempno + '</td>';
			        tableHTML += '<td>' + item.file_count + '</td>';
			        tableHTML += '<td>' + item.doc_status + '</td>';
			        tableHTML += '</tr>';
				});
				
				tableBody.innerHTML = tableHTML;
			}
		}
		
		// 전체 기안문서함 조회
		function allDraftList(val){
			var id = val
			console.log(val)
			
			fetch('./allDraftList.do', {
				method:'POST',
				headers:{"Content-Type":"application/json"},
				body: JSON.stringify({
					id:id
				}),
			})
			.then(response => response.json())
			.then(result => {
				console.log("result:",result);
				if(result != null){
					lists(result)
				}else{
					alert('실패..')
				}
			});
			
			function lists(result){
				var tableBody = document.getElementById('tableBody');
				var tableHTML = '';
				
				tableBody.innerHTML = '';
				
				result.forEach(function(item){
					tableHTML += '<tr>';
			        tableHTML += '<td class="chkbox-td"><input class="form-check-input" type="checkbox"></td>';
			        tableHTML += '<td>' + item.docno + '</td>';
			        tableHTML += '<td><a href="#">' + item.title + '</a></td>';
			        tableHTML += '<td>' + (item.urgency === 'Y' ? '긴급' : '-') + '</td>';
			        tableHTML += '<td>' + item.empVo.name + '</td>';
			        tableHTML += '<td>' + formatDate(item.draft_date) + '</td>';
			        tableHTML += '<td>' + item.tempno + '</td>';
			        tableHTML += '<td>' + item.file_count + '</td>';
			        tableHTML += '<td>' + item.doc_status + '</td>';
			        tableHTML += '</tr>';
				});
				tableBody.innerHTML = tableHTML;
			}
		}
		
		
		
		
// 결재문서함 전체조회
function allApprovalList(val){
	var id = val
	console.log(val)
	
	fetch('./allApprList.do', {
		method:'POST',
		headers:{"Content-Type":"application/json"},
		body: JSON.stringify({
			id:id
		}),
	})
	.then(response => response.json())
	.then(result => {
		console.log("result:",result);
		if(result != null){
			lists(result)
		}else{
			alert('실패..')
		}
	});
	
	function lists(result){
		var tableBody = document.getElementById('tableBody');
		var tableHTML = '';
		
		tableBody.innerHTML = '';
		
		result.forEach(function(item){
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
function approvalListByDocStatus(val){
	var doc_status = val
	console.log("val",val)
	var id = document.getElementById('id').value;
	console.log("id",id)
	
	fetch('./apprListByDocStatus.do', {
		method:'POST',
		headers:{"Content-Type":"application/json"},
		body: JSON.stringify({
			id:id, 
			doc_status:doc_status
		}),
	})
	.then(response => response.json())
	.then(result => {
		console.log("result:",result);
		if(result != null){
			lists(result)
		}else{
			alert('실패..')
		}
	});
	function lists(result){
		var tableBody = document.getElementById('tableBody');
		var tableHTML = '';
		
		tableBody.innerHTML = '';
		
		result.forEach(function(item){
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
		function allRefList(val){
			var id = val
			console.log(val)
			
			fetch('./allReferenceList.do', {
				method:'POST',
				headers:{"Content-Type":"application/json"},
				body: JSON.stringify({
					id:id
				}),
			})
			.then(response => response.json())
			.then(result => {
				console.log("result:",result);
				if(result != null){
					lists(result)
				}else{
					alert('실패..')
				}
			});
			
			function lists(result){
				var tableBody = document.getElementById('tableBody');
				var tableHTML = '';
				
				tableBody.innerHTML = '';
				
				result.forEach(function(item){
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
function refListByDocStatus(val){
	var doc_status = val
	console.log("val",val)
	var id = document.getElementById('id').value;
	console.log("id",id)
	
	fetch('./refListByDocStatus.do', {
		method:'POST',
		headers:{"Content-Type":"application/json"},
		body: JSON.stringify({
			id:id, 
			doc_status:doc_status
		}),
	})
	.then(response => response.json())
	.then(result => {
		console.log("result:",result);
		if(result != null){
			lists(result)
		}else{
			alert('실패..')
		}
	});
	function lists(result){
		var tableBody = document.getElementById('tableBody');
		var tableHTML = '';
		
		tableBody.innerHTML = '';
		
		result.forEach(function(item){
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
		function setActive(clicked){
			var lis = document.querySelectorAll("li.nav-link");
			lis.forEach(function(li){
				li.classList.remove("active");
			});
			clicked.classList.add("active");
		}
		
		
		
function formatDate(date){
	var date = new Date(date);
	
	var day = date.getDate().toString().padStart(2, '0');
	var month = (date.getMonth() + 1).toString().padStart(2,'0');
	var year = date.getFullYear();
	
	return year + '.' + month + '.' + day; 
}