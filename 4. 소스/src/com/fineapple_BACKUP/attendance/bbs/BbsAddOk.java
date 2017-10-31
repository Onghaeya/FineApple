package com.fineapple.attendance.bbs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;import org.eclipse.jdt.core.compiler.CategorizedProblem;

import com.fineapple.DTO.AtdBoardDTO;

public class BbsAddOk extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	 //1. 데이터 가져오기
        //2. DB작업 -> Service 위임
        //3. 결과 출력 -> JSP 위임
        
        //1.
	req.setCharacterEncoding("UTF-8");
        
        String category = req.getParameter("category");
        String subject = req.getParameter("subject");
        String content = req.getParameter("content");
        //세션얻어오기
        HttpSession session = req.getSession();
        String eseq = (String)session.getAttribute("seq");
        //2.
        AtdBoardDTO dto = new AtdBoardDTO();
        
        dto.setEseq(eseq);
        dto.setContent(content);
        dto.setSubject(subject);
        dto.setCseq(category);
        
        BbsService service = new BbsService();
        int result = service.addBbs(dto);
        
        //3.
        req.setAttribute("result", result);
	
	RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/attendance/bbs/bbsAddOk.jsp");
	dispatcher.forward(req, resp);

    }
}