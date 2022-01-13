package com.kh.daydream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
   
   // 메인 페이지
   @RequestMapping(value="/", method=RequestMethod.GET)
   public String home() {
      return "redirect:/main";
   }
   
   @RequestMapping(value="/main", method=RequestMethod.GET)
   public String mainHome() {
      return "/main";
   }
   //
}   
	

