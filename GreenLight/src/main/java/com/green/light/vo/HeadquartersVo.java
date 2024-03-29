package com.green.light.vo;

import java.util.List;

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
public class HeadquartersVo {
	
	private String headno;
	private String hname;
	private String head_mgr;
	private String delflag;
	
	private List<DepartmentVo> deptVo;
	private EmployeeVo empVo;
}
