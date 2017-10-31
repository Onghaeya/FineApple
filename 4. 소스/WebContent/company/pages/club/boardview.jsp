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

</head>
<style>
.v-header{
	margin-top:15px;
}
.v-profile {
	width: 15%;
	float: left;
	padding-left: 15px;
}

.v-profile img {
	border: 1px solid #c5c5c5;
	border-radius: 50%;
	outline: none;
}

.v-writer {
	width: 80%;
	float: left;
	padding-left: 30px;
	font-size: 14px;
}

.v-writer:after {
	clear: both;
}

.v-writer div {
	line-height: 1.5em;
	margin-top: 8px;
	font-size: 16px;
	margin-bottom: 8px;
}

.v-writer span {
	font-size: 16px;
	line-height: 1.5em;
	color: #868686;
}

.v-writer #clubname {
	margin-left: 30px;
	font-size: 16px;
	font-weight: 400;
	color: #868686;
	line-height: 1.33em;
	word-spacing: -10;
}

.v-body {
	margin-top: 25px;
	padding-left: 60px;
}

.v-title {
	font-size: 25px;
	line-height: 36px;
	font-weight: 100;
	color: #333;
	margin-bottom: 25px;
}

.v-content {
	line-height: 1.33;
	margin-bottom: 1em;
	min-height: 30px;
	overflow-x: auto;
	font-size: 14px;
}

.v-regdate {
	font-weight: 400;
	margin: 0 0 21px;
	font-size: 14px;
	line-height: 24px;
	color: #999;
}
.v-btn{
	padding-left:60px;
	margin-top:15px;
}
.v-btn .btn-default:hover{
	border-color: #c5c5c5;
	background-color:#eee;
}

.v-btn .btn-primary{
	border-color: #c5c5c5;
	background-color:#666;
	color:#fff;
}
.v-btn .btn-primary:hover{
	border-color: #c5c5c5;
	background-color:#c5c5c5;
}
</style>
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
						<h1 class="page-header">Blank</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				
				<div class="v-header row">
				
					<div class="v-profile">
						<img src="/Project/company/images/empimg.png">
					</div>
					<div class="v-writer">
						<div>${dto.name}</div>


						<span>${dto.department} / ${dto.position}</span> <span id="clubname"
							class="glyphicon glyphicon-asterisk" aria-hidden="true">
							축구왕 슛돌이</span>
					</div>

				</div>

				<div class="v-body row">
					<div class="v-title">${dto.title}</div>
					<div class="v-content">
						${dto.content}
					</div>
					<div class="v-regdate">게시일:${dto.regDate}</div>
				</div>

				<div class="v-btn" class="row">
					<input type="button" value="돌아가기" class="btn btn-default" onclick="history.back();">
					<input type="submit" value="답변하기" class="btn btn-primary"
						onclick="location.href='';"> 
					<input type="submit"
						value="수정하기" class="btn btn-primary"
						onclick="location.href='/MVCTest/board/edit.do?seq=${dto.seq}';">
					<input type="submit" value="삭제하기" class="btn btn-primary"
						onclick="location.href='/MVCTest/board/del.do?seq=${dto.seq}';">
				</div>
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
