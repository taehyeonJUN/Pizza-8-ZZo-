package com.kr.pizza;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	

	//@RequestMapping(value ="/test.do",method = RequestMethod.GET) //get방식 요청시
	//@RequestMapping(value ="/test.do") //요청방식에 상관없이 실행
	@RequestMapping("/test.do") //요청방식에 상관없이 실행
	public String test(
			@RequestParam("myNo") String no, // "myNo"라는 이름의 파라미터 값을 이 변수에 저장
			
			int myNo, // 변수 명이 파라미터명과 같은 경우 에는 @RequestParam생략 가능(자동 형변환 가능)
			
			//@ModelAttribute("mvo") 
			MyVo mv, //사용자가 정의한 객체의 변수에는 동일한 이름의 파라미터 값이 자동 저장  
			//**변수명 mv로 변경**  
			//**@ModelAttribute에 ("mvo")라는 이름으로 추가 map.put("mvo", mv);와 같은 효과
			//**파라미터를 받기 위한 객체는 자동으로 모델에 추가.
			//**모델에 저장되는 이름은 타입(클래스)의 첫글자만 소문자로 바꾼 이름을 사용
			
			
			Model model, ModelMap modelmap, Map map) {  
	// http://localhost:7999/kopo/test.do 로 요청을 보내면 test.jsp화면이 나오도록 구현
		System.out.println("myNo :" + no);
		System.out.println("myNo :" + myNo);
		System.out.println("mv의 myNo :" + mv.getMyNo()); //**이 값을 jsp로 출력 
		System.out.println("mv의 myId :" + mv.getMyId());
		
		String s = "Hello,Spring";
		//모델에 데이터를 추가하는 방법 
		//인자로 받은 Model, ModelMap, Map 객체에 데이터를 저장
		model.addAttribute("modelVal", s); //s를 "modelVal"이라는 이름으로 저장
		modelmap.addAttribute("modelmapVal", s); //셋중 하나만 쓰면 됨. 모델은 자바 자체 나머지는 스프링에 속함
		map.put("mapVal", s);
		map.put("mapVal", mv);
		
		
		
		// **
		
//		String x = "mv의 myNo :" + mv.getMyNo();
//		String y = "mv의 myId :" + mv.getMyId();
	
//		map.put("myNoMap",x);
//		map.put("myIdMap",y);
		
		map.put("mvo", mv);
		//**
		
		return "test"; // WEB-INF/views/test.jsp //뷰 정보를 반환
	}
}
