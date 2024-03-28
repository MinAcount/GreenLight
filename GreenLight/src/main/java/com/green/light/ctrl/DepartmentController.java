package com.green.light.ctrl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.service.IDepartmentService;
import com.green.light.model.service.IHeadquartersService;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.HeadquartersVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DepartmentController {

	@Autowired
	private IDepartmentService deptService;
	
	@Autowired
	private IHeadquartersService headService;
	
	@PostMapping("/selectdept.do")
	@ResponseBody
	public ResponseEntity<?> selectHead(@RequestBody String deptno, HttpSession session) {
		log.info("DepartmentController POST selectdept.do 부서 상세 조회 : {}", deptno);
		DepartmentVo deptVo = deptService.getOneDept(deptno);
		if(deptVo == null) {
			deptVo = deptService.getOneDeptInfo(deptno);
		}
		return ResponseEntity.ok(deptVo);
	}
	
	@PostMapping("/updateDeptName.do")
	@ResponseBody
	public ResponseEntity<?> updateDeptName(@RequestBody Map<String, Object> map) {
		log.info("DepartmentController POST updateDeptName.do 부서명 수정 : {}", map);
		DepartmentVo deptVo = deptService.getOneDeptInfo((String)map.get("deptno"));
		if(deptVo.getDname().equals(map.get("dname"))) {
			return ResponseEntity.ok("{\"isc\":\"same\"}");
		}
		int n = deptService.updateDeptName(map);
		if (n > 0) {
			return ResponseEntity.ok("{\"isc\":\"success\"}");
		} else {
			return ResponseEntity.ok("{\"isc\":\"fail\"}");
		}
	}
	
	@PostMapping("/insertDept.do")
	@ResponseBody
	public ResponseEntity<?> insertDept(@RequestBody Map<String, Object> map) {
		log.info("DepartmentController POST insertDept.do 부서 생성 : {}", map);
		List<DepartmentVo> deptList = deptService.getDeptByHead((String)map.get("headno"));
		for(DepartmentVo deptVo: deptList) {
			if(deptVo.getDname().equals(map.get("dname"))) {
				return ResponseEntity.ok("{\"isc\":\"same\"}");
			}
		}
		int n = deptService.insertDept(map);
		if(n>0) {
			return ResponseEntity.ok("{\"isc\":\"success\"}");
		}else {
			return ResponseEntity.ok("{\"isc\":\"fail\"}");
		}
	}
	
	@PostMapping("/deptDel.do")
	@ResponseBody
	public ResponseEntity<?> deptDel(@RequestBody Map<String, String> map) {
		log.info("DepartmentController POST deptDel.do 부서 삭제 : {}", map);
		String deptno = (String) map.get("deptno");
		String val = (String) map.get("val");
		DepartmentVo deptVo = deptService.getOneDept(deptno);
		if(deptVo != null) {
			return ResponseEntity.ok("{\"isc\":\"emp\"}");
		}else if(val.equals("1")) {
			System.out.println("delflag 변경될 삭제");
			int n = deptService.updateDeptDelete(deptno);
			if(n>0) {
				return ResponseEntity.ok("{\"isc\":\"delSuccess\"}");
			}else {
				return ResponseEntity.ok("{\"isc\":\"fail\"}");
			}
		}else {
			System.out.println("완전 삭제");
			int n = deptService.deleteDept(deptno);
			if(n>0) {
				return ResponseEntity.ok("{\"isc\":\"deleteSuccess\"}");
			}else {
				return ResponseEntity.ok("{\"isc\":\"fail\"}");
			}
		}
	}
	
	@GetMapping("/deptRecycle.do")
	@ResponseBody
	public ResponseEntity<?> deptRecycle(String deptno) {
		log.info("DepartmentController GET deptRecycle.do 부서 복구 : {}", deptno);
		int n = deptService.restoreDept(deptno);
		return ResponseEntity.ok(n);
	}
}
