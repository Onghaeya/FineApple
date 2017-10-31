
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>

		<style type="text/css">

		</style>
	</head>
	<body>
	<script src="/Project/company/pages/attendance/inc/highcharts.js"></script>
						<script src="/Project/company/pages/attendance/inc/exporting.js"></script>
						
						<div class="panel panel-default">
	                        <div class="panel-heading" style="text-align: center;">
	                            유형별 근태구성
	                        </div>
	                        <!-- /.panel-heading -->
                        	<div class="panel-body">
                            	<div class="flot-chart">
									<div id="container" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>
								</div>
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
						
						<script type="text/javascript">
						
						Highcharts.chart('container', {
						    chart: {
						        type: 'bar',
						        width: 500
						    },
						    title: {
						        text: ''
						    },
						    xAxis: {
						        categories: ['월요일', '화요일', '수요일', '목요일', '금요일']
						    },
						    yAxis: {
						        min: 0,
						        title: {
						            text: ''
						        }
						    },
						    legend: {
						        reversed: true
						    },
						    plotOptions: {
						        series: {
						            stacking: 'normal'
						        }
						    },
						    series: [{
						        name: '평근/외근',
						        data: [5, 3, 4, 7, 2]
						    }, {
						        name: '지각/조퇴/외출',
						        data: [0, 1, 3, 2, 1]
						    }, {
						        name: '야근/특근',
						        data: [3, 4, 4, 2, 5]
						    }]
						});
						</script>	

	</body>
</html>
