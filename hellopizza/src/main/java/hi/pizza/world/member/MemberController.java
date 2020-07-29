package hi.pizza.world.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hi.pizza.world.comm.PageInfo;

@Controller
public class MemberController{

	//	@Autowired,@Inject, @Resource 중 하나를 사용하여 스프링에 등록된 객체를 주입
	@Resource(name ="memberService")
	private MemberService memberService; 

	@RequestMapping(value = "/member/list.do")

	public String list(Map modeMap, PageInfo pageInfo){
		int num = memberService.selectCount();
		pageInfo.setTotalRecordCount(num);
		pageInfo.remderHTML();
		
		List<MemberVo> list = memberService.selectMemberList();
		
		modeMap.put("memList", list); 
		
		return "member/memList";
	}

	@RequestMapping(value = "/member/add.do", method = RequestMethod.GET)

	protected String addform(){
		return "member/memAddForm";
	}


	@RequestMapping(value = "/member/add.do", method = RequestMethod.POST)
	public String add(MemberVo vo){
		System.out.println("...");
		
		int num = memberService.insertMember(vo);
		System.out.println(num + "개의 레코드 추가");

		return "redirect:/home.do";

	}

	@RequestMapping(value = "/member/edit.do", method = RequestMethod.GET)
	public String editform(String memId,Map modelMap){
		MemberVo vo = memberService.selectMember(memId);
		modelMap.put("memVo", vo);
		return "member/memEditForm";
	}

	@RequestMapping(value = "/member/edit.do", method = RequestMethod.POST)
	public String edit( MemberVo vo){

		int num = memberService.updateMember(vo);
		System.out.println(num+"개의 레코드 변경");

		return "redirect:/member/list.do";
	}

	@RequestMapping("/member/del.do")
	public String del(String memId) {
		int num = memberService.deleteMember(memId);
		System.out.println(num+"개의 데이터를 삭제");
		return "redirect:/member/list.do";

	}

	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public String loginform(){
		return "member/loginList";
	}

	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public String login(MemberVo vo,HttpSession session){ 
		MemberVo loginVo = memberService.selectLoginMember(vo);

		if(loginVo==null) { // 로그인 실패(입력한 ID/PW와 일치하는 회원이 없는 경우)
			return "redirect:/member/login.do";
		}else { // 로그인성공(입력한 ID/PW와 일치하는 회원이 있는 경우)
			session.setAttribute("loginUser", loginVo);
			return "redirect:/home.do";

		}
	}

	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public String loginout(HttpSession session) {
		session.invalidate(); 
		return "redirect:/member/list.do";
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)

	protected String homeform(){
		return "comm/homeForm";
	}

}
