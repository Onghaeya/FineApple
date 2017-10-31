package com.fineapple.attendance.bbs;

import java.util.ArrayList;

import com.fineapple.DTO.AtdBoardDTO;
import com.fineapple.DTO.AtdMainListDTO;

public class BbsService {
    private BbsDAO dao;

    
    //서비스안에서 사용 할 dao를 생성자로 생성해둠.
    public BbsService() {
        this.dao = new BbsDAO();
    
    }
    
    
    
    
    //BbsList 서블릿이 글목록을 달라고 요청.
    public ArrayList<AtdMainListDTO> list() {
	//dao에게 list를 달라고 요청하자.
	return dao.list();
    
    }



    //BbsAddOk 서블릿이 글써달라고 요청
    public int addBbs(AtdBoardDTO dto) {
	
	int thread = 0;
	int depth = 0;
	dto.setThread(thread);
	dto.setDepth(depth);
	
	return dao.addBbs(dto);
    }

}



























