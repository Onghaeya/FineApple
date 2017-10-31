package com.fineapple.department.project;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.ProjectDTO;
import com.fineapple.DTO.ProjectDetailDTO;
import com.fineapple.DTO.ProjectUnitDTO;

/**
 * @author 박의영
 *
 */
public class ProjectWriteGo extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		ProjectService service = new ProjectService(session);
		
		String empSeq = (String) session.getAttribute("seq");
		String positionSeq = (String) session.getAttribute("positionSeq");
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		String type = req.getParameter("type");	//작성 페이지 확인(부,사장/과장/사원)
		
		System.out.println(type);
		
		int result = 0;
		
		//검증과 함께 프로세스 진행
		if (type.equals("project") && (positionSeq.equals("2") || positionSeq.equals("1"))) {	//부서장 혹은 사장이 프로젝트 작성
			
			ProjectDTO dto = new ProjectDTO();
			dto.setDepSeq(departmentSeq);
			dto.setEmpSeq(empSeq);
			dto.setRespSeq(req.getParameter("respSeq"));
			dto.setSubject(req.getParameter("subject"));
			dto.setGoal(req.getParameter("goal"));
			dto.setContent(req.getParameter("content"));
			dto.setStartDate(req.getParameter("startDate"));
			dto.setEndDate(req.getParameter("endDate"));
			dto.setType(req.getParameter("notice"));
			
			result = service.writeProject(dto);
			
		} else if (type.equals("unit") && positionSeq.equals("3")) {	//과장이 프로젝트 단위 작성
			
			String start = req.getParameter("start");
			String end = req.getParameter("end");
			String startDate = req.getParameter("startDate");
			String endDate = req.getParameter("endDate");
			
			result = timeCompare(start, end, startDate, endDate);
			
			if (result == 1) {
				ProjectUnitDTO dto = new ProjectUnitDTO();
				dto.setpSeq(req.getParameter("pSeq"));
				dto.setWork(req.getParameter("work"));
				dto.setStartDate(req.getParameter("startDate"));
				dto.setEndDate(req.getParameter("endDate"));
				
				result = service.writeUnit(dto);
			} else {
				req.setAttribute("msg", "작성한 단위의 일정과 프로젝트 일정이 맞지 않습니다");
				RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
				dispatcher.forward(req, resp);								
			}
		} else if (type.equals("detail") && positionSeq.equals("4")) {	//사원이 단위작업 작성
			
			ProjectDetailDTO dto = new ProjectDetailDTO();
			dto.setUnitSeq(req.getParameter("unitSeq"));
			dto.setEmpSeq(req.getParameter("empSeq"));
			dto.setContent(req.getParameter("content"));
			
			result = service.writeDetail(dto);				
		}
		if (result == 0) {	//오류 시 오류메시지와 함께 오류페이지로 이동
			req.setAttribute("msg", "공지사항 작성에 오류가 발생했습니다");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
			
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/project_c.do");
			dispatcher.forward(req, resp);
		}
	}

	/**
	 * 주업무와 부업무의 시간 비교를 통한 유효성 검사 메소드
	 * @param start 주업무 시작일
	 * @param end 주업무 종료일
	 * @param startDate 부업무 시작일
	 * @param endDate 부업무 종료일
	 * @return 유효성 여부(성:1, 패:0)
	 */
	private int timeCompare(String start, String end, String startDate, String endDate) {
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
			Date starts = format.parse(start);	//주업무 시작일
			Date ends = format.parse(end);	//주업무 종료일
			Date startDates = format.parse(startDate);	//부업무 시작일
			Date endDates = format.parse(endDate);	//부업무 종료일

			int compare1 = start.compareTo(startDate);	//프로젝트(시)-단위(시)
			int compare2 = start.compareTo(endDate);	//프로젝트(시)-단위(종)
			int compare4 = end.compareTo(startDate);	//프로젝트(종)-단위(시)
			int compare3 = end.compareTo(endDate);	//프로젝트(종)-단위(종)
			int compare5 = startDate.compareTo(endDate);	//단위(시작)-단위(종료) 비교

			//단위 시작일이 프로젝트 시작일과 같거나 늦고 프로젝트 종료일보다 같거나 이름
			//단위 종료일이 프로젝트 시작일과 같거나 늦고 프로젝트 종료일보다 같거나 이름
			if (compare1 <= 0 && compare2 <= 0 && compare3 >= 0 && compare4 >= 0 && compare5 <= 0) {
				return 1;
			} else {
			}	return 0;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.project / ProjectWriteGo.timeCompare ###");
			return 0;
		}
	}
}