package com.fineapple.all.contact;

import java.util.ArrayList;

import com.fineapple.DTO.VEmployeeDTO;

public class ContactService {

	private ContactDAO dao;
	
	public ContactService() {
		dao = new ContactDAO();
	}
	
	public ArrayList<VEmployeeDTO> getList() {
		return dao.getList();
	}

}
