package com.fineapple.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.fineapple.DTO.MsgReadDTO;
import com.fineapple.DTO.MsgSRDTO;
import com.fineapple.DTO.MsgSentDTO;
import com.fineapple.util.DBUtil;

public class MessageDAO {

	//공통업무 Connection 객체 생성
	private Connection conn;
	
	//공통업무 초기작업
	public MessageDAO() {
		try {
			conn = DBUtil.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//공통업무 자원해제
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	//보낸쪽지함에 쪽지 저장
	public int sAdd(MsgSentDTO sdto) {
		try {
			
			String sql = "insert into tblMsgSent (seq, sentEmployeeNum, title, content, sentDate, sentDelete, sentSave) VALUES (msgsentseq.nextval, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, sdto.getSentEmployeeNum());
			stat.setString(2, sdto.getTitle());
			stat.setString(3, sdto.getContent());
			
			return stat.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}

	//받은쪽지함에 쪽지 저장
	public int rAdd(MsgReadDTO rdto) {
		try {
			//보낸쪽지함에 가장 최근에 추가된 seq값 획득
			int msgNum;
			String sql = "select max(seq) as num from tblmsgsent";
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			rs.next();
			msgNum = rs.getInt("num");

			//받은쪽지함에 저장			
			sql = "insert into tblMsgRead (seq, msgNumber, readEmployeeNum, readDate, readDelete, readSave) VALUES (msgreadseq.nextval, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
			PreparedStatement pstat = conn.prepareStatement(sql);
			pstat.setInt(1, msgNum);
			pstat.setInt(2, rdto.getReadEmployeeNum());
			
			return pstat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}
	
	//받은쪽지함 INSERT 실패시 ROLLBACK
	public int rollbackAdd(MsgReadDTO rdto) {
		try {
			//보낸쪽지함에 가장 최근에 추가된 seq값 획득
			int msgNum;
			String sql = "select max(seq) as num from tblmsgsent";
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			rs.next();
			msgNum = rs.getInt("num");

			sql = "delete from tblmsgsent where seq = ?";
			PreparedStatement pstat = conn.prepareStatement(sql);
			pstat.setInt(1, msgNum);
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}

	
	
	//받은쪽지함 출력
	public ArrayList<MsgSRDTO> list(int num) {
		try {
			String sql = "select tbl1.*, (select name from employee where seq = sentemployeenum) as sentemployeename, (select name from employee where seq = reademployeenum) as reademployeename from (SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave, r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave FROM tblmsgsent S INNER JOIN tblMsgRead R ON s.seq = r.msgnumber where reademployeenum = ? and readdelete = 'N' order by sseq desc) tbl1";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, num);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<MsgSRDTO> list = new ArrayList<MsgSRDTO>();
			while (rs.next()) {
				MsgSRDTO dto = new MsgSRDTO();

				dto.setSseq(rs.getInt("sseq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				dto.setRseq(rs.getInt("rseq"));
				dto.setMsgNumber(rs.getInt("msgNumber"));
				dto.setReadEmployeeNum(rs.getInt("readEmployeeNum"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadDelete(rs.getString("readDelete"));
				dto.setReadSave(rs.getString("readSave"));
				
				dto.setAddedsentDate(rs.getString("sentDate"));
				dto.setAddedreadDate(rs.getString("readDate"));
				dto.setAddedsentEmployeeName(rs.getString("sentemployeename"));
				dto.setAddedreadEmployeeName(rs.getString("reademployeename"));
				
				list.add(dto);
				
			}//while

			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//보낸쪽지함 출력
	public ArrayList<MsgSRDTO> slist(int num) {
		
		try {
			String sql = "SELECT tbl1.*, (select name from employee where seq = sentemployeenum) as sentemployeename, (select name from employee where seq = reademployeenum) as reademployeename from (SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave, r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave FROM tblmsgsent S INNER JOIN tblMsgRead R ON s.seq = r.msgnumber where sentemployeenum = ? and sentdelete = 'N' order by sseq desc) tbl1";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, num);
			ResultSet rs = stat.executeQuery();
			
			ArrayList<MsgSRDTO> list = new ArrayList<MsgSRDTO>();
			while (rs.next()) {
				MsgSRDTO dto = new MsgSRDTO();

				dto.setSseq(rs.getInt("sseq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				dto.setRseq(rs.getInt("rseq"));
				dto.setMsgNumber(rs.getInt("msgNumber"));
				dto.setReadEmployeeNum(rs.getInt("readEmployeeNum"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadDelete(rs.getString("readDelete"));
				dto.setReadSave(rs.getString("readSave"));

				dto.setAddedsentDate(rs.getString("sentDate"));
				dto.setAddedreadDate(rs.getString("readDate"));
				dto.setAddedsentEmployeeName(rs.getString("sentemployeename"));
				dto.setAddedreadEmployeeName(rs.getString("reademployeename"));
				
				list.add(dto);
			}//while
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

	//보관쪽지함 출력
	public ArrayList<MsgSRDTO> plist(int num) {
		try {
			String sql = "select tbl1.*, (select name from employee where seq = sentemployeenum) as sentemployeename, (select name from employee where seq = reademployeenum) as reademployeename from (select * from (SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave, r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave FROM tblmsgsent S INNER JOIN tblMsgRead R ON s.seq = r.msgnumber) where (sentemployeenum = ? and sentsave = 'Y') or (reademployeenum = ? and readsave = 'Y') order by sseq desc) tbl1";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, num);
			stat.setInt(2, num);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<MsgSRDTO> list = new ArrayList<MsgSRDTO>();
			while (rs.next()) {
				MsgSRDTO dto = new MsgSRDTO();

				dto.setSseq(rs.getInt("sseq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				dto.setRseq(rs.getInt("rseq"));
				dto.setMsgNumber(rs.getInt("msgNumber"));
				dto.setReadEmployeeNum(rs.getInt("readEmployeeNum"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadDelete(rs.getString("readDelete"));
				dto.setReadSave(rs.getString("readSave"));

				dto.setAddedsentDate(rs.getString("sentDate"));
				dto.setAddedreadDate(rs.getString("readDate"));
				dto.setAddedsentEmployeeName(rs.getString("sentemployeename"));
				dto.setAddedreadEmployeeName(rs.getString("reademployeename"));
				
				list.add(dto);
			}//while
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//업퍼헤더 리스트출력
	public ArrayList<MsgSRDTO> upperlist(int num) {
		try {
			
			String sql = "select tbl1.*, (select name from employee where seq = sentemployeenum) as sentemployeename, (select name from employee where seq = reademployeenum) as reademployeename from (SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave, r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave FROM tblmsgsent S INNER JOIN tblMsgRead R ON s.seq = r.msgnumber where reademployeenum = ? and readdate is null and readdelete = 'N' order by sseq desc) tbl1";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, num);
			
			ResultSet rs = stat.executeQuery();
			int cnt = 1;
			
			ArrayList<MsgSRDTO> list = new ArrayList<MsgSRDTO>();
			while (rs.next()) {
				MsgSRDTO dto = new MsgSRDTO();

				dto.setSseq(rs.getInt("sseq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				dto.setRseq(rs.getInt("rseq"));
				dto.setMsgNumber(rs.getInt("msgNumber"));
				dto.setReadEmployeeNum(rs.getInt("readEmployeeNum"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadDelete(rs.getString("readDelete"));
				dto.setReadSave(rs.getString("readSave"));

				dto.setAddedsentDate(rs.getString("sentDate"));
				dto.setAddedreadDate(rs.getString("readDate"));
				dto.setAddedsentEmployeeName(rs.getString("sentemployeename"));
				dto.setAddedreadEmployeeName(rs.getString("reademployeename"));
				
				list.add(dto);
				if (cnt == 5) {
					break;
				}
				cnt++;
				
			}//while
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

	public ArrayList<MsgSRDTO> viewlist(String sseq, String rseq, int num) {
		try {

			String sql = "select * from (SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave, r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave FROM tblmsgsent S INNER JOIN tblMsgRead R ON s.seq = r.msgnumber) where sseq = ? and rseq = ? and ((reademployeenum = ? and readdelete = 'N') or (sentemployeenum = ? and sentdelete = 'N')) order by sseq desc";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, sseq);
			stat.setString(2, rseq);
			stat.setInt(3, num);
			stat.setInt(4, num);
			
			ResultSet rs = stat.executeQuery();
			int cnt = 1;
			
			ArrayList<MsgSRDTO> list = new ArrayList<MsgSRDTO>();
			while (rs.next()) {
				MsgSRDTO dto = new MsgSRDTO();

				dto.setSseq(rs.getInt("sseq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				dto.setRseq(rs.getInt("rseq"));
				dto.setMsgNumber(rs.getInt("msgNumber"));
				dto.setReadEmployeeNum(rs.getInt("readEmployeeNum"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadDelete(rs.getString("readDelete"));
				dto.setReadSave(rs.getString("readSave"));
				
				list.add(dto);
				
				if (cnt == 5) {
					break;
				}
				cnt++;

				//읽은시간 업데이트
				sql = "update tblMsgRead set readdate = sysdate where seq = ?";
				stat = conn.prepareStatement(sql);
				stat.setString(1, rseq);
				stat.executeUpdate();
				
			}//while
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<MsgSRDTO> pviewlist(String sseq, String rseq, int num) {
		try {
			String sql = "select * from (SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave, r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave FROM tblmsgsent S INNER JOIN tblMsgRead R ON s.seq = r.msgnumber) where sseq = ? and rseq = ? and ((reademployeenum = ? and readdelete = 'N') or (sentemployeenum = ? and sentdelete = 'N')) order by sseq desc";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, sseq);
			stat.setString(2, rseq);
			stat.setInt(3, num);
			stat.setInt(4, num);
			
			ResultSet rs = stat.executeQuery();
			int cnt = 1;
			
			ArrayList<MsgSRDTO> list = new ArrayList<MsgSRDTO>();
			while (rs.next()) {
				MsgSRDTO dto = new MsgSRDTO();

				dto.setSseq(rs.getInt("sseq"));
				dto.setSentEmployeeNum(rs.getInt("sentEmployeeNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSentDate(rs.getString("sentDate"));
				dto.setSentDelete(rs.getString("sentDelete"));
				dto.setSentSave(rs.getString("sentSave"));
				
				dto.setRseq(rs.getInt("rseq"));
				dto.setMsgNumber(rs.getInt("msgNumber"));
				dto.setReadEmployeeNum(rs.getInt("readEmployeeNum"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadDelete(rs.getString("readDelete"));
				dto.setReadSave(rs.getString("readSave"));
				
				list.add(dto);
				
			}//while
			
			sql = "update tblMsgRead set readdate = sysdate where seq = ?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, rseq);
			stat.executeUpdate();
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int save(String[] str, int boardnum) {
		System.out.println(str.length);
		try {
			if (boardnum == 1) { 
				String sql = "update tblMsgRead set readsave = 'Y' where seq = ?";
				for (int i=0; i<str.length; i++){
					PreparedStatement stat = conn.prepareStatement(sql);
					stat.setInt(1, Integer.parseInt(str[i]));
					stat.executeUpdate();
				}
			} else if (boardnum == 2) { 
				String sql = "update tblMsgSent set sentsave = 'Y' where seq = ?";
				for (int i=0; i<str.length; i++){
					PreparedStatement stat = conn.prepareStatement(sql);
					stat.setInt(1, Integer.parseInt(str[i]));
					stat.executeUpdate();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int del(String[] str, int boardnum, int num) {
		System.out.println(str.length);
		try {
			if (boardnum == 1) {
				String sql = "update tblMsgRead set readdelete = 'Y' where seq = ?";
				for (int i=0; i<str.length; i++){
					PreparedStatement stat = conn.prepareStatement(sql);
					stat.setInt(1, Integer.parseInt(str[i]));
					stat.executeUpdate();
				}
			} else if (boardnum == 2) {
				
				String sql = "update tblMsgSent set sentdelete = 'Y' where seq = ?";
				for (int i=0; i<str.length; i++){
					PreparedStatement stat = conn.prepareStatement(sql);
					stat.setInt(1, Integer.parseInt(str[i]));
					stat.executeUpdate();
				}
				
				sql = "update tblMsgRead set readDelete = 'Y', readSave = 'N' where seq = ? and readdate is null";
				for (int i=0; i<str.length; i++){
					PreparedStatement stat = conn.prepareStatement(sql);
					stat.setInt(1, Integer.parseInt(str[i]));
					stat.executeUpdate();
				}
				
			} else if (boardnum == 3) {
				String sql = "";

				for (int i=0; i<str.length; i++){
					sql = "update tblMsgSent set sentSave = 'N' where seq = ? and sentEmployeeNum = ?";
					PreparedStatement stat = conn.prepareStatement(sql);
					stat.setInt(1, Integer.parseInt(str[i]));
					stat.setInt(2, num);
					stat.executeUpdate();
				}
				
				for (int i=0; i<str.length; i++){
					System.out.println("employnum: " + num);
					sql = "update tblMsgRead set readSave = 'N' where msgnumber = ? and readEmployeeNum = ?";
					PreparedStatement stat = conn.prepareStatement(sql);
					stat.setInt(1, Integer.parseInt(str[i]));
					stat.setInt(2, num);
					stat.executeUpdate();
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public String addgetname(int readEmployeeNum) {
		try {
			String sql = "select name from employee where seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setInt(1, readEmployeeNum);
			ResultSet rs = stat.executeQuery();
			rs.next();
			
			return rs.getString("name");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}


