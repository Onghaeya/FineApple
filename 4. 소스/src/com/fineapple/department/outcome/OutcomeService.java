package com.fineapple.department.outcome;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.EmployeeDTO;
import com.fineapple.DTO.OutcomeCategoryDTO;
import com.fineapple.DTO.OutcomeDTO;
import com.fineapple.DTO.OutcomeViewDTO;

/**
 * @author user
 *
 */
public class OutcomeService {
	
	private OutcomeDAO dao;
	private HttpSession session;
	
	public OutcomeService(HttpSession session) {
		this.dao = new OutcomeDAO();
		this.session = session;
	}
	
	/**
	 * 비용청구시 요구한 사용자에 맞춰 비용 카테고리를 가져오는 서비스 객체
	 * @return 비용 카테고리
	 */
	public ArrayList<OutcomeCategoryDTO> getCategory() {
		
		String departmentSeq = (String) session.getAttribute("departmentSeq");	//세션에서 값 가져오기
		ArrayList<OutcomeCategoryDTO> list = dao.getCategory(departmentSeq);
		return list;
	}
	
	/**
	 * 비용청구서 작성 시 dao로 전달해주는 서비스 객체
	 * @param dto 비용청구서 페이지에서 작성된 내용
	 * @param positionSeq 
	 * @param departmentSeq 
	 * @return 성공/실패 여부
	 */
	public int setOutcome(OutcomeDTO dto, String positionSeq, String departmentSeq) {
		return dao.setOutcome(dto, positionSeq, departmentSeq);
	}

	/**
	 * 사용자에 맞춰 비용청구 메뉴에서 보여줄 목록을 가져오는 서비스 객체
	 * @return 청구된 목록
	 */
	public ArrayList<OutcomeViewDTO> getOutcome() {
		
		String departmentSeq = (String) session.getAttribute("departmentSeq");	//세션에서 값 가져오기
		String positionSeq = (String) session.getAttribute("positionSeq");
		String seq = (String) session.getAttribute("seq");
		ArrayList<OutcomeViewDTO> list = dao.getOutcome(departmentSeq, positionSeq, seq);
		
		for (OutcomeViewDTO dto : list) {
			String regDate = dto.getRegDate().substring(0, 10);	//일자 일단위로 잘라내기
			dto.setRegDate(regDate);
			
			String status = dto.getStatus();	//현황 메시지로 변경
			if (status == null) {	//부서장 대기
				dto.setStatus("대기");
			} else if (status.equals("1")) {	//부서장 반려
				dto.setStatus("부서장 반려");
			} else if (status.equals("2")) {	//부서장 승인
				dto.setStatus("부서장 승인");
			} else if (status.equals("3")) {	//총무부 반려
				dto.setStatus("총무부 반려");
			} else if (status.equals("4")) {	//최종 승인
				dto.setStatus("최종 승인");
			}
		}
		return list;
	}

	/**
	 * 비용청구서 내용 확인 시 내용물을 가져오는 서비스 객체
	 * @return 요청된 비용청구서
	 */
	public OutcomeDTO readOutcome(String seq) {
		
		OutcomeDTO dto = dao.readOutcome(seq);
		
		String content = dto.getContent();	//스크립트 문자 및 개행문자 변경
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll("\r\n", "<br />");
		dto.setContent(content);
		
		String regDate = dto.getRegDate().substring(0, 16);	//일자 시분까지 잘라내기
		dto.setRegDate(regDate);
		
		String conDate = dto.getConDate();	//승인일관련 메시지 입력
		if (conDate == null) {
			dto.setConDate("미승인");	//승인일이 없는 경우 메시지 출력
		} else {
			dto.setConDate(conDate.substring(0, 10));	//승인일이 있는 경우 승인일 출력
		}
		
		String status = dto.getEtc();	//현황관련 메시지 입력
		if (status == null) {	//부서장 대기
			dto.setEtc("대기");
		} else if (status.equals("1")) {	//부서장 반려
			dto.setEtc("부서장 반려");
		} else if (status.equals("2")) {	//부서장 승인
			dto.setEtc("부서장 승인");
		} else if (status.equals("3")) {	//총무부 반려
			dto.setEtc("총무부 반려");
		} else if (status.equals("4")) {	//최종 승인
			dto.setEtc("최종 승인");
		}
		
		return dto;
	}

	/**
	 * 비용청구서 승인/반려 여부를 DAO를 통해 DB에 업데이트하는 서비스 객체
	 * @param seq 비용청구서 번호
	 * @param departmentSeq 승인한 사용자의 부서
	 * @param positionSeq 승인한 사용자의 직급
	 * @param confirm 승인여부
	 * @return 처리 성공 여부
	 */
	public int setOutcomeConfirm(String seq, String departmentSeq, String positionSeq, String confirm) {
		return dao.setOutcomeConfirm(seq, departmentSeq, positionSeq, confirm);
	}
	
	/**
	 * 사용자의 부서직원 리스트를 가져오도록 하는 서비스 객체
	 * @return 사용자의 부서직원 목록
	 */
	public ArrayList<EmployeeDTO> getDepartmentEmployee() {
		
		String departmentSeq = (String) session.getAttribute("departmentSeq");
		ArrayList<EmployeeDTO> list = dao.getDepartmentEmployee(departmentSeq);
		return list;
	}
	
	/**
	 * 비용청구서 수정을 위해 내용물을 가져오도록 하는 서비스 객체
	 * @param seq	대상이 된 비용청구서 번호
	 * @return 비용청구서
	 */
	public OutcomeDTO editOutcome(String seq) {
		return dao.readOutcome(seq);
	}
	
	/**
	 * 비용청구서 수정을 수행하도록 하는 서비스 객체
	 * @param dto 수정된 비용청구서
	 * @return 처리 성공 여부
	 */
	public int editOutcome(OutcomeDTO dto) { 
		return dao.editOutcome(dto);
	}

	/**
	 * 비용청구서 삭제를 수행하도록 하는 서비스 객체
	 * @param seq 대상이 된 비용청구서 번호
	 * @return 처리 성공 여부
	 */
	public int delOutcome(String seq) {
		return dao.delOutcome(seq);
	}
}