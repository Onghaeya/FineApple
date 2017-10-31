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

	<title>지출보고서 처리</title>
	
	<%@ include file="/company/inc/asset_css.jsp" %>
	<%@ include file="/company/inc/asset_js.jsp" %>
	<link href="/Project/company/dist/css/department.css" rel="stylesheet">

</head>
<script>
	$(document).ready(function() {
		$('.form-submit').submit(function() {
		    var c = confirm("정말로 수행하시겠습니까?");
		    return c;
		});
		$('#account').change(function() { 
			var state = $('#account option:selected').val();
			var accountnum = ($('#anumber'+state).val());
			var values = ($('#balance'+state).val());
			var results = ($('#result'+state).val());
			$('#balance').val(values);
			$('#result').val(results);
			$('#anumber').val(accountnum);
		});
	});
</script>
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
					<div class="panel panel-danger">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 비용 등 지출보고 처리
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form class="form-submit" action="/Project/company/pages/department/read_a_go.do" method="post">
								<table id="read" width="100%" class="table table-striped table-bordered table-hover">
									<tr class="table-read">
										<th colspan="4">내용확인 및 지출처리</th>
									</tr>
									<tr class="table-read">
										<th style="width:10%">작성자</th>
										<td style="width:35%">${odto.empName}</td>
										<th style="width:10%">해당부서</th>
										<td style="width:35%">${odto.department}</td>
									</tr>
									<tr class="table-read">
										<th>분류</th>
										<td>${odto.cSeq}</td>
										<th>계좌</th>
										<td>
											<select name="account" id="account" class="form-control">
											<c:forEach items="${list}" var="dto">
												<option value="${dto.seq}">${dto.name}</option>
											</c:forEach>
											</select>
										</td>
									</tr>
									<tr class="table-read">
										<th>설명</th>
										<td>${odto.content}</td>
										<th>주석</th>
										<td><textarea name="content" id="content" rows="15" class="form-control" style="resize:none;"></textarea></td>
									</tr>
									<tr class="table-read">
										<th>총액</th>
										<td>
											<div class="form-group input-group">
												<span class="input-group-addon">-</span>
												<input type="text" name="amount" id="amount" class="form-control" value="${odto.amount}" style="text-align:right" readonly>
												<span class="input-group-addon">원</span>
											</div>
										</td>
										<th>현재 잔고</th>
										<td>
											<div class="form-group input-group">
												<input type="text" name="balance" id="balance" class="form-control" value="" style="text-align:right" readonly>
												<span class="input-group-addon">원</span>
											</div>
										</td>
									</tr>
									<tr class="table-read">
										<th>계좌번호</th>
										<td>
											<div class="form-group">
												<input type="text" name="anumber" id="anumber" class="form-control" value="" style="text-align:right" readonly>
											</div>
										</td>
										<th>처리 후 잔고</th>
										<td>
											<div class="form-group input-group">
												<input type="text" name="result" id="result" class="form-control" value="" style="text-align:right" readonly>
												<span class="input-group-addon">원</span>
											</div>
										</td>
									</tr>
								</table>
							<input type="button" value="돌아가기" class="btn btn-default" onclick="history.back();"/>
							<div id="btns" class="col-sm-12">
								<button type="submit" id="confirm" name="confirm" value="no" class="btn btn-danger btn-confirm">반려하기</button>
								<button type="submit" id="confirm" name="confirm" value="yes" class="btn btn-primary btn-confirm">승인하기</button>
								<input type="hidden" id="seq" name="seq" value="${odto.seq}" />
								<input type="hidden" id="type" name="type" value="out" />				
							</div>
							</form>
							<c:forEach items="${list}" var="dto">
							<input name="balance${dto.seq}" id="balance${dto.seq}" value="${dto.balance}" style="display:none;" />
							<input name="anumber${dto.seq}" id="anumber${dto.seq}" value="${dto.aNumber}" style="display:none;" />
							<input name="result${dto.seq}" id="result${dto.seq}" value="${dto.balance - odto.amount}" style="display:none;" />
							</c:forEach>
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
