package com.kh.daydream.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {
	private static final String NAMESPACE = "com.kh.mappers.review.";
	
	@Inject
	private SqlSession sqlsession;
	
	
	public void getDate() {
		Object obj = sqlsession.selectOne(NAMESPACE, "getDate");
		System.out.println(obj);
	}
}
