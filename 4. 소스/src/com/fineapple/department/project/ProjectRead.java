package com.fineapple.department.project;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.AccountDTO;
import com.fineapple.DTO.IncomeDTO;
import com.fineapple.DTO.IncomeViewDTO;
import com.fineapple.DTO.OutcomeDTO;
import com.fineapple.DTO.OutcomeViewDTO;
import com.fineapple.DTO.ProjectDetailViewDTO;
import com.fineapple.DTO.ProjectUnitViewDTO;
import com.fineapple.DTO.ProjectViewDTO;
import com.fineapple.department.income.IncomeService;
import com.fineapple.department.outcome.OutcomeService;

public class ProjectRead extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		String userSeq = (String) session.getAttribute("seq");
		String seq = req.getParameter("seq");	//해당 문서번호
		String type = req.getParameter("type");	//해당 문서종류
		
		ProjectService service = new ProjectService(session); 
		
		if (departmentSeq == null) {
			req.setAttribute("msg", "로그인 후 이용해주세요");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
		}
		
		if (type.equals("project")) {	//프로젝트 문서 불러오기

			ProjectViewDTO dto = service.getProjectView(seq);
			req.setAttribute("dto", dto);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/project/read_p.jsp");
			dispatcher.forward(req, resp);
			
		} else if (type.equals("units")) {	//단위 문서 불러오기
			
			ProjectUnitViewDTO dto = service.getProjectUnit(seq);
			req.setAttribute("dto", dto);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/project/read_u.jsp");
			dispatcher.forward(req, resp);
			
		} else if (type.equals("detail")) {	//업무 문서 불러오기

			ProjectDetailViewDTO dto = service.getProjectDetail(seq);
			req.setAttribute("dto", dto);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/project/read_d.jsp");
			dispatcher.forward(req, resp);
		}
	}
}