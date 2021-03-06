package site.itwill.controller;


import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.itwill.dto.Member;
import site.itwill.dto.PayManage;
import site.itwill.dto.Request;
import site.itwill.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member(Model model) {
		model.addAttribute("memberList", memberService.getMemberList());
			return "member/member";		
	}

	@RequestMapping(value = "/member_search", method = RequestMethod.POST)
	@ResponseBody
	public List<Member> member(@RequestBody Member member) {
		return memberService.getMember(member);
	}


	@RequestMapping("/member_list") 
	@ResponseBody 
	public List<Member> restMemberJSONList() { 
		return memberService.getMemberList(); 
	}
	
	@RequestMapping(value = "/member_insert", method = RequestMethod.POST)
	@ResponseBody
	public String memberInsert(@RequestBody Member member) {
		
		memberService.addMember(member);
		
		return "success";
	}
		
	
	@RequestMapping(value = "/member_delete/{mno}")
	public String memberDelete(@PathVariable int mno) {
		memberService.removeMember(mno);
		return "redirect:/member";
	}
	
	//사원번호 받아서 저장(변경할때 필요)
	@RequestMapping(value = "/member_view/{mno}", method = RequestMethod.GET)
	@ResponseBody
	public Member restMemberView(@PathVariable int mno) {
		return memberService.getRestMember(mno);
	}
	
	//사원정보 변경
	@RequestMapping(value = "/member_modify", method = {RequestMethod.PUT, RequestMethod.PATCH})
	@ResponseBody
	public String restMemberModify(@RequestBody Member member) {
		memberService.modifyMember(member);
		return "success";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
