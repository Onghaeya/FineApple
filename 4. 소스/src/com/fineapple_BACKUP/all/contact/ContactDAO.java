package com.fineapple.all.contact;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.fineapple.DTO.VEmployeeDTO;
import com.fineapple.util.DBUtil;

public class ContactDAO {

	Connection conn;
	
	public ContactDAO() {
		conn = DBUtil.getConnection();
	}
	
	public ArrayList<VEmployeeDTO> getList() {
		try {
			
			ArrayList<VEmployeeDTO> emplist = new ArrayList<VEmployeeDTO>();
			
			String sql = "SELECT * FROM vEmployee ORDER BY empSeq";
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			while(rs.next()) {
				VEmployeeDTO dto = new VEmployeeDTO();
				dto.setProfilePic(rs.getString("profilePic"));
				dto.setEmpSeq(rs.getString("empSeq"));
				dto.setName(rs.getString("name"));
				dto.setPosition(rs.getString("position"));
				dto.setDepartment(rs.getString("department"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				emplist.add(dto);
			}
			
			return emplist;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

}
