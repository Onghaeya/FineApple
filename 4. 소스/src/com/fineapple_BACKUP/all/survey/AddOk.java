package com.fineapple.all.survey;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.SurveyDTO;
import com.fineapple.DTO.SurveyMultiChoiceDTO;
import com.fineapple.DTO.SurveyQuestionDTO;

public class AddOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

		SurveyService service = new SurveyService();

		HttpSession session = req.getSession(); //empSeq를 얻기 위한 session
		SurveyDTO sdto = new SurveyDTO();		
		req.setCharacterEncoding("UTF-8");
		sdto.setSubject(req.getParameter("subject"));	//제목 
		sdto.setPurpose(req.getParameter("purpose"));
		sdto.setEmpSeq((String)session.getAttribute("seq")); //게시자 seq
		sdto.setStartDate(req.getParameter("startDate"));
		sdto.setEndDate(req.getParameter("endDate"));
		
		//0이면 null로 치환. 0으로하면 부모키 없다그럼
		if (req.getParameter("targetDepartment").equals("0")) {
			sdto.setTargetDepartment(null);
		} else {
			sdto.setTargetDepartment(req.getParameter("targetDepartment"));			
		}
		//0이면 null로 치환
		if (req.getParameter("targetPosition").equals("0")) {
			sdto.setTargetPosition(null);
		} else {
			sdto.setTargetPosition(req.getParameter("targetPosition"));			
		}
		
		sdto.setAnonymity(req.getParameter("anonymity")); //체크 안하면 null로 나온다. 체크하면 y
		
		//각 질문지들의 list를 만들어서 sdto에 담기
		int questionNumber = 1; //질문 번호를 위한 변수
		//설문조사질문dto리스트. 안에 질문 정보들이랑 질문 당 답변 정보 다 들어있음
		ArrayList<SurveyQuestionDTO> sqList = new ArrayList<SurveyQuestionDTO>();
		
		for(int i=1; i<=20; i++) {
			
			if (req.getParameter("valid" + i).equals("y")) { //valid가 y라면(호라성화된 질문이라면	
				
				SurveyQuestionDTO sqdto = new SurveyQuestionDTO();
				sqdto.setQuestionNumber(questionNumber); //질문 번호
				sqdto.setQuestion(req.getParameter("question" + i)); //질문
				sqdto.setAnswerTypeSeq(req.getParameter("answerTypeSeq" + i)); //답변 타입
				
				//multiNum과 answerLimit
				if(sqdto.getAnswerTypeSeq().equals("1") 
						|| sqdto.getAnswerTypeSeq().equals("2")) { //주관식이면 길이 제한을 넣고
					sqdto.setAnswerLimit(Integer.parseInt(req.getParameter("answerLimit" + i)));
					
				} else if (sqdto.getAnswerTypeSeq().equals("4")) { //복수 선택형이면 복수 선택 개수를 넣기
					sqdto.setMultipleNum(Integer.parseInt(req.getParameter("multipleNum" + i)));
				}
				
				sqdto.setRequired(req.getParameter("required" + i)); //필수 대답 문항인지
				
				//선택형 답변이라면 문항 넣어주기
				//주관식은 null이겠지
				//단일 선택형
				if (sqdto.getAnswerTypeSeq().equals("3")) { 
					
					ArrayList<SurveyMultiChoiceDTO> smcList 
						= new ArrayList<SurveyMultiChoiceDTO>(); //질문 문항들을 담을 리스트
					
					String[] rAnswer = req.getParameterValues("rAnswer" + i); //응답들을 받아온다
				
					for(int j=0; j<rAnswer.length; j++) {	//배열에 있는 문항 내용을 list에 옮겨쥬기
						SurveyMultiChoiceDTO  smcdto = new SurveyMultiChoiceDTO();
						if(rAnswer[j] != null && !(rAnswer[j].equals(""))) {
							System.out.println("r : " + rAnswer[j]);
							smcdto.setAnswer(rAnswer[j]);
							//기타 추가할거면 기타도 여기 넣어주기
							smcList.add(smcdto);
						}
					}
					
					sqdto.setSmcList(smcList); //질문지 dto에 문항 넣어주기
					
				//복수 선택형(체크박스)
				} else if (sqdto.getAnswerTypeSeq().equals("4")) {
					
					ArrayList<SurveyMultiChoiceDTO> smcList 
						= new ArrayList<SurveyMultiChoiceDTO>();
					
					String[] cAnswer = req.getParameterValues("cAnswer" + i);
			
					for(int j=0; j<cAnswer.length; j++) {
						SurveyMultiChoiceDTO  smcdto = new SurveyMultiChoiceDTO();
						if(cAnswer[j] != null && !(cAnswer[j].equals(""))) {
							System.out.println("c : " + cAnswer[j]);
							smcdto.setAnswer(cAnswer[j]);
							//기타 추가할거면 기타도 여기 넣어주기
							smcList.add(smcdto);
						}
					}
					
					sqdto.setSmcList(smcList); //질문지 dto에 문항 넣어주기
					
				}
				sqList.add(sqdto);
				questionNumber++;
			}//if
			
			
		}//for
		
		sdto.setSqList(sqList); //서베이정보, 질문list, 응답list를 set
		int result = service.add(sdto);
		req.setAttribute("result", result);
		
		//글보기로 돌아ㅏ가기 위해 방금 넣은 설문조사의 seq 값 가져오기
		String seq = service.getMaxSurveySeq();
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/survey/addok.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}