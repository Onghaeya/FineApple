package com.fineapple.department.accounting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.fineapple.DTO.AccountDTO;
import com.fineapple.DTO.AccountRecentDTO;
import com.fineapple.DTO.IncomeDTO;
import com.fineapple.DTO.IncomeViewDTO;
import com.fineapple.DTO.OutcomeDTO;
import com.fineapple.DTO.OutcomeViewDTO;
import com.fineapple.util.DBUtil;

public class AccountingDAO {

	private Connection conn; 
	
	/**
	 * 생성자(DB 연결)
	 */
	public AccountingDAO() {
		try {
			conn = DBUtil.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.accounting / AccountingDAO.AccountingDAO ###");
		}
	}
	
	/**
	 * 
	 */
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.accounting / AccountingDAO.close ###");
		}
	}

	/**
	 * 처리할 수입목록 사용자에 따라 100개 반환
	 * @param seq 사용자의 사번
	 * @param positionSeq 사용자의 직급
	 * @param limiter 
	 * @return 처리할 수입목록
	 */
	public ArrayList<IncomeViewDTO> getIList(String seq, String positionSeq, String limiter) {
		try {
			String sql = "";
			if (positionSeq.equals("2")) {	//총무부 부장일 경우
				sql = "select * from vIncome where confirm = '부서장 승인'";
			} else {	//총무부 부서원일 경우
				sql = "select * from (select * from vIncome where confirm = '부서장 승인') where respSeq is null or respSeq = " + seq;
			}
			Statement stat = conn.createStatement();
			
			ArrayList<IncomeViewDTO> ilist = new ArrayList<IncomeViewDTO>();
			ResultSet rs = stat.executeQuery(sql);
			
			int count = 1;
			if (limiter != null) {	//전체보기에서 요청, 전체목록 돌려줌
				count = 101;
			}
			
			while (rs.next()) {
				IncomeViewDTO dto = new IncomeViewDTO();
				dto.setSeq(rs.getString("seq"));	//번호
				dto.setEmpSeq(rs.getString("empSeq"));	//작성자 사번
				dto.setRegDate(rs.getString("regDate"));	//작성일
				dto.setGoods(rs.getString("goods"));	//물품
				dto.setUnits(rs.getInt("units"));	//갯수
				dto.setAmount(rs.getInt("amount"));	//금액
				dto.setConfirm(rs.getString("confirm"));	//현황
				dto.setName(rs.getString("name"));	//작성자 이름
				dto.setCategory(rs.getString("category"));	//수입 카테고리
				dto.setDepartmentSeq(rs.getString("departmentSeq"));	//부서번호
				
				ilist.add(dto);			
				if (count == 100) break;
				count++;				
			}
			return ilist;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.accounting / AccountingDAO.getIList ###");
			return null;
		}
	}

	/**
	 * 처리할 지출목록 사용자에 따라 100개 반환
	 * @param seq 사용자의 사번
	 * @param positionSeq 사용자의 직급
	 * @param limiter 
	 * @return 처리할 지출목록
	 */
	public ArrayList<OutcomeViewDTO> getOList(String seq, String positionSeq, String limiter) {
		try {
			String sql = "";
			if (positionSeq.equals("2")) {	//총무부 부장일 경우
				sql = "select * from vOutcome where etc = 2";
			} else {	//총무부 부서원일 경우
				sql = "select * from (select * from vOutcome where etc = 2) where respSeq is null or respSeq = " + seq;
			}
			Statement stat = conn.createStatement();
			
			ArrayList<OutcomeViewDTO> olist = new ArrayList<OutcomeViewDTO>();
			ResultSet rs = stat.executeQuery(sql);
			
			int count = 1;
			if (limiter != null) {	//전체보기에서 요청, 전체목록 돌려줌
				count = 101;
			}
			
			while (rs.next()) {
				OutcomeViewDTO dto = new OutcomeViewDTO();
				dto.setSeq(rs.getString("seq"));	//번호
				dto.setEmpSeq(rs.getString("empSeq"));	//작성자 사번
				dto.setRegDate(rs.getString("regDate"));	//작성일
				dto.setAmount(rs.getInt("amount"));	//금액
				dto.setStatus(rs.getString("etc"));	//현황
				dto.setName(rs.getString("name"));	//작성자 이름
				dto.setDepartmentSeq(rs.getString("departmentSeq"));	//부서번호
				dto.setCategory(rs.getString("category"));	//지출 카테고리
				
				olist.add(dto);			
				if (count == 100) break;
				count++;
			}
			return olist;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.accounting / AccountingDAO.getOList ###");
			return null;
		}
	}

	/**
	 * 회사의 자금상황을 반환
	 * @return	회사의 자금상황
	 */
	public ArrayList<AccountDTO> getAccount() {
		try {
			String sql = "select * from tblAccount";
			Statement stat = conn.createStatement();
			
			ArrayList<AccountDTO> list = new ArrayList<AccountDTO>();
			
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				AccountDTO dto = new AccountDTO();
				dto.setSeq(rs.getString("seq"));	//관리번호
				dto.setName(rs.getString("name"));	//이름
				dto.setaNumber(rs.getString("aNumber"));	//번호(계좌번호 등)
				dto.setBalance(rs.getInt("balance"));	//잔고
				dto.setRegDate(rs.getString("regDate"));	//최종거래일
				
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.accounting / AccountingDAO.getAccount ###");
			return null;
		}
	}

	/**
	 * 수입보고의 총무부 최종 승인을 처리
	 * @param seq 수입보고서 번호
	 * @param idto 추가할 설명과 품목
	 * @param userSeq 결정자 사번
	 * @param con 승인여부
	 * @param con2 
	 * @return 처리 성공 여부
	 */
	public int setIncomeConfirm(String seq, IncomeDTO idto, String userSeq, String aSeq, String con) {
		try {
			String sql = "select content, goods from tblIncome where seq =" + seq;
			Statement stat = conn.createStatement();
			
			IncomeDTO dto = idto;
			String content = "";
			String goods = "";
			
			ResultSet rs = stat.executeQuery(sql);
			if (rs.next()) {
				content = rs.getString("content");
				goods = rs.getString("goods");
			}
			content += "\r\n--------------------\r\n" + dto.getContent();
			goods += "\r\n--------------------\r\n" + dto.getGoods();
			
			sql = "update tblIncome set content = ?, goods = ?, confirm = ?, aSeq = ?, respSeq = ?, conDate = sysdate where seq = ?";
			PreparedStatement pstat = conn.prepareStatement(sql);
			pstat.setString(1, content);
			pstat.setString(2, goods);
			pstat.setString(3, con);
			pstat.setString(4, aSeq);
			pstat.setString(5, userSeq);
			pstat.setString(6, seq);
						
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.accounting / AccountingDAO.setIncomeConfirm ###");
			return 0;
		}
	}

	/**
	 * 지출보고의 총무부 최종 승인을 처리
	 * @param seq 지출보고서 번호
	 * @param odto 추가할 설명
	 * @param userSeq 결정자 사번
	 * @param con 승인여부
	 * @param con2 
	 * @return 처리 성공 여부
	 */
	public int setOutcomeConfirm(String seq, OutcomeDTO odto, String userSeq, String aSeq, String con) {
		try {
			String sql = "select content from tblOutcome where seq =" + seq;
			Statement stat = conn.createStatement();
			
			OutcomeDTO dto = odto;
			String content = "";
			
			ResultSet rs = stat.executeQuery(sql);
			if (rs.next()) {
				content = rs.getString("content");
			}
			content += "\r\n--------------------\r\n" + dto.getContent();
			
			sql = "update tblOutcome set content = ?, etc = ?, aSeq = ?, respSeq = ?, conDate = sysdate where seq = ?";
			PreparedStatement pstat = conn.prepareStatement(sql);
			pstat.setString(1, content);
			pstat.setString(2, con);
			pstat.setString(3, aSeq);
			pstat.setString(4, userSeq);
			pstat.setString(5, seq);
						
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.accounting / AccountingDAO.setOutcomeConfirm ###");
			return 0;
		}
	}

	/**
	 * 수입/지출보고로 인한 계좌의 금액 변동분을 처리
	 * @param adto 변동할 대상 계좌 및 자료
	 * @param mark 변동할 형식(양/음)
	 * @return 처리 성공 여부
	 */
	public int setAccountBalance(AccountDTO adto, String mark) {
		try {
			AccountDTO dto = adto;
			String seq = dto.getSeq();	//계좌 유형번호
			int floats = dto.getBalance();	//변동액
			int balance = 0;	//계좌 잔고
			String marks = mark;	//양음
			
			String sql = "select balance from tblAccount where seq = "+ seq;
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			if (rs.next()) {
				balance = rs.getInt("balance");
			}
			if (marks.equals("+")) {
				balance = balance + floats; 				
			} else {
				balance = balance - floats;
			}
			sql = "update tblAccount set balance = ?, regDate = sysdate where seq = ?";
			PreparedStatement pstat = conn.prepareStatement(sql);
			pstat.setInt(1, balance);
			pstat.setString(2, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.accounting / AccountingDAO.setAccountBalance ###");
			return 0;
		}
	}

	/**
	 * 계좌 현황을 가져오도록 하는 서비스
	 * @return 전체 계좌 현황
	 */
	public ArrayList<AccountDTO> getAList() {
		try {
			String sql = "select * from tblAccount";
			Statement stat = conn.createStatement();
			
			ArrayList<AccountDTO> list = new ArrayList<AccountDTO>();
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				AccountDTO dto = new AccountDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setaNumber(rs.getString("aNumber"));
				dto.setBalance(rs.getInt("balance"));
				dto.setRegDate(rs.getString("regDate"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.accounting / AccountingDAO.getAList ###");
			return null;
		}
	}

	/**
	 * 계좌 1개의 입금 내역을 반환
	 * @param aSeq 요구 계좌
	 * @return 입금 내역
	 */
	public ArrayList<IncomeViewDTO> getIncome(String aSeq) {
		try {
			String sql = "select * from vIncome where aSeq = " + aSeq;
			Statement stat = conn.createStatement();
			
			ArrayList<IncomeViewDTO> list = new ArrayList<IncomeViewDTO>();
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				IncomeViewDTO dto = new IncomeViewDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setUnits(rs.getInt("units"));
				dto.setAmount(rs.getInt("amount"));
				dto.setName(rs.getString("name"));
				dto.setCategory(rs.getString("category"));
				dto.setDepartment(rs.getString("department"));
				dto.setRespName(rs.getString("respName"));
				dto.setRespSeq(rs.getString("respSeq"));
				dto.setConDate(rs.getString("conDate"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.accounting / AccountingDAO.getIncome ###");
			return null;
		}
	}

	/**
	 * 계좌 1개의 출금 내역을 반환
	 * @param aSeq 요구 계좌
	 * @return 출금 내역
	 */
	public ArrayList<OutcomeViewDTO> getOutcome(String aSeq) {
		try {
			String sql = "select * from vOutcome where aSeq = " + aSeq;
			Statement stat = conn.createStatement();
			
			ArrayList<OutcomeViewDTO> list = new ArrayList<OutcomeViewDTO>();
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				OutcomeViewDTO dto = new OutcomeViewDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setAmount(rs.getInt("amount"));
				dto.setRespSeq(rs.getString("respSeq"));
				dto.setName(rs.getString("name"));
				dto.setCategory(rs.getString("category"));
				dto.setDepartment(rs.getString("department"));
				dto.setRespName(rs.getString("respName"));
				dto.setConDate(rs.getString("conDate"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.accounting / AccountingDAO.getOutcome ###");
			return null;
		}
	}

	/**
	 * 최근 30일간 모든 계좌의 출납 횟수를 반환
	 * @return 계좌별 출납 횟수
	 */
	public ArrayList<AccountRecentDTO> getAccountRecent() {
		try {
			String sql = "select * from vAccountRecent";
			Statement stat = conn.createStatement();
			
			ArrayList<AccountRecentDTO> list = new ArrayList<AccountRecentDTO>();
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				AccountRecentDTO dto = new AccountRecentDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setIcount(rs.getString("icount"));
				dto.setIamount(rs.getString("iamount"));
				dto.setOcount(rs.getString("ocount"));
				dto.setOamount(rs.getString("oamount"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.accounting / AccountingDAO.getAccountRecent ###");
			return null;
		}
	}
}
