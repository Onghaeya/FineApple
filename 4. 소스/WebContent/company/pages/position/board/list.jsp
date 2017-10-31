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
#tbl1, #btnList { width: 800px; margin: 30px auto; }
#tbl1 th, #tbl1 td { text-align: center; }

#tbl1 td:nth-child(2) { text-align: left; }

#tbl1 th:nth-child(1) { width: 50px; }
#tbl1 th:nth-child(2) { width: 490px; }
#tbl1 th:nth-child(3) { width: 90px; }
#tbl1 th:nth-child(4) { width: 120px; }
#tbl1 th:nth-child(5) { width: 50px; }
	
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
                        <h1 class="page-header"> 임원게시판?-?<small></small></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <!-- 테이블 내용 -->
                    
                    
               
<table id="tbl1" class="table table-striped">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>읽음</th>
			</tr>		
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.seq}</td>
				<%-- <td><a href="/JSPTest/board/view.do?seq=${dto.seq}">${dto.subject}</a> ${dto.newimg}</td> --%>
				<td  style ="text-align:center"><a href="/company/pages/position/board/view.do?seq=${dto.seq}">${dto.subject}</a></td>
				<%-- <td>${dto.name}</td> --%>
				<td>${dto.regDate}</td>
				<%-- <td>${dto.readcount}</td> --%>
			</tr>
			</c:forEach>
		</table>
        
        <div id="btnList">
			<input type="button" value="글쓰기" class="btn btn-primary"
				onclick="location.href='/Project/company/pages/position/board/add.jsp';">
				<input type="button" value="돌아가기" class="btn btn-info" onclick="history.back();">
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
