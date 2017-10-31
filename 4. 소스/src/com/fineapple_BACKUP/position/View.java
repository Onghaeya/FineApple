package com.fineapple.position;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fineapple.DTO.tblPositionBoardDTO;



public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request
											, HttpServletResponse response) 
														throws ServletException, IOException {
		
		//1. view.do?seq=5 데이터 받기
		//2. DB 작업(select) -> DAO 위임
		//3. 글 한개 반환 -> JSP 건내주면서 호출하기
		
		//1.
		String seq = request.getParameter("seq");
		
		//2.
		TblPositionBoardDAO dao = new TblPositionBoardDAO();
		
		/*//2.3 조회수 증가하기
		HttpSession session = request.getSession();
		
		if(session.getAttribute("readcount") != null
					&& session.getAttribute("readcount").equals("n")) {
			dao.addReadCount(seq);
			session.setAttribute("readcount", "y");
		}
		
		 */		
		tblPositionBoardDTO dto = dao.get(seq); //글 1개 반환
		
		//2.4 존재않는 게시물에 접근하는 경우 예외 처리
		if (dto == null) {
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('게시물이 이미 삭제되었거나 존재하지 않습니다.');location.href='/JSPTest/board/list.do';</script>");
			out.close();
			return;
		}
		
		
		
		//2.5 데이터 조작
		
		
		
		/*//태그 미적용 처리 -> 글내용의 태그를 무효화 처리
		// <> -> &lt;&gt;
		String content = dto.getContent();
		if (dto.getTag().equals("n")) {
			content = content.replace("<", "&lt;").replace(">", "&gt;");
			dto.setContent(content);
		}
		
		//<script> 사용 불가능
		content = dto.getContent()
							.replace("<script", "&lt;script")
							.replace("</script>", "&lt;/script&gt;");
		dto.setContent(content);
		
		//이름 + 제목은 태그 사용 불가능
		dto.setName(dto.getName().replace("<", "&lt;").replace(">", "&gt;"));
		dto.setSubject(dto.getSubject().replace("<", "&lt;").replace(">", "&gt;"));*/
		
		
		//글내용 엔터값 처리
		String content = dto.getContent().replace("\r\n", "<br>");
		dto.setContent(content);
		
		
		//3.
		request.setAttribute("dto", dto);		
		
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("/company/pages/position/board/view.jsp");
		dispatcher.forward(request, response);		
		
	}
	
}













