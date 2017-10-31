<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="/company/pages/attendance/inc/asset.jsp" %>
	<title>SB Admin 2 - Bootstrap Admin Theme</title>
</head>

<style>

.panel-heading {
	cursor:pointer;
}


</style>


<body>

   <div id="wrapper">
		
	    <%@ include file="/company/pages/attendance/inc/navigation.jsp" %>

		<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="border-bottom:0px"></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading" onclick="come();">
							<div class="row">
								<div class="col-xs-3">
					                <i class="fa fa-check-square-o fa-5x"></i>
					            </div>
					            <div class="col-xs-9 text-right">
					                <div class="huge">출근</div>
					            </div>
					        </div>
					    </div>
					    <a href="#">
					        <div class="panel-footer">
					            <span class="pull-left">자세히 보기</span>
					            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
					            <div class="clearfix"></div>
					        </div>
					    </a>
					</div>
			    </div>
			    <div class="col-lg-3 col-md-6">
			        <div class="panel panel-yellow">
			            <div class="panel-heading" onclick="leave();">
			                <div class="row">
			                    <div class="col-xs-3">
			                        <i class="fa fa-share-square-o fa-5x"></i>
			                    </div>
			                    <div class="col-xs-9 text-right">
			                        <div class="huge">퇴근</div>
			                    </div>
			                </div>
			            </div>
			            <a href="#">
			                <div class="panel-footer">
			                    <span class="pull-left">자세히 보기</span>
			                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                    <div class="clearfix"></div>
			                </div>
			            </a>
			        </div>
			    </div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading" onclick="leaveTemp();">
							<div class="row">
								<div class="col-xs-3">
					                <i class="fa fa-check-square-o fa-5x"></i>
					            </div>
					            <div class="col-xs-9 text-right">
					                <div class="huge">외출</div>
					            </div>
					        </div>
					    </div>
					    <a href="#">
					        <div class="panel-footer">
					            <span class="pull-left">자세히 보기</span>
					            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
					            <div class="clearfix"></div>
					        </div>
					    </a>
					</div>
			    </div>
			    <div class="col-lg-3 col-md-6">
			        <div class="panel panel-green">
			            <div class="panel-heading" onclick="comeTemp();">
			                <div class="row">
			                    <div class="col-xs-3">
			                        <i class="fa fa-share-square-o fa-5x"></i>
			                    </div>
			                    <div class="col-xs-9 text-right">
			                        <div class="huge">복귀</div>
			                    </div>
			                </div>
			            </div>
			            <a href="#">
			                <div class="panel-footer">
			                    <span class="pull-left">자세히 보기</span>
			                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                    <div class="clearfix"></div>
			                </div>
			            </a>
			        </div>
			    </div>
			    <div class="col-lg-3 col-md-6">
			        <div class="panel panel-primary">
			            <div class="panel-heading" onclick="list();">
			                <div class="row">
			                    <div class="col-xs-3">
			                        <i class="fa fa-list fa-5x"></i>
			                    </div>
			                    <div class="col-xs-9 text-right">
			                        <div class="huge">조회</div>
			                    </div>
			                </div>
			            </div>
			            <a href="#">
			                <div class="panel-footer">
			                    <span class="pull-left">자세히 보기</span>
			                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                    <div class="clearfix"></div>
			                </div>
			            </a>
			        </div>
			    </div>
			    <div class="col-lg-3 col-md-6">
			        <div class="panel panel-red">
			            <div class="panel-heading" onclick="manage();">
			                <div class="row">
			                    <div class="col-xs-3">
			                        <i class="fa fa-edit fa-5x"></i>
			                    </div>
			                    <div class="col-xs-9 text-right">
			                        <div class="huge">관리</div>
			                    </div>
			                </div>
			            </div>
			            <a href="#">
			                <div class="panel-footer">
			                    <span class="pull-left">자세히 보기</span>
			                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                    <div class="clearfix"></div>
			                </div>
			            </a>
			        </div>
			    </div>
			</div>
			<!-- /.row -->
			
			
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <%@ include file="/company/pages/attendance/inc/closing.jsp" %>

</body>

<script>

/* 출근 */
function come() {
	var come = confirm("출근하시겠습니까?");
	/* 출근ok 로 ㄱㄱ */
	
	if(come == true) {
	    location.href="/Project/attendance/taskComeOk.do"
	}



}


/* 퇴근 */
function leave() {
	var leave = confirm("퇴근하시겠습니까?");
	//퇴근ok 로 ㄱㄱ
	
	if(leave == true) {
	    location.href="/Project/attendance/taskLeaveOk.do"
	}
}


/* 외출 */
function leaveTemp() {
	confirm("외출할꺼야?");
}

/* 복귀 */
function comeTemp() {
	confirm("외출에서 복귀했어?");
}

/* 조회 */
function list() {
    location.href="/Project/attendance/taskList.do";
}

/* 관리 */
function manage() {
    location.href="/Project/attendance/taskManage.do";
}

</script>

</html>





























