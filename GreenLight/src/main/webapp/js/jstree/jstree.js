$(function() {
    var selectTemplateModal = document.querySelector("#selectTemplateModal");

    selectTemplateModal.addEventListener("click", function() {
        console.log("selectTemplateModal()");
        
        $("#JTSelectTemplate").jstree({
         plugins:['types','search'],
         core:{
            check_callback:true,
            data:{
               url:'./JTSelectTemplate.do',
               method:'get',
               dataType:'json',
               success:function(data){
                  console.log(data);
                  data.forEach(function(node){
                     node.text
                  });
               },
               error:function(){
                  alert("Error..")
               }
            }
         },
         
      });
      
      $("#JTSelectTemplate").on("ready.jstree",function(){
         $(this).jstree('open_all');
      });
    });
    
    var searchTimer2;
    
    	$('#search').on('keyup', function() {
		// 이전에 설정된 타이머가 있다면 클리어
		clearTimeout(searchTimer2);

		// 300 밀리초 후에 검색 수행
		searchTimer2 = setTimeout(function() {
			var v = $('#search').val().trim();
			$('#JTSelectTemplate').jstree(true).search(v);
		}, 300);
	});
});

//			document.getElementById("dname").value = data.emp_id;
function selectComplete(){
	console.log("selectComplete()");
	var selectedNodes = $("#JTSelectTemplate").jstree("get_selected",true);
	if(selectedNodes.length>0){
		var tempno = selectedNodes[0].original.tempno;
		console.log(tempno);
		
		fetch("./selectMainTemplate.do?tempno="+tempno)
		.then(response=>response.json())
		.then(data=>{
//			console.log(data.content);
			var templateArea = document.getElementById("templateArea");
			templateArea.innerHTML=data.content;
			
			// input hidden 태그에 뿌려줄 값 조회
			var loginVo_name = document.getElementById("loginVo_name").value;
			var deptVo_dname = document.getElementById("deptVo_dname").value;
			var loginVo_id = document.getElementById("loginVo_id").value;
			console.log("loginVo_name:",loginVo_name);
			console.log("deptVo_dname:",deptVo_dname);
			console.log("loginVo_id:",loginVo_id);
			
			// 값이 뿌려질 input hidden 태그 탐색
			var name = document.getElementById("name");
			var dname = document.getElementById("dname");
			var writer_id = document.getElementById("writer_id");
			console.log("name:",name);
			console.log("dname:",dname);
			console.log("writer_id:",writer_id);
			
			name.value = loginVo_name;
			dname.value = deptVo_dname;
			writer_id.value = loginVo_id;
			
			// 기안 뿌리기
			var today = new Date();

			// 연도, 월, 일을 문자열로 변환하여 조합
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = year + '-' + month + '-' + day;
			console.log(dateString)
	
			// input 요소의 value에 할당
			document.querySelector("#draft_date").value = dateString;
			
			// 공가 선택시 신청연차 초기화
			document.querySelector("#getsuFlag").addEventListener("change",function(){
				console.log("getsuFlag()");
				console.log("this.value:",this.value);
				if(this.value == 'Y'){//공가
					document.getElementById("getsu").value = "";
				}
			});
			
			// dadtarangepicker를 위한 api를 적용
			$('#daterangepicker').daterangepicker({
				"locale": {
					"format": "YYYY-MM-DD",
					"separator": " ~ ",
					"applyLabel": "확인",
					"cancelLabel": "취소",
					"fromLabel": "From",
					"toLabel": "To",
					"customRangeLabel": "Custom",
					"weekLabel": "W",
					"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
					"monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				},
				"startDate": new Date(),
				"endDate": new Date(),
				"drops": "down"
			}, function(start, end, label) {
				$('#start_day').val(start.format('YYYY-MM-DD'));
				$('#end_day').val(end.format('YYYY-MM-DD'));
				console.log("============================================================== typeof start:",typeof start);
				console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
				
				var start_date = new Date(start);
				var end_date = new Date(end);
				
				var getsu_date = end_date.getTime() - start_date.getTime();
				var getsu = Math.floor(getsu_date/(1000*60*60*24));
				console.log("getsu:",getsu);
				document.getElementById("getsu").value = getsu;
			});
			
			var tempcode = document.getElementById("tempcode");
			tempcode.value=data.tempcode;
		})
		.catch(error=>{
			console.log("Error..",error)
		})
	}

}