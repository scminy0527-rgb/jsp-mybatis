package com.app.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.dao.ProductDAO;
import com.app.vo.ProductVO;

public class Write extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		ProductDAO productDAO = new ProductDAO();
		ProductVO productVO = new ProductVO();

		productVO.setName(req.getParameter("name"));
		productVO.setPrice(Integer.parseInt(req.getParameter("price")));
		productVO.setStock(Integer.parseInt(req.getParameter("stock")));

		productDAO.insert(productVO);
	}
}
