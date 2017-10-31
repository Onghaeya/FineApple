package com.fineapple.approval.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fineapple.DTO.ApprovalBoardDTO;
import com.fineapple.util.DBUtil;


public class BoardDAO {

	private Connection conn = null;	
	
	public BoardDAO() {
		conn = DBUtil.getConnection();
	}

	// 글쓰기(AddOk)
	public int add(ApprovalBoardDTO dto) {
		try {
			// 10 10 
			String sql = "insert into approvalBoard (seq, name, appovalCategoryNum, subject, regDate, content, readCount, thread, depth, empNum, pw) "
					+ "values (approvalBoardSeq.nextval, ?, ?, ?, default, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getName());
			stat.setString(2, dto.getAppovalCategoryNum());
			stat.setString(3, dto.getSubject());
			stat.setString(4, dto.getContent());
			stat.setInt(5, dto.getReadCount());
			stat.setInt(6, dto.getThread());
			stat.setInt(7, dto.getDepth());
			stat.setString(8, dto.getEmpNum());
			stat.setString(9, dto.getPw());
			
			return stat.executeUpdate();//글쓰기
		
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return 0;

	
	}

	
	// View
	public ApprovalBoardDTO get(String seq) {
		try {

			String sql = "SELECT * FROM approvalBoard WHERE SEQ = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				
				ApprovalBoardDTO dto = new ApprovalBoardDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setReadCount(rs.getInt("readCount"));
				
				return dto;
				
			}

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return null;
	}
	
	
	
	// 조회수 증가 (ReadCount)
	public void addReadCount(String seq) {
		
		try {

			String sql = "UPDATE approvalBoard SET READCOUNT = READCOUNT + 1 WHERE SEQ = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			stat.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}//addReadCount

	//List 서블릿이 글 목록을 달라고 호출
	public ArrayList<ApprovalBoardDTO> list() {

		try {
			
			String sql = "SELECT SEQ, SUBJECT, NAME, REGDATE, READCOUNT FROM approvalBoard ORDER BY SEQ DESC";
		
			PreparedStatement stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();
			
			ArrayList<ApprovalBoardDTO> list = new ArrayList<ApprovalBoardDTO>();
			
			while(rs.next()){
				ApprovalBoardDTO dto = new ApprovalBoardDTO(); // 작은 상자
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setReadCount(rs.getInt("readCount"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return null;
	}

	// 게시물 삭제
	public int del(ApprovalBoardDTO dto) {
		
		try {

			String sql = "DELETE FROM approvalBoard WHERE SEQ = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSeq());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return 0;
	}

	// 암호 체크 
	public boolean check(ApprovalBoardDTO dto) {
		//아래의 쿼리에서 최대값이 1이 나오는 이유가 뭔가요?
		//		-> 한마디 -> SEQ + ? -> PK
		try{
			
			String sql = "SELECT COUNT(*) AS CNT FROM approvalBoard WHERE SEQ = ? AND PW = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSeq());
			stat.setString(2, dto.getPw());
			
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				if (rs.getInt("cnt") == 1) {
					return true;
				}
			}
		
		} catch (Exception e) {
		
			System.out.println(e.toString());
		
		}
			return false;
		}

	//EditOk 서블릿이 수정할 모든 내용을 줄테니 수정해주세요..	
	public int edit(ApprovalBoardDTO dto) {
		try {
			
			String sql = "update approvalBoard set name=?, subject=?, content=? where seq=?";
			PreparedStatement stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getName());
			stat.setString(2, dto.getSubject());
			stat.setString(3, dto.getContent());
			stat.setString(4, dto.getSeq());
			
			return stat.executeUpdate();
			
			
		} catch (Exception e) {
			
			System.out.println(e.toString());
			
		}
		
		return 0;
	}//edit


	
}//BoardDAO































