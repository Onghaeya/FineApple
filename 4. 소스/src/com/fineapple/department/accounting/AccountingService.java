package com.fineapple.department.accounting;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.AccountDTO;
import com.fineapple.DTO.AccountRecentDTO;
import com.fineapple.DTO.IncomeDTO;
import com.fineapple.DTO.IncomeViewDTO;
import com.fineapple.DTO.OutcomeDTO;
import com.fineapple.DTO.OutcomeViewDTO;

public class AccountingService {

	private AccountingDAO dao;
	private HttpSession session;
	
	public AccountingService(HttpSession session) {
		this.dao = new AccountingDAO();
		this.session = session;
	}

	/**
	 * 처리할 수입 목록을 반환하도록 하는 서비스
	 * @param seq 사용자의 사번
	 * @param positionSeq 사용자의 직급번호
	 * @param limiter 
	 * @return 처리되지 않은 수입 목록
	 */
	public ArrayList<IncomeViewDTO> getIList(String seq, String positionSeq, String limiter) {
		
		ArrayList<IncomeViewDTO> ilist = dao.getIList(seq, positionSeq, limiter);
		
		for (IncomeViewDTO dto : ilist) {
			dto.setGoods(dto.getGoods().replaceAll("<", "&lt;").replaceAll("\r\n", "<br />"));	//물품의 공백, 스크립트 제거
			dto.setRegDate(dto.getRegDate().substring(0, 10));	//일자 일단위로 잘라내기
			if (dto.getGoods().length() > 10) {	//물품 이름의 길이 자르기
				String goods = dto.getGoods().substring(0, 10);
				goods = goods + "..";
				dto.setGoods(goods);
			}
		}
		return ilist;
	}

	/**
	 * 처리할 지출 목록을 반환하도록 하는 서비스
	 * @param seq 사용자의 사번
	 * @param positionSeq 사용자의 직급번호
	 * @param limiter 
	 * @return 처리되지 않은 지출 목록
	 */
	public ArrayList<OutcomeViewDTO> getOList(String seq, String positionSeq, String limiter) {
		
		ArrayList<OutcomeViewDTO> olist = dao.getOList(seq, positionSeq, limiter);
		
		for (OutcomeViewDTO dto : olist) {
			String temp = dto.getRegDate().substring(0, 10);	//일자 일단위로 잘라내기
			dto.setRegDate(temp);
			
			temp = dto.getStatus();	//현황 메시지로 변경
			if (temp.equals("2")) {	//부서장 승인
				dto.setStatus("부서장 승인");
			} else if (temp.equals("3")) {	//총무부 반려
				dto.setStatus("총무부 반려");
			} else if (temp.equals("4")) {	//최종 승인
				dto.setStatus("최종 승인");
			}
		}
		return olist;
	}

	/**
	 * 회사의 자금상황을 반환하도록 하는 서비스
	 * @return 회사의 자금상황
	 */
	public ArrayList<AccountDTO> getAccount() {
		return dao.getAccount();
	}

	/**
	 * 수입보고의 총무부 최종 승인을 처리하도록 하는 서비스
	 * @param seq 수입보고서 번호
	 * @param idto 추가할 설명과 품목
	 * @param userSeq 결정자 사번
	 * @param confirm 승인여부
	 * @param confirm2 
	 * @return 처리 성공 여부
	 */
	public int setIncomeConfirm(String seq, IncomeDTO idto, String userSeq, String aSeq, String confirm) {
		String con = "";
		if (confirm.equals("yes")) {	//승인시
			con = "최종 승인";
		} else {	//반려시
			con = "총무부 반려";
		}
		return dao.setIncomeConfirm(seq, idto, userSeq, aSeq, con);
	}

	/**
	 * 지출보고의 총무부 최종 승인을 처리하도록 하는 서비스
	 * @param seq 지출보고서 번호
	 * @param odto 추가할 설명
	 * @param userSeq 결정자 사번
	 * @param confirm 승인여부
	 * @param confirm2 
	 * @return 처리 성공 여부
	 */
	public int setOutcomeConfirm(String seq, OutcomeDTO odto, String userSeq, String aSeq, String confirm) {
		String con = "";
		if (confirm.equals("yes")) {	//승인시
			con = "4";
		} else {	//반려시
			con = "3";
		}
		return dao.setOutcomeConfirm(seq, odto, userSeq, aSeq, con);
	}

	/**
	 * 수입/지출보고로 인한 계좌의 금액 변동분을 처리하도록 하는 서비스
	 * @param adto 변동할 대상 계좌 및 자료
	 * @param mark 변동할 형식(양/음)
	 * @return 처리 성공 여부
	 */
	public int setAccountBalance(AccountDTO adto, String mark) {
		return dao.setAccountBalance(adto, mark);
	}

	/**
	 * 계좌 현황을 가져오도록 하는 서비스
	 * @return 계좌 현황
	 */
	public ArrayList<AccountDTO> getAList() {
		ArrayList<AccountDTO> list = dao.getAList(); 
		for (AccountDTO dto : list) {
			dto.setRegDate(dto.getRegDate().substring(0, 10));	//일자 일단위로 잘라내기
		}
		return list;
	}

	/**
	 * 계좌 1개의 입출납 기록을 가져오도록 하는 서비스
	 * @param seq 요구 계좌
	 * @return 해당 계좌 입출납 기록
	 */
	public AccountDTO getAccountHistory(String seq) {
		return null;
	}

	/**
	 * 계좌 1개의 입금 내역을 가져오도록 하는 서비스
	 * @param aSeq 요구 계좌
	 * @return 해당 계좌 입금 내역
	 */
	public ArrayList<IncomeViewDTO> getIncome(String aSeq) {
		ArrayList<IncomeViewDTO> list = dao.getIncome(aSeq); 
		for (IncomeViewDTO dto : list) {
			dto.setConDate(dto.getConDate().substring(0, 10));	//일자 일단위로 잘라내기
		}
		return list;
	}

	/**
	 * 계좌 1개의 출금 내역을 가져오도록 하는 서비스
	 * @param aSeq 요구 계좌
	 * @return 해당 계좌 출금 내역
	 */
	public ArrayList<OutcomeViewDTO> getOutcome(String aSeq) {
		ArrayList<OutcomeViewDTO> list = dao.getOutcome(aSeq); 
		for (OutcomeViewDTO dto : list) {
			dto.setConDate(dto.getConDate().substring(0, 10));	//일자 일단위로 잘라내기
		}
		return list;
	}

	/**
	 * 최근 30일간 모든 계좌의 출납 횟수를 가져오도록 하는 서비스
	 * @return 계좌별 출납 횟수
	 */
	public ArrayList<AccountRecentDTO> getAccountRecent() {
		ArrayList<AccountRecentDTO> list = dao.getAccountRecent();
		for (AccountRecentDTO dto : list) {
			if (dto.getIcount() == null) {
				dto.setIcount("0");
			}
			if (dto.getOcount() == null) {
				dto.setOcount("0");
			}
			if (dto.getIamount() == null) {
				dto.setIamount("0");
			}
			if (dto.getOamount() == null) {
				dto.setOamount("0");
			}
		}
		return list;
	}
}
