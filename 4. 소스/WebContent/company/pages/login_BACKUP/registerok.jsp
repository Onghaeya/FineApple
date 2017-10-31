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
#tbl th, #tbl td { text-align: center; }
#tbl td:nth-child(2) { text-align: left; }
#tbl .short { width: 20%; }
#tbl #content { height: 300px; text-align:center; }
</style>
<script>

</script>
    <!-- Bootstrap Core CSS -->
    <link href="/Project/company/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/Project/company/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/Project/company/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/Project/company/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
            <!-- upperHeader -->    
            <%@ include file="/company/inc/upperHeader.jsp" %>
			<!-- leftHeader -->
        	<%@ include file="/company/inc/leftHeader.jsp" %>

            
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">로그인 자유게시판 <small>글쓰기</small></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <!-- 테이블 내용 -->
                    
             		<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@page import="com.fineapple.util.DBUtil"%>

<%
	//업무+결과
	//1.데이터 가져오기
	//2.파일 업로드 처리->파일명 알아내기
	//3.insert작업(회원 가입)
	//4.결과 처리

	//1.
	request.setCharacterEncoding("UTF-8");
	//2.
	//request->(대신)->MultipartRequest생성
	String path = request.getRealPath("/company/pages/login/profile");
	System.out.println(path);
	int size = 10 * 1024 * 1024; // 10MB

	String seq = "";
	String name = "";
	String jumin = "";
	String pw = "";
	String cellphone = "";
	String email = "";//orgfilename은 사용 안함
	String firstDate = "";
	String endDate = "";
	String payment = "";
	String departmentSeq = "";
	String pwHint = "";
	String pwAnswer = "";
	String gender = "";
	String phone = "";
	String profilePic = "";
	String task = "";
	String bank = "";
	String bankAccount = "";
	String positionSeq = "";
	
	
	/* ---------------------------------------------------------------------- */
	int result=0;

	try {
		MultipartRequest multi = new MultipartRequest(request, path, //업로드 경로
				size, //최대 업로드 크기
				"UTF-8", //인코딩
				new DefaultFileRenamePolicy());
		//데이터 가져오기
		/* seq = multi.getParameter("seq"); */
		name = multi.getParameter("name");
		/* jumin = multi.getParameter("jumin");  */
	    jumin=multi.getParameter("jumin_1");
	    jumin=multi.getParameter("-"); 
		jumin=multi.getParameter("jumin_2"); 
		pw = multi.getParameter("pw");
		/* cellphone = multi.getParameter("cellphone"); */
		cellphone = multi.getParameter("cel1");
		cellphone = multi.getParameter("cel2_1");
		cellphone = multi.getParameter("cel2_2");
		email = multi.getParameter("email");
		email = multi.getParameter("@");
		email = multi.getParameter("email_dns");
		email = multi.getParameter("emailaddr");
		firstDate = multi.getParameter("firstDate");
		endDate = multi.getParameter("endDate");
		payment = multi.getParameter("payment");
		departmentSeq = multi.getParameter("departmentSeq");
		/* departmentSeq = multi.getParameter("task"); */
		pwHint = multi.getParameter("pwHint");
		pwAnswer = multi.getParameter("pwAnswer");
		gender = multi.getParameter("gender");
		/* phone = multi.getParameter("phone"); */
		phone = multi.getParameter("phone1");
		phone = multi.getParameter("phone2_1");
		phone = multi.getParameter("phone2_2");
		profilePic = multi.getParameter("profilePic");
		task = multi.getParameter("task");
		bank = multi.getParameter("bank");
		bankAccount = multi.getParameter("bankAccount");
		positionSeq = multi.getParameter("positionSeq");
		
		System.out.print(multi.getParameter("seq"));
		
		
		
		
		if(gender.equals("남자")){
			gender="m";
		}else if(gender.equals("여자")){
			gender="f";
		}

		//실제 저장된 파일명 가져오기
		profilePic = multi.getFilesystemName("profilePic");

		//out.println("파일명:"+profile);
		if (profilePic == null)
			profilePic = "default.png";

		//3.
		String sql = "insert into employee(seq,name,jumin,pw,cellphone,email,firstDate,endDate,payment,departmentSeq,pwHint,pwAnswer,gender,phone,profilePic,task,bank,bankAccount,positionSeq)values(employeeseq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn;
		PreparedStatement pstat; 

		conn = DBUtil.getConnection();
		pstat = conn.prepareStatement(sql);
		pstat.setString(1, name);
		pstat.setString(2, jumin);
		pstat.setString(3, pw);
		pstat.setString(4, cellphone);
		pstat.setString(5, email);
		pstat.setString(6, firstDate);
		pstat.setString(7, endDate);
		pstat.setString(8, payment);
		 pstat.setString(9, departmentSeq); 
		pstat.setString(10, pwHint);
		pstat.setString(11, pwAnswer);
		pstat.setString(12, gender);
		pstat.setString(13, phone);
		pstat.setString(14, profilePic);
		pstat.setString(15, task);
		pstat.setString(16, bank);
		pstat.setString(17, bankAccount);
		pstat.setString(18, positionSeq);
		
	
		result = pstat.executeUpdate();
		pstat.close();
		
		sql = "select max(seq) from employee";
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery(sql);
		if(rs.next()) {
		    seq = rs.getString(1);
		}
		
		conn.close();
		stat.close();
			
		
		
		
	} catch (Exception e) {
		e.printStackTrace();

	}
%>


<%-- <script>

<%
if(rs.next()){
	 //로그인 성공
	 result=true;
	 
	 //인증 티켓 발급
	 session.setAttribute("seq",seq);
	 //추가 정보
	 session.setAttribute("name",rs.getString("name"));
	 session.setAttribute("positionSeq",rs.getString("positionSeq"));
	 session.setAttribute("departmentSeq",rs.getString("departmentSeq"));
	
	 System.out.println("로그인 시도 중 : "+rs.getString("departmentSeq"));
	 
	 
}else{
	 //로그인 실패
%>


	alert("정보를 다시확인해주세요");
	 <%
	 result=false;
}
%>
</script>
 --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code Snippet</title>
<%-- <%@include file="../inc/asset.jsp"%> --%>

<style>
</style>
<script>
	$(document).ready(function() {

	});
</script>

</head>
<body>
	<div id="main">
		<%-- <%@include file="../inc/header.jsp"%> --%>
		<div id="mcontent">
		
		
			<%if(result==1){ %>
			<div class="msg">회원 가입이 완료되었습니다. 사번은 <%= seq %> 입니다. </div>
			<input type="button" value="시작 페이지로 이동하기"
				onclick="location.href='/Project/company/pages/index.jsp';" class="btn btn-info btnEnd">
				<%}else{ %>
			<div class="msg">문제가 발생했습니다. 다시 시도하세요.</div>
			<input type="button" value="다시 시도하기" onclick="history.back();"
				class="btn btn-default btnEnd">
				<%} %>


		</div>
	</div>
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
