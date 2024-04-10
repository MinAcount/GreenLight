<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="./se2/js/service/HuskyEZCreator.js"
   charset="utf-8"></script>
<script type="text/javascript" src="./js/draft_bkh/draft.js"></script>

</head>
<body class="nav-fixed">
   <%@ include file='./include/mainHeader.jsp'%>
   <!-- 사이드나브바 & 콘텐트 영역 -->

   <i data-feather='check-circle' id='toastFeather'></i>
   <div id="layoutSidenav">
      <%@ include file='./include/mainSidenav.jsp'%>

      <!-- 콘텐츠 영역 -->
      <div id="layoutSidenav_content">
         <div id="main_content">
            <h1 style="margin-bottom: 70px; text-align: center;">기안서 작성</h1>
            <hr class="mt-0 mb-5">

            <div
               style="display: flex; flex-direction: row; justify-content: space-between;">
               <!-- 문서양식선택 모달 -->
               <div class="modal fade" id="templateModal" tabindex="-1"
                  aria-labelledby="exampleModalLabel" aria-hidden="true"
                  data-bs-backdrop="static">
                  <div class="modal-dialog jstreeModal">
                     <div class="modal-content" style="width: 800px; height: 630px;">
                        <div class="modal-header">
                           <h5 class="modal-title" id="exampleModalLabel">문서양식 선택</h5>
                           <button type="button" class="btn-close" data-bs-dismiss="modal"
                              aria-label="Close"></button>
