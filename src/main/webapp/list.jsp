<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.app.dao.ProductDAO" %>
<%@ page import="com.app.vo.ProductVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>상품 목록</title>
  </head>
  <body>
    <%
        ProductDAO productDAO = new ProductDAO();
        List<ProductVO> products = productDAO.selectAll();
    %>

    <table border="1">
      <tr>
        <th>상품번호</th>
        <th>상품명</th>
        <th>상품가격</th>
        <th>상품재고</th>
      </tr>
      <%
          for(ProductVO product : products) {
      %>
          <tr>
              <td><%= product.getId() %></td>
              <!-- 해당 상품명을 클릭 하면 /read 로 이동, id를 쿼리스트링으로 전달 -->
              <td>
                <a href="read?id=<%= product.getId() %>">
                	<%= product.getProductName() %>
                </a>
              </td>
              <td><%= product.getProductPrice() %></td>
              <td><%= product.getProductStock() %></td>
          </tr>
      <%
          }
      %>
    </table>
  </body>
</html>
