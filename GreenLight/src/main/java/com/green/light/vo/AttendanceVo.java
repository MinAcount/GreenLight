package com.green.light.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
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
@Builder
public class AttendanceVo {

	private String id;
	private String in_date;
	private String out_date;
	private String att_status;
	
	private String total_working_hours;
	
	
	private EmployeeVo empVo;
	
}
