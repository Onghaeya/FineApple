package com.fineapple.department.temp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.util.DBUtil;

public class TempStart extends HttpServlet {
	
	private Connection conn;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			HttpSession session = req.getSession();
			
			conn = DBUtil.getConnection();
			
			String seq = req.getParameter("seq");
			String name = "";
			String departmentSeq = "";
			String positionSeq = "";
			System.out.println(seq);
			
			String sql = "select * from employee where seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
				departmentSeq = rs.getString("departmentSeq");
				positionSeq = rs.getString("positionSeq");
			}
			session.setAttribute("seq", seq);
			session.setAttribute("name", name);
			session.setAttribute("departmentSeq", departmentSeq);
			session.setAttribute("positionSeq", positionSeq);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/temp.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / TempStart.doGet ###");
		}
	}
}