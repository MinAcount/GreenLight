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
	
}
