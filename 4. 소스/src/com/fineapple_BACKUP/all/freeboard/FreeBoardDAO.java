package com.fineapple.all.freeboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.fineapple.DTO.FBCategoryDTO;
import com.fineapple.DTO.FBCommentDTO;
import com.fineapple.DTO.FBFileDTO;
import com.fineapple.DTO.FreeBoardDTO;
import com.fineapple.DTO.VFreeBoardDTO;
import com.fineapple.util.DBUtil;

public class FreeBoardDAO {

	Connection conn;
	
	public FreeBoardDAO() {
		conn = DBUtil.getConnection();
	}
	
	public ArrayList<FBCategoryDTO> getCategory() {
	
		try {
			
			String sql = "SELECT * FROM FBCategory";
			Statement stat = conn.createStatement();
			
			ResultSet rs = stat.executeQuery(sql);
			
			ArrayList<FBCategoryDTO> categoryList = new ArrayList<FBCategoryDTO>();

			while (rs.next()) {
				FBCategoryDTO dto = new FBCategoryDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				categoryList.add(dto);
			}
			
			return categoryList;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null; 
		}
		
	}

	public int addFreeBoard(FreeBoardDTO fbdto) {
		try {
			
			String sql = "INSERT INTO freeboard (seq, empSeq, FBCategory, title, content, readCount, regDate, thread, depth) "
									+ "VALUES (freeBoardSeq.nextVal, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, DEFAULT)";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, fbdto.getEmpSeq());
			stat.setString(2, fbdto.getFBCategory());
			stat.setString(3, fbdto.getTitle());
			stat.setString(4, fbdto.getContent());
			
			int result = stat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}

	
	public String getMaxSeq() {
		
		int result = 0; 
		
		//방금 넣은 freeboard 테이블에서의 시퀀스 구하기
		String sql = "SELECT MAX(seq) FROM freeBoard";
		Statement stat;
		String seq = "";
		try {
			stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				seq = rs.getString(1);
			}
			
			rs.close();
			stat.close();
			
			return seq;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//첨부파일 저장
	public int addFile(FreeBoardDTO fbdto) {
		try {
			
			int result = 0;
	
			//첨부파일들 하나하나 집어넣기
			String sql = "INSERT INTO FBFile (seq, FBSeq, orgFileName, fileName) VALUES (FBFileSeq.nextVal, ?, ?, ?)";
			
			//있는 만큼
			for (FBFileDTO filedto : fbdto.getFileList()) {
				PreparedStatement pstat = conn.prepareStatement(sql);
				pstat.setString(1, fbdto.getSeq());
				pstat.setString(2, filedto.getOrgFileName());
				pstat.setString(3, filedto.getFileName());
				result = pstat.executeUpdate();
			}
			
			return result;
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}

	//view 중 글 불러오기
	public VFreeBoardDTO getContent(String seq) {
		
		try {
			//시퀀스가 넘겨받은 시퀀스와 같은 애를 찾아라
			String sql = "SELECT * FROM VFreeBoard WHERE seq = ?";
			PreparedStatement pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			ResultSet rs = pstat.executeQuery();
			
			VFreeBoardDTO dto = new VFreeBoardDTO(); //dto 준비
			
			while (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setEmpSeq(rs.getString("empSeq"));
				dto.setName(rs.getString("name"));
				dto.setFbCategory(rs.getString("fbCategory"));
				dto.setFbCategorySeq(rs.getString("fbCategorySeq"));
				dto.setTitle(rs.getString("title"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setContent(rs.getString("content"));
				dto.setReadCount(rs.getInt("readCount"));
				dto.setThread(rs.getString("thread"));
				dto.setDepth(rs.getString("depth"));
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
		
	}

	public ArrayList<FBFileDTO> getFiles(String seq) {

		try {
			String sql = "SELECT * FROM fbFile WHERE fbSeq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			ResultSet rs = stat.executeQuery();
			
			//fbdto에 넣을 파일 리스트
			ArrayList<FBFileDTO> fileList = new ArrayList<FBFileDTO>();
			
			//여러개일 수 있으니 while로 
			while(rs.next()) {
				FBFileDTO dto = new FBFileDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setFileName(rs.getString("fileName"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				fileList.add(dto);
			}
			
			return fileList;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
	}

	public ArrayList<VFreeBoardDTO> getList(HashMap<String, String> map) {
		try {
			
			String sql 
				= String.format(
						"select * from (select a.*, rownum as rnum from "
						+ "(select seq, name, empSeq, fbCategorySeq, fbCategory, title, readCount, regDate, round((sysdate - regDate) * 24) as gap "
								+ "from VFreeBoard order by seq desc) a) where rnum >= %s and rnum <= %s"
									, map.get("start"), map.get("end"));
			
			Statement stat = conn.createStatement()	;
			ResultSet rs = stat.executeQuery(sql);
			
			ArrayList<VFreeBoardDTO> list = new ArrayList<VFreeBoardDTO>();
			
			while(rs.next()) {
				VFreeBoardDTO dto = new VFreeBoardDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setEmpSeq(rs.getString("empSeq"));
				dto.setFbCategorySeq(rs.getString("fbCategorySeq"));
				dto.setFbCategory(rs.getString("fbCategory"));
				dto.setTitle(rs.getString("title"));
				dto.setReadCount(rs.getInt("readCount"));
				dto.setRegDate(rs.getString("regDate").substring(0, 10));
				dto.setGap(rs.getInt("gap"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
	}
	
	//파일이 있는지
	public ArrayList<VFreeBoardDTO> isFileAttached(ArrayList<VFreeBoardDTO> list) {
		try {
			
			String sql = "SELECT COUNT(*) FROM fbFile WHERE fbSeq = ?"; 
			
			for(VFreeBoardDTO dto : list) {
				
				PreparedStatement stat = conn.prepareStatement(sql);
				stat.setString(1, dto.getSeq());
				ResultSet rs = stat.executeQuery();
				
				if (rs.next()) {
					if (rs.getInt(1) != (0)) { 
						dto.setFileImg("<span style='color: #aaa; margin-left: 5px;' class='glyphicon glyphicon-floppy-disk'></span>");
					}
				}
				
			}
			
			return list; 
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	//총 게시물 개수 구하기
	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			String sql ="SELECT COUNT(*) FROM FreeBoard";
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			
			return 0; 
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
			
	}

	public int edit(FreeBoardDTO fbdto) {
		try {
			
			String sql = "UPDATE freeBoard SET fbCategory = ?, title = ?, content = ? WHERE seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, fbdto.getFBCategory());
			stat.setString(2, fbdto.getTitle());
			stat.setString(3, fbdto.getContent());
			stat.setString(4, fbdto.getSeq());
			
			int result = stat.executeUpdate();
			
			return result;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return 0;
	}
	
	//글 삭제하기
	public int fbDelete(String seq) {
		try {
			String sql = "DELETE FROM freeBoard WHERE seq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			int result = stat.executeUpdate();
			
			stat.close();

			return result;
		
		} catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}
	
	//첨부파일 삭제하기
	public int fileDelete(String seq) {
		try {
			String sql = "DELETE FROM fbFile WHERE fbSeq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			int result = stat.executeUpdate();
			
			stat.close();

			return result;
		
		} catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
	}

	public ArrayList<FBCommentDTO> getComments(String seq) {
		try {
			
			ArrayList<FBCommentDTO> clist = new ArrayList<FBCommentDTO>();
			
			String sql = "SELECT * FROM fbComment WHERE fbSeq = ?";
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			ResultSet rs = stat.executeQuery();
			
			while(rs.next()) {
				FBCommentDTO dto = new FBCommentDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setEmpSeq(rs.getString("empSeq"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setContent(rs.getString("content"));
				dto.setThread(rs.getInt("thread"));
				dto.setDepth(rs.getInt("depth"));
				clist.add(dto);
			}
			return clist;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

}
