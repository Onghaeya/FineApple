<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>프로젝트 확인</title>
	
	<%@ include file="/company/inc/asset_css.jsp" %>
	<%@ include file="/company/inc/asset_js.jsp" %>
	<link href="/Project/company/dist/css/department.css" rel="stylesheet">

</head>

<body>

	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		<!-- uppderHeader -->
		<%@ include file="/company/inc/upperHeader.jsp" %>
		<%@ include file="/company/inc/leftHeader.jsp" %>
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header"></h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<i class="fa fa-list-alt fa-fw"></i> 프로젝트 내용 확인
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table id="read" width="100%" class="table table-striped table-bordered table-hover">
								<tr class="table-read">
									<th style="width:15%">번호</th>
									<td>${dto.seq}</td>
								</tr>
								<tr class="table-read">
									<th>작성자</th>
									<td>${dto.empName}</td>
								</tr>
								<tr class="table-read">
									<th>담당자</th>
									<td>${dto.respName}</td>
								</tr>
								<tr class="table-read">
									<th>주제</th>
									<td>${dto.subject}</td>
								</tr>
								<tr class="table-read">
									<th>목적</th>
									<td>${dto.goal}</td>
								</tr>
								<tr class="table-read">
									<th>설명</th>
									<td>${dto.content}</td>
								</tr>
								<tr class="table-read">
									<th>시작일</th>
									<td>${dto.startDate}</td>
								</tr>
								<tr class="table-read">
									<th>종료일</th>
									<td>${dto.endDate}</td>
								</tr>
							</table>
							<div id="btns" class="col-sm-12">
								<input type="button" value="돌아가기" class="btn btn-default" onclick="history.back();"/>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

</body>

</html>
