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
#tbl th, #tbl td {
	text-align: center;
	height: 34;
}

#tbl td:nth-child(2) {
	text-align: left;
}

#tbl .short {
	width: 20%;
}

#tbl #content {
	height: 300px;
}

#a div {
	margin: 0;
	padding: 0;
	float: left;
	width: 400px;
	height: 34px;
}

#a div input {
	margin: 0;
	padding: 0;
	width: 100px;
	height: 34px;
}
</style>
<style>
#tbl {
	
}

#tbl th {
	width: 150px;
	text-align: right;
}

#tbl td {
	width: 550px;
}

.short {
	width: 100px;
}

.shorts {
	width: 500px;
}

#title #content {
	height: 50px;
}

.container { width:300px; height:300px; text-align:center; vertical-align:middle; display:table-cell; }




</style>
<script>
	$(document).ready(function() {

	});
</script>


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
					<div class="container">
						<div class="row">
							<div class="col-md-4 col-md-offset-4">
								<div class="login-panel panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">로그인하세요.</h3>
									</div>
									<div class="panel-body">
										<form role="form" method="post"
											action="/Project/company/pages/login/login/loginok.jsp">
											<fieldset>
												<div class="form-group">
													<input class="form-control" placeholder="E-mail" name="seq"
														autofocus>
												</div>
												<div class="form-group">
													<input class="form-control" placeholder="Password"
														name="pw" type="password" value="">
												</div>
												<div class="checkbox">
													<label> <input name="remember" type="checkbox"
														value="Remember Me">로그인 상태 유지
													</label>
												</div>
												<!-- Change this to a button or input when using this as a form -->
												<input type="submit"
													class="btn btn-lg btn-success btn-block" value="로그인"
													style="width: 48%; display: inline;"></input> <input
													onclick="location.href='/Project/company/pages/login/login/register.jsp';"
													class="btn btn-lg btn-success btn-block" value="회원가입"
													style="width: 48%; display: inline; margin: 0;"></input>


											</fieldset>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
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
