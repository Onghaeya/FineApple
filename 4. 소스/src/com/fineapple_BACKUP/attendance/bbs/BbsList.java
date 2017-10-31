package com.fineapple.attendance.bbs;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fineapple.DTO.AtdMainListDTO;

public class BbsList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //구현된 기능 : 검색, 페이징, 정렬.
        //구현 할 기능 : 분류 별 보여주기, 글쓰기, 글수정, 글삭제, 조회수 카운트, 댓글작성, 답글 등..
        
        
        //1. DB 작업(select) -> Service 객체 위임
        //2. 1의 결과 -> ArrayList<BoardDTO> 반환
        //3. 2의 결과 -> JSP 위임 + 전달
        
        //1.
        //관리자 호출
	BbsService service = new BbsService();
        
        //2.
        //모든 게시물의 List용 정보를 담아왔다.
        ArrayList<AtdMainListDTO> list = service.list(); 
        
        //3.
        //bbsList.jsp 로 전달.
        req.setAttribute("list", list);
        
        RequestDispatcher dispatcher = req.getRequestDispatcher("/company/pages/attendance/bbs/bbsList.jsp");
        dispatcher.forward(req, resp);

	
	
	
	
	
	
    }
}