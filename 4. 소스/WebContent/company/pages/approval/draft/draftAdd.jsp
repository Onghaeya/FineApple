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

	#tbl1 {
		width: 700px;
		border: 1px solid black;
		margin: 20px;
		margin-left: 90px;
		
	/* 	border-collapse: collapse; */
	}
	
	
	#tbl1 tr {
		border: 1px solid black;
	}
	#tbl1 tr:nth-child(1) { 
		border: 0px;
		height: 100px; 
		text-align: center;	
		font-family: 궁서;
		font-size: 50px;
	}
	
	/* 문서번호  */
	#tbl1 tr:nth-child(2) { 
		border: 0px;
		height: 70px; 
		text-align: left;	
		font-family: 바탕;
		font-size: 15x;
	}
	
	/* 작성자 */
	#tbl1 tr:nth-child(3) {
		border: 0px; 
		
		height: 70px; 
		text-align: left;	
		font-family: 바탕;
		font-size: 15x;
	}
	/* 분류 */
	#tbl1 tr:nth-child(4) {
		border: 0px; 
		height: 70px; 
		text-align: left;	
		font-family: 바탕;
		font-size: 15x;
	}
	
	/* 내용 - 1-1 */
	#tbl1 tr:nth-child(5) { 
		border: 0px;
		height: 70px; 
		text-align: left;	
		font-family: 바탕;
		font-size: 15x;
	}
	
	/* 진짜 내용 - 1-1 */
	#tbl1 tr:nth-child(6) { 
		border: 0px;
		height: 400px; 
		text-align: center;	
		font-family: 바탕;
		font-size: 15x;
	}
	
	/* 위와 같은 내용을.... */
	#tbl1 tr:nth-child(7) { 
		border: 0px;
		height: 100px; 
		text-align: center;	
		font-family: 바탕;
		font-size: 15x;
	}
/* 	
	#sel {
		height: 40px;	
	} */
	
	#tbl1 #content { 
		border: 0px;
		height: 300px; 	
	}
	
	/* 결제 완료 버튼 */
	#tbl1 tr:nth-child(8) { 
		border: 0px;
		height: 100px; 
		text-align: center;	
		font-family: 바탕;
		font-size: 15x;
	}
	
	
	#btns {
		border: 0px;
		text-align: right;	
		padding-right: 30px;
	}
	
	#tbl1 .short { width: 40%; }
	

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
                        <h1 class="page-header">기안서 작성</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    
                    <form method="post" action="/Project/approval/draft/draftaddok.do">
                    <table id="tbl1">
                    	<tr>
                    		<td colspan="4">기　안　서</td>
                    	</tr>

                    	<tr>
                    		<td width=200px;>　문서 번호 : </td>
                    		<td colspan="3">　문서 번호는 자동으로 기입됩니다. </td>
                    	</tr>
                    	
                    	<tr>
                    		<td width=200px;>　작성자 : </td>
                    		<td colspan="3"><input type="text" name="name" id="name" required class="form-control short"></td> 
                    		
                    	</tr>
                    	
                    	<tr>
                    		<td width=200px;>　분류 : </td>
                    		<td colspan="3">
                    				<!-- 카테고리  -->
                    				<select name="approvalCategory" id="approvalCategory" class="form-control short" required>
                    					<c:forEach items="${categoryList}" var="category">
                     					<option value="${category.seq}">${category.approvalCategoryName}</option> 
                     					</c:forEach>     
                    				</select>	

							</td>
                    	</tr>
                    	
                    	<tr>
                    		<td colspan="4">　내용 : </td>
                    	</tr>
                    	
                    	<tr>
                    		<td colspan="4">
                    		<textarea name="content" id="content" class="form-control" required></textarea>
                    		</td>
                    	</tr>
                    	
                    	<tr>
                    		<td colspan="4">위와 같은 사항을 결재 승인 요청 합니다.</td>
                    	</tr>
                    	
                    	<!-- 결재 요청 완료 버튼 -->
                    	<tr>
                    		<td colspan="4">
			                    <div id="btns">		
									<!-- <input type="button" value="돌아가기" class="btn btn-default" onclick="history.back();"> -->
									<input type="submit" value="결재요청 완료하기" class="btn btn-default">
								</div>            
							</td>        	
                    	</tr>
                    </table>
                    

                    
                    </form>
                          
                    
                    
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
