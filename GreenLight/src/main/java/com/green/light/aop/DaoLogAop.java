package com.green.light.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class DaoLogAop {
	
	@Pointcut("execution(public * com.green.light.model.mapper.*Dao*.*(..))")
	public void daoPointCut() {}
	
	@Before("daoPointCut()")
	public void before(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.warn("메서드 실행 전");
		Object[] args = j.getArgs();
		if(args == null) {
			logger.warn("====={}=====",j.getSignature().getName());
			for(int i=0; i<args.length; i++) {
				logger.warn("{}번째 args : \t {}", (i+1), String.valueOf(args[i]));
			}
			logger.warn("====={}=====",j.getSignature().getName());
		}
	}
	
	@AfterReturning(value = "daoPointCut()", returning = "returnValue")
	public void afterReturning(JoinPoint j, Object returnValue) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.warn("종료: \t {}", j.getSignature().getName());
	}
	
	@AfterThrowing(value = "daoPointCut()", throwing = "execption")
	public void afterThrowing(JoinPoint j, Throwable execption) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.warn("에러: \t {}", j.getSignature().getName());
		logger.warn("에러: \t {}", execption.getMessage());
	}

}
