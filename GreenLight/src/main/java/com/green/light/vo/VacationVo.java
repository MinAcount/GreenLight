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
public class VacationVo {

	private String vacno;
	private String id;
	private String start_day;
	private String end_day;
	private String half;
	private float getsu;
	private String bigo;
	
	private float used_leave;
	private float remaining_leave;
	
	private EmployeeVo empVo;
	private DepartmentVo deptVo;
	
	public VacationVo(String vacno, String id, String start_day, String end_day, String half, float getsu,
			String bigo) {
		super();
		this.vacno = vacno;
		this.id = id;
		this.start_day = start_day;
		this.end_day = end_day;
		this.half = half;
		this.getsu = getsu;
		this.bigo = bigo;
	}
	
}
