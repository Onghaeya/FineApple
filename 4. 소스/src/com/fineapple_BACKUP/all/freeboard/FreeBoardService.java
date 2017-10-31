package com.fineapple.all.freeboard;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.fineapple.DTO.FBCategoryDTO;
import com.fineapple.DTO.FBCommentDTO;
import com.fineapple.DTO.FBFileDTO;
import com.fineapple.DTO.FreeBoardDTO;
import com.fineapple.DTO.VFreeBoardDTO;

public class FreeBoardService {

	private FreeBoardDAO dao;
	private HttpSession session;
	
	public FreeBoardService() {
		dao = new FreeBoardDAO();
	}
	
	public FreeBoardService(HttpSession session) {
		dao = new FreeBoardDAO();
		this.session = session;
	}
	
	//카테고리 얻어오기
	public ArrayList<FBCategoryDTO> getCategory() {
		return dao.getCategory();
	}

	//글 디비에 넣기
	public int add(FreeBoardDTO fbdto) {
		int fileResult = 1;
		String seq = "";
		//글내용 넣기
		int addResult = dao.addFreeBoard(fbdto);
		System.out.println(fbdto.getFileList().size());
		if(fbdto.getFileList().size() != 0) {
			//첨부파일이 있다면 첨부파일 넣기
			seq = dao.getMaxSeq();	//방금 입력한 글의 시퀀스 필요
			fbdto.setSeq(seq);			//넣어주기
			fileResult = dao.addFile(fbdto);
		}
		
		if ((addResult == 1) && (fileResult == 1)) return 1;
		else return 0;
		
	}

	public String getMaxSeq() {
		
		return dao.getMaxSeq();
	}

	public VFreeBoardDTO getView(String seq) {
		
		//글 얻어오기
		VFreeBoardDTO fbdto = new VFreeBoardDTO();
		fbdto = dao.getContent(seq);
		fbdto.setRegDate(fbdto.getRegDate().substring(0, 19));	//날짜 .0 자르기
		
		//첨부파일 얻어오기
		fbdto.setFileList(dao.getFiles(seq));
		
		//확장자명 잘라주기
		for (FBFileDTO dto : fbdto.getFileList()) {
			String fileName = dto.getFileName();
			dto.setExtension(fileName.substring(fileName.lastIndexOf("."), fileName.length()));
			//점을 뒤에서부터 찾아서 인덱스 구한 다음에 마지막까지 자름
		}

		//댓글 얻어오기
		
		return fbdto;
	}

	public ArrayList<VFreeBoardDTO> getList(HashMap<String, String> map) {
		ArrayList<VFreeBoardDTO> list = new ArrayList<VFreeBoardDTO>();
		
		list = dao.getList(map);
		
		//새로운 글 더 예쁜거 찾아보기
		for(VFreeBoardDTO dto : list) {
			if (dto.getGap() <= 6) {
				dto.setGapImg("<span class='label' style='color: #53a8f3; vertical-align: text-top; padding: 0px;'>new</span>");
			}
		}
		
		//첨부파일
		list = dao.isFileAttached(list);
		
		return list;
	}

	public int getTotalCount(HashMap<String, String> map) {
		return dao.getTotalCount(map);
	}

	public VFreeBoardDTO getEdit(String seq) {
		
		VFreeBoardDTO dto = new VFreeBoardDTO();
		
		dto = dao.getContent(seq); 				//우선 글 내용
		dto.setFileList(dao.getFiles(seq));	//첨부파일
			
		return dto;
	}

	public int edit(FreeBoardDTO fbdto) {
		//글 수정
		int result = dao.edit(fbdto);
		return result;
	}

	public int delete(String seq) {
		
		//글삭제
		dao.fileDelete(seq);
		
		//첨부파일삭제
		int result = dao.fbDelete(seq);

		return result;
	}

	public ArrayList<FBCommentDTO> getComments(String seq) {
		return dao.getComments(seq);
		
	}
	

}
