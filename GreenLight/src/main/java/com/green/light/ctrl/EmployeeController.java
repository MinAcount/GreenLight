package com.green.light.ctrl;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	@ResponseBody
	public ResponseEntity<String> employeeAdd(MultipartFile profile, @RequestParam Map<String, String> map) throws IOException {
	    log.info("EmployeeController POST employeeAdd 직원 추가 : {}/{}", profile, map);
	    String strProfile = "";
	    if(profile != null) {
	    	byte[] byteArr = profile.getBytes();
	    	strProfile = Base64.getEncoder().encodeToString(byteArr);
	    }
		EmployeeVo vo = new EmployeeVo("", map.get("name"), map.get("email"), 
				map.get("phone"), map.get("birthday"), map.get("gender"), 
				map.get("address"), map.get("deptno"), map.get("spot"), 
				map.get("join_day"), map.get("etype"), strProfile);
		String encodePassword = passwordEncoder.encode("1q2w3e4r!!");
		vo.setPassword(encodePassword);
		boolean isc = employeeService.insertEmployee(vo);
		System.out.println("입력되는 vo"+vo);
	    if (isc) {
	    	return ResponseEntity.ok("{\"msg\":\"success\"}");
	    } else {
	    	return ResponseEntity.ok("{\"msg\":\"fail\"}");
	    }
	}
	
	@PostMapping("/loginCheck.do")
	@ResponseBody
	public ResponseEntity<?> loginCheck(@RequestBody Map<String, Object> map, HttpSession session) {
		log.info("EmployeeController POST loginCheck.do 로그인 : {}", map);
		EmployeeVo failVo = employeeService.getLoginFail((String)(map.get("id")));
		
		if(failVo == null) {
			return ResponseEntity.ok("{\"msg\":\"NULL\"}");
		}else{
			session.setAttribute("failCount", failVo);
			if(failVo.getFail() >= 5) {
				return ResponseEntity.ok("{\"msg\":\"LOCK\"}");
			}
			//암호화 된 비밀번호와 입력된 비밀번호가 같은지 확인
			boolean matchPassword =  passwordEncoder.matches((String)map.get("password"),failVo.getPassword());
			if(matchPassword) {
				map.put("password", failVo.getPassword());
				EmployeeVo vo = employeeService.getLogin(map);
				if(vo != null) {
					session.setAttribute("loginVo", vo);
					System.out.println("session에 담기는 vo"+vo);
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
	
	@PostMapping("/passwordCheck.do")
	@ResponseBody
	public ResponseEntity<?> passwordCheck(@RequestBody Map<String, Object> map, HttpSession session) {
		log.info("EmployeeController POST passwordCheck.do 비밀번호 변경 : {}", map);
		EmployeeVo passwordVo = employeeService.getLoginFail((String)(map.get("id")));
		
		// 암호화 된 비밀번호와 입력된 비밀번호가 같은지 확인
		boolean matchPassword = passwordEncoder.matches((String) map.get("password"), passwordVo.getPassword());
		if (matchPassword) {
			//새로운 비밀번호 암호화 및 변경
			String newPassword = (String)map.get("confirmPassword");
			String encodeNewPassword = passwordEncoder.encode(newPassword);
			Map<String, Object> updateMap = new HashMap<String, Object>(){{
				put("id",(String)(map.get("id")));
				put("password",encodeNewPassword);
			}};
			int n = employeeService.updatePassword(updateMap);
			if(n>0) {
				return ResponseEntity.ok("{\"msg\":\"SUCCESS\"}");
			}else {
				return ResponseEntity.ok("{\"msg\":\"UPDATEFAIL\"}");
			}
		} else {
			return ResponseEntity.ok("{\"msg\":\"FAIL\"}");
		}
	}
	
	@PostMapping("/employeeListByEstatus.do")
	@ResponseBody
	public ResponseEntity<?> employeeListByEstatus(@RequestBody String estaus, HttpSession session) {
		log.info("EmployeeController POST employeeListByEstatus.do 재직상태별 직원 조회 : {}", estaus);
		List<EmployeeVo> list;
		if(estaus.equals("A")) {
			System.out.println("전체조회");
			list = employeeService.getAllEmployee();
		}else {
			System.out.println("상태별조회");
			list = employeeService.getAllEmployeeByStatus(estaus);
		}
		return ResponseEntity.ok(list);
	}
}