<!--                            <input type="hidden" id="tempcode" name="tempcode" value=""> -->

                        </div>
                        <div class="modal-body"
                           style="display: flex; flex-direction: column; justify-content: space-between;">
                           <div class="toast-body"
                              style="display: flex; flex-direction: row; justify-content: space-around;">
                              <!-- 문서양식목록(js tree) -->
                              <div
                                 style="width: 395px; min-height: 450px; border-right: 1px solid black;">
                                 <div id="search_box">
                                    <input id="search" type="text">
                                 </div>
                                 <div id="JTSelectTemplate"
                                    style="max-height: 450px; overflow-y: scroll;"></div>

                              </div>
                              <!-- 선택된 문서양식 미리보기 -->
                              <div id="template_preview" style="width: 395px; min-height: 450px;">
                                 
                              </div>
                           </div>
                           <div class="modal-footer">
                              <button class="btn btn-secondary" type="button"
                                 data-bs-dismiss="modal">취소</button>
                              <button class="btn btn-primary" type="button"
                                 style="margin-left: 10px;" data-bs-dismiss="modal"
                                 onclick="selectComplete()">완료</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div>
                  <button id="selectTemplateModal" class="btn btn-secondary "
                     type="button" data-bs-toggle="modal"
                     data-bs-target="#templateModal" style="margin-right: 5px;">문서양식
                     선택</button>

                  <!-- 결재선 설정 -->
                  <button class="btn btn-secondary " type="button"
                     data-bs-toggle="modal" data-bs-target="#approvalModal"
                     style="margin-right: 5px;">결재선 설정</button>

                  <div class="modal fade" id="approvalModal" tabindex="-1"
                     aria-labelledby="exampleModalLabel" aria-hidden="true"
                     data-bs-backdrop="static">
                     <div class="modal-dialog jstreeModal">
                        <div class="modal-content" style="width: 800px; height: 630px;">
                           <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">결재선 설정</h5>
                              <button type="button" class="btn-close"
                                 data-bs-dismiss="modal" aria-label="Close"></button>
                           </div>
                           <div class="modal-body"
                              style="display: flex; flex-direction: column; justify-content: space-between; margin-top: 15px;">
                              <div class="toast-body"
                                 style="display: flex; flex-direction: row; justify-content: space-around;">
                                 <!-- 결재자들(js tree) -->
                                 <div id="approval_sel"
                                    style="width: 300px; min-height: 450px; border: 1px solid black; padding: 10px;">
                                    <div id="search_box">
                                       <input id="search_input" type="text">
                                    </div>
                                    <div id="apprJstree"
                                       style="margin-top: 10px; border: 1px solid black; width: 100%; max-height: 390px; overflow-y: scroll;"></div>

                                 </div>
                                 <div style="width: 50px; text-align: center;">
                                    <button id="addEmp" class="btn btn-primary"
                                       style="width: 30px; height: 100px; margin-top: 180px">&gt;&gt;</button>
                                 </div>
                                 <!-- 선택된 결재자들 -->
                                 <div id="apr_chk"
                                    style="width: 300px; min-height: 450px; border: 1px solid black; padding-top: 30px;"></div>
                              </div>
                              <div class="modal-footer"
                                 style="margin-bottom: 20px; margin-top: 10px;">
                                 <input type="button" class="btn btn-danger" value="초기화"
                                    onclick="clean()">
                                 <button class="btn btn-secondary " type="button"
                                    data-bs-dismiss="modal" onclick="apprCancel()">취소</button>
                                 <button data-bs-dismiss="modal" onclick="apprDone()"
                                    class="btn btn-primary " type="button"
                                    style="margin-left: 10px;">완료</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>

                  <!-- 참조자추가 모달 -->
                  <button class="btn btn-secondary " type="button"
                     data-bs-toggle="modal" data-bs-target="#refModal">참조자 추가</button>
						<div class="modal fade" id="refModal" tabindex="-1"
							aria-labelledby="refModalLabel" aria-hidden="true"
							data-bs-backdrop="static">
							<div class="modal-dialog jstreeModal">
								<div class="modal-content" style="width: 800px; height: 630px;">
									<div class="modal-header">
										<h5 class="modal-title" id="refModalLabel">참조자 추가</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body"
										style="display: flex; flex-direction: column; justify-content: space-between; margin-top: 15px;">
										<div class="toast-body"
											style="display: flex; flex-direction: row; justify-content: space-around;">
											<!-- 참조자들(js tree) -->
											<div id="ref_sel"
												style="width: 300px; min-height: 450px; border: 1px solid black; padding: 10px;">
												<div id="search_box">
													<input id="search_input2" type="text">
												</div>
												<div id="refJstree"
													style="margin-top: 10px; border: 1px solid black; width: 100%; max-height: 390px; overflow-y: scroll;"></div>
											</div>
											<div style="width: 50px; text-align: center;">
												<button id="addRef" class="btn btn-primary"
													style="width: 30px; height: 100px; margin-top: 180px">&gt;&gt;</button>
											</div>
											<!-- 선택된 참조자들 -->
											<div id="ref_chk"
												style="width: 300px; min-height: 450px; border: 1px solid black; padding-top: 30px;"></div>
										</div>
										<div class="modal-footer"
											style="margin-bottom: 20px; margin-top: 10px;">
											<input type="button" class="btn btn-danger" value="초기화"
												onclick="cleanRef()">
											<button class="btn btn-secondary " type="button"
												data-bs-dismiss="modal" onclick="refCancel()">취소</button>
											<button data-bs-dismiss="modal" onclick="refDone()"
												class="btn btn-primary " type="button"
												style="margin-left: 10px;">완료</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<!-- 서명 유효성처리 모달 -->
						<div class="modal fade" data-bs-backdrop="static" id="staticBackdrop3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1;">
			        		<div class="modal-content">
			            		<div class="modal-header text-danger">
			                		<div class="modal-title" id="exampleModalLabel">
			                			<i data-feather="check-circle" id="toastFeather"></i>
					        			<strong class="me-auto">Primary Text Toast</strong>
			                		</div>
			                		<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
			            		</div>
			            		<div class="modal-body">This toast uses the primary text utility on the toast header.
			            			<br><br>
			            			<div class="modal-footer">
										<button class="btn btn-dsecondary" type="button" data-bs-dismiss="modal">Close</button>
									    <button style="margin-left: 10px;" class="btn btn-danger" type="button">Save changes</button>
								    </div>
			            		</div>
				        	</div>
				    	</div>
				</div>
					</div>
					<div>
						<button class="btn btn-secondary " type="button"
							style="margin-right: 5px;" onclick="saveTemp()">임시저장</button>
						<button class="btn btn-primary " type="button"
							style="width: 73.6px;" onclick="submissionValidation('01')">상신</button>
					</div>
				</div>
				
				<input type="hidden" id="loginVo_name" value="${sessionScope.loginVo.name}">
                  <input type="hidden" id="deptVo_dname" value="${deptVo.dname}">
                  <input type="hidden" id="loginVo_id" value="${sessionScope.loginVo.id}">
                  
                  <input type="hidden" id="loginVo_spot" value="${sessionScope.loginVo.spot}">
                  
                  <input type="hidden" id="vacVo_remaining_leave" value = "${vacVo.remaining_leave}">
            <div
               style="display: flex; flex-direction: row; padding-top: 20px; padding-bottom: 20px; min-height: 800px;">
               <div id="templateArea">
					<input type="hidden" id="tempcode" value="">
					<input type="hidden" id="save_sign" value="">
