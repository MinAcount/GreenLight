package com.green.light.comm;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.green.light.vo.AttendanceVo;


public class ExcelView extends AbstractExcelView_xlsx{
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// 데이터 찾아오기
		// Object로 넘어온 값을 각 Model에 맞게 형변환 해준다.
		List<AttendanceVo> list = (List<AttendanceVo>) model.get("lists");

		// (시트만들기)
		Sheet sheet = workbook.createSheet();

		int rowCount = 0;
		int cellCount = 0;

		// 컬럼의 너비 설정하기
		sheet.setColumnWidth(0, 256 * 20);

		// 시트 이름 설정하기
		workbook.setSheetName(0, "근태 목록");

		// 첫 행을 만들어서 컬럼 이름 출력하기
		// 제목 Cell 생성
		Row row = sheet.createRow(rowCount++);
		row.createCell(cellCount++).setCellValue("사원번호");
		row.createCell(cellCount++).setCellValue("근무일");
		row.createCell(cellCount++).setCellValue("출근시간");
		row.createCell(cellCount++).setCellValue("퇴근시간");
		row.createCell(cellCount++).setCellValue("근무상태");

		// 데이터 Cell 생성
		for (AttendanceVo attendanceVo : list) {
			row = sheet.createRow(rowCount++);
			cellCount = 0;
			row.createCell(cellCount++).setCellValue(attendanceVo.getId());
			row.createCell(cellCount++).setCellValue(attendanceVo.getIn_date().substring(0,11));
			row.createCell(cellCount++).setCellValue(attendanceVo.getIn_date().substring(11,16));
			if(attendanceVo.getOut_date() == null) {
				row.createCell(cellCount++).setCellValue("-");
			}else {
				row.createCell(cellCount++).setCellValue(attendanceVo.getOut_date().substring(11,16));
				
			}
			row.createCell(cellCount++).setCellValue(attendanceVo.getAtt_status());
		}

		// 디스크로 flush SXSSF방식의 경우 XSSF의 스트리밍 확장 방식이기 때문에 flush를 해줘야함
		// flushRows를 통해 메모리에 있는 데이터를 디스크(임시파일)로 옮기고 메모리를 비워냄
		// list.size()를 통해서 생성한 row만큼만 flush 한다
		((SXSSFSheet) sheet).flushRows(list.size());

	}

	// workbook은 HSSF(.xls), XSSF(.xlsx), SXSSF(.xlsx확장 대용량파일) 세가지로 나뉘어 지는데
	// .xls는 엑셀 2007년 이전 버전 , .xlsx는 2007년 이후 버전으로 .xlsx에서 저장 시 메모리를 덜 소모하고 속도가 빠른
	// SXSSF방식 사용
	protected Workbook createWorkbook() {
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook();
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook();
		SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook();
		return new SXSSFWorkbook(xssfWorkbook);
	}
}
