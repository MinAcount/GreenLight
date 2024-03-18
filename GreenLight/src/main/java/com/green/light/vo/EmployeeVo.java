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
public class EmployeeVo {

	private String id;
	private String name;
	private String password;
	private String email;
	private String phone;
	private String birthday;
	private String gender;
	private String address;
	private String deptno;
	private String spot;
	private String position;
	private String estatus;
	private String join_day;
	private String exit_day;
	private String etype;
	private int leave;
	private String auth;
	private String profile;
	private int fail;
	
	private String opt;
	private String keyword;
	
	private DepartmentVo deptVo;
	private CommonVo comVo;
	
	public EmployeeVo(String id, String name, String email, String phone, String address, String deptno, String spot, String profile) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.deptno = deptno;
		this.spot = spot;
		this.profile = profile;
	}

	public EmployeeVo(String name, String email, String phone, String birthday, String gender,
			String address, String deptno, String spot, String join_day, String etype, String profile) {
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.gender = gender;
		this.address = address;
		this.deptno = deptno;
		this.spot = spot;
		this.join_day = join_day;
		this.etype = etype;
		this.profile = profile;
	}

}