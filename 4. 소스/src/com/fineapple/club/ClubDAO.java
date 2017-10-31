package com.fineapple.club;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fineapple.DTO.ClubDTO;
import com.fineapple.util.DBUtil;

public class ClubDAO {

	private Connection conn;
	
	//초기작업
	public ClubDAO() {
		try {
			conn = DBUtil.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//자원해제
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//클럽리스트 뷰에 있는 리스트를 뽑아주는 메소드
	public ArrayList<ClubDTO> list() {

		try {
			String sql="";
			
			sql = "Select * from clubListView";
			PreparedStatement stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();
			
			//큰 상자(테이블)
			//ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			//여기서 발생하는 여러가지 에러 확인!!!
			ArrayList<ClubDTO> list = new ArrayList<ClubDTO>();
			
			//rs -> list 복사
			while (rs.next()) {
				//레코드 1개 -> DTO 1개
				//작은 상자(레코드)
				ClubDTO dto = new ClubDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setCategoryName(rs.getString("categoryName"));
				if(rs.getString("clubImg")!=null) {
					dto.setClubimg(rs.getString("clubImg"));
				}else {
					dto.setClubimg("/Project/company/images/logo1black.png");
				}
				dto.setDepartment(rs.getString("department"));
				dto.setDetail(rs.getString("detail"));
				dto.setEmpName(rs.getString("empName"));
				dto.setName(rs.getString("name"));
				dto.setOpenDate(rs.getString("openDate"));
				
				list.add(dto);
				
			}//while
			
			return list;
		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		
	}

	public ArrayList<ClubDTO> getClubName(String seq) {
		
		
		try {
			
			String sql ="";
			
			sql="SELECT c.SEQ as seq, c.NAME as clubname from club c INNER JOIN CLUBMEMBER m ON c.SEQ = m.CLUBSEQ INNER JOIN EMPLOYEE e on c.EMPSEQ = e.SEQ WHERE m.EMPSEQ=?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<ClubDTO> myClubList = new ArrayList<ClubDTO>(); 
			while(rs.next()) {
				ClubDTO dto = new ClubDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("clubname"));
				
				myClubList.add(dto);
			}
			
			return myClubList;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
