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

<title>새로운 프로젝트 작성</title>

	<%@ include file="/company/inc/asset_css.jsp" %>
	<%@ include file="/company/inc/asset_js.jsp" %>
	<link href="/Project/company/dist/css/department.css" rel="stylesheet">	

<script>
	$(document).ready(function() {

	});
</script>
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
							<i class="fa fa-pencil fa-fw"></i> 새로운 프로젝트 작성
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form action="/Project/company/pages/department/project/write_p_go.do" method="post">
								<table id="dev_write" width="100%" class="table table-striped table-bordered table-hover">
									<tr>
										<!-- 자동입력 -->
										<th>담당자</th>
										<td><input type="text" name="emp" id="emp" class="form-control" value="" required readonly /></td>
									</tr>
									<tr>
										<th>주제</th>
										<td><input type="text" name="subject" id="subject" class="form-control" placeholder="프로젝트  주제를 입력하세요" required /></td>
									</tr>
									<tr>
										<th>목표</th>
										<td><textarea name="goal" id="goal" class="form-control" rows="5" placeholder="프로젝트 목표를 입력하세요" required></textarea></td>
									</tr>
									<tr>
										<th>설명</th>
										<td><textarea name="content" id="content" class="form-control" rows="10" placeholder="프로젝트에 대한 설명을 입력하세요" required></textarea></td>
									</tr>
									<tr>
										<th>시작일</th>
										<td><input type="text" id="startDate" name="startDate" class="form-control" placeholder="시작일을 지정하세요" readonly /></td>
										<script>
										$('#startDate').datepicker({
											format: 'yyyy-mm-dd', setStartDate: '2017-01-01', autoclose: true
										});
										</script>
									</tr>
									<tr>
										<th>종료일</th>
										<td><input type="text" id="endDate" name="endDate" class="form-control" placeholder="종료일을 지정하세요" readonly /></td>
										<script>
										// 시작일보다 늦을 경우 경고발생
										$('#endDate').datepicker({
											format: 'yyyy-mm-dd', setStartDate: '2017-01-01', autoclose: true
										});
										</script>
									</tr>
									<!-- 해당 부분은 if로 부장님일때만 보여주기 -->
									<tr>
										<th>게시물 종류</th>
										<td>
											<select name="notice" id="notice" class="form-control">
												<option value="">프로젝트</option>
												<option value="">공지사항</option>
											</select>
										</td>
									</tr>
								</table>
								<div id="btns">
									<input type="button" value="돌아가기" class="btn btn-default" 	onclick="history.back();"/>
									<input type="submit" value="글쓰기" class="btn btn-primary" />
								</div>
							</form>
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
