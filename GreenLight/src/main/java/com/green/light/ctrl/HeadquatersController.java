package com.green.light.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.service.IDepartmentService;
import com.green.light.model.service.IEmployeeService;
import com.green.light.model.service.IHeadquartersService;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.HeadquartersVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HeadquatersController {
	
	@Autowired
	private IHeadquartersService headService;
	
	@Autowired
	private IDepartmentService deptService;
	
	@Autowired
	private IEmployeeService empService;
	
	@GetMapping("/headAndDept.do")
	public String headAndDept(Model model) {
		log.info("HeadquatersController GET headAndDept.do 본부 및 부서 첫페이지로 이동");
		List<HeadquartersVo> headList = headService.getAllHead();
		model.addAttribute("headList",headList);
		HeadquartersVo headVo = null;
		List<EmployeeVo> headMgrHuboList = new ArrayList<EmployeeVo>();
		for(HeadquartersVo head :  headList) {
			if(head.getDelflag().equals("N")) {
				headVo = head;
				List<DepartmentVo> deptList = deptService.getDeptByHead(headVo.getHeadno());
				List<DepartmentVo> list = new ArrayList<DepartmentVo>();
				for(DepartmentVo dept : deptList) {
					list.add(deptService.getOneDept(dept.getDeptno()));
				}
				EmployeeVo empVo = empService.getOneEmployee(headVo.getHead_mgr());
				headVo.setDeptVo(list);
				headVo.setEmpVo(empVo);
				headMgrHuboList = empService.getHeadMgrHubo(headVo.getHeadno());
				break;
			}
		}
		model.addAttribute("headVo",headVo);
		model.addAttribute("headMgrHuboList",headMgrHuboList);
		return "headAndDept";
	}
	
	@PostMapping("/selectdeptList.do")
	@ResponseBody
	public ResponseEntity<?> selectDeptList(@RequestBody String headno, HttpSession session) {
		log.info("HeadquatersController POST selectdeptList.do 본부별 부서조회 : {}", headno);
		List<DepartmentVo> list = deptService.getDeptByHead(headno);
		List<EmployeeVo> headMgrHubo = empService.getHeadMgrHubo(headno);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("headMgrHubo", headMgrHubo);
		return ResponseEntity.ok(map);
	}
	
	@PostMapping("/selectHead.do")
	@ResponseBody
	public ResponseEntity<?> selectHead(@RequestBody String headno, HttpSession session) {
		log.info("HeadquatersController POST selectHead.do 본부 상세 조회 : {}", headno);
		HeadquartersVo headVo = headService.getOneHead(headno);
		if(headVo.getHead_mgr() != null) {
			EmployeeVo empHeadVo = empService.getOneEmployee(headVo.getHead_mgr());
			headVo.setEmpVo(empHeadVo);
		}
		List<DepartmentVo> deptList = new ArrayList<DepartmentVo>();
		List<EmployeeVo> empList = new ArrayList<EmployeeVo>();
		for(DepartmentVo deptInfo : headVo.getDeptVo()) {
			if(deptInfo.getDept_mgr() != null) {
				EmployeeVo empDeptVo = empService.getOneEmployee(deptInfo.getDept_mgr());
				empList.add(empDeptVo);
				deptInfo.setEmpVo(empList);
			}else {
				deptInfo.setEmpVo(null);
			}
			deptList.add(deptInfo);
		}
		headVo.setDeptVo(deptList);
		return ResponseEntity.ok(headVo);
	}
	
	@GetMapping("/headAndDeptManage.do")
	public String headAndDeptManage(Model model) {
		log.info("HeadquatersController GET headAndDeptManage.do 본부 및 부서 관리 페이지로 이동");
		List<HeadquartersVo> headList = headService.getAllHead();
		List<DepartmentVo> deptList = deptService.getAllDept();
		List<EmployeeVo> empList = empService.getAllEmployee();
		model.addAttribute("headList", headList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		return "headAndDeptManage";
	}
	
	@PostMapping("/updateHeadName.do")
	@ResponseBody
	public ResponseEntity<?> updateHeadName(@RequestBody Map<String, Object> map) {
		log.info("HeadquatersController POST updateHeadName.do 본부명 수정 : {}", map);
		HeadquartersVo headVo = headService.getOneHead((String)map.get("headno"));
		
		if(headVo.getHname().equals(map.get("hname"))) {
			return ResponseEntity.ok("{\"isc\":\"same\"}");
		}else {
			int n = headService.updateHeadName(map);
			if(n>0) {
				return ResponseEntity.ok("{\"isc\":\"success\"}");
			}else {
				return ResponseEntity.ok("{\"isc\":\"fail\"}");
			}
		}
	}
	
	@PostMapping("/insertHead.do")
	@ResponseBody
	public ResponseEntity<?> insertHead(@RequestBody String hname) {
		log.info("HeadquatersController POST insertHead.do 본부 추가 : {}", hname);
		List<HeadquartersVo> list = headService.getAllHead();
		List<HeadquartersVo> allList = new ArrayList<HeadquartersVo>();
		for(HeadquartersVo vo : list) {
			if(vo.getHname().equals(hname)) {
				return ResponseEntity.ok(allList);
			}
		}
		headService.insertHead(hname);
		allList = headService.getAllHead();
		List<EmployeeVo> empList = empService.getAllEmployee();
		for(EmployeeVo emp : empList) {
			for(HeadquartersVo head : allList) {
				if(emp.getId().equals(head.getHead_mgr())) {
					head.setEmpVo(emp);
				}
			}
		}
		return ResponseEntity.ok(allList);
	}
	
	@PostMapping("/headDel.do")
	@ResponseBody
	public ResponseEntity<?> headDel(@RequestBody Map<String, Object> map) {
		log.info("HeadquatersController POST headDel.do 본부 삭제 : {}", map);
		String headno = (String)map.get("headno");
		List<DepartmentVo> deptList = deptService.getDeptByHead(headno);
		if(deptList.size() != 0) {
			return ResponseEntity.ok("{\"isc\":\"dept\"}");
		}else if(map.get("val").equals("1")) {
			System.out.println("delflag 변경될 삭제");
			int n = headService.updateHeadDelete(headno);
			if(n>0) {
				return ResponseEntity.ok("{\"isc\":\"delSuccess\"}");
			}else {
				return ResponseEntity.ok("{\"isc\":\"fail\"}");
			}
		}else {
			System.out.println("완전 삭제");
			int n = headService.deleteHead(headno);
			if(n>0) {
				return ResponseEntity.ok("{\"isc\":\"deleteSuccess\"}");
			}else {
				return ResponseEntity.ok("{\"isc\":\"fail\"}");
			}
		}
	}
	
	@GetMapping("/headRecycle.do")
	public String headRecycle(String headno) {
		log.info("HeadquatersController GET headRecycle.do 본부 복구 : {}", headno);
		headService.restoreHead(headno);
		return "redirect:/headAndDeptManage.do";
	}
	
	@PostMapping("/updateHeadManager.do")
	@ResponseBody
	public ResponseEntity<?> updateHeadManager(@RequestBody Map<String, Object> map) {
		log.info("HeadquatersController POST updateHeadManager.do 본부장 복구 및 변경 : {}",map);
		headService.updateHeadMgr(map);
		List<EmployeeVo> newHubo = empService.getHeadMgrHubo((String)map.get("headno"));
		List<DepartmentVo> deptList = new ArrayList<DepartmentVo>();
		for(EmployeeVo hubo : newHubo) {
			DepartmentVo deptVo = deptService.getOneDept(hubo.getDeptno());
			deptList.add(deptVo);
		}
		Map<String, Object> joinMap = new HashMap<String, Object>();
		joinMap.put("newHubo", newHubo);
		joinMap.put("deptList", deptList);
		return ResponseEntity.ok(joinMap);
	}
}
