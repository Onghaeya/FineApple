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
<title>Message | Fine Apple</title>

	<script type="text/javascript" src="/Project/smarteditor/workspace/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	
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

<style>
	#headerInbox{
		vertical-align: middle;
	}
	#headerInbox + input {
		margin-top: 5px;
	}
	
	#page-wrapper .class:NTH-CHILD(2) {
		display: none;
	}
	
	#btns{
		text-align: right;
	}
</style>
<script>

</script>

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
	        <div class="row">
	            <div id="headerInbox" class="col-lg-12">
	                <h1 class="page-header">쪽지쓰기</h1>
	            </div>
	            <!-- /.col-lg-12 -->
	        </div>
	        <!-- /.row -->
            
            <form method="post" action="/Project/message/addok.do">
	            <div class="row col-lg-12">
	            	<table class="table table-responsive table-bordered">
						<tr>
							<td width="100">받는사람</td>
							<td>
								<c:if test="${reademployeenum == null}">
									<input type="text" name="reademployeenum" style="width: 100%;" />
								</c:if>
								<c:if test="${reademployeenum != null}">
									<input type="text" name="reademployeenum" value="${reademployeenum}" style="width: 100%;" />
								</c:if>
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>
								<input type="text" name="title" style="width: 100%;"/>
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
							    <textarea id="content" name="content" style="width:100%; min-height: 500px;">
					            </textarea>
								<jsp:include page="/company/inc/texteditor.jsp"></jsp:include>
							</td>
						</tr>
	            	</table>
	            </div>
	            <div id="btns">
					<input type="submit" value="보내기" class="btn btn-primary" id="send" onclick="submitContents()"/>
					<input type="button" value="돌아가기" class="btn btn-default" onclick="history.back();" />
				</div>
            </form>
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


