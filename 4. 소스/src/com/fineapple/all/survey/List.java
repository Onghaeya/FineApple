package com.fineapple.all.survey;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.VSurveyDTO;

public class List extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		
		SurveyService service = new SurveyService();
		
		//페이지
		int nowPage = 0;
		int totalCount = 0;
		int pageSize = 15;
		int totalPage = 0;
		int start = 0;
		int end = 0;
		int n = 0;
		int loop = 0;
		int blockSize = 5;
		
		String page = req.getParameter("page");
		if (page == null) nowPage = 1;
		else nowPage = Integer.parseInt(page);
		
		start = ((nowPage - 1) * pageSize) + 1;
		end = start + pageSize - 1;
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start", start + "");
		map.put("end", end + "");
		
		ArrayList<VSurveyDTO> surveyList = new ArrayList<VSurveyDTO>();
		surveyList = service.getSurveyList(map);
		
		
		//총 게시물 수 얻어오기(일정 숫자 이상 페이지 못 넘어가게 하려고
		totalCount = service.getTotalCount(map);
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		String pagebar = "<nav><ul class='pagination'>";
		
		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1; //현재페이지
		
		//이전 5 페이지로 가는 블럭
		if (n == 1) {
			pagebar += String.format("<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
		} else {
			pagebar += String.format("<li><a href='/Project/all/freeboard/list.do?page=%d' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>", n-1);
		}
		
		//이제 진짜 숫자 쓰여진 페이지바
		while (!(loop > blockSize || n > totalPage)) {
			
			if (n == nowPage) { //현재 페이지
				pagebar += String.format(" <li class='active'><a href='#'>%d</a></li> ", n);
			} else { //나머지 페이지
				pagebar += String.format(" <li><a href='/Project/all/freeboard/list.do?page=%d'>%d</a></li> ", n, n);
			}
			
			loop++;//회전 수 제어 역할
			n++;//블럭의 시작 페이지 역할 + 페이지 번호 역할
		}
		
		//다음 5개로 가는 블럭
		if (n > totalPage) {
			pagebar += String.format("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		} else {		
			pagebar += String.format("<li><a href='/Project/all/freeboard/list.do?page=%d' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>", n);
		}
		
		pagebar += "</ul></nav>";
		
		req.setAttribute("surveyList", surveyList);
		req.setAttribute("map", map);
		req.setAttribute("nowPage", nowPage); //현재 페이지 반환
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("pagebar", pagebar);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/survey/list.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}