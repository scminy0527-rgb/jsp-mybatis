package com.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.app.mybatis.config.MyBatisConfig;
import com.app.vo.ProductVO;

public class ProductDAO {
//	세션 공장: sessionfactory (sql session 만듬)
	
	private SqlSession sqlSession;
	
	public ProductDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
//	상품 추가
	public void insert(ProductVO productVO) {
		sqlSession.insert("product.insert", productVO);
	}
	
//	전체조회
	public List<ProductVO> selectAll() {
		List<ProductVO> products = sqlSession.selectList("product.selectAll");
		return products;
	}
	
//	특정 상품만 조회
	public ProductVO select(Long id) {
		return sqlSession.selectOne("product.select", id);
	}
	
//	업데이트
//	이걸 처리해주는 서블릿 구성
	public void update(ProductVO productVO) {
		sqlSession.update("product.update", productVO);
	}
	
//	삭제
//	상품 삭제를 하는거 구현
	public void delete(Long id) {
		sqlSession.delete("product.delete", id);
	}
}















