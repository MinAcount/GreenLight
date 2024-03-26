package com.green.light.comm;

import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.web.servlet.view.AbstractView;

public abstract class AbstractExcelView_xlsx extends AbstractView{
	
    private static final String CONTENT_TYPE_XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
    private static final String CONTENT_TYPE_XLS = "application/vnd.ms-excel";
    
    public AbstractExcelView_xlsx() {
		
  	}
   
      @Override
      protected boolean generatesDownloadContent() {
          return true;
      }
   
      @Override
      protected final void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
   
          Workbook workbook = createWorkbook();
   
          setContentType(CONTENT_TYPE_XLSX);
//          setContentType(CONTENT_TYPE_XLS);
   
          buildExcelDocument(model, workbook, request, response);
   
          response.setContentType(getContentType());
   
          ServletOutputStream out = response.getOutputStream();
          out.flush();
          workbook.write(out);
          out.flush();
          
          if (workbook instanceof SXSSFWorkbook) {
              ((SXSSFWorkbook) workbook).dispose();
          }
      }
   
      protected abstract Workbook createWorkbook();
   
      /**
       * Subclasses must implement this method to create an Excel HSSFWorkbook
       * document, given the model.
       * 
       * @param model
       *            the model Map
       * @param workbook
       *            the Excel workbook to complete
       * @param request
       *            in case we need locale etc. Shouldn't look at attributes.
       * @param response
       *            in case we need to set cookies. Shouldn't write to it.
       */
      protected abstract void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception;
  }
