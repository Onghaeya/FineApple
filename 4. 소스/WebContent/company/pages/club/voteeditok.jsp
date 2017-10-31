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

<style>
.col-lg-12 {
	
}

.col-lg-12 .page-header {
	float: left;
	width: 33.3%;
	text-align: center;
	font-size: 18px;
	font-weight: 100;
	padding-bottom: 20px;
	margin: 0px 0 5px;
	border-bottom: 1px solid #eee;
	padding-top: 20px;
}

.page-header a {
	color: #444;
	text-decoration: none;
}

.vote {
	float: left;
}

.profile {
	width: 10%;
	height: 100%;
	padding: 10px 30px;
}

.profile img {
	border: 1px solid #c6c6c6;
	border-radius: 50%;
	width: 55px;
}

.word {
	width: 90%;
	height: 100%;
}

.detail {
	height: 50%;
	font-size: 1.1em;
	font-weight: 100;
}

.title {
	color: #444;
	padding: 14px 0px 0px;
}

.info {
	color: #c6c6c6;
	padding: 5px 0px 10px;
}

.info div {
	float: left;
}

.voterow {
	height: 82px;
	border-bottom: 1px solid #eee;
	/* width: 99%; */
	margin: 0px auto;
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
						<div class="page-header">
							<a href="/Project/club/myclubboard.do?clubseq=${clubseq}">게시판</a>
						</div>
						<div class="page-header">
							<a href="/Project/club/myclubvote.do?clubseq=${clubseq}">투표</a>
						</div>
						<div class="page-header">
							<a href="/Project/club/myclubschedule.do?clubseq=${clubseq}">일정</a>
						</div>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<section>

					<c:if test="${result == 1}">
						<script>
					location.href = "/Project/club/myclubvote.do?clubseq=${clubseq}";
				</script>
					</c:if>

					<c:if test="${result == 0}">
						<script>
					history.back();
				</script>
					</c:if>

				</section>
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
