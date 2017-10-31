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

	<title>비용청구 현황</title>

	<%@ include file="/company/inc/asset_js.jsp" %>
	<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
	<script type="text/javascript" language="javascript" src="../../dist/js/jquery.dataTables.min.js"></script>
	<%@ include file="/company/inc/asset_css.jsp" %>
	<link href="/Project/company/dist/css/department.css" rel="stylesheet">

<script>
$(document).ready(function() {
    $('#searchTable').DataTable( {
    		order: [0, 'desc'],
        initComplete: function () {
            this.api().columns().every( function () {
                var column = this;
                var select = $('<select><option value=""></option></select>')
                    .appendTo( $(column.footer()).empty() )
                    .on( 'change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );
 
                        column
                            .search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                    } );
 
                column.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                } );
            } );
        }
    } );
} );
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
			<!-- /.panel -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<i class="glyphicon glyphicon-pencil  fa-fw"></i> 비용청구 목록
						</div>
						<div class="panel-body">
							<table id="searchTable" width="100%" class="table table-striped table-bordered table-hover" id="table-outcome">
								<thead>
									<tr class="table-list">
										<th>번호</th>
										<th>작성자</th>
										<th>종류</th>
										<th>금액(원)</th>
										<th>제출일</th>
										<th>현황</th>
										<th style="width:80px">내용확인</th>
									</tr>
								</thead>
								<tfoot>
									<tr class="table-list">
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${list}" var="dto">
									<tr class="table-list">
										<td>${dto.seq}</td>
										<td>${dto.name}</td>
										<td>${dto.category}</td>
										<td>${dto.amount}</td>
										<td>${dto.regDate}</td>
										<td>${dto.status}</td>
										<td><button type="button" id="btn-custom-small" class="btn btn-outline btn-default glyphicon glyphicon-ok" onclick="location.href='read_o.do?seq=${dto.seq}';" style="width:25px"></button></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
							<div class="row">
								<div id="btns" class="col-sm-12">
									<button type="button" class="btn btn-outline btn-default" onclick="location.href='outcome_c.do';">목록갱신</button>
									<button type="button" class="btn btn-outline btn-danger" onclick="location.href='write_o.do';">비용청구</button>
								</div>
							</div>
							<!-- 상, 페이지바 / 하, 검색 -->	
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
					<div class="col-sm-12" style="text-align:left">
					<input type="button" value="돌아가기" class="btn btn-default" onclick="history.back();"/>
					</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- row -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

</body>

</html>
