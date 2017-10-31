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

<title>새로운 프로젝트 단위 작성</title>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<%@ include file="/company/inc/asset_css.jsp" %>
	<%@ include file="/company/inc/asset_js.jsp" %>
	<link href="/Project/company/dist/css/department.css" rel="stylesheet">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<script>
	$(document).ready(function() {
		$('.form-submit').submit(function() {
		    var c = confirm("정말로 수행하시겠습니까?");
		    return c;
		});
		$('#pSeq').change(function() { 
			var state = $('#pSeq option:selected').val();
			if (state == "default") {
				$('#resp').val("");
				$('#dep').val("");
				$('#start').val("");
				$('#end').val("");
			} else {
				var respSeq = ($('#resp'+state).val());
				var depSeq = ($('#dep'+state).val());
				var starts = ($('#start'+state).val());
				var ends = ($('#end'+state).val());
				$('#resp').val(respSeq);
				$('#dep').val(depSeq);
				$('#start').val(starts);
				$('#end').val(ends);
			}
		});
		$.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년',
	        minDate: 0
	  });
		$(function() {
		var dateFormat = "mm/dd/yy",
	      from = $( "#startDate" )
	        .datepicker({
	          defaultDate: 0,
	          changeMonth: true,
	          numberOfMonths: 1
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }),
	      to = $( "#endDate" ).datepicker({
	        defaultDate: "+1w",
	        changeMonth: true,
	        numberOfMonths: 1
	      })
	      .on( "change", function() {
	        from.datepicker( "option", "maxDate", getDate( this ) );
	      });
	 
	    function getDate( element ) {
	      var date;
	      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }
	      return date;
	    }
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
					<div class="panel panel-success">
						<div class="panel-heading">
							<i class="fa fa-pencil fa-fw"></i> 새로운 프로젝트 단위 작성
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form class="form-submit" action="/Project/company/pages/department/write_p_go.do" method="post">
								<table id="dev_write" width="100%" class="table table-striped table-bordered table-hover">
									<tr class="table-read">
										<th>대상 프로젝트</th>
										<td colspan="3">
											<select name="pSeq" id="pSeq" class="form-control">
												<option value="default"></option>
											<c:forEach items="${list}" var="dto">
												<option value="${dto.seq}">${dto.subject}</option>
											</c:forEach>
											</select>
										</td>
									</tr>
									<tr class="table-read">
										<th>담당자</th>
										<td colspan="3">
											<div class="form-group input-group">
												<input type="text" name="resp" id="resp" class="form-control" value="" style="text-align:left" readonly>
											</div>
										</td>
									</tr>
									<tr class="table-read">
										<th>부서</th>
										<td colspan="3">
											<div class="form-group input-group">
												<input type="text" name="dep" id="dep" class="form-control" value="" style="text-align:left" readonly>
											</div>
										</td>
									</tr>
									<tr class="table-read">
										<th>업무내용</th>
										<td colspan="3">
										<input type="text" name="work" id="work" class="form-control" placeholder="단위 프로젝트에 대한 업무를 입력하세요" required />
										</td>
									</tr>
									<tr class="table-read">
										<th>프로젝트 시작일</th>
										<td>
											<div class="form-group input-group">
												<input type="text" name="start" id="start" class="form-control" value="" style="text-align:left" readonly>
											</div>
										</td>
										<th>프로젝트 종료일</th>
										<td>
											<div class="form-group input-group">
												<input type="text" name="end" id="end" class="form-control" value="" style="text-align:left" readonly>
											</div>
										</td>
									</tr>
									<tr class="table-read">
										<th>단위 시작일</th>
										<td>
											<div class="input-group date">
												<input type="text" class="form-control" id="startDate" name="startDate" placeholder="시작일을 지정하세요" readonly required />
												<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
											</div>
										</td>
										<th>단위 종료일</th>
										<td>
											<div class="input-group date">
												<input type="text" class="form-control" id="endDate" name="endDate" placeholder="종료일을 지정하세요" readonly required />
												<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
											</div>
										</td>
									</tr>
								</table>
								<div id="btns" class="col-sm-12">
									<input type="button" value="돌아가기" class="btn btn-default" 	onclick="history.back();"/>
									<input type="submit" value="작성하기" class="btn btn-success" />
									<input type="hidden" name="type" id="type" value="unit" />
								</div>
							</form>
							<c:forEach items="${list}" var="dto">
							<input name="resp${dto.seq}" id="resp${dto.seq}" value="${dto.respName}" style="display:none;" />
							<input name="dep${dto.seq}" id="dep${dto.seq}" value="${dto.department}" style="display:none;" />
							<input name="start${dto.seq}" id="start${dto.seq}" value="${dto.startDate}" style="display:none;" />
							<input name="end${dto.seq}" id="end${dto.seq}" value="${dto.endDate}" style="display:none;" />
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
