package com.gura.acorn.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {
	
	@ExceptionHandler(loginException.class)
	public ModelAndView check(loginException check) {
		ModelAndView mView = new ModelAndView();
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
	
	@ExceptionHandler(NotDeleteException.class)
	public ModelAndView notDelete(NotDeleteException nde) {
		ModelAndView mView = new ModelAndView();
		mView.addObject("exception", nde);
		mView.setViewName("error/nde");
		return mView;
	}
}
