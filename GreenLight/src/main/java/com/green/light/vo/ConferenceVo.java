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
public class ConferenceVo {

	private String conf_id;
	private String cname;
	private int capacity;
	private String availability;
	private String ho;
	private String roominfo;
}
