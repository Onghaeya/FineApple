package com.fineapple.department.project;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.ProjectListDTO;
import com.fineapple.DTO.ProjectTotalDTO;

public class ProjectCheck extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		ProjectService service = new ProjectService(session);
		
		/*
		//댓글구현은 마지막에, 필요한 목록
		ProjectViewDTO dto = service.getProjectView(latestSeq);	//가장 최근 1건의 프로젝트 + 종속된 댓글 가져오기
		ArrayList<ProjectCommentDTO> clist = dto.getCommentList();	//가져온 프로젝트에 종속된 댓글리스트 담기
		req.setAttribute("clist", clist);
		req.setAttribute("dto", dto);
		*/
		
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		String type = req.getParameter("type");
		
		if (departmentSeq == null) {	//비정상 접근 시
			req.setAttribute("msg", "로그인 후 이용해주세요");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/error.jsp");
			dispatcher.forward(req, resp);
		}
		ArrayList<ProjectListDTO> orglist = service.getProjectList(departmentSeq);	//프로젝트 목록
		
		ArrayList<ProjectListDTO> list = new ArrayList<ProjectListDTO>();	//프로젝트를 담을 객체
		ArrayList<ProjectListDTO> notice = new ArrayList<ProjectListDTO>();	//공지사항을 담을 객체
		String latestSeq = "";	//최신 1건 프로젝트의 번호를 담을 변수
		
		for (ProjectListDTO dto : orglist) {
			ProjectListDTO ldto = new ProjectListDTO();
			if (dto.getType().equals("notice")) {	//공지사항은 notice에 담아서 넘기기
				ldto.setSeq(dto.getSeq());
				ldto.setDepSeq(dto.getDepSeq());
				ldto.setRespSeq(dto.getRespSeq());
				ldto.setSubject(dto.getSubject());
				ldto.setStartDate(dto.getStartDate());
				ldto.setEndDate(dto.getEndDate());
				ldto.setType(dto.getType());
				ldto.setDepartment(dto.getDepartment());
				ldto.setRespName(dto.getRespName());
				
				notice.add(dto);
				
			} else {	//프로젝트는 list에 담아서 넘기기
				ldto.setSeq(dto.getSeq());
				ldto.setDepSeq(dto.getDepSeq());
				ldto.setRespSeq(dto.getRespSeq());
				ldto.setSubject(dto.getSubject());
				ldto.setStartDate(dto.getStartDate());
				ldto.setEndDate(dto.getEndDate());
				ldto.setDepartment(dto.getDepartment());
				ldto.setRespName(dto.getRespName());
				
				String startDate = ldto.getStartDate();
				String endDate = ldto.getEndDate();
				
				list.add(dto);
				if (latestSeq.equals("")) {
					latestSeq = dto.getSeq();	//가장 최근 프로젝트 번호 1개				
				}
			}
		}
		//현재 부서에서 진행중인 모든 프로젝트와 종속된 단위 및 업무들을 가져오기(차트 구현용)
		ArrayList<ProjectTotalDTO> tlist = service.getProjectTotal(departmentSeq);
		
		req.setAttribute("list", list);
		req.setAttribute("notice", notice);
		req.setAttribute("tlist", tlist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/department/project/project.jsp");
		dispatcher.forward(req, resp);
	}
}