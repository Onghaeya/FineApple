package com.fineapple.all.survey;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.DepartmentDTO;
import com.fineapple.DTO.SurveyAnswerTypeDTO;
import com.fineapple.DTO.tblPositionDTO;

public class Add extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//대상으로 선택할 부서 목록과 직급 목록을 출력
		ArrayList<DepartmentDTO> dlist = new ArrayList<DepartmentDTO>();
		ArrayList<tblPositionDTO> plist = new ArrayList<tblPositionDTO>();
		ArrayList<SurveyAnswerTypeDTO> alist = new ArrayList<SurveyAnswerTypeDTO>(); 
		
		SurveyService service = new SurveyService();
		dlist = service.getDepartment(); //부서 얻어오기
		plist = service.getPosition(); 		//직급 얻어오기
		alist = service.getAnwerType();	//답안 유형 얻어오기
		
		req.setAttribute("dlist", dlist);
		req.setAttribute("plist", plist);
		req.setAttribute("alist", alist);
		
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/survey/add.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
