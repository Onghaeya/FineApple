package com.fineapple.all.freeboard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.FBFileDTO;
import com.fineapple.DTO.FreeBoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AddOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		
		String path = req.getRealPath("/company/pages/all/freeboard/FBFiles");
	
		int size = 50 * 1024 * 1024;
		
		try {	//첨부파일 위한 try catch
			
			//1.
			req.setCharacterEncoding("UTF-8");
			
			MultipartRequest multi = new MultipartRequest(
														req
														, path
														, size
														, "UTF-8"
														, new DefaultFileRenamePolicy());
					
			HttpSession session = req.getSession(); //인증티켓 얻어오기 위해
			
			FreeBoardDTO fbdto = new FreeBoardDTO(); //FreeBoardDTO
			
			
			fbdto.setEmpSeq((String)session.getAttribute("seq"));
			fbdto.setFBCategory(multi.getParameter("FBCategory"));
			fbdto.setTitle(multi.getParameter("title"));
			fbdto.setContent(multi.getParameter("content"));
			
			//첨부파일 list에 넣기
			Enumeration e = multi.getFileNames();
			ArrayList<FBFileDTO> fileList = new ArrayList<FBFileDTO>();
			
			while (e.hasMoreElements()) {
				
				String file = (String)e.nextElement();
				
				FBFileDTO temp = new FBFileDTO();
				
				if (multi.getFilesystemName(file) != null) {	//파일이 있는 놈이라면
					
					temp.setFileName(multi.getFilesystemName(file));  //저장 이름
					temp.setOrgFileName(multi.getOriginalFileName(file));//사용자 이름
					fileList.add(temp);

				}
			}
			
			
			
			//첨부파일 FreeBoardDTO에 넣기
			fbdto.setFileList(fileList);
			
			//2. service 보내기
			FreeBoardService service = new FreeBoardService();
			int result = service.add(fbdto);

			// + 방금 쓴 글 번호 가져오기
			String seq = "";
			seq = service.getMaxSeq();
			
			//결과 잘 들어갔는지 저장 + 시퀀스
			req.setAttribute("result", result);
			req.setAttribute("seq", seq);
	
			RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/all/freeboard/addok.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}
	
}
