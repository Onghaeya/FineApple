package com.fineapple.position;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fineapple.DTO.tblPositionBoardDTO;
import com.fineapple.DTO.tblScheduleDTO;
import com.fineapple.util.DBUtil;

public class TblScheduleDAO {
	
	private Connection conn = null;
		
	public TblScheduleDAO() {
		conn = DBUtil.getConnection();
	}

	
	//AddOk 서블릿이 글 좀 써달라고 DTO 건네면서 위임
	public int add(tblScheduleDTO dto) {

		try {

			//System.out.println("add 접근");
			
			String sql = "insert into tblSchedule values (tblScheduleseq.nextval, ?, ?, 10, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement stat = conn.prepareStatement(sql);
			
			
			
			stat.setString(1, dto.getCategorySeq());
			stat.setString(2, dto.getSubject());
			stat.setString(3, dto.getContent());
			stat.setString(4, dto.getPlace());
			stat.setString(5, dto.getStartDate());
			stat.setString(6, dto.getEndDate());
			stat.setString(7, dto.getOpen());
			stat.setInt(8, dto.getAlarm());
			/*if(dto.getAlarm()!=1){
				int notAlarm = 0;
				stat.setInt(8, notAlarm);
			}else{
				stat.setInt(8, dto.getAlarm());
				
			}*/
			stat.setString(9, dto.getPositionSeq());
		
			
			//System.out.println("여기까지 와주세요");
			
			return stat.executeUpdate();//글쓰기

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return 0;
	}


	//List 서블릿이 글 목록을 달라고 호출
	public ArrayList<tblScheduleDTO> list() {

		//ArrayList<BoardDTO> list = new ArrayList<>();
		
		try {

			String sql = "SELECT subject,startDate FROM TBLschedule";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<tblScheduleDTO> list = new ArrayList<tblScheduleDTO>();
			
			//rs -> list 복사
			while (rs.next())	{
				//레코드 1개 -> BoardDTO 1개
				tblScheduleDTO dto = new tblScheduleDTO();
				
				
				//dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setStartDate(rs.getString("startDate").substring(0, 10));
				/*dto.setContent(rs.getString("Content"));
				dto.setPlace(rs.getString("Place"));
				dto.setEndDate(rs.getString("EndDate"));
				dto.setOpen(rs.getString("Open"));
				dto.setAlarm(rs.getInt("Alarm"));
				dto.setPositionSeq(rs.getString("positionSeq"));*/
				
				System.out.println("DAO에요"+"/"+dto.getSeq());
				list.add(dto);
				
			
			}
			
			
			
			return list;

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return null;
	}



	public tblScheduleDTO get2(String seq) {
		
		
		try {
				System.out.println(seq);
			String sql = "SELECT * FROM tblSchedule WHERE seq = ?";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				
				tblScheduleDTO dto = new tblScheduleDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));

				
				if(rs.getString("categorySeq").equals("21")){
					//dto.setCategorySeq(rs.getString("categorySeq"));
					dto.setCategorySeq("회의");
				}else if(rs.getString("categorySeq").equals("22")){
					dto.setCategorySeq("업무");
				}else if(rs.getString("categorySeq").equals("23")){
					dto.setCategorySeq("행사");
				}else{
					dto.setCategorySeq("기타");
				}
				
				if(rs.getString("positionSeq").equals("1")){
					//dto.setPositionSeq(rs.getString("positionSeq"));
					dto.setPositionSeq("사장");
				}else if(rs.getString("positionSeq").equals("2")){
					dto.setPositionSeq("부장");
				}else if(rs.getString("positionSeq").equals("3")){
					dto.setPositionSeq("과장");
				}else{
					dto.setPositionSeq("사원");
				}


				dto.setPlace(rs.getString("place"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setContent(rs.getString("content"));
					
				System.out.println("리스트 출력완료");
				return dto;
				
				
			}

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return null;
	}
	
	//View 서블릿이 글번호를 줄테니 글 1개(DTO)를 주세요..
	public tblScheduleDTO get(String dtemp) {

		try {

			String sql = "SELECT * FROM tblSchedule WHERE startDate = ?";
			System.out.println(sql);
			System.out.println(dtemp);
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dtemp);
			
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				
				tblScheduleDTO dto = new tblScheduleDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));


				
				if(rs.getString("categorySeq").equals("21")){
					//dto.setCategorySeq(rs.getString("categorySeq"));
					dto.setCategorySeq("회의");
				}else if(rs.getString("categorySeq").equals("22")){
					dto.setCategorySeq("업무");
				}else if(rs.getString("categorySeq").equals("23")){
					dto.setCategorySeq("행사");
				}else{
					dto.setCategorySeq("기타");
				}
				
				if(rs.getString("positionSeq").equals("1")){
					//dto.setPositionSeq(rs.getString("positionSeq"));
					dto.setPositionSeq("사장");
				}else if(rs.getString("positionSeq").equals("2")){
					dto.setPositionSeq("부장");
				}else if(rs.getString("positionSeq").equals("3")){
					dto.setPositionSeq("과장");
				}else{
					dto.setPositionSeq("사원");
				}


				dto.setPlace(rs.getString("place"));
				dto.setStartDate(rs.getString("startDate"));
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
	
	//Edit eget 서블릿이 글번호를 줄테니 글 1개(DTO)를 주세요..
	public tblScheduleDTO eget(String seq) {
		
		try {
			
			String sql = "SELECT * FROM tblSchedule WHERE seq = ?";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				
				tblScheduleDTO dto = new tblScheduleDTO();
				
				
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setCategorySeq(rs.getString("categorySeq"));
				dto.setPositionSeq(rs.getString("positionSeq"));
				dto.setPlace(rs.getString("place"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setOpen(rs.getString("open"));
				dto.setContent(rs.getString("content"));
				dto.setAlarm(rs.getInt("alarm"));
				
				
				
				
				
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
	public int edit(tblScheduleDTO dto) {
		
		
		
		try {

			
			String sql = "UPDATE tblSchedule SET categorySeq = ?, subject = ?, content = ?, place = ?, startDate = ?, endDate = ?, open = ?, alarm = ?, positionSeq = ? where seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			
			System.out.println("여기 넘어오시나요?"+dto.getSeq());
			
			stat.setString(1, dto.getCategorySeq());
			stat.setString(2, dto.getSubject());
			stat.setString(3, dto.getContent());
			stat.setString(4, dto.getPlace());
			stat.setString(5, dto.getStartDate().substring(0, 10));
			stat.setString(6, dto.getEndDate().substring(0, 10));
			stat.setString(7, dto.getOpen());
			stat.setInt(8, dto.getAlarm());
			stat.setString(9, dto.getPositionSeq());
			stat.setString(10, dto.getSeq());
			
			
			
			return stat.executeUpdate();

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return 0;
	}


	//EditOk 서블릿이 글번호+암호 줄테니 이거 맞는지 확인?
	public boolean check(tblScheduleDTO dto) {

		try {

			//아래의 쿼리에서 최대값이 1이 나오는 이유가 뭔가요?
			//		-> 한마디 -> SEQ + ? -> PK
			String sql = "SELECT COUNT(*) AS CNT FROM tblSchedule WHERE SEQ = ? ";
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
	public int del(tblScheduleDTO dto) {

		try {

			String sql = "DELETE FROM tblSchedule WHERE SEQ = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSeq());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return 0;
	}





}













