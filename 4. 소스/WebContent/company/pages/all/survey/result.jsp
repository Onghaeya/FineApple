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

    <title>SB Admin 2 - Bootstrap Admin Theme</title>
    
    

    <!-- Bootstrap Core CSS -->
    <link href="/Project/company/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/Project/company/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/Project/company/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/Project/company/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/Project/company/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- highChart -->
	<script src="/Project/company/dist/js/highcharts.js"></script>
	
	<!-- jQuery -->
    <script src="/Project/company/vendor/jquery/jquery.min.js"></script>
    
	<!-- Morris Charts JavaScript -->
    <script src="/Project/company/vendor/raphael/raphael.min.js"></script>
    <script src="/Project/company/vendor/morrisjs/morris.min.js"></script>
    <script src="/Project/company/data/morris-data.js"></script>
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
	#resultWrapper #panelWrapper {margin: 0 auto;} /* 이거 width 지정 안됨 */
	.submitName { text-align: center; width: 80px; background-color: #eee;}
	a:focus, a:hover { text-decoration: none; }
</style>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <!-- upperHeader -->    
            <%@ include file="/company/inc/upperHeader.jsp" %>
			<!-- leftHeader -->
        	<%@ include file="/company/inc/leftHeader.jsp" %>
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">설문조사</h1>
                    
                    <div id="resultWrapper">
                    
						<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						
						<div class="panel panel-default">
	                           <div class="panel-heading">
	                               <h4 class="panel-title">
	                                   <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">0. 전체 통계</a>
	                               </h4>
	                           </div>
	                           <div id="collapseOne" class="panel-collapse collapse in">
	                               <div class="panel-body">
									<div id="timeChart" style="min-width: 310px; height: 400px; margin: 0 auto"></div><!-- 통계 차트 -->
	                               </div>
	                           </div>
	                       </div>
						
							<c:forEach items="${sqList}" var="sqdto"> <!-- 아코디언 하나 -->
							<c:if test="${sqdto.answerTypeSeq == '1' or sqdto.answerTypeSeq == '2'}">
							<div class="panel panel-default">
							  <div class="panel-heading" role="tab" id="headingOne">
							    <h4 class="panel-title">
							      <a data-toggle="collapse" data-parent="#accordion" href="#collapse${sqdto.seq}" aria-expanded="true" aria-controls="collapsechart${sqdto.seq}">
							        ${sqdto.questionNumber}. ${sqdto.question}
							      </a>
							    </h4>
							  </div>
							  <div id="collapse${sqdto.seq}" class="panel-collapse collapsing" role="tabpanel" aria-labelledby="headingOne">
							    <div class="panel-body">
								     <table class="table shortDescript">
										<c:forEach items="${sqdto.saList}" var="sadto">
										<tr>
											<!-- 익명이라면 -->
											<c:if test="${dto.anonymity == 'y'}">
											<th class="submitName">익명</th>
											</c:if>
											<c:if test="${dto.anonymity == 'n'}">
											<th>${sadto.name}</th>
											</c:if>
											
											<td>${sadto.descriptiveAnswer}</td>
										</tr>
										</c:forEach>
									</table>
								    </div>
								  </div>
								</div>
		
							</c:if>
							<!-- 선택형이 ㄴ경우(그래프) -->
							<c:if test="${sqdto.answerTypeSeq == '4' or sqdto.answerTypeSeq == '3'}"> 
							<div class="panel panel-default">
							  <div class="panel-heading" role="tab" id="headingOne">
							    <h4 class="panel-title">
							      <a data-toggle="collapse" data-parent="#accordion" href="#collapse${sqdto.seq}" aria-expanded="true" aria-controls="collapsechart${sqdto.seq}">
							        ${sqdto.questionNumber}. ${sqdto.question}
							      </a>
							    </h4>
							  </div>
							  <div id="collapse${sqdto.seq}" class="panel-collapse collapsing" role="tabpanel" aria-labelledby="headingOne">
							    <div class="panel-body">
							      <div id="chart${sqdto.seq}"></div>
							    </div>
							  </div>
							</div>
							</c:if> 
							<!-- 선택형  -->
							
							</c:forEach>
							<script>
								<c:forEach items="${sqList}" var="sqdto">
								<c:if test="${sqdto.answerTypeSeq == '3'}"> //단일 선택
								Morris.Donut({
									  element: 'chart${sqdto.seq}',
									  data: [
										<c:forEach items="${sqdto.smcList}" var="smcdto" varStatus="status">
									    {value: '${smcdto.count / sqdto.totalAnswerCount * 100}', label: '${smcdto.answer}'}
									    <c:if test="${sqdto.smcList.size() > status.count}">
										,
										</c:if>
									    </c:forEach>

									  ],
									  
									  labelColor: '#21CFBF',
									  colors: [
									    '#E67A77',
									    '#79D2D0',
									    '#95D7BB',
									    '#D8DD81'
									  ],
									  formatter: function (x) { return x + "%"}
									});
								
								</c:if>
								
								<c:if test="${sqdto.answerTypeSeq == '4'}"> //복수 선택 */
								Morris.Bar({
								  element: 'chart${sqdto.seq}',
								  data:[
									<c:forEach items="${sqdto.smcList}" var="smcdto" varStatus="status">
									
								    {x: '${smcdto.answer}', a: '${smcdto.count / sqdto.totalAnswerCount * 100}'}
								    
								 	<c:if test="${sqdto.smcList.size() > status.count}">
									,
									</c:if>
								    </c:forEach>
								  ],
								  xkey: 'x',
								  ykeys: [
									  'a'
								  	<c:if test="${sqdto.smcList.size() > status.count}">
									,
									</c:if>
									],
								  labels: ['${smcdto.count}'],
								  barColors: function(row, series, type) {
									  if (row.x % 5 == 0)
										  return '#6987A0';
									  else if(row.x % 5 == 1)
										  return '#A0C4E0';
									  else if (row.x % 5 == 2)
								    	return '#C3E3EF';
									  else if (row.x % 5 == 3)
										  return '#ECC7AF';
									  else if (row.x % 5 == 4)
										  return '#F6CEA8';	
									},
									gridTextSize: '12',
									ymax: 100,
									formatter: function (x) { return x + "%"}
								});				
								</c:if>
								
								</c:forEach>
							</script>
							<script>
							
							
							Highcharts.chart('timeChart', {
							    chart: {
							        type: 'line'
							    },
							    title: {
							        text: '시간 별 응답자 수'
							    },
							    xAxis: {
							        categories: [
							        	<c:forEach items="${dto.stList}" var="stdto" varStatus="status">
							        	"${stdto.regDate}시"
							        	<c:if test="${dto.stList.size() >  status.count}">
							        	,
							        	</c:if>
							        	</c:forEach>
							        	]
							    },
							    yAxis: {
							        title: {
							            text: '누적 인원(명)',
						            	style: {
						                    fontSize:'14px'
						                }
							        },
							        labels: {
						                style: {
						                    fontSize:'13px'
						                }
						            }
							    },
							    plotOptions: {
							        line: {
							            dataLabels: {
							                enabled: true
							            },
							            enableMouseTracking: false
							        }
							    },
							    series: [{
							        name: '응답자 수',
							        data: [
							        	<c:set var="count" value="0" />
									    <c:forEach items="${dto.stList}" var="stdto" varStatus="status">
									    <c:set var="sum" value="${sum + stdto.count}" />
										${sum}
							        	<c:if test="${dto.stList.size() > status.count}">
										,
										</c:if>
							        	</c:forEach>
							        	]
							    }]
							});
							</script>
							
							

          			 	</div>
                    
                    </div>
                    <!-- /resultWrpper -->
                
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
           
             
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

	 

    <!-- Bootstrap Core JavaScript -->
    <script src="/Project/company/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/Project/company/vendor/metisMenu/metisMenu.min.js"></script>

    

    <!-- Custom Theme JavaScript -->
    <script src="/Project/company/dist/js/sb-admin-2.js"></script>
    
     
</body>

</html>
