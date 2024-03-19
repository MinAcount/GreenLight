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
public class GroupMemberVo {

	private String groupno;
	private String chat_id;
	private String id;
	private String name;
	private String noti;
	private String group_out;
	private String last_mesg;
	private String favor;
}
