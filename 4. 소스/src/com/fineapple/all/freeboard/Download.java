package com.fineapple.all.freeboard;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Download extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String fileName = request.getParameter("file");

		String savePath = "company/pages/all/freeboard/FBFiles";
		ServletContext context = getServletContext();
		String sDownloadPath = context.getRealPath(savePath);


		String sFilePath = sDownloadPath + "/" + fileName;
		byte b[] = new byte[4096];
		FileInputStream in = new FileInputStream(sFilePath);
		String sMimeType = getServletContext().getMimeType(sFilePath);
		System.out.println("sMimeType>>>" + sMimeType);

		if (sMimeType == null)
			
			sMimeType = "application/octet-stream"; //MIME, 브라우저에게 해석할 수 없는 데이터라고 타입을 속여서 보내는 작업 중 하나

		response.setContentType(sMimeType);
		String agent = request.getHeader("User-Agent");
		boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);

		if (ieBrowser) {
			fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("/+", "%20");
		} else {
			fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
		}

		response.setHeader("Content-Disposition", "attachment; filename= " + fileName);

		ServletOutputStream out2 = response.getOutputStream();
		int numRead;

		while ((numRead = in.read(b, 0, b.length)) != -1) {
			out2.write(b, 0, numRead);
		}
		out2.flush();
		out2.close();
		in.close();
		
	}
	
}