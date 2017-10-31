package com.fineapple.department.outcome;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fineapple.DTO.EmployeeDTO;
import com.fineapple.DTO.OutcomeCategoryDTO;
import com.fineapple.DTO.OutcomeDTO;
import com.fineapple.DTO.OutcomeViewDTO;
import com.fineapple.util.DBUtil;

/**
 * @author 박의영
 *
 */
public class OutcomeDAO {

	private Connection conn; 
	
	/**
	 * 생성자(DB 연결)
	 */
	public OutcomeDAO() {
		try {
			conn = DBUtil.getConnection();			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.OutcomeDAO ###");
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
		}
	}
	
	/**
	 * 현재 사용자의 부서에 따라 비용청구서 작성시 보여줄 비용카테고리를 제한해서 돌려줌
	 * @param departmentSeq 세션에서 가져온 부서번호
	 * @return 비용카테고리
	 */
	public ArrayList<OutcomeCategoryDTO> getCategory(String departmentSeq) {
		try {
			String sql = "select * from tblOCategory";
			Statement stat = conn.createStatement();
			
			ArrayList<OutcomeCategoryDTO> list = new ArrayList<OutcomeCategoryDTO>();
			
			ResultSet rs = stat.executeQuery(sql);
			
			int count = 1;
			
			if (departmentSeq.equals("3")) {	//총무부에서 요청한 경우에만 모든 카테고리를 제공
				while (rs.next()) {
					OutcomeCategoryDTO dto = new OutcomeCategoryDTO();
					dto.setSeq(rs.getString("seq"));	//카테고리 번호
					dto.setName(rs.getString("name"));//카테고리 이름
					
					list.add(dto);
				}								
			} else {	//기타 부서에서 요청시 5번까지만 제공
				while (rs.next()) {
					OutcomeCategoryDTO dto = new OutcomeCategoryDTO();
					dto.setSeq(rs.getString("seq"));	//카테고리 번호
					dto.setName(rs.getString("name"));//카테고리 이름
					
					list.add(dto);
					if (count == 5) break;
					count++;
				}
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.getCategory ###");
			return null;
		}
	}
	
	/**
	 * 사용자에 따라 비용청구서를 DB에 기록
	 * @param dto 비용청구서 내용
	 * @param positionSeq 청구서를 작성한 사용자의 직급
	 * @param departmentSeq 청구서를 작성한 사용자의 부서
	 * @return 성공/실패 여부
	 */
	public int setOutcome(OutcomeDTO dto, String positionSeq, String departmentSeq) {
		try {
			String sql = "";
			if (positionSeq.equals("2")) {	//부서의 장이 청구서를 작성한 경우
				sql = "insert into tblOutcome (seq, empSeq, cSeq, regDate, content, amount, etc) values (outcomeSeq.nextVal, ?, ?, default, ?, ?, 2)";
			} else {	//기타 사원이 청구서를 작성한 경우
				sql = "insert into tblOutcome (seq, empSeq, cSeq, regDate, content, amount) values (outcomeSeq.nextVal, ?, ?, default, ?, ?)";				
			}
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getEmpSeq());	//작성자
			stat.setString(2, dto.getcSeq());	//카테고리 번호
			stat.setString(3, dto.getContent());	//내용
			stat.setInt(4, dto.getAmount());	//금액
			
			return stat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.setOutcome ###");
			return 0;
		}
	}
	
	/**
	 * 사용자에 따라 비용청구서의 목록을 반환 
	 * @param departmentSeq 사용자의 부서번호
	 * @param positionSeq 
	 * @param seq 
	 * @return 비용청구서 목록
	 */
	public ArrayList<OutcomeViewDTO> getOutcome(String departmentSeq, String positionSeq, String seq) {
		try {
			String sqlPart = "";
			if (positionSeq.equals("3") || positionSeq.equals("4")) {
				sqlPart = "where empSeq = "+ seq;	//사원, 과장은 자신의 청구목록			
			} else if (positionSeq.equals("2")) {
				sqlPart = "where departmentSeq = "+ departmentSeq;	//부장은 부서 청구목록
			} else if (positionSeq.equals("1")) {
				sqlPart = "";	//사장은 전체 청구목록
			} else {
				sqlPart = "where";	//오류 발생
			}
			String sql = "select * from vOutcome "+ sqlPart + " order by regDate desc";	//전체 작성일순 정렬
			PreparedStatement stat = conn.prepareStatement(sql);
			
			ArrayList<OutcomeViewDTO> list = new ArrayList<OutcomeViewDTO>();
			
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				OutcomeViewDTO dto = new OutcomeViewDTO();
				dto.setSeq(rs.getString("seq"));	//지출내역서 번호
				dto.setName(rs.getString("name"));	//작성자
				dto.setRegDate(rs.getString("regDate"));	//작성일
				dto.setAmount(rs.getInt("amount"));	//금액
				dto.setDepartmentSeq(rs.getString("departmentSeq"));	//부서 번호
				dto.setCategory(rs.getString("category"));	//지출 카테고리
				dto.setStatus(rs.getString("etc"));	//현황
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.getOutcome ###");
			return null;
		}
	}

