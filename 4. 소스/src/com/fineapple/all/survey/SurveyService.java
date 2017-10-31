package com.fineapple.all.survey;
import java.util.ArrayList;
import java.util.HashMap;

import com.fineapple.DTO.DepartmentDTO;
import com.fineapple.DTO.SurveyAnswerDTO;
import com.fineapple.DTO.SurveyAnswerTypeDTO;
import com.fineapple.DTO.SurveyDTO;
import com.fineapple.DTO.SurveyQuestionDTO;
import com.fineapple.DTO.VSurveyDTO;
import com.fineapple.DTO.tblPositionDTO;

/**
 * @author 해나
 *설문조사 관련 service 클래스
 */
public class SurveyService {
	
	SurveyDAO dao;
	
	public SurveyService () {
		dao = new SurveyDAO();
	}
	
	//부서 목록 얻어오기
	public ArrayList<DepartmentDTO> getDepartment() {
		//ArrayList<DepartmentDTO> dlist = new ArrayList<DepartmentDTO>();
		return dao.getDepartment();
	}

	//직급 목록 얻어오기
	public ArrayList<tblPositionDTO> getPosition() {
		//ArrayList<tblPositionDTO> plist = new ArrayList<tblPositionDTO>();
		return dao.getPosition();
	}

	public ArrayList<SurveyAnswerTypeDTO> getAnwerType() {
		
		return dao.getAnswerType();
	}

	public int add(SurveyDTO sdto) {
		
		//1. 설문지 insert
		int surveyResult = dao.addSurvey(sdto);
		String surveySeq = dao.getMaxSurveySeq(); //방금 넣은 설문조사 seq 얻어오기
		
		for(SurveyQuestionDTO dto : sdto.getSqList()) {
			dto.setSurveySeq(surveySeq); //질문테이블에 넣어주기
		}
		
		//2. 질문 insert
		sdto = dao.addSurveyQuestion(sdto);		
		
		//3. 선택형 응답 insert
		dao.addSurveyMultipleChoice(sdto);
		
		return surveyResult;
	}

	public String getMaxSurveySeq() {
		return dao.getMaxSurveySeq();
	}

	public ArrayList<VSurveyDTO> getSurveyList(HashMap<String, String> map) {
		
		ArrayList<VSurveyDTO> list = new ArrayList<VSurveyDTO>();
		list = dao.getSurvey(map);//기본 정보
		
		list = dao.getParticipantsCount(list); //참여자 수
		
		list = dao.getQuestionCount(list); //문항 수
		
		for(VSurveyDTO dto : list) {
			dto.setStartDate(dto.getStartDate().substring(0, 10));
			dto.setEndDate(dto.getEndDate().substring(0, 10));
			dto.setRegDate(dto.getRegDate().substring(0, 10));
			
		}
		
		return list;
	}
	
	//페이징 위한
	public int getTotalCount(HashMap<String, String> map) {
		return dao.getTotalCount(map);
	}

	public VSurveyDTO getView(String seq) {
		
		VSurveyDTO dto = new VSurveyDTO();
		//1. vsurvey 얻어오기
		dto = dao.getvSurvey(seq);
		
		dto.setStartDate(dto.getStartDate().substring(0, 10)); //날짜까지만 잘라주기
		dto.setEndDate(dto.getEndDate().substring(0, 10));
		
		//2. question 얻어오기
		dto = dao.getQuestions(dto);
		
		//3. 선택형이라면 multiChoice 가져오기
		dto = dao.getMultiChoice(dto);
		
		return dto;
	}

	public boolean checkParticipants(String empSeq, String seq) {
		
		int result = dao.checkParticipants(empSeq, seq);
		//만약 대답을 한 번도 한 적 없다면 참여한 적 없는거니까 true(업무 진행)
		if (result == 0) {
			return true;
		} else {
			return false;
		}
		
	}

	//해당 설문조사의 문제들과 답 타입을 얻기 위한 메소드
	public ArrayList<SurveyQuestionDTO> getsqList(String seq) {
		return dao.getsqList(seq);
		
	}

	//응담 디비에 저장하기
	public int addAnswer(ArrayList<SurveyAnswerDTO> saList) {
		return dao.addAnswer(saList);
		
	}

	public VSurveyDTO getResult(String seq) {
		
		VSurveyDTO dto = new VSurveyDTO();
		
		//설문조사 기본 정보
		dto = dao.getvSurveyResult(seq);
		
		//설문조사문항들
		dto.setSqList(dao.getsqListResult(seq));
		
		//각 문항들에 대답한 사람 총 수
		dto = dao.getAnswerCount(dto);
		
		//각 문항들 중 선택형
		dto = dao.getMultiChoice(dto);
		//각 문항들의 대답한 사람 수
		dto = dao.getMultiCount(dto);
		
		//답변
		dto = dao.getAnswerResult(dto);
		
		//참여한 사람과 시간
		dto = dao.getSurveyTime(dto);
		
		//참여자 수
		dto.setParticipantsCount(dao.getParticipantsCount(dto.getSeq()));
		return dto;
	}
	
}