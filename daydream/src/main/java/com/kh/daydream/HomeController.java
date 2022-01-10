package com.kh.daydream;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.daydream.service.TeacherService;

import com.kh.daydream.vo.TeacherVo;

@Controller
public class HomeController {
   
   // 메인 페이지
   @RequestMapping(value="/main", method=RequestMethod.GET)
   public String mainHome() {
      return "/main";
   }
   //
}   
	
	