	/**
	 * 요청된 비용청구서 1장을 돌려줌
	 * @param seq 비용청구서 번호
	 * @return 비용청구서 1장 DTO
	 */
	public OutcomeDTO readOutcome(String seq) {
		try {
			String sql = "select * from vOutcomeRead where seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			OutcomeDTO dto = new OutcomeDTO();
			
			ResultSet rs = stat.executeQuery();
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));	//번호
				dto.setEmpSeq(rs.getString("empSeq"));	//작성자번호
				dto.setEmpName(rs.getString("name"));	//작성자
				dto.setRegDate(rs.getString("regDate"));	//작성일
				dto.setContent(rs.getString("content"));	//내용
				dto.setAmount(rs.getInt("amount"));	//금액
				dto.setcSeq(rs.getString("category"));	//종류
				dto.setConDate(rs.getString("conDate"));	//승인일
				dto.setEtc(rs.getString("etc"));	//현황
				dto.setDepartment(rs.getString("department"));	//부서이름
			}
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.readOutcome ###");
			return null;
		}
	}

	/**
	 * 부서장의 비용청구서 승인
	 * @param seq 비용청구서 번호
	 * @param positionSeq 승인한 부서장의 직급
	 * @param departmentSeq 승인한 부서장의 부서
	 * @param confirm 승인/반려 여부
	 * @return 결과 반환
	 */
	public int setOutcomeConfirm(String seq, String departmentSeq, String positionSeq, String confirm) {
		try {
			String sql = "update tblOutcome set etc = ? where seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			
			if (confirm.equals("yes")) {	//승인한 경우
				stat.setString(1, "2");
				stat.setString(2, seq);
			} else {	//부서장이 반려한 경우
				stat.setString(1, "1");
				stat.setString(2, seq);
			}
			return stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.setOutcomeConfirm ###");
			return 0;
		}
	}

	/**
	 * 사용자의 해당 부서원 목록
	 * @param departmentSeq	사용자의 부서번호
	 * @return 부서원 목록
	 */
	public ArrayList<EmployeeDTO> getDepartmentEmployee(String departmentSeq) {
		try {
			String sql = "select * from employee where departmentSeq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, departmentSeq);
			
			ArrayList<EmployeeDTO> list = new ArrayList<EmployeeDTO>();
			
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				EmployeeDTO dto = new EmployeeDTO();
				dto.setSeq(rs.getString("seq"));	//사번
				dto.setName(rs.getString("name"));	//이름
				dto.setCellphone(rs.getString("cellphone"));	//연락처
				dto.setEmail(rs.getString("email"));	//휴대전화
				dto.setFirstDate(rs.getString("firstDate"));	//입사일
				dto.setEndDate(rs.getString("endDate"));	//퇴사일
				dto.setGender(rs.getString("gender"));	//성별
				dto.setPhone(rs.getString("phone"));	//담당전화
				dto.setProfilePic(rs.getString("profilePic"));	//프로필사진
				dto.setTask(rs.getString("task"));	//담당업무
				dto.setDepartmentSeq(rs.getString("departmentSeq"));	//부서번호
				dto.setPositionSeq(rs.getString("positionSeq"));	//직급번호
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.getDepartmentEmployee ###");
			return null;
		}
	}
	
	/**
	 * 요청된 비용청구서 수정
	 * @param dto 수정된 비용청구서
	 * @return 처리 성공 여부
	 */
	public int editOutcome(OutcomeDTO dto) {
		try {
			String sql = "update tblOutcome set regDate = sysdate, content = ?, amount = ?, cSeq = ? where seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getContent());
			stat.setInt(2, dto.getAmount());
			stat.setString(3, dto.getcSeq());
			stat.setString(4, dto.getSeq());

			return stat.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.editOutcome ###");
			return 0;
		}
	}

	/**
	 * 요청된 비용청구서 삭제
	 * @param seq 삭제할 비용청구서 번호
	 * @return 처리 성공 여부
	 */
	public int delOutcome(String seq) {
		try {
			String sql = "delete from tblOutcome where seq = "+ seq;
			Statement stat = conn.createStatement();
			
			return stat.executeUpdate(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("### com.fineapple.department / OutcomeDAO.delOutcome ###");
			return 0;
		}
	}
}