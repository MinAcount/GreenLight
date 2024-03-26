package com.green.light.ctrl;

import java.util.ArrayList;
import java.util.List;

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
		return "headAndDept";
	}
	
	@PostMapping("/selectdeptList.do")
	@ResponseBody
	public ResponseEntity<?> selectDeptList(@RequestBody String headno, HttpSession session) {
		log.info("HeadquatersController POST selectdeptList.do 본부별 부서조회 : {}", headno);
		List<DepartmentVo> list = deptService.getDeptByHead(headno);
		return ResponseEntity.ok(list);
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
}
