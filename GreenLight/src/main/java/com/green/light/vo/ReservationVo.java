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
public class ReservationVo {

	private String reserveno   ;
	private String applicant   ;
	private String phone       ;
	private Date reserve_date;
	private String meetingtitle;
	
}
