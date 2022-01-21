package kr.green.spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Data;

@Controller
public class AjaxController {
	
	@ResponseBody
	@RequestMapping(value ="/ajax/test1")
	public String ajaxTest1(String str){
	    return "success : " + str;
	}
	@ResponseBody
	@RequestMapping(value ="/ajax/test2")
	public Map<String, Object> ajaxTest2(@RequestBody String str){
		HashMap<String, Object>map = new HashMap<String, Object>();
	    map.put("name","Jay");
	    map.put("address","Seoul");
	    map.put("data", str);
		return map;
	}
	@ResponseBody
	@RequestMapping(value ="/ajax/test3")
	public Map<String, Object> ajaxTest3(@RequestBody MemberDTO member){
		HashMap<String, Object>map = new HashMap<String, Object>();
	    map.put("name","Jay");
	    map.put("address","Seoul");
	    map.put("data", member);
		return map;
	}
}

@Data
class MemberDTO{
	String id;
	String pw;
}

