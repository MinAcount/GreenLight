package com.green.light.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DocumentVo {
	
	private String docno;
	private String writer_id;
	private String title;
	private String content;
	private String draft_date;
	private String urgency;
	private String tempno;
	private String doc_status;
	private int file_count;
	
	private CommonVo commVo;
	private CommonVo2 commVo2;
	private DepartmentVo deptVo;
	private HeadquartersVo headVo;
	private EmployeeVo empVo;
	private ApprovalVo apprVo;
	private FileStorageVo fileVo;
	
}
