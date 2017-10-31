package com.fineapple.approval.draft;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.fineapple.DTO.ApprovalCategoryDTO;
import com.fineapple.DTO.ApprovalDTO;
import com.fineapple.DTO.FBCategoryDTO;
import com.fineapple.util.DBUtil;

import javafx.animation.ScaleTransition;

public class DraftDAO {

	Connection conn;

	
	public DraftDAO() {
		conn = DBUtil.getConnection();
	}// 생성자 DraftDAO
	
	//
	public ArrayList<ApprovalCategoryDTO> getCategory() {
		
		try {
			
			String sql = "SELECT * FROM approvalCategory";
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			ArrayList<ApprovalCategoryDTO> categoryList = new ArrayList<ApprovalCategoryDTO>();
			
			while (rs.next()) {
				ApprovalCategoryDTO dto = new ApprovalCategoryDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setApprovalCategoryName(rs.getString("approvalCategoryName"));
				
				categoryList.add(dto);
			}
			
			return categoryList;
			
		} catch (Exception e) {
			
			System.out.println(e.toString());
			
			return null;
			
		}
		
	}//getCategory

	// 결재 내역에 데이터 넣기
	public int add(ApprovalDTO dto) {
		try {
			String sql = "insert into approval (seq, employeenum, approvalcategorynum, approvalcontent, approvaldraftdate) values (approvalSeq.nextval, ?, ?, ?, default)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getEmployeeNum());
			stat.setString(2, dto.getApprovalCategory());
			stat.setString(3, dto.getApprovalContent());
			
			int result = stat.executeUpdate();
			
			return result;
		
		
		} catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}	
	}
	
	
}//DraftDAO























