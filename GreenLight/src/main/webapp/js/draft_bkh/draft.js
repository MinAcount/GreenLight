function insertDocument(){
   console.log("insertDocument()");
   
   /*document table*/
   var writer_id = document.getElementById("writer_id").value;
   var templateArea = document.getElementById("templateArea");
   var content = templateArea.innerHTML;
   var title = document.getElementById("title").value;
   var draft_date = document.getElementById("draft_date").value;
   var urgencyChecked = document.getElementById("urgency");
   var urgency = urgencyChecked.checked?'Y':'N';
   var tempcode = document.getElementById("tempCode").value;
   console.log("writer_id:",writer_id);
   console.log("content:",content);
   console.log("title:",title);
   console.log("draft_date:",draft_date);
   console.log("urgency:",urgency);
   console.log("tempcode:",tempcode);

   /*vacation table*/
   /*var writer_id = document.getElementById("writer_id").value;*/
   var start_day = document.getElementById("start_day").value;
   var end_day = document.getElementById("end_day").value;
   var getsu = document.getElementById("getsu").value;
   
   console.log("start_day:",start_day);
   console.log("end_day:",end_day);
   console.log("getsu:",getsu);

   /*Approval table*/
   var emp_id = [];
   var orderno = [];
   var apprLine = [];
   var apr_chk_div = document.getElementById("apr_chk");
   var chkAppr_div = document.getElementById("chkAppr");
   console.log("apr_chk_div",apr_chk_div)
   var idInputs = apr_chk_div.querySelectorAll("[name='id']");
   var apprOrderInputs = chkAppr_div.querySelectorAll("[name=apr_no]");
   console.log("idInputs",idInputs)
   Array.from(idInputs).forEach(function(idInput){
      emp_id.push(idInput.value)
   })
//   console.log(emp_id);
   Array.from(apprOrderInputs).forEach(function(apprOrderInput){
      console.log("------",apprOrderInput.value)
      orderno.push(apprOrderInput.value)
   })
//   console.log("orderno",orderno)
   
   
   for(let i = 0; i < emp_id.length; i++){
   let apprVo =({
      writer_id:writer_id,
      emp_id:emp_id[i],
      orderno:orderno[i],
      atype:"01"
   })
   apprLine.push(apprVo);
}
   console.log(apprLine);
   console.log(typeof apprLine);
   
   /*filestorage table */
   var fileInput = document.getElementById("fileInput");
   var files = fileInput.files;
   
   var formData = new FormData();
   formData.append("writer_id",writer_id);
   formData.append("content",content);
   formData.append("title",title);
   formData.append("draft_date",draft_date);
   formData.append("urgency",urgency);
   formData.append("tempcode",tempcode);
   formData.append("start_day",start_day);
   formData.append("end_day",end_day);
   formData.append("getsu",getsu);
   formData.append("apprLine",JSON.stringify(apprLine));
      
   for(let i = 0; i < files.length; i++){
      formData.append('files', files[i]);
      console.log("file:",files[i]);
   }
   
   /*fetch post*/
   fetch("./insertDocument.do", {
       method: 'POST',
       body:formData
//       headers:{'Content-Type': 'application/json'},
//       body: JSON.stringify({
//         writer_id:writer_id,
//         content:content,
//         title:title,
//         draft_date:draft_date,
//         urgency:urgency,
//         tempcode:tempcode,
//         start_day:start_day,
//         end_day:end_day,
//         getsu:getsu
//      })

   })
   .then(response => {
       if (!response.ok) {
           throw new Error('네트워크 에러..');
       }
       return response.json();
   })
   .then(data => {
       console.log('data:', data);
   })
   .catch(error => {
       console.error('오류 발생:', error);
   });
  
   
   var emp_id = [];
   var orderno = [];
   var apr_chk_div = document.getElementById("apr_chk");
   var chkAppr_div = document.getElementById("chkAppr");
//   console.log("apr_chk_div",apr_chk_div)
   var idInputs = apr_chk_div.querySelectorAll("[name='id']");
   var apprOrderInputs = chkAppr_div.querySelectorAll("[name=apr_no]");
//   console.log("idInputs",idInputs)
   Array.from(idInputs).forEach(function(idInput){
      emp_id.push(idInput.value)
   })
//   console.log(emp_id);
   Array.from(apprOrderInputs).forEach(function(apprOrderInput){
      console.log("------",apprOrderInput.value)
      orderno.push(apprOrderInput.value)
   })
   console.log("orderno",orderno)
   
      /*fetch post*/
   fetch("./insertApproval.do", {
       method: 'POST',
       headers:{'Content-Type': 'application/json'},
       body: JSON.stringify({
         writer_id:writer_id,
         emp_id:emp_id,
         orderno:orderno,
         docno:'202400035'
      })
       
   })
   .then(response => {
       if (!response.ok) {
           throw new Error('네트워크 에러..');
       }
       return response.json();
   })
   .then(data => {
       console.log('data:', data);
   })
   .catch(error => {
       console.error('오류 발생:', error);
   });
}



function radioActiveS(chk){
   console.log("radioActive()")
   console.log(chk);
   
//      console.log("input[name='start_day']");
      $("input[name='시작일']").prop("disabled", !chk);
}

function radioActiveE(chk){
   console.log("radioActive()")
   console.log(chk);
   
//      console.log("input[name='start_day']");
      $("input[name='종료일']").prop("disabled", !chk);
}