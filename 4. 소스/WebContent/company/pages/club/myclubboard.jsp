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
#clubtable {
	
}

#clubtable th, #clubtable td {
	text-align: center;
	color: #333;
}

#clubtable th {
	background-color: #787878;
	color: #fff;
	font-family: "Yoon Gothic", "Apple Gothic", "HY Gulim", "MalgumGothic",
		"HY Dotum", "Lexi Gulim", "Helvetica Neue", "Helvetica", "Arial",
		sans-serif;
}
/* 	#clubtable td:nth-child(2) { text-align: left; }
 */
#clubtable th:nth-child(2) {
	width: 40%;
}

#clubtable th:nth-child(3) {
	width: 15%;
}

#clubtable a {
	color: #333;
}

.v-btn {
	padding-left: 60px;
	margin-top: 15px;
}

.v-btn .btn-default:hover {
	border-color: #c5c5c5;
	background-color: #eee;
}

.v-btn .btn-primary {
	border-color: #c5c5c5;
	background-color: #666;
	color: #fff;
}

.v-btn .btn-primary:hover {
	border-color: #c5c5c5;
	background-color: #c5c5c5;
}
#listbtns{
	text-align:right;
}
.col-lg-12{

}
.col-lg-12 .page-header{
	float:left;
	width:33.3%;
	text-align:center;
	font-size:18px;
	font-weight:100;
}
.page-header a{
	color:#444;
	text-decoration: none;
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
						<div class="page-header"><a href="/Project/club/myclubboard.do?clubseq=${clubseq}">게시판</a></div>
						<div class="page-header"><a href="/Project/club/myclubvote.do?clubseq=${clubseq}">투표</a></div>
						<div class="page-header"><a href="/Project/club/myclubschedule.do?clubseq=${clubseq}">일정</a></div>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<table id="clubtable" class="table table-hover">
					<tr>
						<th>#</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회</th>
					</tr>
					<c:forEach items="${boardlist}" var="dto">
						<tr>
							<td>${dto.seq}</td>
							<td title="${dto.fullTitle}"><a
								href="/Project/club/boardview.do?realseq=${dto.realSeq}">
									${dto.title} </a> ${dto.gapImg}</td>
							<td>${dto.name}</td>
							<td>${dto.regDate}</td>
							<td>${dto.readCount}</td>
						</tr>
					</c:forEach>
				</table>
				<!-- /.row -->
				<div id="listbtns" class="v-btn">
				<form method="post" action="/Project/club/boardadd.do">
					<input type="button" value="전체보기" class="btn btn-default"
							onclick="location.href='/Project/club/myclubboard.do?clubseq=${clubseq};">
					
						 <input type="hidden" name="clubseq" value="${clubseq}">
						 <input	type="submit" value="글쓰기" class="btn btn-primary">
					</form>
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
