package com.green.light.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.service.IDepartmentService;
import com.green.light.vo.DepartmentVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DepartmentController {

	@Autowired
	private IDepartmentService deptService;
	
	@PostMapping("/selectdept.do")
	@ResponseBody
	public ResponseEntity<?> selectHead(@RequestBody String deptno, HttpSession session) {
		log.info("DepartmentController POST selectdept.do 부서 상세 조회 : {}", deptno);
		DepartmentVo deptVo = deptService.getOneDept(deptno);
		return ResponseEntity.ok(deptVo);
	}
}
