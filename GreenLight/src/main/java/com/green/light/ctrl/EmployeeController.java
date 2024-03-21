package com.green.light.ctrl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.service.IDepartmentService;
import com.green.light.model.service.IEmployeeService;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EmployeeController {
	
	@Autowired
	private IEmployeeService employeeService;
	
	@Autowired
	private IDepartmentService departmentService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("/employeeList.do")
	public String employeeList(Model model) {
		log.info("EmployeeController GET employeeList 직원 정보 리스트");
		List<EmployeeVo> list = employeeService.getAllEmployee();
		model.addAttribute("list",list);
		return "employeeList";
	}
	
	@GetMapping("/employeeAddForm.do")
	public String employeeAddForm(Model model) {
		log.info("EmployeeController GET employeeAddForm 직원 추가 페이지 이동");
		List<DepartmentVo> deptList = departmentService.getAllDept();
		model.addAttribute("deptList",deptList);
		return "employeeAddForm";
	}
	
	@PostMapping("/employeeAdd.do")
	public String employeeAdd(EmployeeVo vo) {
		log.info("EmployeeController POST employeeAdd 직원 추가 : {}", vo);
		vo.setId(""); //빈 값이라도 넣어야 매핑 가능
		String encodePassword = passwordEncoder.encode("1q2w3e4r!!");
		System.out.println(encodePassword);
		vo.setPassword(encodePassword);
		if(vo.getProfile() == null) {
			vo.setProfile("");
		}
		boolean isc = employeeService.insertEmployee(vo);
		log.info("성공여부 : {}",isc);
		return "redirect:/employeeList.do";
	}
	
	@PostMapping("/loginCheck.do")
	@ResponseBody
	public ResponseEntity<?> login(@RequestBody Map<String, Object> map, HttpSession session) {
		log.info("EmployeeController POST loginCheck.do 로그인 : {}", map);
		EmployeeVo failVo = employeeService.getLoginFail((String)(map.get("id")));
		
		if(failVo == null) {
			return ResponseEntity.ok("{\"msg\":\"NULL\"}");
		}else{
			session.setAttribute("failCount", failVo);
			System.out.println(failVo);
			if(failVo.getFail() >= 5) {
				return ResponseEntity.ok("{\"msg\":\"LOCK\"}");
			}
			//암호화 된 비밀번호와 입력된 비밀번호가 같은지 확인
			boolean matchPassword =  passwordEncoder.matches((String)map.get("password"),failVo.getPassword());
			System.out.println("match?"+matchPassword);
			System.out.println("mapPassword??"+map.get("password"));
			System.out.println("voPassword??"+failVo.getPassword());
			if(matchPassword) {
				map.put("password", failVo.getPassword());
				System.out.println("map"+map);
				EmployeeVo vo = employeeService.getLogin(map);
				if(vo != null) {
					session.setAttribute("loginVo", vo);
					if(vo.getAuth() == "00") {
						return ResponseEntity.ok("{\"msg\":\"SUCCESSADMIN\"}");
					}else {
						return ResponseEntity.ok("{\"msg\":\"SUCCESS\"}");
					}
				}else {
					return ResponseEntity.ok("{\"msg\":\"FAIL\"}");
				}
			}else {
				return ResponseEntity.ok("{\"msg\":\"FAIL\"}");
			}
		}
	}
}
