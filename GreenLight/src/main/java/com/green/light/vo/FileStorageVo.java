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

	private int fileno;
	private String ref_id;
	private String ftype;
	private String origin_name;
	private String stored_name;
	private String payload;
	private int fsize;
	private String upload_date;
	private String delflag;
	
	public FileStorageVo(String ref_id, String origin_name, String stored_name, String payload, int fsize) {
		super();
		this.ref_id = ref_id;
		this.origin_name = origin_name;
		this.stored_name = stored_name;
		this.payload = payload;
		this.fsize = fsize;
	}

}
