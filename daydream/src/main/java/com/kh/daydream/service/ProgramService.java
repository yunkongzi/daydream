package com.kh.daydream.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.daydream.dao.ProgramDao;

@Service
public class ProgramService {

	@Inject
	private ProgramDao adminDao;
}
