package com.kh.daydream.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;




@RequestMapping("/company")
@Controller
public class CompanyController {

	
	//오시는길
	@RequestMapping(value = "/road", method = RequestMethod.GET)
	public String CompanyRoad() {
		return "/company/road";
	}
	
	//업체소개
		@RequestMapping(value = "/introduction", method = RequestMethod.GET)
		public String CompanyIntroduction() {
			return "/company/introduction";
		}
}
