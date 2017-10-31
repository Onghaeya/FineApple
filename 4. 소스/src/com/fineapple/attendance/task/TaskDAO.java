package com.fineapple.attendance.task;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.fineapple.DTO.AtdWorkRecordDTO;
import com.fineapple.util.DBUtil;

public class TaskDAO {

    private Connection conn;
    
    //초기작업
    //DAO에서 사용 할 커넥션을 생성자로 만들어 둔다.
    public TaskDAO() {
        try {
            conn = DBUtil.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //중간관리자인 서비스가 나에게 일을 떠넘겼다. 출근을 기록해주자.
    public int come(AtdWorkRecordDTO dto) {

	try {
	    
	    //'퇴근기록이 없는 출근기록' 이 하나도 없다면.. 출근을 기록한다.
	    String sql = "SELECT * FROM ATDWORKRECORD WHERE eseq = ? AND LEAVETIME is NULL";
	    PreparedStatement stat = conn.prepareStatement(sql);
	    stat.setString(1, dto.getEseq());
	    int result = stat.executeUpdate();

	    System.out.println("출근 셀렉트결과 result : "+result);

	    
	    //만약 그런 기록이 없다면..
	    if (result == 0) {
		
		sql = "INSERT INTO ATDWORKRECORD (SEQ, ESEQ, COMETIME) VALUES (atdWrSeq.nextval, ?, DEFAULT)";
		PreparedStatement stat2 = conn.prepareStatement(sql);
		stat2.setString(1, dto.getEseq());
		
		result = stat2.executeUpdate();
		System.out.println("출근 인서트결과 reesult : "+result);

		return result;
	    }
	    
	    return 0;
	    
	} catch (Exception e) {
	    e.printStackTrace();
	    return 0;
	}
    }

    //중간관리자인 서비스가 나에게 일을 떠넘긴다맨날 시발빗바릾발 힝ㅠㅠㅜ
    public int leave(String eseq) {

	try {
	
	    //'퇴근기록이 없는 출근기록' 이 하나 있다면, 거기에 대해 퇴근기록을 넣는다. 
	    
	    String sql = "SELECT * FROM ATDWORKRECORD WHERE eseq = ? AND LEAVETIME is NULL";
	    PreparedStatement stat = conn.prepareStatement(sql);
	    stat.setString(1, eseq);
	    int result = stat.executeUpdate();
	    System.out.println("퇴근 셀력결과 result : "+result);
	    
	    //'퇴근기록이 없는 출근기록' 이 하나라면..
	    if(result == 1) {
		sql = "UPDATE ATDWORKRECORD SET LEAVETIME = sysdate WHERE eseq = ? and LEAVETIME is NULL";
		PreparedStatement stat2 = conn.prepareStatement(sql);
		stat2.setString(1, eseq);
		
		result = stat2.executeUpdate();
		System.out.println("퇴근 업데이트결과 reesult : "+result);
		return result;
	    }
	    
	    return 0;
	    
	} catch (Exception e) {
	    e.printStackTrace();
	    return 0;
	}
    }
    
    
}
