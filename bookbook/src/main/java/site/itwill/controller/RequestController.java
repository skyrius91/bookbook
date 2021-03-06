package site.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.itwill.dto.Member;
import site.itwill.dto.Request;
import site.itwill.service.RequestService;

@Controller
public class RequestController {
	@Autowired
	private RequestService requestService;

	@RequestMapping(value = "/request", method = RequestMethod.GET)
	public String request(Model model, HttpSession session) {
		model.addAttribute("requestList", requestService.getRequestList());
			return "request/request";
	}
	
	@RequestMapping(value = "/request_search", method = RequestMethod.POST)
	@ResponseBody
	public List<Request> request(@RequestBody Request request) {
		return requestService.getRequest(request);
	}

	@RequestMapping("/request_list")
	public ResponseEntity<List<Request>> restRequestList() {
		ResponseEntity<List<Request>> entity = null;
		try {
			// ResponseEntity 객체 생성 시 요청에 대한 응답결과와 응답코드 저장
			entity = new ResponseEntity<List<Request>>(requestService.getRequestList(), HttpStatus.OK);
		} catch (Exception e) {
			// ResponseEntity 객체 생성 시 요청에 대한 응답코드(에러코드) 저장
			entity = new ResponseEntity<List<Request>>(HttpStatus.BAD_REQUEST);
		}
		return entity;

	}

	@RequestMapping(value = "/request_delete/{rno}")
	public String requestDelete(@PathVariable int rno) {
		requestService.removeRequest(rno);
		return "redirect:/request";
	}

	// 발주번호 받아서 저장(변경할때 필요)
	@RequestMapping(value = "/request_view/{rno}", method = RequestMethod.GET)
	@ResponseBody
	public Request restRequestView(@PathVariable int rno) {
		return requestService.getRestRequest(rno);
	}

	// 발주정보 변경
	@RequestMapping(value = "/request_modify", method = { RequestMethod.PUT, RequestMethod.PATCH })
	@ResponseBody
	public String restRequestModify(@RequestBody Request request) {
		requestService.modifyRequest(request);
		return "success";
	}

	@RequestMapping(value = "/request_insert", method = RequestMethod.POST)
	@ResponseBody
	public String requestrInsert(@RequestBody Request request) {
		requestService.addRequest(request);
		return "success";
	}

}
