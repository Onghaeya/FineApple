package com.fineapple.approval.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.ApprovalBoardDTO;


public class List extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req
                                 , HttpServletResponse resp) 
                                          throws ServletException, IOException {
      
      //1. DB 작업(select) -> DAO 위임
      //2. 반환된 목록을 JSP 에게 건네주면서 호출하기
      
      BoardDAO dao = new BoardDAO();
      ArrayList<ApprovalBoardDTO> list = dao.list();
      
      for(ApprovalBoardDTO dto : list){
         // 날짜 자르기
         dto.setRegDate(dto.getRegDate().substring(0, 10));
         // 제목 길면 짜르기
         String subject = dto.getSubject();
         if (subject.length() > 30) {
            subject = subject.substring(0, 30) + "..";

         }
         
         dto.setSubject(subject);         
      }
      
      // 조회수 방지 티켓
      HttpSession session = req.getSession();
      session.setAttribute("readCount", "n");
      
      //2.
      req.setAttribute("list", list);
      
      //System.out.println("LIST.JAVA");
      RequestDispatcher dispatcher
         = req.getRequestDispatcher("/company/pages/approval/board/list.jsp");
      dispatcher.forward(req, resp);      
      
   }//doGet

}//List




















