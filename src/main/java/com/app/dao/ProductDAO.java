package com.app.dao;

import org.apache.ibatis.session.SqlSession;

import com.app.mybatis.config.MyBatisConfig;
import com.app.vo.ProductVO;

public class ProductDAO {
//	세션 공장: sessionfactory (sql session 만듬)
	
	public SqlSession sqlSession;
	
	public ProductDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
//	상품 추가
	public void insert(ProductVO productVO) {
		sqlSession.insert("product.insert", productVO);
	}
}