<div style="width: 100%; text-align: center;" id="templateAreaLeft">
                     <div class="top"
                        style="text-align: center; margin-bottom: 50px; padding-top: 30px;">
                        <h2>지출결의서</h2>
                     </div>
                     <div class="header1"
                        style="display: flex; flex-direction: row; justify-content: flex-end; margin-bottom: 20px;">
                        <div style="display: flex; flex-direction: row;">
                           <table id="WriterArea" class="template" style="height: 160px;">
                              <tr>
                                 <th rowspan="3" class="width30">신청</th>
                                 <td id="drafter_spot" class="fontSize14" style="width: 90px; height: 20px;"></td>
                              </tr>
                              <tr>
                                 <td>
                                    <div id="drafter_name" class="fontSize14"></div>
                                 </td>
                              </tr>
                              <tr>
                                 <td id="drafter_draft_date" class="fontSize14" style="height: 20px;"></td>
                              </tr>
                           </table>

                           <table id="approvalArea" class="template"
                              style="margin-left: 10px; height: 160px;">
                              <tr id="firstTr">
                                 <th id="apprTh" rowspan="3" class="width30" style="display: none;">승인</th>
                                 
                              </tr>
                              <tr id="secondTr">
                                 
                              </tr>
                              <tr id="thirdTr">
                                 
                              </tr>
                           </table>
                        </div>
                     </div>
                     <div class="header2"
                        style="display: flex; flex-direction: row; justify-content: flex-start;">
                        <div style="width: 100%;">
                           <table class="template" style="width: 69%;">
                              <tr>
                                 <th style="width: 80px;">기안자</th>
                                 <td id="draftWriter" style="width: 180px;" class="paddingL10">
                                    <p id="name"></p>
                                    <input type="hidden" id="writer_id" name="writer_id" value="">
                                 </td>
                              </tr>
                               <tr>
                                 <th>소속부서</th>
                                 <td class="paddingL10">
                                    <p id="dname"></p>
                                 </td>
                              </tr>
                              <tr>
                                 <th>기안일</th>
                                 <td class="paddingL10">
                                    <p id="draft_date"></p>
                                 </td>
                              </tr>
                              <tr>
                                 <th>문서번호</th>
                                 <td class="paddingL10">
                                 	<p id="docno"></p>
                                 </td>
                              </tr>
                           </table>
                        </div>
                     </div>


                  <div class="content" style="width: 100%; margin-top: 20px;">
                     <table class="template" style="width: 100%;">
                     
                        <tr>
                           <th style="width: 20%;">제목</th>
                           <td id="title" colspan="3" class="pdl10 pdr10"><input name="title" class="width100p height33px" type="text"></td>
                        </tr>
                        <tr>
                           <th style="width: 20%;">작성일자</th>
                           <td style="width: 30%;" class="pdl10 pdr10"><p id="write_date"></p></td>
                          <th style="width: 20%;">금액</th>
                           <td style="width: 30%;" class="pdl10 pdr10"><input class="width100p height33px" type="text"></td>
                        </tr>
                        <tr>
                           <th>지출사유</th>
                           <td colspan="3" style="width: 30%;" class="pdl10 pdr10"><input class="width100p height33px" type="text"></td>
                        </tr>
                        <tr>
                              		<th>긴급 여부</th>
									<td id="urgencyTd" class="pdl10" colspan = '3'>
									    <div style="display: inline-block;">
									        <input type="checkbox" id="urgency" name="urgency">
									    </div>
									    <div style="display: inline-block;">
									        <p style="color:red; margin-left: 5px;">긴급 여부 체크란 입니다!</p>
									    </div>
									</td>
                              </tr>
                     </table>
                  </div>
                  <div class="AddDetails"
                     style="margin-top: 30px; margin-bottom: 10px; text-align: right;">
                     <button
                        style="background-color: rgba(123, 130, 124, 0.1); border: 1px solid #B0B5B1" onclick="addExpenseDetail()">추가</button>
                     <button
                        style="background-color: rgba(123, 130, 124, 0.1); border: 1px solid #B0B5B1" onclick="deleteExpenseDetail()">삭제</button>
                  </div>
                  <div class="bottom" style="width: 100%;">
                     <table class="template" id="expenseDetail" style="width: 100%;">
                     <tbody>
                        <tr>
                           <th style="width: 25%;">일자</th>
                           <th style="width:20%; text-align: center;">분류</th>
                           <th style="width: 35%;">사용내역</th>
                           <th style="width: 20%">금액</th>
                        </tr>
                        <tr class="details">
                           <td class="pdl10 pdr10"><input style="width: 100%;" type="text"></td>
							<td class="pdl10 pdr10">
								<select class="datatable-selector" name="deptno" id="deptno">
										<option>물품구입비</option>
										<option>잡비</option>
										<option>회식비</option>
										<option>식비</option>
										<option>교통비</option>
										<option>기타</option>
								</select>
							</td>
							<td class="pdl10 pdr10"><input class="width100p height33px" type="text"></td>
                           <td class="pdl10 pdr10"><input name="amount" class="width100p height33px" type="number"></td>
                        </tr>
                        <tr>
                           <th colspan="1">합계</th>
                           <td colspan="3"></td>
                        </tr>
                        </tbody>
                     </table>
                     <table class="template" style="margin-top: 10px; width: 100%; height: 50px;">
                                 <colgroup>
                                    <col width="20%">
                                    <col width="80%">
                                 </colgroup>
                                 <tr>
                                    <th>파일첨부</th>
                                    <td id="fileTd" class="pdl10">
                                       <input type="file" id="fileInput" multiple="multiple">
                                    </td>
                                 </tr>
                              </table>
                  </div>
                  </div>					
               </div>
               <div
                  style="margin-left: 30px; width: 25%; border: 1px solid black; padding: 10px; border-color: #B0B5B1;">
                  <div>
                     <nav class="nav nav-borders">
                        <ul
                           style="display: flex; flex-direction: row; height: 62px; margin-bottom: 0px; padding-top: 14px;">
                           <li style="cursor: pointer;" id="getApproval" class="nav-link active ms-0"
                              onclick=" setActive(this); getApprLine();">결재선</li>
                           <li style="cursor: pointer;" class="nav-link" id="getReference"
                              onclick=" setActive(this); getRefLine();">참조자</li>
                        </ul>
                     </nav>
                  </div>
                  <hr class="mt-0 mb-5">
                  <div id="chkAppr"></div>
                  <div id="chkRef"></div>
               </div>
            </div>

            <%@ include file="./include/footer.jsp"%>
         </div>
      </div>
   </div>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script>
   <script src="js/scripts.js"></script>
</body>
</html>