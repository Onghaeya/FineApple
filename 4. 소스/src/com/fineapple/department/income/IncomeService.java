package com.fineapple.department.income;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.IncomeCategoryDTO;
import com.fineapple.DTO.IncomeDTO;
import com.fineapple.DTO.IncomeViewDTO;

/**
 * 
 * @author Bul
 *
 */
public class IncomeService {

	private IncomeDAO dao;
	private HttpSession session;
	
	public IncomeService(HttpSession session) {
		this.dao = new IncomeDAO();
		this.session = session;
	}

	/**
	 * Income 접근 시 사용자의 부서, 직급에 따라 목록을 돌려주도록 하는 서비스
	 * @param departmentSeq 사용자의 부서번호
	 * @param positionSeq 사용자의 직급번호
	 * @param seq 사용자의 사원번호
	 * @return 수입내역 목록
	 */
	public ArrayList<IncomeViewDTO> getIncome(String departmentSeq, String positionSeq, String seq) {
		
		ArrayList<IncomeViewDTO> list = dao.getIncome(departmentSeq, positionSeq, seq);
		
		for (IncomeViewDTO dto : list) {
			dto.setGoods(dto.getGoods().replaceAll("<", "&lt;"));	//물품의 공백, 스크립트 제거
			dto.setRegDate(dto.getRegDate().substring(0, 10));	//일자 일단위로 잘라내기
			if (dto.getGoods().length() > 10) {	//물품 이름의 길이 자르기
				String goods = dto.getGoods().substring(0, 10);
				goods = goods + "..";
				dto.setGoods(goods);
			}
		}
		return list;
	}
	
	/**
	 * 사용자의 부서에 따라 수입 관련 카테고리를 가져오도록 하는 서비스
	 * @param departmentSeq 사용자의 부서번호
	 * @return 수입 카테고리
	 */
	public ArrayList<IncomeCategoryDTO> getCategory(String departmentSeq) {
		return dao.getCategory(departmentSeq);
	}

	/**
	 * 매출 및 수입보고서를 작성하도록 하는 서비스
	 * @param dto 작성할 수입보고서
	 * @param positionSeq 사용자의 직급번호
	 * @return 처리 성공 여부
	 */
	public int setIncome(IncomeDTO dto, String positionSeq) {
		return dao.setIncome(dto, positionSeq);
	}

	/**
	 * 보고서 한개를 불러들이도록 하는 서비스 
	 * @param seq 불러올 수입보고서
	 * @return 수입보고서
	 */
	public IncomeDTO readIncome(String seq) {
		IncomeDTO dto = dao.readIncome(seq);
		
		String temp = dto.getContent();	//내용 스크립트 문자 및 개행문자 변경
		temp = temp.replaceAll("<", "&lt;");
		temp = temp.replaceAll("\r\n", "<br />");
		dto.setContent(temp);
		
		temp = dto.getGoods();	//물품 스크립트 문자 및 개행문자 변경
		temp = temp.replaceAll("<", "&lt;");
		temp = temp.replaceAll("\r\n", "<br />");
		dto.setGoods(temp);
		
		temp = dto.getRegDate().substring(0, 16);	//일자 시분까지 잘라내기
		dto.setRegDate(temp);
		
		temp = dto.getConDate();	//승인일관련 메시지 입력
		if (temp == null) {
			dto.setConDate("미승인");	//승인일이 없는 경우 메시지 출력
		} else {
			dto.setConDate(temp.substring(0, 10));	//승인일이 있는 경우 승인일 출력
		}
		return dto;
	}

	/**
	 * 보고서 반려/승인 여부를 지정하도록 하는 서비스
	 * @param seq 지정할 수입보고서 번호
	 * @param departmentSeq 사용자의 부서번호
	 * @param positionSeq 사용자의 직급번호
	 * @param confirm 반려/승인 여부
	 * @return 처리 성공 여부
	 */
	public int setIncomeConfirm(String seq, String departmentSeq, String positionSeq, String confirm) {
		return dao.setIncomeConfirm(seq, departmentSeq, positionSeq, confirm);
	}

	/**
	 * 수입보고서 수정을 위해 내용물을 가져오도록 하는 서비스
	 * @param seq 수정할 수입보고서 번호
	 * @return 수입보고서
	 */
	public IncomeDTO editIncome(String seq) {
		return dao.readIncome(seq);
	}

	/**
	 * 수입보고서 수정을 요청하는 서비스
	 * @param dto 수정할 수입보고서
	 * @return 처리 성공 여부
	 */
	public int editIncome(IncomeDTO dto) {
		return dao.editIncome(dto);
	}

	/**
	 * 수입보고서 삭제를 요청하는 서비스
	 * @param seq 삭제할 수입보고서 번호
	 * @return 처리 성공 여부
	 */
	public int delIncome(String seq) {
		return dao.delIncome(seq);
	}
}
