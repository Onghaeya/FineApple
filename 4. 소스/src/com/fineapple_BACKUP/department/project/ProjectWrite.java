package com.fineapple.department.project;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.Queue;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.EmployeeDTO;
import com.fineapple.DTO.ProjectDetailViewDTO;
import com.fineapple.DTO.ProjectListDTO;
import com.fineapple.DTO.ProjectUnitViewDTO;

public class ProjectWrite extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		String positionSeq = (String) session.getAttribute("positionSeq");
		
		ProjectService service = new ProjectService(session);

		if (positionSeq.equals("2") || positionSeq.equals("1")) {	//부서장 혹은 사장이 프로젝트 작성
			//담당자(부서원 목록/사번+이름) 가져오기
			ArrayList<EmployeeDTO> list = service.getProjectPerson(departmentSeq);
			req.setAttribute("list", list);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/project/write.jsp");
			dispatcher.forward(req, resp);	

		} else if (positionSeq.equals("3")) {	//과장이 프로젝트 단위 작성
			//부서 내 진행중 프로젝트(번호/주제/담당자/시작일/종료일) 가져오기
			ArrayList<ProjectListDTO> list = service.getProjectListNow(departmentSeq);
			req.setAttribute("list", list);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/project/write_u.jsp");
			dispatcher.forward(req, resp);

		} else if (positionSeq.equals("4")) {	//사원이 프로젝트 단위업무 작성
			//담당자(부서원 목록/사번+이름) + 부서 내 진행중인 프로젝트의 단위들(단위번호/단위업무/시작일/종료일) 가져오기
			ArrayList<EmployeeDTO> elist = service.getProjectPerson(departmentSeq);
			ArrayList<ProjectUnitViewDTO> ulist = service.getProjectUnitList(departmentSeq);
			req.setAttribute("elist", elist);
			req.setAttribute("ulist", ulist);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/project/write_d.jsp");
			dispatcher.forward(req, resp);	
		}
	}
}