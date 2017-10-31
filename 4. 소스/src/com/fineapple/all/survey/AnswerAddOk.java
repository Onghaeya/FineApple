package com.fineapple.all.survey;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.SurveyAnswerDTO;
import com.fineapple.DTO.SurveyQuestionDTO;

public class AnswerAddOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		SurveyService service = new SurveyService();
		HttpSession session = req.getSession();
		String empSeq = (String)session.getAttribute("seq");
		
		String seq = req.getParameter("seq"); //방금 설문의 번호
		
		//문제들의 seq와 답변 타입을 가져온다.
		ArrayList<SurveyQuestionDTO> sqList = new ArrayList<SurveyQuestionDTO>();
		sqList = service.getsqList(seq);
		
		ArrayList<SurveyAnswerDTO> saList= new ArrayList<SurveyAnswerDTO>();
		//답변 리스트를 만든다.
		for (SurveyQuestionDTO sqdto : sqList) {
			
			//주관식이라면!
			if(sqdto.getAnswerTypeSeq().equals("1") 
					|| sqdto.getAnswerTypeSeq().equals("2")) {
				
				//답변이 하나지만 어쨌든 arraylist에 넣어야됨
				//null은??
				SurveyAnswerDTO sadto = new SurveyAnswerDTO();
				sadto.setDescriptiveAnswer(req.getParameter("a" + sqdto.getSeq())); //문제의 답변
				sadto.setEmpSeq(empSeq); //등록자
				sadto.setSurveyQuestionSeq(sqdto.getSeq()); //문항 번호
				saList.add(sadto);
				
			} else if (sqdto.getAnswerTypeSeq().equals("3")) { //단일 선택
				
				SurveyAnswerDTO sadto = new SurveyAnswerDTO();
				sadto.setSurveyMultiChoiceSeq(req.getParameter("a" + sqdto.getSeq())); //문제의 답변
				sadto.setEmpSeq(empSeq); //등록자
				sadto.setSurveyQuestionSeq(sqdto.getSeq()); //문항 번호
				saList.add(sadto);
				
			} else if (sqdto.getAnswerTypeSeq().equals("4")) { //복수 선택형
				
				//여러개니까 배열로 받아줌
				String[] answers = req.getParameterValues("a" + sqdto.getSeq());
				for(String answer : answers) {
					
					SurveyAnswerDTO sadto = new SurveyAnswerDTO();
					sadto.setSurveyMultiChoiceSeq(answer); //문제의 답변
					sadto.setEmpSeq(empSeq); //등록자
					sadto.setSurveyQuestionSeq(sqdto.getSeq()); //문항 번호
					saList.add(sadto);

				}
				
			}
			
		} //for
		
		int result = service.addAnswer(saList); //이제 디비에 저장
		
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/survey/answeraddok.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}