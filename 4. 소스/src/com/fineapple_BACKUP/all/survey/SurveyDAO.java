package com.fineapple.all.survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.fineapple.DTO.DepartmentDTO;
import com.fineapple.DTO.SurveyAnswerDTO;
import com.fineapple.DTO.SurveyAnswerTypeDTO;
import com.fineapple.DTO.SurveyDTO;
import com.fineapple.DTO.SurveyMultiChoiceDTO;
import com.fineapple.DTO.SurveyQuestionDTO;
import com.fineapple.DTO.SurveyTimeDTO;
import com.fineapple.DTO.VSurveyDTO;
import com.fineapple.DTO.tblPositionDTO;
import com.fineapple.util.DBUtil;

public class SurveyDAO {
	
	private Connection conn;
	
	public SurveyDAO() {
		conn = DBUtil.getConnection();
	}
	
	//부서가져오기
	public ArrayList<DepartmentDTO> getDepartment() {
		try {
			
			ArrayList<DepartmentDTO> dlist = new ArrayList<DepartmentDTO>();
			String sql = "SELECT * FROM department";
			
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				DepartmentDTO dto = new DepartmentDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setDepartment(rs.getString("department"));
				dlist.add(dto);		
			}

			return dlist;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
	}

	//직급 가져오기
	public ArrayList<tblPositionDTO> getPosition() {
	
		try {
			
			ArrayList<tblPositionDTO> plist = new ArrayList<tblPositionDTO>();
			
			String sql = "SELECT * FROM tblPosition";
			Statement stat = conn.createStatement()	;
			ResultSet rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				tblPositionDTO dto = new tblPositionDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setPosition(rs.getString("position"));
				plist.add(dto);
			}
			
			return plist; 
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	//응답 종류 반환
	public ArrayList<SurveyAnswerTypeDTO> getAnswerType() {
		
		try {
			ArrayList<SurveyAnswerTypeDTO> alist = new ArrayList<SurveyAnswerTypeDTO>();
			
			String sql = "SELECT * FROM surveyAnswerType";
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			while(rs.next()) {
				SurveyAnswerTypeDTO dto = new SurveyAnswerTypeDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setAnswerType(rs.getString("answerType"));
				alist.add(dto);
			}
			
			return alist;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
		
	}

	//설문지 정보 insert
	public int addSurvey(SurveyDTO sdto) {
		
		
		try {
			
			String sql = "INSERT INTO survey (seq, subject, purpose, empSeq, startDate, endDate, targetDepartment, targetPosition, anonymity) "
									+ "VALUES (surveySeq.nextVal, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, sdto.getSubject());
			stat.setString(2, sdto.getPurpose());
			stat.setString(3, sdto.getEmpSeq());
			stat.setString(4, sdto.getStartDate()); //안되려나??/
			stat.setString(5, sdto.getEndDate());
			stat.setString(6, sdto.getTargetDepartment());
			stat.setString(7, sdto.getTargetPosition());
			stat.setString(8, sdto.getAnonymity());
			return stat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}

	//survey 테이블의 가장 최신 얻어오기
	public String getMaxSurveySeq() {
		try {
			
			String sql = "SELECT MAX(seq) FROM survey";
			
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			String seq = "";
			while(rs.next()) {
			
				seq = rs.getString(1);
				
			}
			
			return seq; 
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
	}

	//질문 insert
	public SurveyDTO addSurveyQuestion(SurveyDTO sdto) {
		try {
			
			//안에 들어가있는 질문 모두 해줘야됨
			for(SurveyQuestionDTO dto : sdto.getSqList()) {
				String sql = "INSERT INTO surveyQuestion (seq, surveySeq, questionNumber, question, multipleNum, answerLimit, required, answerTypeSeq) "
										+ "VALUES (surveyQuestionSeq.nextVal, ?, ?, ?, ?, ?, ?, ?)";
			
				PreparedStatement pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getSurveySeq());
				pstat.setInt(2, dto.getQuestionNumber());
				pstat.setString(3, dto.getQuestion());
				pstat.setInt(4, dto.getMultipleNum());
				pstat.setInt(5, dto.getAnswerLimit());
				pstat.setString(6, dto.getRequired());
				pstat.setString(7, dto.getAnswerTypeSeq());
				pstat.executeUpdate();
				pstat.close();
			
				sql = "SELECT MAX(seq) FROM surveyQuestion";
				Statement stat = conn.createStatement();
				ResultSet rs = stat.executeQuery(sql);
				
				if(rs.next()) { 
					if(dto.getSmcList() != null) { //만약 smclist가 존재한다면 부모 번호 넣어주기
						for(SurveyMultiChoiceDTO smcdto : dto.getSmcList()) {
							smcdto.setSurveyQuestionSeq(rs.getString(1));
						}
					}
				}
				
				
			}
			return sdto;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	//선택형 응답 insert
	public void addSurveyMultipleChoice(SurveyDTO sdto) {
		try {
				
			String sql = "INSERT INTO surveyMultiChoice (seq, answer, etc, surveyQuestionSeq) "
								+ "VALUES (surveyMultiChoiceSeq.nextVal, ?, ?, ?)";
			for (SurveyQuestionDTO sqdto : sdto.getSqList()) {
				if(sqdto.getSmcList() != null) { //선택형 응답이 있다면
					for (SurveyMultiChoiceDTO smcdto : sqdto.getSmcList()) {
						
						PreparedStatement stat = conn.prepareStatement(sql);
						stat.setString(1, smcdto.getAnswer());
						stat.setString(2, smcdto.getEtc());
						stat.setString(3, smcdto.getSurveyQuestionSeq());
						stat.executeUpdate();
						
					}
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

	public String getMaxSQSeq() {
		try {
			String seq = "";
			
			String sql = "SELECT MAX(seq) FROM surveyQuestion";

			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				seq = rs.getString(1);
			}
			
			return seq;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
	}

	public ArrayList<VSurveyDTO> getSurvey(HashMap<String, String> map) {
		try {
			
			ArrayList<VSurveyDTO> list = new ArrayList<VSurveyDTO>();
			
			String sql 
				= String.format("select * from (select a.*, rownum as rnum from "
					+ "(SELECT * FROM vSurvey order by seq desc) a) where rnum >= %s and rnum <= %s"
						, map.get("start"), map.get("end"));
				
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			while(rs.next()) {
				VSurveyDTO dto = new VSurveyDTO();
				dto.setName(rs.getString("name"));
				dto.setEmpSeq(rs.getString("empSeq"));
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setPurpose(rs.getString("purpose"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setTargetDepartment(rs.getString("targetDepartment"));
				dto.setDepartment(rs.getString("department"));
				dto.setTargetPosition(rs.getString("targetPosition"));
				dto.setPosition(rs.getString("position"));
				dto.setAnonymity(rs.getString("anonymity"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setEnd(rs.getInt("end"));
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
	}

	//참여자 수
	public ArrayList<VSurveyDTO> getParticipantsCount(ArrayList<VSurveyDTO> list) {
		try {
			
			String sql = "select count(*) FROM surveyAnswer where surveyQuestionSeq in (SELECT DISTINCT seq from surveyQuestion WHERE surveySeq = ?)";
			for (VSurveyDTO dto : list) {
				PreparedStatement stat = conn.prepareStatement(sql);
				stat.setString(1, dto.getSeq());
				ResultSet rs = stat.executeQuery();
				
				if(rs.next()) {
					dto.setParticipantsCount(rs.getInt(1));
				}
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
	}

	//문항 수
	public ArrayList<VSurveyDTO> getQuestionCount(ArrayList<VSurveyDTO> list) {
		String sql = "SELECT COUNT(*) FROM surveyQuestion WHERE surveySeq = ?";
		try {
			for (VSurveyDTO dto : list) {
				PreparedStatement stat = conn.prepareStatement(sql);
				stat.setString(1, dto.getSeq());
				ResultSet rs = stat.executeQuery();
				
				if(rs.next()) {
					dto.setQuestionCount(rs.getInt(1));
				}
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	//총 게시물 개수 구하기
	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			String sql ="SELECT COUNT(*) FROM survey";
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			
			return 0; 
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
			
	}

	public VSurveyDTO getvSurvey(String seq) {
		try {
			
			VSurveyDTO dto = new VSurveyDTO();
			
			String sql = "SELECT * FROM vSurvey WHERE seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setEmpSeq(rs.getString("empSeq"));
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setPurpose(rs.getString("purpose"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setTargetDepartment(rs.getString("targetDepartment"));
				dto.setDepartment(rs.getString("department"));
				dto.setTargetPosition(rs.getString("targetPosition"));
				dto.setPosition(rs.getString("position"));
				dto.setAnonymity(rs.getString("anonymity"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setEnd(rs.getInt("end"));
			}
			return dto;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	public VSurveyDTO getQuestions(VSurveyDTO dto) {
		
		try {
			
			String sql = "SELECT * FROM surveyQuestion where surveySeq = ? ORDER BY questionNumber";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSeq());
			ResultSet rs = stat.executeQuery();
			
			ArrayList<SurveyQuestionDTO> sqList = new ArrayList<SurveyQuestionDTO>();
			while(rs.next()) {
				SurveyQuestionDTO sqdto = new SurveyQuestionDTO();
				sqdto.setSeq(rs.getString("seq"));
				sqdto.setQuestionNumber(rs.getInt("questionNumber"));
				sqdto.setQuestion(rs.getString("question"));
				sqdto.setMultipleNum(rs.getInt("multipleNum"));
				sqdto.setAnswerLimit(rs.getInt("answerLimit"));
				sqdto.setRequired(rs.getString("required"));
				sqdto.setAnswerTypeSeq(rs.getString("answerTypeSeq"));
				sqList.add(sqdto);
			}
			
			dto.setSqList(sqList);
			return dto;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	public VSurveyDTO getMultiChoice(VSurveyDTO dto) {
		
		try {
			
			String sql = "SELECT * FROM surveyMultiChoice WHERE surveyQuestionSeq = ?";
			for(SurveyQuestionDTO sqdto : dto.getSqList()) {
				
				PreparedStatement stat = conn.prepareStatement(sql);
				stat.setString(1, sqdto.getSeq());
				ResultSet rs = stat.executeQuery();
				
				ArrayList<SurveyMultiChoiceDTO> smcList = new ArrayList<SurveyMultiChoiceDTO>();
				
				while(rs.next()) {
					SurveyMultiChoiceDTO smcdto = new SurveyMultiChoiceDTO();
					smcdto.setSeq(rs.getString("seq"));
					smcdto.setAnswer(rs.getString("answer"));
					smcdto.setEtc(rs.getString("etc"));
					smcList.add(smcdto);
				}
				sqdto.setSmcList(smcList); //각 질문마다 넣어주기
			}
		
			return dto;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	//참여했던 사람인지 찾아내기
	public int checkParticipants(String empSeq, String seq) {
		int result = 0;

		try {
			
			System.out.println(seq);
			
			String sql = "select count(*) from partiCount where empSeq = ? AND surveySeq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, empSeq);
			stat.setString(2, seq);
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
			}

			return result;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result = 0;
	}

	public ArrayList<SurveyQuestionDTO> getsqList(String seq) {
		try {
			
			ArrayList<SurveyQuestionDTO> sqList = new ArrayList<SurveyQuestionDTO>();
			String sql = "SELECT seq, answerTypeSeq FROM SurveyQuestion WHERE surveySeq = ?";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			ResultSet rs = stat.executeQuery();
			
			while(rs.next()) {
				SurveyQuestionDTO dto = new SurveyQuestionDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setAnswerTypeSeq(rs.getString("answerTypeSeq"));
				sqList.add(dto);
			}
			
			return sqList;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	public int addAnswer(ArrayList<SurveyAnswerDTO> saList) {
		try {
			
			int result = 1;
			String sql = "INSERT INTO surveyAnswer (seq, surveyQuestionSeq, surveyMultiChoiceSeq, descriptiveAnswer, regDate, empSeq) "
								+ "VALUES (surveyAnswerSeq.nextVal, ?, ?, ?, DEFAULT, ?)";
			
			for (SurveyAnswerDTO dto : saList) { //응답 리스트 모두 저장
			
				PreparedStatement stat = conn.prepareStatement(sql);
				stat.setString(1, dto.getSurveyQuestionSeq());
				stat.setString(2, dto.getSurveyMultiChoiceSeq());
				stat.setString(3, dto.getDescriptiveAnswer());
				stat.setString(4, dto.getEmpSeq());
				int result2 = stat.executeUpdate();

				//한 번이라도 0이 결과로 나오면 0 반환 
				if(result2 == 0) {
					result = 0;
				}
			}
			
			return result;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return 0;
	}

	//차트를 위해 survey 기본 정보 뽑아온다
	public VSurveyDTO getvSurveyResult(String seq) {
		try {
			
			VSurveyDTO dto = new VSurveyDTO();
			
			String sql = "SELECT * FROM vSurvey WHERE seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setEmpSeq(rs.getString("empSeq"));
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				/*dto.setPurpose(rs.getString("purpose"));*/
				/*dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));*/
				dto.setTargetDepartment(rs.getString("targetDepartment"));
				dto.setDepartment(rs.getString("department"));
				dto.setTargetPosition(rs.getString("targetPosition"));
				dto.setPosition(rs.getString("position"));
				dto.setAnonymity(rs.getString("anonymity"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setEnd(rs.getInt("end"));
			}
			return dto;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	//차트를 위해 question 리스트 뽑아온다
	public ArrayList<SurveyQuestionDTO> getsqListResult(String seq) {
		try {
			
			String sql = "SELECT * FROM surveyQuestion where surveySeq = ? ORDER BY questionNumber";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			ResultSet rs = stat.executeQuery();
			
			ArrayList<SurveyQuestionDTO> sqList = new ArrayList<SurveyQuestionDTO>();
		
			while(rs.next()) {
				SurveyQuestionDTO sqdto = new SurveyQuestionDTO();
				sqdto.setSeq(rs.getString("seq"));
				sqdto.setQuestionNumber(rs.getInt("questionNumber"));
				sqdto.setQuestion(rs.getString("question"));
				/*sqdto.setRequired(rs.getString("required"));*/
				sqdto.setAnswerTypeSeq(rs.getString("answerTypeSeq"));
				sqList.add(sqdto);
			}
			
			return sqList;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;

	}

	public VSurveyDTO getAnswerResult(VSurveyDTO dto) {
		
		try {
			
			String sql = "SELECT * FROM vAnswerEmp WHERE surveyQuestionSeq = ? ORDER BY seq DESC";
			
			for (SurveyQuestionDTO sqdto : dto.getSqList()) {
				
				ArrayList<SurveyAnswerDTO> saList = new ArrayList<SurveyAnswerDTO>();
				
				PreparedStatement stat = conn.prepareStatement(sql);
				stat.setString(1, sqdto.getSeq());
				ResultSet rs = stat.executeQuery();
				
				while(rs.next()) {
					SurveyAnswerDTO sadto = new SurveyAnswerDTO();
					sadto.setEmpSeq(rs.getString("empSeq"));
					sadto.setSeq(rs.getString("seq"));
					sadto.setDescriptiveAnswer(rs.getString("descriptiveAnswer"));
					sadto.setSurveyMultiChoiceSeq(rs.getString("surveyMultiChoiceSeq"));
					sadto.setRegDate(rs.getString("regDate"));
					sadto.setName(rs.getString("name"));
					
					saList.add(sadto); //answer를 다 모은다
				}
				
				sqdto.setSaList(saList); //해당 question에 salist를 넣어준다.
			}
	
			return dto;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return null;
	}

	public int getParticipantsCount(String seq) {
		
		try {
			
			int count = 0;
			
			String sql = "select count(DISTINCT empSeq) FROM surveyAnswer where surveyQuestionSeq in (SELECT seq from surveyQuestion WHERE surveySeq = ?)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			ResultSet rs = stat.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			
			return count;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}

	public VSurveyDTO getMultiCount(VSurveyDTO dto) {
		try {
			//각 선택형 답변이 몇개 선택됐는지 불러오는 것
			String sql = "SELECT COUNT(*) FROM surveyAnswer WHERE surveyMultiChoiceSeq = ?";
			
			for (SurveyQuestionDTO sqdto : dto.getSqList()) {				
				for (SurveyMultiChoiceDTO smcdto : sqdto.getSmcList()) {					
					
					PreparedStatement stat = conn.prepareStatement(sql);
					stat.setString(1, smcdto.getSeq());
					ResultSet rs = stat.executeQuery();
					
					while(rs.next()) {
						smcdto.setCount(rs.getInt(1));					
					}	
					
				}
			}
	
			return dto;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return null;
	}

	public VSurveyDTO getAnswerCount(VSurveyDTO dto) {
		try {
			
			String sql = "select count(*) from surveyAnswer where surveyQuestionSeq = ?";
			
			for (SurveyQuestionDTO sqdto : dto.getSqList()) {
				PreparedStatement stat = conn.prepareStatement(sql);
				stat.setString(1, sqdto.getSeq());
				ResultSet rs = stat.executeQuery();
				
				if(rs.next()) {
					sqdto.setTotalAnswerCount(rs.getInt(1));
				}
			}
			return dto;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	public VSurveyDTO getSurveyTime(VSurveyDTO dto) {
		try {
			
			ArrayList<SurveyTimeDTO> stlist = new ArrayList<SurveyTimeDTO>();
			
			String sql = "SELECT COUNT(*) AS count, regDate FROM vRegTime WHERE surveySeq = ? GROUP BY regDate";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSeq());
			ResultSet rs = stat.executeQuery();
			
			while (rs.next()) {
				SurveyTimeDTO temp = new SurveyTimeDTO();
				temp.setRegDate(rs.getString("regDate"));
				temp.setSurveySeq(dto.getSeq());
				temp.setCount(rs.getInt("count"));
				stlist.add(temp);
			}
			System.out.println("time 하위");
			dto.setStList(stlist);
			
			return dto;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}
	
}
