package com.green.light.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.green.light.model.service.IEmployeeService;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginService implements UserDetailsService {

	@Autowired
	private IEmployeeService service;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		log.info("LoginService loadUserByUsername 입력받은 ID : {}",id);
		log.info("LoginService repository : {}", service);
		
		EmployeeVo vo = service.getOneEmployee(id);
		log.info("LoginService EmployeeVo : {}", vo);
		if(vo != null) {
			return new User(id, vo.getPassword(), AuthorityUtils.createAuthorityList(vo.getAuth()));
		}else {
			return null;
		}
	}

}
