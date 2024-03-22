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
public class VacationVo {

	private String vacno;
	private String id;
	private Date start_day;
	private Date end_day;
	private String half;
	private int getsu;
	private String bigo;

}
