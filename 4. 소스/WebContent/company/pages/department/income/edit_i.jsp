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

	<title>수입보고서 수정</title>
	
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
							<i class="fa fa-bar-chart-o fa-fw"></i> 매출 및 수입보고서
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form action="/Project/company/pages/department/edit_i_go.do" method="post">
								<table id="read" width="100%" class="table table-striped table-bordered table-hover">
									<tr class="table-read">
										<th>번호</th>
										<td><input type="text" name="userSeq" id="userSeq" value="${dto.seq}" class="form-control" readOnly /></td>
									</tr>
									<tr class="table-read">
										<th>작성자</th>
										<td>${dto.empName}</td>
									</tr>
									<tr class="table-read">
										<th>분류</th>
										<td>
											<select name="category" id="category" class="form-control">
												<c:forEach items="${clist}" var="dto">
												<option value="${dto.seq}">${dto.name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr class="table-read">
										<th>설명</th>
										<td><textarea name="content" id="content" rows="15" class="form-control" style="resize:none;" required>${dto.content}</textarea></td>
									</tr>
									<tr class="table-read">
										<th>물품</th>
										<td><textarea name="goods" id="goods" rows="5" class="form-control" style="resize:none;" required>${dto.goods}</textarea></td>
									</tr>
									<tr class="table-read">
										<th>수량</th>
										<td>
											<div class="form-group input-group">
												<input type="number" name="units" id="units" class="form-control" step="1" min="1" value="${dto.units}" required>
												<span class="input-group-addon">개</span>
											</div>
										</td>
									</tr>
									<tr class="table-read">
										<th>금액</th>
										<td>
											<div class="form-group input-group">
												<input type="number" name="amount" id="amount" class="form-control" step="1" min="1" value="${dto.amount}" required>
												<span class="input-group-addon">원</span>
											</div>
										</td>
									</tr>
								</table>
							<div id="btns" class="col-sm-12">
								<input type="button" value="돌아가기" class="btn btn-default" onclick="history.back();"/>
								<input type="submit" value="수정하기" class="btn btn-warning" />
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
