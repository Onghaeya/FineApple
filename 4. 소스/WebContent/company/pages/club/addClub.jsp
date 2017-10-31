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

<!-- Social Buttons CSS -->
<link
	href="/Project/company/vendor/bootstrap-social/bootstrap-social.css"
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
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Buttons</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<!-- 글쓰기 폼 -->
				<form method="post" action="/Project/company/club/addClub.do"
					enctype="multipart/form-data">
					<table id="club-form" class="table table-striped">
						<tr>
							<th>클럽 이름</th>
							<td><input type="text" name="name" id="name"
								class="form-control short" required></td>
						</tr>
						<tr>
							<th>클럽 내용</th>
							<td><input type="text" name="detail" id="detail"
								class="form-control long" required></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td><input type="text" name="subject" id="subject"
								class="form-control long" required></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="content" id="content"
									class="form-control long" required></textarea></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td><select name="tag" id="tag" class="form-control short">
									<option value="1">스포츠</option>
									<option value="2">장윤하</option>
							</select></td>
						</tr>
						<tr>
							<th>클럽 로고</th>
							<td><input type="file" name="attach" id="attach"
								class="form-control"></td>
						</tr>
						
					</table>
					<div id="btns">
						<input type="button" value="돌아가기" class="btn btn-default"
							onclick="history.back();"> 
						<input type="submit" value="만들기" class="btn btn-primary">
					</div>

					<!-- 지금 작성중인 글이 새글? 답변글? -->
				</form>
			</div>
			<!-- /.row -->
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
