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

    <!-- Bootstrap Core CSS -->
    <link href="/Project/company/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/Project/company/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/Project/company/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/Project/company/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

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
<style>
	#listTable { width: 850px; margin: 0px auto; font-size: 14px; text-align: center; }
	#listTable td {  }
	#listTable th { text-align: center; }
	#listTable .number { width: 70px;  }
	#listTable .category { width: 100px; }
	#listTable td.title { width: 350px; text-align: left; }
	#listTable .name { width: 130px;  }
	#listTable .regDate { width: 120px;  }
	#listTable .readCount { width: 70px; }
	#listTable .title a { color: #333; }
	#listTable .title a:hover { text-decoration: none; color: #333; }
	
	.pagination>.active>a, .pagination>.active>a:hover { background-color: #337ab7; }	
	.pagination>li>a, .pagination>li>span { color: #555; }
	
	#pageButton { width: 850px; margin: 0 auto; }
	#pagebar { width: 440px; text-align: left; float: left; }
	#write { width: 400px; text-align: right; float: left; margin-top: 23px; }
</style>
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
                        <h1 class="page-header">자유게시판</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            
            <table id="listTable" class="table table-hover">
			    <thead>
			        <tr>
			            <th>번호</th>
			            <th>말머리</th>
			            <th>제목</th>
			            <th>글쓴이</th>
			            <th>등록일</th>
			            <th>조회수</th>
			        </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${list}" var="dto">
			        <tr>
			            <td class="number">${dto.seq}</td>
			            <td class="category">${dto.fbCategory}</td>
			            <td class="title"><a href="/Project/all/freeboard/view.do?seq=${dto.seq}">${dto.title} ${dto.fileImg} ${dto.gapImg}</a></td>
			            <td class="name">${dto.name}</td>
			            <td class="regDate">${dto.regDate}</td>
			            <td class="readCount">${dto.readCount}</td>
			        </tr>
			        </c:forEach>
			       
			    </tbody>
			</table>       
			<div id="pageButton">       
            	<div id="pagebar">${pagebar}</div>
            	<div id="write"><input type="button" value="글쓰기" class="btn btn-outline btn-primary" onclick="location.href='/Project/all/freeboard/add.do';"></div>
	            <div style="clear:both;"></div>
            </div>
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

    <!-- DataTables JavaScript -->
    <script src="/Project/company/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/Project/company/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/Project/company/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/Project/company/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

</body>

</html>
