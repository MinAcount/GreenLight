package com.green.light.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class TemplateVo {
	private String tempno;
	private String emp_id;
	private String content;
	private String tempcode;
	private String createat;
	private String mainflag;
	
	public TemplateVo(String emp_id, String content, String tempcode) {
		super();
		this.emp_id = emp_id;
		this.content = content;
		this.tempcode = tempcode;
	}
	
}
