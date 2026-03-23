<%@page import="java.util.Optional"%>
<%@page import="com.app.vo.ProductVO"%>
<%@page import="com.app.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<style type="text/css">
   label {
      display : "block";
   }
</style>
</head>
<body>

   <%
      Long id = Long.parseLong(request.getParameter("id"));
      ProductDAO productDAO = new ProductDAO();
      // select()는 ProductVO를 반환하므로 Optional.ofNullable로 감쌈
      Optional<ProductVO> foundProduct = Optional.ofNullable(productDAO.select(id));
   %>

   <% if (foundProduct.isPresent()) {
         ProductVO product = foundProduct.get();
   %>
		<form action="update-ok" method="post">
			<!-- id는 화면에 안 보이게 hidden으로 전달 -->
	      <input type="hidden" name="id" value="<%= product.getId() %>" />

	      <label>
	         <span>상품명</span>
	         <input type="text" name="productName" value="<%= product.getProductName() %>" />
	      </label>
	      <label>
	         <span>상품 가격</span>
	         <input type="text" name="productPrice" value="<%= product.getProductPrice() %>" />
	      </label>
	      <label>
	         <span>상품 재고</span>
	         <input type="text" name="productStock" value="<%= product.getProductStock() %>" />
	      </label>
	      <button type="submit">수정 완료</button>
	   </form>
   <% } else { %>
      <h2>존재하지 않는 상품입니다.</h2>
      <a href="list">목록으로 돌아가기</a>
   <% } %>
   
</body>
</html>

