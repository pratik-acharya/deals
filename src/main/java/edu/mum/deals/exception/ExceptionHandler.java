package edu.mum.deals.exception;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionHandler {
	
	@Autowired
	MessageSourceAccessor messageSourceAccessor;
	public static final String DEFAULT_ERROR_VIEW = "general-error";

	
	@org.springframework.web.bind.annotation.ExceptionHandler(MethodArgumentNotValidException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public DomainErrors handleDomainException(MethodArgumentNotValidException exception){
		List<FieldError> fieldErrors = exception.getBindingResult().getFieldErrors();
		DomainErrors errors = new DomainErrors();
		errors.setErrorType("validationError");
		for(FieldError fieldError: fieldErrors){
			DomainError error = new DomainError(messageSourceAccessor.getMessage(fieldError));
			errors.addError(error);
		}
		return errors;
	}
	
	
	@org.springframework.web.bind.annotation.ExceptionHandler(DealNotFoundException.class)
	public ModelAndView handleError(HttpServletRequest req, DealNotFoundException exception) {
		 ModelAndView mav = new ModelAndView();
		 mav.addObject("reason", exception.getReason());
		 mav.setViewName(DEFAULT_ERROR_VIEW);
		 return mav;
	}
	
	
	   @org.springframework.web.bind.annotation.ExceptionHandler(value = Exception.class)
	    public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
	        ModelAndView mav = new ModelAndView();
	        mav.addObject("reason", "Something went wrong !!!. Please try again later");
	        mav.setViewName(DEFAULT_ERROR_VIEW);
	        return mav;
	    }
	

}
