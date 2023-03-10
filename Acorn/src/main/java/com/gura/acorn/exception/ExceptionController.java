package com.gura.acorn.exception;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
/*
 * 	Spring MVC 가 동작중에 특정 type 의 예외가 발생하면 해당 예외를 여기서 처리할 수 있다.
 */

  @ControllerAdvice

public class ExceptionController {
	
	// spring framework 가 동작하는 중에 BanException type 의
	// 예외가 발생하면 호출하는 메소드
	@ExceptionHandler(loginException.class)
	public ModelAndView check(loginException check) {
		ModelAndView mView = new ModelAndView();
		// exception 이라는 키 값으로 예외 객체를 담고
		if(check.getMessage().equals("notExist")) {
			mView.addObject("exception", check);
			mView.setViewName("error/not_exist");
		}else if(check.getMessage().equals("banUser")){
			mView.addObject("exception", check);
			mView.setViewName("error/ban_user");	
		}else if(check.getMessage().equals("needLogin")) {
			mView.addObject("exception", check);
			mView.setViewName("error/need_login");
		}else if(check.getMessage().equals("needAuthority")) {
			mView.addObject("exception", check);
			mView.setViewName("error/need_authority");
		}
		return mView;
	}
}
