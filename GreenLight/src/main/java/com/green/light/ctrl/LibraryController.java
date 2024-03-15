package com.green.light.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LibraryController {

	 @GetMapping(value = "/draftList.do")
	 public String draftList() {
		 log.info("LibraryController draftList.do");
		 return "draftList";
	 }
}
