package com.fineapple.club;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fineapple.DTO.ClubVoteDTO;
import com.fineapple.DTO.SimpleEmpVO;
import com.fineapple.DTO.VoteItemDTO;
import com.fineapple.DTO.VoteJoinerDTO;
import com.fineapple.util.DBUtil;
import com.sun.org.apache.regexp.internal.recompile;

public class ClubVoteDAO {

	private Connection conn;
	
	//초기작업
	public ClubVoteDAO() {
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

	public ArrayList<ClubVoteDTO> getVoteList(String clubSeq) {
		
		try {
			
			String sql = "";
			sql = "SELECT cv.seq as seq, e.name as writer, cv.TITLE, round((sysdate - cv.startDate) * 24 * 60) as gap, floor(cv.ENDDATE-sysdate) as gap2 FROM CLUBVOTE cv INNER JOIN CLUBMEMBER ON cv.MEMBERSEQ = CLUBMEMBER.SEQ INNER JOIN EMPLOYEE e ON CLUBMEMBER.EMPSEQ = e.SEQ WHERE cv.CLUBSEQ=? ORDER BY cv.SEQ DESC";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, clubSeq);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<ClubVoteDTO> list = new ArrayList<ClubVoteDTO>();
			
			while(rs.next()) {
				ClubVoteDTO dto = new ClubVoteDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setGap(rs.getInt("gap"));
				dto.setGap2(rs.getInt("gap2"));
				
				list.add(dto);
				
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<VoteJoinerDTO> getVoteJoinerList(String seq) {
		try {
			String sql="";
			
			sql="SELECT vj.* FROM VOTEJOINER vj INNER JOIN CLUBVOTEITEM vi on vj.ITEMSEQ = vi.SEQ INNER JOIN  CLUBVOTE cv ON vi.VOTESEQ = cv.SEQ WHERE cv.seq=?";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			ArrayList<VoteJoinerDTO> list = new ArrayList<VoteJoinerDTO>();
			
			while(rs.next()) {
				VoteJoinerDTO dto = new VoteJoinerDTO();
				
				dto.setItemSeq(rs.getString("itemSeq"));
				dto.setMemberSeq(rs.getString("memberSeq"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setSeq(rs.getString("SEQ"));
				
				list.add(dto);
			}		
			
			return list;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	public ClubVoteDTO getOneVote(String seq) {
		
		try {
			String sql = "SELECT cv.seq as seq, e.name as writer, cv.TITLE as title, e.SEQ as writerseq, round((sysdate - cv.startDate) * 24 * 60) as gap, cv.enddate as enddate FROM CLUBVOTE cv INNER JOIN CLUBMEMBER ON cv.MEMBERSEQ = CLUBMEMBER.SEQ INNER JOIN EMPLOYEE e ON CLUBMEMBER.EMPSEQ = e.SEQ WHERE cv.seq = ? ORDER BY cv.SEQ DESC";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			
			stat.setString(1, seq);
			
			ResultSet rs =stat.executeQuery();
			
			ClubVoteDTO dto = new ClubVoteDTO();
			if(rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setWriterSeq(rs.getString("writerSeq"));
				dto.setGap(rs.getInt("gap"));
				dto.setEndDate(rs.getString("endDate"));
			}
			
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<VoteItemDTO> getVoteItems(String seq) {
		try {
			String sql ="";
			
			sql="SELECT vi.seq as seq, vi.voteseq as voteseq, vi.content as content FROM CLUBVOTEITEM vi iNNER JOIN CLUBVOTE cv ON vi.VOTESEQ = cv.SEQ WHERE cv.SEQ=? order BY vi.SEQ ASC";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<VoteItemDTO> list = new ArrayList<VoteItemDTO>();
			while(rs.next()) {
				VoteItemDTO dto = new VoteItemDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setContent(rs.getString("content"));
				dto.setVoteSeq(rs.getString("voteSeq"));
				
				list.add(dto);
			};
			return list;
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<VoteJoinerDTO> getVoteJoiners(String seq) {
		try {
			String sql = "";
			
			sql = "SELECT vj.seq as seq, vj.itemseq as itemseq, vj.memberseq as memberseq, vj.regdate as regdate FROM CLUBVOTEITEM vi INNER JOIN VOTEJOINER vj on vi.SEQ = vj.ITEMSEQ WHERE vi.VOTESEQ=?";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			ArrayList<VoteJoinerDTO> joinerlist = new ArrayList<VoteJoinerDTO>();
			
			while(rs.next()) {
				
				VoteJoinerDTO dto = new VoteJoinerDTO();
				
				dto.setItemSeq(rs.getString("itemSeq"));
				dto.setMemberSeq(rs.getString("memberSeq"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setSeq(rs.getString("seq"));
				
				joinerlist.add(dto);
			}
			
			return joinerlist;
					
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public SimpleEmpVO getEmpInfo(String writerSeq) {
		try {
			String sql="SELECT e.name as name, d.department as department, p.position as position FROM DEPARTMENT d INNER JOIN EMPLOYEE e on d.SEQ = e.DEPARTMENTSEQ INNER JOIN TBLPOSITION p ON e.POSITIONSEQ = p.SEQ WHERE e.SEQ = ?";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			
			stat.setString(1, writerSeq);
			
			ResultSet rs = stat.executeQuery();
			
			SimpleEmpVO vo = new SimpleEmpVO();
			
			if(rs.next()) {
				vo.setDepartment(rs.getString("department"));
				vo.setName(rs.getString("name"));
				vo.setPosition(rs.getString("position"));
			}
			
			return vo;
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int insertVote(String item, String clubseq, String empSeq) {

		try {
			String sql ="insert into VOTEJOINER VALUES (VOTEJOINERSEQ.nextval, ?, (SELECT seq FROM CLUBMEMBER WHERE CLUBSEQ=? AND EMPSEQ=?), DEFAULT)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, item);
			stat.setString(2, clubseq);
			stat.setString(3, empSeq);
			
			int result = 0;
			result = stat.executeUpdate();
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int getVoteSeq(String clubseq, String voteseq, String empseq) {
		try {
			String sql = "";
			
			sql = "SELECT itemseq as result FROM VOTEJOINER WHERE ITEMSEQ IN (SELECT seq FROM CLUBVOTEITEM WHERE VOTESEQ=?) and MEMBERSEQ=(SELECT SEQ FROM CLUBMEMBER WHERE clubseq=? and EMPSEQ=?)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
				
			stat.setString(1, voteseq);
			stat.setString(2, clubseq);
			stat.setString(3, empseq);
			
			ResultSet rs = stat.executeQuery();
			int result =0;
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return 0;
	}

	public int editVote(String clubseq, String prechecked, String checkitem, String empseq) {
		
		try {
			String sql = "";
			sql = "UPDATE votejoiner set ITEMSEQ = ? WHERE itemseq=? AND MEMBERSEQ=(SELECT seq FROM CLUBMEMBER WHERE CLUBSEQ=? AND EMPSEQ=?)";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, checkitem);
			stat.setString(2, prechecked);
			stat.setString(3, clubseq);
			stat.setString(4, empseq);
			
			int result=0;
			result=stat.executeUpdate();
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public String addNewVote(String title, String clubseq, String endDate, String empseq) {
		try {
			String sql ="";
			sql="INSERT INTO CLUBVOTE(seq, clubseq, MEMBERSEQ, title, enddate) VALUES (clubvoteseq.nextval, ?, (SELECT seq FROM CLUBMEMBER WHERE EMPSEQ=? and clubseq=?), ?, ?)";
			PreparedStatement stat = conn.prepareStatement(sql);
			
			stat.setString(1,clubseq);
			stat.setString(2,empseq);
			stat.setString(3,clubseq);
			stat.setString(4,title);
			stat.setString(5,endDate);
			
			
			int result=stat.executeUpdate();
			String voteseq="0";
			if(result!=0) {
				sql="select max(seq) as seq from clubvote";
				stat = conn.prepareStatement(sql);
				ResultSet rs = stat.executeQuery();
				
				if(rs.next()) {
					voteseq = rs.getString("seq");
				}
			}
			
			
			return voteseq;
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
		
	}

	public int addNewVoteItem(String voteseq, String item) {
		
		try {
			String sql ="";
			sql ="insert into CLUBVOTEITEM(seq, voteseq, content) values(clubvoteitemseq.nextval, ?, ?)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, voteseq);
			stat.setString(2, item);
			
			int result=0;
			
			result=stat.executeUpdate();
			
			return result;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
}
