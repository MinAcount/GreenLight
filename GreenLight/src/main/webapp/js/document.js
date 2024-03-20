// 기안문서함 전체조회

function allDraftList() {
	var item = document.querySelectorAll('.item');
	var itemList = [];
       
	item.forEach(function(item){
		var docno = item.querySelector('.docno').textContent;
		var title = item.querySelector('.title').textContent;
		var urgency = item.querySelector('.urgency').textContent;
		var name = item.querySelector('.name').textContent;
		var tempno = item.querySelector('.tempno').textContent;
		var file_count = item.querySelector('.file_count').textContent;
		var doc_status = item.querySelector('.doc_status').textContent;
		
		var items = {
			docno: docno,
			title: title,
			urgency: urgency,
			name: name,
			tempno: tempno,
			file_count: file_count,
			doc_status: doc_status
		};
		itemList.push(items);
	});
	
	console.log(itemList)
}







// 기안서 상태별 전체조회
//function draftListByDocStatus(docStatus) {
//    $.ajax({
//        url: '/draftListByDocStatus',
//        method: 'GET',
//        data: {
//            doc_status: docStatus
//        },
//        success: function(response) {
//            console.log(response);
//            // 서버로부터 받은 응답을 처리합니다.
//        },
//        error: function(xhr, status, error) {
//            console.error(error);
//        }
//    });
//}
