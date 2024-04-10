function pageFirst(){
	console.log("처음페이지로 이동");
	spa_ajax(1);
}
function pagePrev(stagePage,countPage){
	console.log(stagePage,countPage);
	var page = (stagePage-countPage)<0?1:(stagePage-countPage);
	spa_ajax(page);
}
function page(page){
	console.log(page);
	spa_ajax(page);
}
function pageNext(stagePage,countPage){
	console.log(stagePage,countPage);
	var page =(stagePage+countPage);
	spa_ajax(page);
}
function pageLast(totalPage){
	console.log(totalPage);
	spa_ajax(totalPage);
}

var spa_ajax = function(...args){ //spread
	var choice_page = args[0];
	
	console.log("cp"+choice_page);
	
	$.ajax({
		url: "./page.do",
		type: "post",
		data: {"page":choice_page},
		dataType:"json",
		success:function(data){
			console.log(typeof data);
			console.log(data);
			$.each(data, function(key, value){
				console.log(data);
				console.log(key);
				var n = $("table tr:eq(0) th").length; //admin인지 유저인지
				var varHTML ="";
				if(key == 'lists'){
					varHTML += "<thead>"
					varHTML += "<tr class='info'>"
					if(n == 6){
					varHTML += "<th>"
					varHTML += "<input type='checkbox' class='allCheck' id='allCheck' onclick='checkAll(this.checked)'>"
					varHTML += "</th>"
					}                                                                                    
					varHTML += "<th>글번호</th>"
					varHTML += "<th>작성자</th>"
					varHTML += "<th>제목</th>"
					if(n == 6){
					varHTML += "<th>삭제여부</th>"
					}
					varHTML += "<th>작성일</th>"
					varHTML += "</tr>"
					varHTML += "</thead>"
					
					varHTML += "<tbody>"
					
					$.each(value, function(key,v){
					varHTML+="<tr>"
					if(n == 6){
					varHTML+="<td>";
					varHTML+="<input type='checkbox' name='delCheck' value='"+v.seq+"'>";
					varHTML+="</td>";
					}
					varHTML+="<td>";
					varHTML+=v.seq;
					varHTML+="</td>";
					varHTML+="<td>"+v.id+"</td>";
					varHTML+="<td>";
					varHTML+="<div class='panel-heading'>";
					varHTML+="<a class='panel-title' data-toggle='collapse' data-parent='#accordion' href='#collapse"+v.seq+"'>";
					let title = v.title;
					if(title.indexOf("img") != -1){
						title = title.replace("<img>","<img src='./images/reply.png'/>")
					}
					varHTML+= title
					varHTML+="			</a>                                                                                                   ";
					varHTML+="		</div>                                                                                                     ";
					varHTML+="	</td>                                                                                                          ";
					if(n==6){
					varHTML+="		<td>"+v.delflag+"</td>                                                                                     ";
					}
					varHTML+="	<td>                                                                                                           ";
					let date = new Date(v.regdate);
//					let datePrint = date.toLocaleString();
					let datePrint = `${date.getFullYear()}년 ${date.getMonth()+1}월 ${date.getDate()}일`;
					varHTML+=datePrint
					varHTML+="	</td>                                                                                                          ";
					varHTML+="</tr>                                                                                                            ";
					varHTML+="<tr>                                                                                                             ";
					varHTML+="<td colspan='"+n+"'>                                                                  ";
					varHTML+="<div id='collapse"+v.seq+"' class='panel-collapse collapse'>                                               ";
					varHTML+="<div class='form-group'>                                                                               ";
					varHTML+="<label>내용</label>                                                                                ";
					var content = v.content;
					if(content == null){
						content ="";
					}
					varHTML+="<textarea class='form-control' rows='4' readonly='readonly'>"+content+"</textarea>               ";
					varHTML+="<div>                                                                                              ";
					if(data.memId == v.id){
					varHTML+="<input type='button' class='btn btn-primary' value='수정' onclick='modify("+v.seq+")'>";
					}
					if(data.memId == v.id || n==6){
					varHTML+="<input type='button' class='btn btn-danger' value='삭제' onclick='del("+v.seq+")'>";
					}
					if(n != 6){
					varHTML+="<input type='button' class='btn btn-info' value='답글' onclick='reply("+v.seq+")'>";
					}
					varHTML+="</div>";
					varHTML+="</div>";
					varHTML+="</div>";
					varHTML+="</td>";
					varHTML+="</tr>";
					});                                                                                                                         
					varHTML += "</tbody>"
					varHTML += "<tfoot>"
					varHTML += "</tfoot>"
				}else{                                                                                                                   
					varHTML += "<tr>";
					varHTML += "	<td colspan='"+n+"'>                                                                                                          ";
					varHTML += "		<ul class='pagination pagination-lg'>                                                                                                              ";
					if(value.stagePage>1){
						varHTML += "				<li><a href='#' onclick='pageFirst()'><span class='glyphicon glyphicon-fast-backward'></span></a></li>                                     ";
						if((value.stagePage -value.countPage) >= 0){
						varHTML += "				<li><a href='#' onclick='pagePrev("+value.stagePage+","+value.countPage+")'><span class='glyphicon glyphicon-step-backward'></span></a></li>   ";
						}
					}
					for(let i=value.stagePage; i<=value.endPage; i++ ){
						let active = (value.page == i) ? "class='active'" : "";
						varHTML += "<li "+active+"><a href='javascript:page("+i+")'>"+i+"</a></li>";
					}
					if(value.page < value.totalPage){
						if((value.stagePage + value.countPage-1) < value.totalPage){
							varHTML += "<li><a href='#' onclick='pageNext("+value.stagePage+","+value.countPage+")'><span class='glyphicon glyphicon-step-forward'></span></a></li>";
						}
						varHTML += "<li><a href='#' onclick='pageLast("+value.totalPage+")'><span class='glyphicon glyphicon-fast-forward'></span></a></li>                     ";
					}
				}
				varHTML += "</ul>                                                                                                                                             ";
				varHTML += "</td>                                                                                                                                                 ";
				varHTML += "</tr>                                                                                                                                                     ";
				
				if(key == "lists"){
					$(".table").html(varHTML);
				}else{
					$("tfoot").append(varHTML);
					$("tfoot").css("text-align","center");
				}
			});
		},
		error:function(e){
			console.log("잘못된 요청: "+e);
		}
	});
}