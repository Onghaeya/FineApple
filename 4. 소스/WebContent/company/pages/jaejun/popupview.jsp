<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- view.jsp, 리스트의 사이즈가 0인 경우 잘못된 요청 메세지 출력 -->
<c:if test="${viewlist.size() == 0}">
<script>
	alert("잘못된 요청입니다. 다시 시도해 주십시오.");
</script>
<% out.close(); %>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Message | Fine Apple</title>
<style>
	#table th:NTH-CHILD(1) { width: 30px; }
	#table th:NTH-CHILD(2) { width: 520px; }
	#table th:NTH-CHILD(3) { width: 100px; }
	#table th:NTH-CHILD(4) { width: 134px; }
	#table th:NTH-CHILD(5) { width: 135px; }
	#table td, #table th {
		text-align: center;
	}
	#table tr td:NTH-CHILD(2) {
		text-align: left;
	}

	main{
		width: 600px;
	}
	
	#headerInbox {
		border: 0px solid red;
		vertical-align: middle;
	}
	.btns {
		border: 0px solid red;
		margin: 0px 15px;
		display: inline;
		float: right;
	}
</style>
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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
<script>

	function replyclose() {
		<c:forEach items="${viewlist}" var="dto">
			opener.document.location.href='/Project/message/add.do?reademployeenum=${dto.sentEmployeeNum}';
		</c:forEach>
		self.close();
	}

	function delclose() {
		alert("쪽지목록의 삭제하기를 이용하세요.")
		self.close();
	}
	
</script>
</head>

<body>
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div id="headerInbox" class="col-lg-12">
                    <h1 class="page-header">쪽지보기</h1>
                    
                <!-- /.col-lg-12 -->
	            </div>
            </div>
            <!-- /.row -->
            
            
            <!-- PCDATA로 인한 테이블 깨짐 방지하기 -->
            <div class="row col-lg-12">
            	<table class="table table-responsive table-bordered" style="table-layout: fixed;">
					<c:forEach items="${viewlist}" var="dto">
					<tr>
						<td width="100">제목</td>
						<td><b>${dto.title}</b></td>
					</tr>
					<tr>
						<td>쪽지정보</td>
						<td><b>${dto.sentEmployeeNum}</b> ${dto.sentDate}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td style="word-wrap: break-word;">${dto.content}</td>
					</tr>
					</c:forEach>
            	</table>
            </div>
            
			<form id="form1" method="post" action="" >
	            <div id="btns" style="text-align: right;">
					<input type="button" class="btn btn-info" value="답장하기" onclick="replyclose();" />
	            	<input type="button" class="btn btn-danger" value="삭제하기" onclick="delclose();" />
					<input type="button" class="btn btn-default" value="닫기" onclick="self.close();"/>
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

    <!-- DataTables JavaScript, 여기에 페이지 다 있음 -->
    <script src="/Project/company/vendor/datatables/js/jquery.dataTables.js"></script>
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