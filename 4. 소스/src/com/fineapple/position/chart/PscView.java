package com.fineapple.position.chart;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PscView extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기	-> DAO 위임
		//2. 데이터 가공 
		//3. 출력 -> JSP 위임
		
		//1.
		PsChartDAO dao = new PsChartDAO();
		ArrayList<PSChartDTO> list = dao.list();
		
		//2.
		
		//3. 
		req.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/position/schedule/chart/pscview.jsp");
		dispatcher.forward(req, resp);
		
		System.out.println("여기 나오쉼?");
		
	}
}