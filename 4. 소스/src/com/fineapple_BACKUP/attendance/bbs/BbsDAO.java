package com.fineapple.attendance.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.fineapple.DTO.AtdBoardDTO;
import com.fineapple.DTO.AtdMainListDTO;
import com.fineapple.util.DBUtil;

public class BbsDAO {

    private Connection conn;
    
    //초기작업
    //DAO에서 사용 할 커넥션을 생성자로 만들어 둔다.
    public BbsDAO() {
        try {
            conn = DBUtil.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // BbsService가 글목록을 달라고 요청.
    public ArrayList<AtdMainListDTO> list() {
	try {
	    
	    	String sql = "select category, subject, name, regDate, readCount from atdMainList";
	    	
	    	PreparedStatement stat = conn.prepareStatement(sql);
	        ResultSet rs = stat.executeQuery();
	        
	        ArrayList<AtdMainListDTO> list = new ArrayList<AtdMainListDTO>();
	        while (rs.next()) {
	            AtdMainListDTO dto = new AtdMainListDTO();
	            dto.setCategory(rs.getString("category"));
	            dto.setSubject(rs.getString("subject"));
	            dto.setName(rs.getString("name"));
	            dto.setRegDate(rs.getString("regDate"));
	            dto.setReadCount(rs.getInt("readCount"));
	            
	            list.add(dto);
		}
	    
	        return list;

	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}
    }
    //BbsService 객체가 글써달라고 요청
    public int addBbs(AtdBoardDTO dto) {
	try {
	    String sql = "INSERT INTO ATDBOARD (SEQ, ESEQ, CSEQ, SUBJECT, CONTENT, THREAD, DEPTH) VALUES (atdBoardSeq.nextval, ?, ?, ?, ?, ?, ?)";
	    
	    PreparedStatement stat = conn.prepareStatement(sql);
	    stat.setString(1, dto.getEseq()+"");
            stat.setString(2, dto.getCseq()+"");
            stat.setString(3, dto.getSubject());
            stat.setString(4, dto.getContent());
            stat.setString(5, dto.getThread()+"");
            stat.setString(6, dto.getDepth()+"");

            return stat.executeUpdate();

	} catch (Exception e) {
	    e.printStackTrace();
	    return 0;
	}
    }
}

































