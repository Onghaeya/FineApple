package com.fineapple.department.income;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.fineapple.DTO.IncomeCategoryDTO;
import com.fineapple.DTO.IncomeDTO;
import com.fineapple.DTO.IncomeViewDTO;
import com.fineapple.util.DBUtil;

public class IncomeDAO {

	private Connection conn; 
	
	/**
	 * 생성자(DB 연결)
	 */
	public IncomeDAO() {
		try {
			conn = DBUtil.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.income / IncomeDAO.IncomeDAO ###");
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
			System.out.println("### com.fineapple.department.income / IncomeDAO.close ###");
		}
	}
	
	/**
	 * 사용자의 직급, 부서에 따라 수입내역의 목록을 반환
	 * @param departmentSeq 사용자의 부서번호
	 * @param positionSeq 사용자의 직급번호
	 * @param seq 
	 * @return 수입내역 목록
	 */
	public ArrayList<IncomeViewDTO> getIncome(String departmentSeq, String positionSeq, String seq) {
		try {
			String sql = "";
			if (positionSeq.equals("2")) {	//부장인 경우(부서 전체)
				sql = "select * from vIncome where departmentSeq = ?";
			} else {	//기타는 자신의 내용만
				sql = "select * from vIncome where departmentSeq = ? and empSeq = "+ seq;
			}
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, departmentSeq);
			
			ArrayList<IncomeViewDTO> list = new ArrayList<IncomeViewDTO>();
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				IncomeViewDTO dto = new IncomeViewDTO();
				dto.setSeq(rs.getString("seq"));	//문서번호
				dto.setEmpSeq(rs.getString("empSeq"));	//작성자 사번
				dto.setRegDate(rs.getString("regDate"));	//작성일
				dto.setGoods(rs.getString("goods"));	//물품
				dto.setUnits(rs.getInt("units"));	//수량
				dto.setAmount(rs.getInt("amount"));	//금액
				dto.setConfirm(rs.getString("confirm"));	//승인여부
				dto.setName(rs.getString("name"));	//작성자 이름
				dto.setDepartmentSeq(rs.getString("departmentSeq"));	//부서번호
				dto.setCategory(rs.getString("category"));	//카테고리 이름
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.income / IncomeDAO.getIncome ###");
			return null;
		}
	}

	/**
	 * 사용자의 부서에 따라 수입 관련 카테고리를 반환
	 * @param departmentSeq 사용자의 부서번호
	 * @return 수입 카테고리
	 */
	public ArrayList<IncomeCategoryDTO> getCategory(String departmentSeq) {
		try {
			String sql = "select * from tblICategory";
			Statement stat = conn.createStatement();
			
			ArrayList<IncomeCategoryDTO> list = new ArrayList<IncomeCategoryDTO>();
			
			ResultSet rs = stat.executeQuery(sql);
			
			int count = 1;
			
			if (departmentSeq.equals("3")) {	//총무부에서 요청한 경우에만 모든 카테고리를 제공
				while (rs.next()) {
					IncomeCategoryDTO dto = new IncomeCategoryDTO();
					dto.setSeq(rs.getString("seq"));	//카테고리 번호
					dto.setName(rs.getString("name"));	//카테고리 이름
					
					list.add(dto);
				}								
			} else {	//영업부에서 요청시 5번까지만 제공
				while (rs.next()) {
					IncomeCategoryDTO dto = new IncomeCategoryDTO();
					dto.setSeq(rs.getString("seq"));	//카테고리 번호
					dto.setName(rs.getString("name"));	//카테고리 이름
					
					list.add(dto);
					if (count == 5) break;
					count++;
				}
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.income / IncomeDAO.getCategory ###");
			return null;
		}
	}

	/**
	 * 매출 및 수입보고서 작성
	 * @param dto 작성할 수입보고서
	 * @param positionSeq 사용자의 직급번호
	 * @return 처리 성공 여부
	 */
	public int setIncome(IncomeDTO dto, String positionSeq) {
		try {
			String sql = "insert into tblIncome (seq, empSeq, cSeq, regDate, content, goods, units, amount, confirm) values (outcomeSeq.nextVal, ?, ?, default, ?, ?, ?, ?, ?)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getEmpSeq());	//작성자
			stat.setString(2, dto.getcSeq());	//카테고리 번호
			stat.setString(3, dto.getContent());	//내용
			stat.setString(4, dto.getGoods());
			stat.setInt(5, dto.getUnits());
			stat.setInt(6, dto.getAmount());	//금액
			if (positionSeq.equals("2")) {	//부서의 장이 보고서를 작성한 경우
				stat.setString(7, "부서장 승인"); 
			} else {	//기타 사원이 보고서를 작성한 경우
				stat.setString(7, "대기");
			}
			return stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.income / IncomeDAO.setIncome ###");
			return 0;
		}
	}

	/**
	 * 수입보고서 한개 반환 
	 * @param seq 불러올 수입보고서 번호
	 * @return 불러온 수입보고서
	 */
	public IncomeDTO readIncome(String seq) {
		try {
			String sql = "select * from vIncomeRead where seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			IncomeDTO dto = new IncomeDTO();
			
			ResultSet rs = stat.executeQuery();
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));	//번호
				dto.setEmpSeq(rs.getString("empSeq"));	//작성자번호
				dto.setEmpName(rs.getString("name"));	//작성자
				dto.setRegDate(rs.getString("regDate"));	//작성일
				dto.setContent(rs.getString("content"));	//내용
				dto.setGoods(rs.getString("goods"));	//물품
				dto.setUnits(rs.getInt("units"));	//수량
				dto.setAmount(rs.getInt("amount"));	//금액
				dto.setcSeq(rs.getString("category"));	//종류
				dto.setConDate(rs.getString("conDate"));	//승인일
				dto.setConfirm(rs.getString("confirm"));	//현황
				dto.setDepartment(rs.getString("department"));	//부서이름
			}
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.income / IncomeDAO.readIncome ###");
			return null;
		}
	}

	/**
	 * 수입보고서 반려/승인 지정
	 * @param seq 대상 수입보고서 번호
	 * @param departmentSeq 지정자의 부서번호
	 * @param positionSeq 지정자의 직급번호
	 * @param confirm 반려/승인 여부
	 * @return 처리 성공 여부
	 */
	public int setIncomeConfirm(String seq, String departmentSeq, String positionSeq, String confirm) {
		try {
			String sql = "update tblIncome set confirm = ? where seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			
			if (confirm.equals("yes")) {	//승인한 경우
				stat.setString(1, "부서장 승인");
				stat.setString(2, seq);
			} else {	//반려한 경우
				stat.setString(1, "부서장 반려");
				stat.setString(2, seq);
			}
			return stat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.income / IncomeDAO.setIncomeConfirm ###");
			return 0;
		}
	}

	/**
	 * 수입보고서를 수정
	 * @param dto 수입보고서 수정본
	 * @return 처리 성공 여부
	 */
	public int editIncome(IncomeDTO dto) {
		try {
			String sql = "update tblIncome set regDate = sysdate, content = ?, goods = ?, units = ?, amount = ?, cSeq = ? where seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getContent());
			stat.setString(2, dto.getGoods());
			stat.setInt(3, dto.getUnits());
			stat.setInt(4, dto.getAmount());
			stat.setString(5, dto.getcSeq());
			stat.setString(6, dto.getSeq());

			return stat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.income / IncomeDAO.editIncome ###");
			return 0;
		}
	}

	/**
	 * 수입보고서를 삭제
	 * @param seq 삭제할 수입보고서 번호
	 * @return 처리 성공 여부
	 */
	public int delIncome(String seq) {
		try {
			String sql = "delete from tblIncome where seq = "+ seq;
			Statement stat = conn.createStatement();
			
			return stat.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department.income / IncomeDAO.delIncome ###");
			return 0;
		}
	}

}
