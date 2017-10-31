package com.fineapple.attendance.task;

import com.fineapple.DTO.AtdWorkRecordDTO;

public class TaskService {

    private TaskDAO dao;

    
    //서비스안에서 사용 할 dao를 생성자로 생성해둠.
    public TaskService() {
        this.dao = new TaskDAO();
    
    }


    //컨트롤이 출근을 기록해달라고, dto를 주면서 요청. 중간관리자인 나는 그걸 dao에게 위임한다. 데헷!
    public int come(AtdWorkRecordDTO dto) {
	return dao.come(dto);
    }


    //컨트롤이 퇴근을 기록해달라고 함. 디에오쨩에게 위임하고 쉬어버렷!!
    public int leave(String eseq) {
	return dao.leave(eseq);
    }
    
}
