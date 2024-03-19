// 기안서 상태별 전체조회
function draftListByDocStatus(docStatus) {
    $.ajax({
        url: '/draftListByDocStatus',
        method: 'GET',
        data: {
            doc_status: docStatus
        },
        success: function(response) {
            console.log(response);
            // 서버로부터 받은 응답을 처리합니다.
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
}
