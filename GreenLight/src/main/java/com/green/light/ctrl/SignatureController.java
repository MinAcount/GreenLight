package com.green.light.ctrl;

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

import com.green.light.model.service.ISignService;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.SignVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SignatureController {
	
	
	@Autowired
	private ISignService service;
	
	@GetMapping(value = "/signature.do")
	public String signature(Model model, HttpSession session) {
		log.info("SignatureController GET signature 서명 리스트");
		EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
	    if (loginVo == null) {
	        // loginVo가 null이면 로그인 페이지로 리다이렉트 또는 다른 처리
	        return "redirect:/";
	    }
		String id = loginVo.getId();
		List<SignVo> signlist = service.selectAllSign(id);
//		List<SignVo> signlist =service.selectAllSign(loginVo.getId());
		model.addAttribute("signlist",signlist);
		System.out.println(signlist);
		return "signature";
	}
	
	

	@PostMapping(value = "/mainSign.do")
	@ResponseBody
	public ResponseEntity<?> mainSign(@RequestBody Map<String, String> signno , HttpSession session) {
		log.info("SignatureController mainSign 대표서명변경 signno :{} session : {}",signno , session);
		EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		
		String no = signno.get("signno");
		
		SignVo signVo = new SignVo();
		signVo.setId(loginVo.getId());
		signVo.setSignno(no);
		service.updateMainSign(signVo);
		return ResponseEntity.ok("\"isc\":\"true\"");
	}
	
	@PostMapping(value = "/delSign.do")
	@ResponseBody
	public ResponseEntity<?> delSign(@RequestBody Map<String, String> signno , HttpSession session) {
		log.info("SignatureController mainSign 대표서명변경 signno :{} session : {}",signno , session);
		EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		
		String no = signno.get("signno");
		
		SignVo signVo = new SignVo();
		signVo.setId(loginVo.getId());
		signVo.setSignno(no);
		service.delSign(signVo);
		return ResponseEntity.ok("\"isc\":\"true\"");
	}
	
	@GetMapping(value = "/insertSign.do")
	public String insertSign() {
		log.info("SignatureController insertSign 서명생성페이지로 이동");
		return "insertSign";
	}
	

	@PostMapping(value = "/insertSign.do")
	@ResponseBody
	public ResponseEntity<?> insertSign(@RequestBody Map<String, Object> signData, HttpSession session) {
	    log.info("SignatureController insertSign 서명생성 AJAX");
	    EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
	    
		List<SignVo> signlist = service.selectAllSign(loginVo.getId());
	    
	    String save_sign = (String) signData.get("data");
	    log.info("전달받은 데이터 값: {}", save_sign);
	    
	    if ("Y".equals((String) signData.get("main"))) {
	        service.changeMainSign(loginVo.getId());
	    }
	    

	    
	    
	    SignVo signVo = new SignVo();
	    signVo.setSave_sign(save_sign);
	    signVo.setId(loginVo.getId());
	    signVo.setMain((String) signData.get("main"));
	    if(signlist.size() == 0) {
	    	signVo.setMain("Y");
	    }
	    service.insertSign(signVo);
	    return ResponseEntity.ok("\"isc\":\"true\"");
	}

	
	@PostMapping(value = "/checkSign.do")
	@ResponseBody
	public SignVo checkSign(HttpSession session, Model model) {
		log.info("SignatureController POST /checkSign.do 대표서명 체크");
		EmployeeVo empVo = (EmployeeVo)session.getAttribute("loginVo");
		SignVo sVo = service.selectMainSign(empVo.getId());
		model.addAttribute("sVo",sVo);
		SignVo nVo = new SignVo();
		System.out.println("======================"+sVo);
		if(sVo != null) {
			return sVo;
		} else {
			sVo = nVo;
			return sVo;
		}
	}
}