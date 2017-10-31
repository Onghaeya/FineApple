<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>부서별 업무처리</title>
	
	<jsp:include page="/company/inc/asset_css.jsp"></jsp:include>
	<%@ include file="/company/inc/asset_js.jsp" %>
	
</head>

<body>

	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		<!-- uppderHeader -->
			<%@ include file="/company/inc/upperHeader.jsp" %>

			<%@ include file="/company/inc/leftHeader.jsp" %>
		</nav>
		<div style="clear:both;"></div>
		<div id="page-wrapper">
      <div class="row">
        <div class="col-lg-12">
          <h1 class="page-header">부서별 업무</h1>
        </div>
        <!-- /.col-lg-12 -->
      </div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
	                <i class="fa fa-calendar fa-5x"></i>
		            </div>
		            <div class="col-xs-9 text-right">
	                <div class="huge">프로젝트</div>
		            </div>
			        </div>
				    </div>
				    <a href="/Project/company/pages/department/project_c.do">
			        <div class="panel-footer">
		            <span class="pull-left">업무 처리</span>
		            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
		            <div class="clearfix"></div>
			        </div>
				    </a>
					</div>
		    </div>
		    <div class="col-lg-3 col-md-6">
	        <div class="panel panel-red">
            <div class="panel-heading">
               <div class="row">
                 <div class="col-xs-3">
                   <i class="fa fa-credit-card fa-5x"></i>
                 </div>
                 <div class="col-xs-9 text-right">
                   <div class="huge">비용청구</div>
                 </div>
               </div>
            </div>
            <a href="/Project/company/pages/department/outcome_c.do">
              <div class="panel-footer">
                <span class="pull-left">업무 처리</span>
                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                <div class="clearfix"></div>
              </div>
            </a>
	        </div>
		    </div>
		    <c:if test="${departmentSeq == 3 || departmentSeq == 4}">
			  <div class="col-lg-3 col-md-6">
	        <div class="panel panel-primary">
            <div class="panel-heading">
               <div class="row">
                 <div class="col-xs-3">
                   <i class="fa fa-money fa-5x"></i>
                 </div>
                 <div class="col-xs-9 text-right">
                   <div class="huge">수입보고</div>
                 </div>
               </div>
            </div>
            <a href="/Project/company/pages/department/income_c.do">
              <div class="panel-footer">
                <span class="pull-left">업무 처리</span>
                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                <div class="clearfix"></div>
              </div>
            </a>
	        </div>
		    </div>
		    </c:if>
		    <c:if test="${departmentSeq == 3}">
		    <div class="col-lg-3 col-md-6">
	        <div class="panel panel-yellow">
            <div class="panel-heading">
               <div class="row">
                 <div class="col-xs-3">
                   <i class="fa fa-bank fa-5x"></i>
                 </div>
                 <div class="col-xs-9 text-right">
                   <div class="huge">수입/지출 처리</div>
                 </div>
               </div>
            </div>
            <a href="/Project/company/pages/department/accounting_c.do">
              <div class="panel-footer">
                <span class="pull-left">업무 처리</span>
                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                <div class="clearfix"></div>
              </div>
            </a>
	        </div>
		    </div>
		    </c:if>
		    <button type="button" id="btn-custom-small" class="btn btn-outline btn-default" onclick="location.href='/Project/company/pages/department/temp_start.htm';" style="width:2px"></button>
			</div>
			<!-- /.row -->
     </div>
     <!-- /#page-wrapper -->
   </div>
   <!-- /#wrapper -->

</body>

</html>
