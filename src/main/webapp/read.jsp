<%@page import="java.util.Optional"%>
<%@page import="com.app.vo.ProductVO"%>
<%@page import="com.app.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>상품 상세</title>
  </head>
  <body>
  	<%
  		Long id = Long.parseLong(request.getParameter("id"));
  		ProductDAO productDAO = new ProductDAO();
  		// Optional.ofNullable: null 이어도 NPE 없이 안전하게 감쌈 (Flutter null safety 와 동일 개념)
  		Optional<ProductVO> optProduct = Optional.ofNullable(productDAO.select(id));

  		if (optProduct.isPresent()) {
  			ProductVO productVO = optProduct.get();
  	%>
	    <h1>선택한 해당 상품의 상세 정보</h1>
	    <h2>상품 아이디: <%= productVO.getId() %></h2>
	    <h2>상품 명: <%= productVO.getProductName() %></h2>
	    <h2>상품 가격: <%= productVO.getProductPrice() %></h2>
	    <h2>상품 재고량: <%= productVO.getProductStock() %></h2>
	    <br/>
	    <a href="list">목록으로 돌아가기</a>
	    <div>
	    	<a href="update?id=<%= productVO.getId() %>">수정하기</a>
	    	<a href="delete?id=<%= productVO.getId() %>">삭제하기</a>
	    </div>
  	<%
  		} else {
  	%>
	    <h2>존재하지 않는 상품입니다.</h2>
	    <a href="list">목록으로 돌아가기</a>
  	<%
  		}
  	%>
  </body>
</html>
