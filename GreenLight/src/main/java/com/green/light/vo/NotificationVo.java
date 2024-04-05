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
@AllArgsConstructor
@NoArgsConstructor
public class NotificationVo {
	private String noti_id;
	private String gubun;
	private String ntype;
	private String sender;
	private String alert_time;
	private String content;
	
	private String receiver_id;
	private String read;
	
	private CommonVo comVo;
	private EmployeeVo empVo;
}
