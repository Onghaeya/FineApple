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

	<title>계좌 입출금 승인 내역</title>
	
	<%@ include file="/company/inc/asset_js.jsp" %>
	<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
	<script type="text/javascript" language="javascript" src="../../dist/js/jquery.dataTables.min.js"></script>
	<%@ include file="/company/inc/asset_css.jsp" %>
	<link href="/Project/company/dist/css/department.css" rel="stylesheet">

</head>
<script>
$(document).ready(function() {
	$('#accountTable').DataTable( {
		order: [5, 'desc'],
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
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-list-alt fa-fw"></i> 입출금 승인 내역
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table id="accountTable" width="100%" class="table table-striped table-bordered table-hover" id="table-outcome">
								<thead>
									<tr class="table-list">
										<th>구분</th>
										<th>작성자</th>
										<th>부서</th>
										<th>분류</th>
										<th>금액</th>
										<th>승인일</th>
										<th>승인자</th>
										<th>문서확인</th>
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
										<th></th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${ilist}" var="dto">
									<tr class="table-list" style="background-color:#bce8f1;">
										<td>수입</td>
										<td>${dto.name}</td>
										<td>${dto.department}</td>
										<td>${dto.category}</td>
										<td>${(dto.amount * dto.units)}</td>
										<td>${dto.conDate}</td>
										<td>${dto.respName}</td>
										<td><button type="button" id="btn-custom-small" class="btn btn-outline btn-default glyphicon glyphicon-check" onclick="location.href='read_i.do?seq=${dto.seq}';" style="width:50px"></button></td>
									</tr>
									</c:forEach>
									<c:forEach items="${olist}" var="dto">
									<tr class="table-list" style="background-color:#f2dede;">
										<td>지출</td>
										<td>${dto.name}</td>
										<td>${dto.department}</td>
										<td>${dto.category}</td>
										<td>${dto.amount}</td>
										<td>${dto.conDate}</td>
										<td>${dto.respName}</td>
										<td><button type="button" id="btn-custom-small" class="btn btn-outline btn-default glyphicon glyphicon-check" onclick="location.href='read_o.do?seq=${dto.seq}';" style="width:50px"></button></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<div id="btns" class="col-sm-12">
									<input type="button" value="돌아가기" class="btn btn-default" 	onclick="history.back();"/>
							</div>
							<!-- /.table-responsive -->	
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
