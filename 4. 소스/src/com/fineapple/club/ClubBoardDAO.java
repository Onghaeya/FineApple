package com.fineapple.club;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.fineapple.DTO.ClubBoardDTO;
import com.fineapple.util.DBUtil;

public class ClubBoardDAO {

	private Connection conn;

	// 초기작업
	public ClubBoardDAO() {
		try {
			conn = DBUtil.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 자원해제
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ClubBoardDTO> getList(String seq) {

		try {

			String sql = "";
			sql = "SELECT rownum as rnum, a.* FROM (SELECT cb.SEQ, cb.TITLE as title, cb.CONTENT as content, e.NAME as name, cb.REGDATE as regdate, cb.READCOUNT, round((sysdate-cb.REGDATE)*24*60) as gap from CLUBBOARDCATEGORY cbc INNER JOIN CLUBBOARD cb on cbc.SEQ = cb.CATEGORYSEQ INNER JOIN CLUBMEMBER cm ON cb.MEMBERSEQ = cm.SEQ INNER JOIN club c ON cb.CLUBSEQ = c.SEQ INNER JOIN employee e on cm.EMPSEQ = e.SEQ WHERE cb.CLUBSEQ=? order BY cb.SEQ ASC) a ORDER BY rnum desc";

			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);

			ResultSet rs = stat.executeQuery();

			ArrayList<ClubBoardDTO> list = new ArrayList<ClubBoardDTO>();

			while (rs.next()) {
				ClubBoardDTO dto = new ClubBoardDTO();

				dto.setSeq(rs.getString("rnum"));
				dto.setRealSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setRegDate(rs.getString("regdate"));
				dto.setContent(rs.getString("content"));
				dto.setReadCount(rs.getInt("readCount"));
				dto.setGap(rs.getInt("gap"));
				dto.setName(rs.getString("name"));

				list.add(dto);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public void addReadCount(String realseq) {
		try {

			String sql = "UPDATE ClubBoard SET readCount = readCount + 1 WHERE seq = ?";

			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, realseq);

			stat.executeUpdate(); // 조회수 증가

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	public ClubBoardDTO getBoardDTO(String realseq) {
		try {

			String sql = "SELECT * FROM ClubBoardView WHERE realseq=?";

			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, realseq);

			ResultSet rs = stat.executeQuery(); // 원본

			ClubBoardDTO dto = new ClubBoardDTO(); // 복사본

			if (rs.next()) {
				dto.setRealSeq(rs.getString("realseq"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setReadCount(rs.getInt("readCount"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setDepartment(rs.getString("department"));
				dto.setPosition(rs.getString("position"));
			}	

			return dto;

		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
	}

	public int add(HashMap<String, String> map) {
		
		try {
			String sql = "";
			sql="INSERT INTO CLUBBOARD VALUES (CLUBBOARDSEQ.nextval, 2, (SELECT seq FROM CLUBMEMBER WHERE EMPSEQ=? and CLUBSEQ=?), ?,?,?,default,0,0,0)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			
			stat.setString(1, map.get("empSeq"));
			stat.setString(2, map.get("clubSeq"));
			stat.setString(3, map.get("clubSeq"));
			stat.setString(4, map.get("title"));
			stat.setString(5, map.get("content"));
			
			
			return stat.executeUpdate();
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

}
