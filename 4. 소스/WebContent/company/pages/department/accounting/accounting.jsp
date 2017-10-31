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

	<title>수입 / 지출처리 현황</title>

	<%@ include file="/company/inc/asset_js.jsp" %>
	<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
	<script type="text/javascript" language="javascript" src="../../dist/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="../../dist/js/highcharts.js"></script>
	<script type="text/javascript" language="javascript" src="../../dist/js/data.js"></script>
	<%@ include file="/company/inc/asset_css.jsp" %>
	<link href="/Project/company/dist/css/department.css" rel="stylesheet">

<script>
$(document).ready(function() {
		$('#accountTable').DataTable( {
				order: [0, 'asc'],
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
    $('#incomeTable').DataTable( {
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
    $('#outcomeTable').DataTable( {
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
					<div class="panel panel-default"><!-- rlist 사용 -->
						<div class="panel-heading collapsable" data-toggle="collapse" data-target="#menu1">
							<i class="fa fa-bar-chart-o fa-fw"></i> 최근 30일 재원별 출납 현황
						</div>
						<div class="panel-body collapse" id="menu1">
							<div id="container" style="min-width: 310px; height: 200px; margin: 0 auto"></div>
							<table id="datatable" style="display:none">
						    <thead>
					        <tr>
				            <th></th>
				            <th>입금</th>
				            <th>출금</th>
					        </tr>
						    </thead>
						    <tbody>
						    <c:forEach items="${rlist}" var="dto">
					        <tr>
				            <th>${dto.name}</th>
				            <td>${dto.icount}</td>
				            <td>${dto.ocount}</td>
					        </tr>
					      </c:forEach>
						    </tbody>
							</table>
							<script type="text/javascript">
							Highcharts.chart('container', {
						    data: {
					        table: 'datatable'
						    },
						    chart: {
					        type: 'column'
						    },
						    title: {
					        text: '최근 30일 재원별 출납 현황'
						    },
						    yAxis: {
					        allowDecimals: false,
					        title: {
					            text: '횟수'
					        }
						    },
						    tooltip: {
					        formatter: function () {
				            return '<b>' + this.series.name + '</b><br/>' +
			                this.point.y + ' ' + this.point.name.toLowerCase();
					        }
						    }
							});
							</script>
							
							<div id="container2" style="min-width: 310px; height: 300px; margin: 0 auto"></div>
							<script type="text/javascript">
							Highcharts.chart('container2', {
							    chart: {
							        type: 'column'
							    },
							    title: {
							        text: '최근 30일 재원별 금액 변동 현황'
							    },
							    xAxis: {
							        categories: [
							        	<c:forEach items="${rlist}" var="dto">
							        	'${dto.name}',
								    	</c:forEach>
							        	]
							    },
							    credits: {
							        enabled: false
							    },
							    series: [{
							        name: '변동액',
							        data: [
							        	<c:forEach items="${rlist}" var="dto">
							        	${dto.iamount - dto.oamount},
								    	</c:forEach>
										]
							    }]
							});
							</script>
							</div>
						</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
					<div class="panel panel-success">
						<div class="panel-heading">
							<i class="fa fa-credit-card fa-fw"></i> 현재 재원 목록
						</div>
						<div class="panel-body">
							<table id="accountTable" width="100%" class="table table-striped table-bordered table-hover" id="table-outcome">
								<thead>
									<tr class="table-list">
										<th>번호</th>
										<th>유형</th>
										<th>위치(계좌번호)</th>
										<th>잔고(원)</th>
										<th>최종거래일</th>
										<th style="width:90px">입출금 기록</th>
									</tr>
								</thead>
								<tfoot>
									<tr class="table-list">
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${alist}" var="dto">
									<tr class="table-list">
										<td>${dto.seq}</td>
										<td>${dto.name}</td>
										<td>${dto.aNumber}</td>
										<td>${dto.balance}</td>
										<td>${dto.regDate}</td>
										<td><button type="button" id="btn-custom-small" class="btn btn-outline btn-default glyphicon glyphicon-check" onclick="location.href='read_a.do?seq=${dto.seq}&type=account';" style="width:25px"></button></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->	
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
					<div class="panel panel-primary">
						<div class="panel-heading collapsable" data-toggle="collapse" data-target="#menu2">
							<i class="glyphicon glyphicon-pencil fa-fw"></i> 수입 처리가 필요한 보고 목록
						</div>
						<div class="panel-body collapse" id="menu2">
							<table id="incomeTable" width="100%" class="table table-striped table-bordered table-hover" id="table-outcome">
								<thead>
									<tr class="table-list">
										<th>번호</th>
										<th>작성자</th>
										<th>종류</th>
										<th>물품</th>
										<th>총액(원)</th>
										<th>제출일</th>
										<th>현황</th>
										<th style="width:80px">승인처리</th>
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
									<tr class="table-list">
										<td>${dto.seq}</td>
										<td>${dto.name}</td>
										<td>${dto.category}</td>
										<td>${dto.goods}</td>
										<td>${(dto.amount * dto.units)}</td>
										<td>${dto.regDate}</td>
										<td>${dto.confirm}</td>
										<td><button type="button" id="btn-custom-small" class="btn btn-outline btn-default glyphicon glyphicon-check" onclick="location.href='read_a.do?seq=${dto.seq}&type=in';" style="width:25px"></button></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
							<div class="row">
								<div id="btns" class="col-sm-12">
									<button type="button" class="btn btn-outline btn-default" onclick="location.href='accounting_c.do';">목록갱신</button>
									<button type="button" class="btn btn-outline btn-primary" onclick="location.href='accounting_c.do?limiter=no';">전체목록</button>
								</div>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
					<div class="panel panel-danger">
						<div class="panel-heading collapsable" data-toggle="collapse" data-target="#menu3">
							<i class="glyphicon glyphicon-pencil fa-fw"></i> 지출 처리가 필요한 보고 목록
						</div>
						<div class="panel-body collapse" id="menu3">
							<table id="outcomeTable" width="100%" class="table table-striped table-bordered table-hover" id="table-outcome">
								<thead>
									<tr class="table-list">
										<th>번호</th>
										<th>작성자</th>
										<th>종류</th>
										<th>금액(원)</th>
										<th>제출일</th>
										<th>현황</th>
										<th style="width:80px">승인처리</th>
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
									<c:forEach items="${olist}" var="dto">
									<tr class="table-list">
										<td>${dto.seq}</td>
										<td>${dto.name}</td>
										<td>${dto.category}</td>
										<td>${dto.amount}</td>
										<td>${dto.regDate}</td>
										<td>${dto.status}</td>
										<td><button type="button" id="btn-custom-small" class="btn btn-outline btn-default glyphicon glyphicon-check" onclick="location.href='read_a.do?seq=${dto.seq}&type=out';" style="width:25px"></button></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
							<div class="row">
								<div id="btns" class="col-sm-12">
									<button type="button" class="btn btn-outline btn-default" onclick="location.href='accounting_c.do';">목록갱신</button>
									<button type="button" class="btn btn-outline btn-primary" onclick="location.href='accounting_c.do?limiter=no';">전체목록</button>
								</div>
							</div>
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
