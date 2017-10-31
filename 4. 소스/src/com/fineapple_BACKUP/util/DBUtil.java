package com.fineapple.util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	//심재준PC DB접속용(SISTMVC) 클래스임
	public static Connection getConnection() {
		
		Connection conn;
		
		try {
			
			//1. 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//2. Connection 객체 생성
			conn = DriverManager
					.getConnection("jdbc:oracle:thin:@119.197.206.57:1521:orcl"
					, "SISTMVC", "java1234");
			
			//3. 반환
			return conn;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	

	/*public static void main(String[] args) {
		
		DBUtil db = new DBUtil();
		Connection conn = db.getConnection();
		try {
			System.out.println(conn.isClosed());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}*/

}//class


