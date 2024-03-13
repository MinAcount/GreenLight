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

}