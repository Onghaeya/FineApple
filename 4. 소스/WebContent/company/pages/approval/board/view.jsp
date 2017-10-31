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
<title>결재 자유게시판 - 내용 보기</title>
<style>

#tbl1 { width: 800px; margin: 30px auto; }

#tbl1 th { width: 150px; text-align: center; }
#tbl1 td { width: 650px; }
#tbl1 #name, #tbl1 #tag, #tbl1 #pw { width: 150px; }
#tbl1 #content { height: 200px; }
#btnList { width: 800px; margin: 30px auto; text-align: right; }

</style>
<script>
$(document).ready(function() {
	
});

</script>
    <!-- Bootstrap Core CSS -->
    <link href="/Project/company/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/Project/company/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/Project/company/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/Project/company/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


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
                        <h1 class="page-header">결재 <small>자유 게시판</small></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    
           <table width="100%" class="table table-striped table-hover" id="tbl">         
<!--            <table id="tbl1" class="table table-striped"> -->
			<tr>
				<th>번호</th>
				<td>${dto.seq}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${dto.name}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.subject}</td>
			</tr>
			<tr style="height: 300px;">
				<th style="vertical-align: middle;">내용</th>
				<td style="vertical-align: middle;">${dto.content}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${dto.regDate}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${dto.readCount}</td>
			</tr>
		</table>
				
<!-- 			<button type="button" class="btn btn-default">Default</button> -->
<!-- 			
	경로 참고 
	<input type="button" value="글쓰기" class="btn btn-primary"
	onclick="location.href='/Project/approval/board/add.do';"> 
-->
		<!-- 뷰 아래에 버튼들.. -->
		<div id="btnList">
			<input type="button" value="돌아가기" class="btn btn-default"
					onclick="location.href='/Project/approval/board/list.do';">
<%-- 			<input type="button" value="수정하기" class="btn btn-default"
					onclick="location.href='/JSPTest/board/edit.do?seq=${dto.seq}';"> --%>
			<input type="button" value="수정하기" class="btn btn-default"
					onclick="location.href='/Project/approval/board/edit.do?seq=${dto.seq}';">
			<input type="button" value="삭제하기" class="btn btn-default"
					onclick="location.href='/Project/approval/board/del.do?seq=${dto.seq}';">
		</div>


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
