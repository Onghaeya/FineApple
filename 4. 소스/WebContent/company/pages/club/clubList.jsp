<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->

<style>

/*클럽이미지*/
.club-list-img {
	width: 100%;
	height: 150px;
	margin: 10px auto;
}

/*클럽이미지가 없을경우*/
.club-list-noimg {
	width: 100%;
	height: 150px;
	background-color: #333;
	margin: 10px auto;
}

/*클럽 이름*/
.club-list-detail h2 {
	font-size: 13px;
	text-align: center;
}

/*클럽 만든사람, 소속 부서*/
.club-list-detail h3 {
	font-size: 12px;
	text-align: center;
	font-weight: normal;
	margin: 0 auto;
	margin-bottom:20px;
}
</style>

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">

			<!-- upperHeader -->
			<%@ include file="/company/inc/upperHeader.jsp"%>
			<!-- leftHeader -->
			<%@ include file="/company/inc/leftHeader.jsp"%>


		</nav>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Club List</h1>
					</div>
					<!-- /.col-lg-12 -->
				
				</div>
				<!-- /.row -->
				<div class="row">
				
					<c:forEach items="${clubList}" var="dto">
						<div class="col-md-4">

							<!-- 클럽 이미지부분 -->
							<div class="club-list-img"
								style="background:url('${dto.clubimg}') no-repeat; background-size:cover;"></div>

							<!-- 클럽 이름과, 클럽장, 부서 -->
							<div class="club-list-detail">
								<h2>${dto.name}</h2>
								<h3>${dto.empName} / ${dto.department }</h3>
							</div>



						</div>
					</c:forEach>

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
