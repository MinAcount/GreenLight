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

function selectComplete(){
   console.log("selectComplete()");
   var selectedNodes = $("#JTSelectTemplate").jstree("get_selected",true);
   if(selectedNodes.length>0){
      var tempno = selectedNodes[0].original.tempno;
      console.log(tempno);
      
      fetch("./selectMainTemplate.do?tempno="+tempno)
      .then(response=>response.json())
      .then(data=>{
         console.log(data);
         var templateArea = document.querySelector("#templateArea");
         templateArea.innerHTML = data.content;
      })
      .catch(error=>{
         console.log("Error..",error)
      })
   }
}