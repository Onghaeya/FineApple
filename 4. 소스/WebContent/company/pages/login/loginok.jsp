<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin 2 - Bootstrap Admin Theme</title>
<style>
#tbl th, #tbl td {
	text-align: center;
}

#tbl td:nth-child(2) {
	text-align: left;
}

#tbl .short {
	width: 20%;
}

#tbl #content {
	height: 300px;
}
</style>
<script>
	
</script>
<!-- Bootstrap Core CSS -->
<link href="/Project/company/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/Project/company/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/Project/company/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="/Project/company/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>



	<%@page import="java.sql.Connection"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
	<%@ page import="com.fineapple.util.DBUtil"%>
	<%@ page import="com.fineapple.DTO.ClubDTO"%>
	<%@ page import="java.util.*"%>
	<%@ page import="com.fineapple.club.ClubService"%>
	<%
		//loginok.jsp
		//1. 데이터 가져오기(id, pw)
		//2. DB 연결하기
		//3. select 질의(인증)
		//4. 인증 티켓 발급하기
		//5. 결과 출력

		//1.
		String seq = request.getParameter("seq");
		String pw = request.getParameter("pw");

		//2.
		Connection conn;
		PreparedStatement stat;
		ResultSet rs;

		conn = DBUtil.getConnection();

		System.out.print(seq);
		System.out.print(pw);

		//3.
		String sql = "select * from employee where seq=? and pw=?";
		stat = conn.prepareStatement(sql);
		stat.setString(1, seq);
		stat.setString(2, pw);

		rs = stat.executeQuery();

		//4.
		boolean result = false; //로그인 성공 유무

		/* if (rs.next()) {
			if (rs.getInt(1) == 1) {
				//로그인 성공
				// -> 사이트를 어디든지 돌아다녀도 인증 상태를 확인할 수 있도록 처리
				
				//boolean flag = true;//지역 변수 X
				//멤버 변수 X
				//pageContext X
				//request X
				//session O & cookie O
				//application X
				
				
				//인증 티켓 발급(= 로그인)
				//session.setAttribute("flag", true);
				session.setAttribute("id", id);//유일한 식별자(PK)
				
				result = true;
				
				//추가 정보를 세션에 넣어두기(자주 쓴다고 가정하에..)
				
				
			} else {
				//로그인 실패
				result = false;
			}
		}
		*/
	%>

	<script>
		
	<%if (rs.next()) {
				//로그인 성공
				result = true;

				//인증 티켓 발급
				session.setAttribute("seq", seq);
				//추가 정보
				session.setAttribute("name", rs.getString("name"));
				session.setAttribute("positionSeq", rs.getString("positionSeq"));
				session.setAttribute("departmentSeq", rs.getString("departmentSeq"));
				

				ClubService service = new ClubService(session);

				ArrayList<ClubDTO> myClubList = service.getClubName();

				System.out.println(myClubList.get(0).getName());

				session.setAttribute("myclublist", myClubList);
				
				String department = (String) session.getAttribute("departmentSeq");
				String position = (String) session.getAttribute("positionSeq");

				
				switch (department) {
					case "1" :
						department = "개발부";
						break;
					case "2" :
						department = "인사부";
						break;
					case "3" :
						department = "총무부";
						break;
					case "4" :
						department = "영업부";
						break;
				}
				switch (position) {
					case "1" :
						position = "사장";
						break;
					case "2" :
						position = "부장";
						break;
					case "3" :
						position = "과장";
						break;
					case "4" :
						position = "사원";
						break;
				}
				session.setAttribute("department", department);
				session.setAttribute("position", position);

			} else {
				//로그인 실패%>
		alert("다시 로그인해주세요.");
	<%result = false;
			}%>
		
	</script>



	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
	
<%if (result) {%>
	/* alert("로그인 성공!!"); */
	location.href = "/Project/attendance/taskComeOk.do";
<%} else {%>
	/* alert("로그인 실패;;"); */
	history.back();
<%}%>
	
</script>
</head>
<body>

</body>
</html>




















</div>
<!-- /.row -->
</div>
<!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="/Project/company/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/Project/company/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/Project/company/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/Project/company/dist/js/sb-admin-2.js"></script>

</body>

</html>
