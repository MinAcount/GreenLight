package com.green.light.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.service.IConferenceService;
import com.green.light.vo.ConferenceVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ConferenceController {
	
	@Autowired
	private IConferenceService service;
	
	@GetMapping(value = "/roomList.do")
	@ResponseBody
	public String AllRoom(Model model) {
		log.info("ConferenceController GET roomList.do 회의실 전체조회");
		List<ConferenceVo> lists = service.getAllRoom();
		System.out.println(lists);
		model.addAttribute("lists", lists);
		return "roomList";
	}
	
	@GetMapping(value = "/roomOne.do")
	public String OneRoom(@RequestParam("conf_id") String conf_id, Model model) {
		log.info("ConferenceController GET roomOne.do 회의실 상세조회 {}", conf_id);
		ConferenceVo vo = service.getOenRoom(conf_id);
		System.out.println(vo);
		model.addAttribute("vo", vo);
		return "roomOne";
	}
	
	@GetMapping(value = "/insertRoom.do")
	@ResponseBody
	public int InsertRoom(@RequestBody ConferenceVo vo) {
		log.info("ConferenceController GET insertRoom.do [관리자] 회의실 등록 {}", vo);
		vo.getCname();
		vo.getCapacity();
		vo.getLocality();
		vo.getHo();
		vo.getRoominfo();
		int cnt = service.insertRoom(vo);
		return cnt;
	}
	
	@GetMapping(value = "/updateRoom.do")
	@ResponseBody
	public int UpdateRoom(@RequestBody ConferenceVo vo) {
		log.info("ConferenceController GET updateRoom.do [관리자] 회의실 수정 {}", vo);
		vo.getConf_id();
		vo.getCname();
		vo.getCapacity();
		vo.getAvailability();
		vo.getRoominfo();
		int cnt = service.updateRoom(vo);
		return cnt;
	}
}
