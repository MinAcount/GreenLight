package com.green.light.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ApprovalVo {

	private String apprno;
	private String docno;
	private String writer_id;
	private String atype;
	private String emp_id;
	private String appr_status;
	private int orderno;
	private String appr_date;
	private String signature;
	private String comment;
	
	
	public ApprovalVo(String docno, String writer_id, String atype, String emp_id, int orderno) {
		super();
		this.docno = docno;
		this.writer_id = writer_id;
		this.atype = atype;
		this.emp_id = emp_id;
		this.orderno = orderno;
	}
	
	
	
}
