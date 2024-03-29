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
public class DepartmentVo {
	
	private String deptno;
	private String dname;
	private String dept_mgr;
	private String headno;
	private String delflag;
	
	private CommonVo comVo;
	private List<EmployeeVo> empVo;
}
