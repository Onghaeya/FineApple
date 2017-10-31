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

	<title>개발부 프로젝트 현황</title>

	<%@ include file="/company/inc/asset_css.jsp" %>

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
					<div class="panel panel-primary">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i>개발부 프로젝트 현황
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<!-- 실제 사용시에는 복붙해서 가져오기 -->
							<%@ include file="/company/pages/department/templates/ref_project_gantt.jsp" %>
							<!-- <div id="morris-area-chart"></div> -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			<!-- /.panel -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i>다른 프로젝트 목록
						</div>
						<div class="panel-body">
							<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th>현황</th>
										<th>주제</th>
										<th>시작일</th>
										<th>종료일</th>
										<th>작성자</th>
									</tr>
								</thead>
								<tbody>
									<%--  <c:forEach items="" var="">--%>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<%--  </c:forEach>--%>
								</tbody>
							</table>
							<!-- /.table-responsive -->
							<form action="">
								<div class="form-group input-group">
									<input type="text" class="form-control">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
									</span>
								</div>
							</form>
							<div id="btns">
								<button type="button" class="btn btn-outline btn-default">목록갱신</button>
								<!-- if, 부장일때만 -->
								<button type="button" class="btn btn-outline btn-primary">새 프로젝트</button>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- row -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<%@ include file="/company/inc/asset_js.jsp" %>

</body>

</html>
