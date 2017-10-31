package com.fineapple.approval.draft;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fineapple.DTO.ApprovalDTO;

public class DraftAddOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
																	throws ServletException, IOException {
		
		// 1. 데이터 가져오기
		//2. DB 작업(insert) -> DAO 위임
		//3. 결과 출력 -> JSP 위임 
		
		try {
			
			//1.
			req.setCharacterEncoding("UTF-8"); //한글 + POST
			
			String employeenum = req.getParameter("employeenum");
			String approvalCategory = req.getParameter("approvalCategory");
			String approvalcontent = req.getParameter("approvalcontent");
			
			// 2.
			ApprovalDTO dto = new ApprovalDTO();
			
			dto.setApprovalCategoryNum(approvalCategory);
			dto.setEmployeeNum(employeenum);
			dto.setApprovalContent(approvalcontent);
			
			DraftDAO dao = new DraftDAO();
			int result = dao.add(dto);
			
			
			// 3.
			req.setAttribute("result", result);

			RequestDispatcher dispatcher
					= req.getRequestDispatcher("/company/pages/approval/draft/draftAddok.jsp");
			dispatcher.forward(req, resp);	

		} catch (Exception e) {
			// TODO: handle exception
		}		
		
	}

}//DraftAddOk
