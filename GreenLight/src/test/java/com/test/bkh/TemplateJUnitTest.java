package com.test.bkh;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.service.ITemplateService;
import com.green.light.vo.TemplateVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class TemplateJUnitTest {
	@Autowired
	private ITemplateService service;

	@Test
	public void test() {
		// selectMainTemplate
		TemplateVo selectedTmeplateVo = service.selectMainTemplate("01");
		System.out.println(selectedTmeplateVo);
		assertNotNull(selectedTmeplateVo);
		
		// insertTemplate
		TemplateVo insertTemplateVo = new TemplateVo("admin", "<div class=\"top\" style=\"text-align: center; margin-bottom: 30px;\">\r\n"
				+ "                  <h1>지출결의서</h1>\r\n"
				+ "               </div>\r\n"
				+ "               <div class=\"header\" style=\"display: flex; flex-direction: row; justify-content: space-between;\">\r\n"
				+ "                  <div>\r\n"
				+ "                     <table class=\"template\">\r\n"
				+ "                        <tr>\r\n"
				+ "                           <th>기안자</th>\r\n"
				+ "                           <td>기안자</td>\r\n"
				+ "                        </tr>\r\n"
				+ "                        <tr>\r\n"
				+ "                           <th>소속</th>\r\n"
				+ "                           <td>기안부서</td>\r\n"
				+ "                        </tr>\r\n"
				+ "                        <tr>\r\n"
				+ "                           <th>기안일</th>\r\n"
				+ "                           <td>기안일</td>\r\n"
				+ "                        </tr>\r\n"
				+ "                        <tr>\r\n"
				+ "                           <th>문서번호</th>\r\n"
				+ "                           <td>문서번호</td>\r\n"
				+ "                        </tr>\r\n"
				+ "                     </table>\r\n"
				+ "                  </div>\r\n"
				+ "                  <div>\r\n"
				+ "                     <table class=\"template\" style=\"display: flex; flex-direction: row; justify-content: center;\">\r\n"
				+ "                                                <tr>\r\n"
				+ "                                                        <th rowspan=\"3\">신청</th>\r\n"
				+ "                                                        <td>과장</td>\r\n"
				+ "                                                        <td>대리</td>\r\n"
				+ "                                                        <td>사원</td>\r\n"
				+ "                                                </tr>\r\n"
				+ "                                                <tr>\r\n"
				+ "                                                        <td>한성준</td>\r\n"
				+ "                                                        <td>둘성준</td>\r\n"
				+ "                                                        <td>셋성준</td>\r\n"
				+ "                                                </tr>\r\n"
				+ "                                                <tr>\r\n"
				+ "                                                        <td>2024.03.21</td>\r\n"
				+ "                                                        <td>2024.03.22</td>\r\n"
				+ "                                                        <td>2024.03.23</td>\r\n"
				+ "                                                </tr>\r\n"
				+ "                                        </table>\r\n"
				+ "                  </div>\r\n"
				+ "               </div>\r\n"
				+ "               <div class=\"content\"  style=\"width: 100%; margin-top: 30px;\">\r\n"
				+ "                  <table class=\"template\"  style=\"width: 100%;\">\r\n"
				+ "                          <colgroup>\r\n"
				+ "                                  <col width=\"20%\">\r\n"
				+ "                                  <col width=\"80%\">\r\n"
				+ "                          </colgroup>\r\n"
				+ "                     <tr>\r\n"
				+ "                             <th>휴가 종류</th>\r\n"
				+ "                             <td>\r\n"
				+ "                                     <select>\r\n"
				+ "                                             <option value=\"연차\">연차</option>\r\n"
				+ "                                             <option value=\"공가\">공가</option>\r\n"
				+ "                                     </select>\r\n"
				+ "                             </td>\r\n"
				+ "                     </tr>\r\n"
				+ "                     <tr>\r\n"
				+ "                             <th>기간 및 일시</th>\r\n"
				+ "                             <td>\r\n"
				+ "                                     <div class=\"input-group input-group-joined\" style=\"width: 16.5rem;\">\r\n"
				+ "                                                                 <span class=\"input-group-text\">\r\n"
				+ "                                                                         <i data-feather=\"calendar\"></i>\r\n"
				+ "                                                                 </span>\r\n"
				+ "                                                        <input class=\"form-control ps-0\" id=\"litepickerRangePlugin\" placeholder=\"Select date range...\" />\r\n"
				+ "                                                        </div>\r\n"
				+ "                             </td>\r\n"
				+ "                     </tr>\r\n"
				+ "                     <tr>\r\n"
				+ "                             <th>반차 여부</th>\r\n"
				+ "                             <td>\r\n"
				+ "                                     <input type=\"checkbox\" value=\"시작일\" id=\"startCheckbox\">\r\n"
				+ "                                     <label>시작일</label>\r\n"
				+ "                                     (\r\n"
				+ "                                     <input type=\"radio\" name=\"시작일\" value=\"오전\" disabled=\"disabled\">\r\n"
				+ "                                     <label>오전</label>\r\n"
				+ "                                     <input type=\"radio\" name=\"시작일\" value=\"오후\" disabled=\"disabled\">\r\n"
				+ "                                     <label>오후</label>\r\n"
				+ "                                     )\r\n"
				+ "                                     <input type=\"checkbox\" value=\"종료일\" id=\"endCheckbox\">\r\n"
				+ "                                     <label>종료일</label>\r\n"
				+ "                                     (\r\n"
				+ "                                     <input type=\"radio\" name=\"종료일\" value=\"오전\" disabled=\"disabled\">\r\n"
				+ "                                     <label>오전</label>\r\n"
				+ "                                     <input type=\"radio\" name=\"종료일\" value=\"오후\" disabled=\"disabled\">\r\n"
				+ "                                     <label>오후</label>\r\n"
				+ "                                     )\r\n"
				+ "                             </td>\r\n"
				+ "                     </tr>\r\n"
				+ "                     <tr>\r\n"
				+ "                             <th>연차 일수</th>\r\n"
				+ "                             <td>\r\n"
				+ "                                     <span>\r\n"
				+ "                                             <b>잔여연차 : </b>\r\n"
				+ "                                             <input type=\"text\">\r\n"
				+ "                                     </span>\r\n"
				+ "                                     <span>\r\n"
				+ "                                             <b>신청연차 : </b>\r\n"
				+ "                                             <input type=\"text\">\r\n"
				+ "                                     </span>\r\n"
				+ "                             </td>\r\n"
				+ "                     </tr>\r\n"
				+ "                     <tr>\r\n"
				+ "                             <td colspan=\"2\">\r\n"
				+ "                                     공가 : <br>\r\n"
				+ "                                     경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br>\r\n"
				+ "                                     예비군/민방위는 사전에 통지서를, 사후에 참석증을 반드시 제출<br>\r\n"
				+ "                                     질병휴가는 의사의 진단서 또는 진료 증명서를 반드시 제출\r\n"
				+ "                             </td>\r\n"
				+ "                     </tr>\r\n"
				+ "                  </table>\r\n"
				+ "               </div>\r\n"
				+ "            </div>", "01");
		int insertTemplateRow = service.insertTemplate(insertTemplateVo);
//		assertEquals(insertTemplateRow, 1);
	}

}
