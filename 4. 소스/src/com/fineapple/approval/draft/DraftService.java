package com.fineapple.approval.draft;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.ApprovalCategoryDTO;
import com.fineapple.all.freeboard.FreeBoardDAO;

public class DraftService {

	private DraftDAO dao;
	private HttpSession session;
	
	public DraftService() {
		dao = new DraftDAO();
	}	
	
	public DraftService(HttpSession session) {
		dao = new DraftDAO();
		this.session = session;
	}
	
	
	// 카테고리 얻어오기
	public ArrayList<ApprovalCategoryDTO> getCategory() {
		return dao.getCategory();
	}

}//DraftService







