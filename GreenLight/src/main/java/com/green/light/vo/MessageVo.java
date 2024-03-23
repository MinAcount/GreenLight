package com.green.light.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MessageVo {

	private String mesg_id;
	private String chat_id;
	private int writter;
	private String content;
	private String send_date;
	private String file_yn;
	
	private GroupMemberVo gmvo;
	private EmployeeVo empVo;
}
