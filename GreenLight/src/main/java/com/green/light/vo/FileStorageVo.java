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
@AllArgsConstructor
@NoArgsConstructor
public class FileStorageVo {

	private String ref_id;
	private String ftype;
	private String origin_name;
	private String stored_name;
	private String payload;
	private int fsize;
	private String upload_date;
	private String delflag;
	
	private CommonVo comVo;
	
}
