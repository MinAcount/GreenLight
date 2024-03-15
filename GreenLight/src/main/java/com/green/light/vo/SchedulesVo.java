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
public class SchedulesVo {

	private String schedule_id;
	private String cno;
	private String creator;
	private String phone;
	private Date modified;
	private String usertype;
	private String category;
	private String title;
	private String memo;
	private Date start_date;
	private Date end_date;
	private String location;
	private String priority;
	private String recur;
	private String visibility;
	private String participants;
	private String permission;
	private String alarm;

}
