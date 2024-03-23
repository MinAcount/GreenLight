package com.green.light.vo;

import java.util.Date;

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
public class AttendanceVo {

	private String id;
	private Date in_date;
	private Date out_date;
	private String att_status;
	
	private EmployeeVo empVo;

}
