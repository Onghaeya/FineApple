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

	<title>전체 프로젝트 목록</title>

	<%@ include file="/company/inc/asset_js.jsp" %>
	<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
	<script type="text/javascript" language="javascript" src="../../dist/js/jquery.dataTables.min.js"></script>
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
										<td><button type="button" id="btn-custom-small" class="btn btn-outline btn-default glyphicon glyphicon-ok" onclick="location.href='read_p.do?seq=${dto.seq}';" style="width:25px"></button></td>
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
  g.setDateTaskDisplayFormat('day dd month yyyy'); // Shown in tool tip box
  g.setDayMajorDateDisplayFormat('mon yyyy - Week ww') // Set format to display dates in the "Major" header of the "Day" view
  g.setWeekMinorDateDisplayFormat('dd mon') // Set format to display dates in the "Minor" header of the "Week" view
  g.setShowTaskInfoLink(1); // Show link in tool tip (0/1)
  g.setShowEndWeekDate(0); // Show/Hide the date for the last day of the week in header for daily view (1/0)
  g.setUseSingleCell(10000); // Set the threshold at which we will only use one cell per table row (0 disables).  Helps with rendering performance for large charts.
  g.setFormatArr('Day', 'Week', 'Month', 'Quarter'); // Even with setUseSingleCell using Hour format on such a large chart can cause issues in some browsers
  // Parameters                     (pID, pName,                  pStart,       pEnd,        pStyle,         pLink (unused)  pMile, pRes,       pComp, pGroup, pParent, pOpen, pDepend, pCaption, pNotes, pGantt)
  g.AddTaskItem(new JSGantt.TaskItem(1,   'Define Chart API',     '',           '',          'ggroupblack',  '',                 0, 'Brian',    0,     1,      0,       1,     '',      '',      'Some Notes text', g ));
  g.AddTaskItem(new JSGantt.TaskItem(11,  'Chart Object',         '2017-02-20','2017-02-20', 'gmilestone',   '',                 1, 'Shlomy',   100,   0,      1,       1,     '',      '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(12,  'Task Objects',         '',           '',          'ggroupblack',  '',                 0, 'Shlomy',   40,    1,      1,       1,     '',      '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(121, 'Constructor Proc',     '2017-02-21','2017-03-09', 'gtaskblue',    '',                 0, 'Brian T.', 60,    0,      12,      1,     '',      '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(122, 'Task Variables',       '2017-03-06','2017-03-11', 'gtaskred',     '',                 0, 'Brian',    60,    0,      12,      1,     121,     '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(123, 'Task by Minute/Hour',  '2017-03-09','2017-03-14 12:00', 'gtaskyellow', '',            0, 'Ilan',     60,    0,      12,      1,     '',      '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(124, 'Task Functions',       '2017-03-09','2017-03-29', 'gtaskred',     '',                 0, 'Anyone',   60,    0,      12,      1,     '123SS', 'This is a caption', null, g));
  g.AddTaskItem(new JSGantt.TaskItem(2,   'Create HTML Shell',    '2017-03-24','2017-03-24', 'gtaskyellow',  '',                 0, 'Brian',    20,    0,      0,       1,     122,     '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(3,   'Code Javascript',      '',           '',          'ggroupblack',  '',                 0, 'Brian',    0,     1,      0,       1,     '',      '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(31,  'Define Variables',     '2017-02-25','2017-03-17', 'gtaskpurple',  '',                 0, 'Brian',    30,    0,      3,       1,     '',      'Caption 1','',   g));
  g.AddTaskItem(new JSGantt.TaskItem(32,  'Calculate Chart Size', '2017-03-15','2017-03-24', 'gtaskgreen',   '',                 0, 'Shlomy',   40,    0,      3,       1,     '',      '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(33,  'Draw Task Items',      '',           '',          'ggroupblack',  '',                 0, 'Someone',  40,    2,      3,       1,     '',      '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(332, 'Task Label Table',     '2017-03-06','2017-03-09', 'gtaskblue',    '',                 0, 'Brian',    60,    0,      33,      1,     '',      '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(333, 'Task Scrolling Grid',  '2017-03-11','2017-03-20', 'gtaskblue',    '',                 0, 'Brian',    0,     0,      33,      1,     '332',   '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(34,  'Draw Task Bars',       '',           '',          'ggroupblack',  '',                 0, 'Anybody',  60,    1,      3,       0,     '',      '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(341, 'Loop each Task',       '2017-03-26','2017-04-11', 'gtaskred',     '',                 0, 'Brian',    60,    0,      34,      1,     '',      '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(342, 'Calculate Start/Stop', '2017-04-12','2017-05-18', 'gtaskpink',    '',                 0, 'Brian',    60,    0,      34,      1,     '',      '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(343, 'Draw Task Div',        '2017-05-13','2017-05-17', 'gtaskred',     '',                 0, 'Brian',    60,    0,      34,      1,     '',      '',      '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(344, 'Draw Completion Div',  '2017-05-17','2017-06-04', 'gtaskred',     '',                 0, 'Brian',    60,    0,      34,      1,     "342,343",'',     '',      g));
  g.AddTaskItem(new JSGantt.TaskItem(35,  'Make Updates',         '2017-07-17','2017-09-04', 'gtaskpurple',  '',                 0, 'Brian',    30,    0,      3,       1,     '333',   '',      '',      g));

  g.Draw();
} else {
  alert("Error, unable to create Gantt Chart");
}
			          </script>
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
						<div class="panel-heading collapsable" data-toggle="collapse" data-target="#menu2">
							<i class="glyphicon glyphicon-pencil fa-fw"></i> 프로젝트 목록
						</div>
						<div class="panel-body collapse" id="menu2">
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
										<td><button type="button" id="btn-custom-small" class="btn btn-outline btn-default glyphicon glyphicon-ok" onclick="location.href='read_p.do?seq=${dto.seq}';" style="width:25px"></button></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
							<div class="row">
								<div id="btns" class="col-sm-12">
									<button type="button" class="btn btn-outline btn-default" onclick="location.href='project_c.do';">목록갱신</button>
									<button type="button" class="btn btn-outline btn-default" onclick="location.href='read_p.do';">전체목록</button>
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
