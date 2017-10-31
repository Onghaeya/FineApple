<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		.confirmBox { /* border: 1px solid #ccc; */ border-radius: 5px; margin: 0px auto; text-align: center; margin: 100px 40px; }		
		.end { font-size: 16px; margin: 20px; }		
		.end div { margin-bottom: 4px; }		
		.btns { text-align: center; }		
		.btn { margin: 5px; }
		.fa { font-size: 18px; }
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
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <c:if test="${result == 1}">
	            <div class="confirmBox">
	            	<div class="end">
	            		<div style="margin-bottom: 3px;"><i class="fa fa-smile-o"></i></div>
	            		<div style="font-weight: bold;">등록이 완료되었습니다!</div> 
	            	</div>
	            	<div class="btns">
	            		<input type="button" value="목록으로" class="btn btn-primary" onclick="location.href='/Project/all/freeboard/list.do'">
	            		<input type="button" value="글보기" class="btn btn-info" onclick="location.href='/Project/all/freeboard/view.do?seq=${seq}';">
	            	</div>
	            </div>
            </c:if>
            
            <c:if test="${result == 0}">
	            <div class="confirmBox">
	            	<div class="end">
	            		<div><i class="fa fa-frown-o"></i></div>
	            		<div style="font-weight: bold;">글이 등록되지 않았습니다.</div>
	            		<div>전산부로 문의 바랍니다.</div>
	            		<div>02) 2550-1039</div>
	            	</div>
	            	<div class="btns">
	            		<input type="button" value="목록으로" class="btn btn-primary" onclick="location.href='/Project/all/freeboard/list.do'">
	            		<input type="button" value="돌아가기" class="btn btn-info" onclick="history.back();">
	            	</div>
	            </div>
            </c:if>
            
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
