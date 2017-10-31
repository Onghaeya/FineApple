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

	<title>프로젝트 현황</title>

	<%@ include file="/company/inc/asset_js.jsp" %>
	<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
	<script type="text/javascript" language="javascript" src="../../dist/js/jquery.dataTables.min.js"></script>
	<link href="/Project/company/dist/css/jsgantt.css" rel="stylesheet">
	<script type="text/javascript" language="javascript" src="../../dist/js/jsgantt.js"></script>
	<%@ include file="/company/inc/asset_css.jsp" %>
	<link href="/Project/company/dist/css/department.css" rel="stylesheet">

<script>
$(document).ready(function() {
    $('#searchTable1').DataTable( {
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
    $('#searchTable2').DataTable( {
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
						<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<i class="fa fa-bullhorn fa-fw"></i> 공지사항 목록
						</div>
						<div class="panel-body">
							<table id="searchTable1" width="100%" class="table table-striped table-bordered table-hover">
								<thead>
									<tr class="table-list">
										<th>번호</th>
										<th>담당자</th>
										<th>주제</th>
										<th>시작일</th>
										<th>종료일</th>
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
									<c:forEach items="${notice}" var="dto">
									<tr class="table-list">
										<td>${dto.seq}</td>
										<td>${dto.respName}</td>
										<td>${dto.subject}</td>
										<td>${dto.startDate}</td>
										<td>${dto.endDate}</td>
										<td><button type="button" id="btn-custom-small" class="btn btn-outline btn-default glyphicon glyphicon-ok" onclick="location.href='read_p.do?seq=${dto.seq}&type=project';" style="width:25px"></button></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-success">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 프로젝트 현황
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="embedded-Gantt">
			          <script type="text/javascript">
var g = new JSGantt.GanttChart(document.getElementById('embedded-Gantt'), 'day');
if (g.getDivId() != null) {
  g.setCaptionType('Complete');  // Set to Show Caption (None,Caption,Resource,Duration,Complete)
  g.setQuarterColWidth(36);
  g.setDateTaskDisplayFormat('yyyy - mon - dd - day'); // Shown in tool tip box
  g.setDayMajorDateDisplayFormat('yyyy month - ww Week') // Set format to display dates in the "Major" header of the "Day" view
  g.setWeekMinorDateDisplayFormat('month dd') // Set format to display dates in the "Minor" header of the "Week" view
  g.setShowTaskInfoLink(1); // Show link in tool tip (0/1)
  g.setShowEndWeekDate(0); // Show/Hide the date for the last day of the week in header for daily view (1/0)
  g.setUseSingleCell(10000); // Set the threshold at which we will only use one cell per table row (0 disables).  Helps with rendering performance for large charts.
  g.setFormatArr('Day', 'Week', 'Month', 'Quarter'); // Even with setUseSingleCell using Hour format on such a large chart can cause issues in some browsers
  g.setShowTaskInfoLink(1);
  g.addLang('ko', {'january':'1월','february':'2월','march':'3월','april':'4월','maylong':'5월','june':'6월',
	  'july':'7월','august':'8월','september':'9월','october':'10월','november':'11월','december':'12월',
	  'jan':'1','feb':'2','mar':'3','apr':'4','may':'5','jun':'6','jul':'7','aug':'8','sep':'9','oct':'10','nov':'11','dec':'12',	
	  'sunday':'일요일','monday':'월요일','tuesday':'화요일','wednesday':'수요일','thursday':'목요일','friday':'금요일','saturday':'토요일',
	  'sun':'일','mon':'월','tue':'화','wed':'수','thu':'목','fri':'금','sat':'토',
	  'resource':'담당자','duration':'기간','comp':'일정진행','completion':'일정진행도','startdate':'시작일','enddate':'종료일','moreinfo':'해당 문서 확인하기','notes':'내용',
	  'format':'형식','hour':'시','day':'일','week':'주차','month':'월','quarter':'분기','hours':'시간','days':'일','weeks':'주','months':'개월','quarters':'분기',
	  'hr':'시','dy':'일','wk':'주','mth':'개월','qtr':'분기','hrs':'시간','dys':'일','wks':'주','mths':'개월','qtrs':'분기'});
  g.setLang('ko');
  // Parameters                     (pID, pName,                  pStart,       pEnd,        pStyle,         pLink (unused)  pMile, pRes,       pComp, pGroup, pParent, pOpen, pDepend, pCaption, pNotes, pGantt)
	<c:forEach items="${tlist}" var="dto">
  g.AddTaskItem(new JSGantt.TaskItem(${dto.totalSeq},'${dto.subject}','${dto.startDate}','${dto.endDate}','${dto.colorSet}','../department/read_p.do?seq=${dto.seq}&type=${dto.type}',0,'${dto.respName}',${dto.percentage},0,${dto.parentSeq},1,'','','${dto.dContent}',g));
  </c:forEach>

  g.Draw();
} else {
  alert("Error, unable to create Gantt Chart");
}
			          </script>
			          <!-- g.setDateTaskDisplayFormat('day dd month yyyy'); // Shown in tool tip box
  g.setDayMajorDateDisplayFormat('mon yyyy - Week ww') // Set format to display dates in the "Major" header of the "Day" view
  g.setWeekMinorDateDisplayFormat('dd mon') // Set format to display dates in the "Minor" header of the "Week" view -->
			        </div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			<!-- /.panel -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-success">
						<div class="panel-heading">
							<i class="glyphicon glyphicon-pencil fa-fw"></i> 프로젝트 목록
						</div>
						<div class="panel-body">
							<table id="searchTable2" width="100%" class="table table-striped table-bordered table-hover">
								<thead>
									<tr class="table-list">
										<th>번호</th>
										<th>담당자</th>
										<th>주제</th>
										<th>시작일</th>
										<th>종료일</th>
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
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${list}" var="dto">
									<tr class="table-list">
										<td>${dto.seq}</td>
										<td>${dto.respName}</td>
										<td>${dto.subject}</td>
										<td>${dto.startDate}</td>
										<td>${dto.endDate}</td>
										<td><button type="button" id="btn-custom-small" class="btn btn-outline btn-default glyphicon glyphicon-ok" onclick="location.href='read_p.do?seq=${dto.seq}&type=project';" style="width:25px"></button></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
							<div class="row">
								<div id="btns" class="col-sm-12">
									<button type="button" class="btn btn-outline btn-default" onclick="location.href='project_c.do';">목록갱신</button>
								</div>
								<div id="btns" class="col-sm-12">
									<c:if test="${positionSeq == 2}">
									<!-- 부장일 때만 나타남 -->
									<form class="form-submit" action="/Project/company/pages/department/write_p.do" method="post">
										<button type="submit" class="btn btn-success btn-confirm">새 프로젝트 작성</button>
									</form>
									</c:if>
									<c:if test="${positionSeq == 3}">
									<!-- 과장일 때만 나타남 -->
									<form class="form-submit" action="/Project/company/pages/department/write_p.do" method="post">
										<button type="submit" class="btn btn-success btn-confirm">프로젝트 단위 작성</button>
									</form>
									</c:if>
									<c:if test="${positionSeq == 4}">
									<!-- 사원일 때만 나타남 -->
									<form class="form-submit" action="/Project/company/pages/department/write_p.do" method="post">
										<button type="submit" class="btn btn-success btn-confirm">단위 업무 작성</button>
									</form>
									</c:if>
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