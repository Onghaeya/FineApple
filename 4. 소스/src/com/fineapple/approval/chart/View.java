package com.fineapple.approval.chart;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기 -> DAO 위임
		//2. 데이터 가공?
		//3. 출력 -> JSP 위임
		
		//1.
		ChartDAO dao = new ChartDAO();
		ArrayList<ChartDTO> list = dao.list();
		
		//2.
		
		//3.
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/approval/chart/view.jsp");
		dispatcher.forward(req, resp);
		
	}	
	
}
