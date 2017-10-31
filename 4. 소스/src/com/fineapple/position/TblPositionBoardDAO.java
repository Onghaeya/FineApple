package com.fineapple.position;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fineapple.DTO.tblPositionBoardDTO;
import com.fineapple.util.DBUtil;

public class TblPositionBoardDAO {
	
	private Connection conn = null;
		
	public TblPositionBoardDAO() {
		conn = DBUtil.getConnection();
	}

	
	//AddOk 서블릿이 글 좀 써달라고 DTO 건네면서 위임
	public int add(tblPositionBoardDTO dto) {

		try {

			/*insert into TBLPOSITIONBOARD
			(seq,categorySeq,empseq,subject,regdate,content,readCount,thread,depth)
			VALUES(TBLPOSITIONBOARDSEQ.nextval,1,10,'제목','2017-02-17','내용',1,1,1);*/
			
			/*String sql = "INSERT INTO TBLBOARD (SEQ, NAME, EMAIL, SUBJECT, CONTENT, TAG, REGDATE, READCOUNT, USERIP, PW) "
					+ "VALUES (BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, ?, ?)";*/
			
			System.out.println("add 접근");
			System.out.println(dto.getSubject());
			String sql = "insert into TBLPOSITIONBOARD values (tblpositionboardseq.nextval, 5, 10, ?, default, ?, 1, 1, 1)";
			PreparedStatement stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getSubject());
			stat.setString(2, dto.getContent());
			System.out.println(dto.getSubject() + "여기");
			System.out.println(dto.getContent() + "여기");
			
			System.out.println("여기까지 와주세요");
	
			
			return stat.executeUpdate();//글쓰기

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return 0;
	}


	//List 서블릿이 글 목록을 달라고 호출
	public ArrayList<tblPositionBoardDTO> list() {

		//ArrayList<BoardDTO> list = new ArrayList<>();
		
		try {

			String sql = "SELECT * FROM TBLPOSITIONBOARD ORDER BY SEQ DESC";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<tblPositionBoardDTO> list = new ArrayList<tblPositionBoardDTO>();
			
			//rs -> list 복사
			while (rs.next())	{
				//레코드 1개 -> BoardDTO 1개
				tblPositionBoardDTO dto = new tblPositionBoardDTO();
				dto.setSeq(rs.getString("seq"));
					//dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegDate(rs.getString("regdate"));
					//dto.setReadcount(rs.getInt("readCount"));
				list.add(dto);
			}
			
			
			
			return list;

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return null;
	}


	//View 서블릿이 글번호를 줄테니 글 1개(DTO)를 주세요..
	public tblPositionBoardDTO get(String seq) {

		try {

			String sql = "SELECT * FROM TBLPositionBOARD WHERE SEQ = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				
				tblPositionBoardDTO dto = new tblPositionBoardDTO();
				dto.setSeq(rs.getString("seq"));
					//dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
					//dto.setEmail(rs.getString("email"));
					//dto.setRegdate(rs.getString("regdate"));
					//dto.setUserip(rs.getString("userip"));
					//dto.setReadcount(rs.getInt("readcount"));
					//dto.setTag(rs.getString("tag"));
				
				System.out.println("리스트 출력완료");
				return dto;
				
				
			}

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return null;
	}


	//View 서블릿이 글번호 줄테니 조회수 +1 해달라고 요청
	public void addReadCount(String seq) {

		try {

			String sql = "UPDATE TBLBOARD SET READCOUNT = READCOUNT + 1 WHERE SEQ = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			stat.executeUpdate();

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
	}


	//EditOk 서블릿이 수정할 모든 내용을 줄테니 수정해주세요..
	public int edit(tblPositionBoardDTO dto) {

		try {

			String sql = "UPDATE TBLBOARD SET NAME = ?, EMAIL = ?, SUBJECT = ?, CONTENT = ?, TAG = ? WHERE SEQ = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
				//stat.setString(1, dto.getName());
				//stat.setString(2, dto.getEmail());
			stat.setString(3, dto.getSubject());
			stat.setString(4, dto.getContent());
				//stat.setString(5, dto.getTag());
			stat.setString(6, dto.getSeq());//X -> O
			
			return stat.executeUpdate();

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return 0;
	}


	//EditOk 서블릿이 글번호+암호 줄테니 이거 맞는지 확인?
	public boolean check(tblPositionBoardDTO dto) {

		try {

			//아래의 쿼리에서 최대값이 1이 나오는 이유가 뭔가요?
			//		-> 한마디 -> SEQ + ? -> PK
			String sql = "SELECT COUNT(*) AS CNT FROM TBLBOARD WHERE SEQ = ? AND PW = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSeq());
			//stat.setString(2, dto.getPw());
			
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


	
	//DelOk 서블릿이 글번호를 줄테니 글을 삭제해주세요.
	public int del(tblPositionBoardDTO dto) {

		try {

			String sql = "DELETE FROM TBLBOARD WHERE SEQ = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSeq());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return 0;
	}
	
}













