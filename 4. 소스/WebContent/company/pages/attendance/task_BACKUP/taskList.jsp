<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<%@ include file="/company/pages/attendance/inc/asset.jsp" %>
	
    <title>SB Admin 2 - Bootstrap Admin Theme</title>

</head>

<style>
	/* 금주 근태현황 그래프 중복 방지 */
	#morris-bar-chart > svg:nth-child(1) {display: none;}
	
	/* 기타 유형관리 */
	#table-main {
		padding-left:0px; /* 유형별 근태구성과 거리 좁힘. -> 셀 넓이 확보 */
	}	
	#table-main > div > div.panel-body > div > table > tbody td:nth-child(1) {
		text-align: center; /* 기타 근태현황의 유형들을 텍스트중앙정렬 */
	}
	#table-main > div > div.panel-body > div > table > tbody td:nth-child(2) {
		text-align: right; /* 값들을 텍스트우측정렬 */
	}
	
	



</style>
<body>

    <div id="wrapper">
       	<%@ include file="/company/pages/attendance/inc/navigation.jsp" %>
        <div id="page-wrapper">
		<div class="container-fluid">
			

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style="text-align: center;">${department} ${position}, ${name}</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
	            <!-- display:none -->
                <div class="col-lg-6" style="display:none;"><div class="panel panel-default"><div class="panel-heading">Area Chart Example</div><!-- /.panel-heading --><div class="panel-body"><div id="morris-area-chart"></div></div><!-- /.panel-body --></div><!-- /.panel --></div><!-- /.col-lg-6 -->
                  </div>
            <!-- /.row -->
                
            <!------------------------------------------------------------------- 금주 근태현황 차트  ------------------------------------------------------------->
            <div class="row">
				  <div class="col-lg-6">
				      <div class="panel panel-default">
				          <div class="panel-heading" style="text-align: center;">금주 근태현황</div>
				          <!-- /.panel-heading -->
				          <div class="panel-body" style="padding: 0px;">
				              <div id="morris-bar-chart" style="position: relative; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
				                  <svg height="342" version="1.1" width="887" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative;">
				                      <desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc>
				                      <defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
				                      <text x="32.71875" y="305" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
				                          <tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan>
				                      </text>
				                      <path fill="none" stroke="#aaaaaa" d="M45.21875,305H862" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
				                      <text x="32.71875" y="235" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
				                          <tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">3</tspan>
				                      </text>
				                      <path fill="none" stroke="#aaaaaa" d="M45.21875,235H862" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
				                      <text x="32.71875" y="165" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
				                          <tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">6</tspan>
				                      </text>
				                      <path fill="none" stroke="#aaaaaa" d="M45.21875,165H862" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
				                      <text x="32.71875" y="95" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
				                          <tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">9</tspan>
				                      </text>
				                      <path fill="none" stroke="#aaaaaa" d="M45.21875,95H862" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
				                      <text x="32.71875" y="25" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
				                          <tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">12</tspan>
				                      </text>
				                      <path fill="none" stroke="#aaaaaa" d="M45.21875,25H862" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
				                      <text x="803.6584821428571" y="317.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
				                          <tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">09-30</tspan>
				                      </text>
				                      <text x="686.9754464285714" y="317.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
				                          <tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">09-29</tspan>
				                      </text>
				                      <text x="570.2924107142857" y="317.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
				                          <tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">09-28</tspan>
				                      </text>
				                      <text x="453.609375" y="317.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
				                          <tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">09-27</tspan>
				                      </text>
				                      <text x="336.9263392857143" y="317.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
				                          <tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">09-26</tspan>
				                      </text>
				                      <text x="220.24330357142858" y="317.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
				                          <tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">09-25</tspan>
				                      </text>
				                      <text x="103.56026785714286" y="317.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
				                          <tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">09-24</tspan>
				                      </text>
				                      <!-- 일요일 -->
				                      <rect x="59.804129464285715" y="305" width="42.25613839285714" height="0" rx="0" ry="0" fill="#5CB85C" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <rect x="105.06026785714286" y="305" width="42.25613839285714" height="0" rx="0" ry="0" fill="#F0AD4E" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <!-- 일요일 -->
				                      <!-- 월요일 -->
				                      <rect x="176.48716517857144" y="87" width="42.25613839285714" height="218" rx="0" ry="0" fill="#5CB85C" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <rect x="221.74330357142858" y="105" width="42.25613839285714" height="200" rx="0" ry="0" fill="#F0AD4E" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <!-- /월요일 -->
				                      <!-- 화요일 -->
				                      <rect x="293.17020089285717" y="180" width="42.25613839285714" height="125" rx="0" ry="0" fill="#5CB85C" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <rect x="338.42633928571433" y="193" width="42.25613839285714" height="112" rx="0" ry="0" fill="#F0AD4E" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <!-- /화요일 -->
				                      <!-- 수요일 -->
				                      <rect x="409.85323660714283" y="95" width="42.25613839285714" height="210" rx="0" ry="0" fill="#5CB85C" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <rect x="455.109375" y="133" width="42.25613839285714" height="172" rx="0" ry="0" fill="#F0AD4E" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <!-- /수요일 -->
				                      <!-- 목요일 -->
				                      <rect x="526.5362723214286" y="65" width="42.25613839285714" height="240" rx="0" ry="0" fill="#5CB85C" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <rect x="571.7924107142857" y="95" width="42.25613839285714" height="210" rx="0" ry="0" fill="#F0AD4E" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <!-- /목요일 -->
				                      <!-- 금요일 -->
				                      <rect x="643.2193080357142" y="170" width="42.25613839285714" height="135" rx="0" ry="0" fill="#5CB85C" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <rect x="688.4754464285713" y="190" width="42.25613839285714" height="115" rx="0" ry="0" fill="#F0AD4E" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <!-- /금요일 -->
				                      <!-- 토요일 -->
				                      <rect x="759.9023437499999" y="305" width="42.25613839285714" height="0" rx="0" ry="0" fill="#5CB85C" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                      <rect x="805.158482142857" y="305" width="42.25613839285714" height="0" rx="0" ry="0" fill="#F0AD4E" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				                  </svg>
				                  <!-- /토요일 -->
				                  <div class="morris-hover morris-default-style" style="left: 747.518px; top: 135px; display: none;">
				                      <div class="morris-hover-row-label">09-30</div>
				                      <div class="morris-hover-point" style="color: #0b62a4">근무시간: 010
				                      </div>
				                      <div class="morris-hover-point" style="color: #7a92a3">업무 소요시간: 2265</div>
				                  </div>
				              </div>
				          </div>
				      </div>
				      <!-- /.panel -->
				  </div>
				  <!-- /.col-lg-6 -->
            </div>
            <!-- /.row --> 
            <!------------------------------------------------------------------- / 금주 근태현황 ------------------------------------------------------------->
            <!-- display:none -->
            <div class="col-lg-6" style="display:none;"><div class="panel panel-default"><div class="panel-heading">Line Chart Example</div><!-- /.panel-heading --><div class="panel-body"><div id="morris-line-chart"></div></div><!-- /.panel-body --></div><!-- /.panel --></div><!-- /.col-lg-6 --><div class="col-lg-6" style="display:none;"><div class="panel panel-default"><div class="panel-heading">Donut Chart Example</div><!-- /.panel-heading --><div class="panel-body"><div id="morris-donut-chart"></div></div><!-- /.panel-body --></div><!-- /.panel --></div><!-- /.col-lg-6 --><div class="col-lg-12" style="display:none;"><div class="panel panel-default"><div class="panel-heading">Morris.js Usage</div><!-- /.panel-heading --><div class="panel-body"><p>Morris.js is a jQuery based charting plugin created by Olly Smith. In SB Admin, we are using the most recent version of Morris.js which includes the resize function, which makes the charts fully responsive. The documentation for Morris.js is available on their website, <a target="_blank" href="http://morrisjs.github.io/morris.js/">http://morrisjs.github.io/morris.js/</a>.</p><a target="_blank" class="btn btn-default btn-lg btn-block" href="http://morrisjs.github.io/morris.js/">View Morris.js Documentation</a></div><!-- /.panel-body --></div><!-- /.panel --></div><!-- /.col-lg-6 -->
            
            <!-- 3개의 차트를 묶는 Row -->
            <div class="row">
            <table style="width:100%;">
            	<tr>
            	
  		            <!------------------------------------------------------------------- 유형별 근태구성  ------------------------------------------------------------->
	            	<td style="height:100px; vertical-align:top;">
						<div class="col-lg-6" id="chart-efficiency">
							<div class="panel panel-default">
								<div class="panel-heading" style="text-align: center;">
									유형별 근태구성
								</div>
								<!-- /.panel-heading -->
								<script src="/Project/company/pages/attendance/inc/highcharts.js"></script>
								<div id="container"
									style="padding-right: 15px; min-width: 310px; height: 400px; margin: 0 auto"></div>
								<script type="text/javascript">
                                       Highcharts.chart('container',
                                       {
                                           chart :
                                           {
                                               type : 'bar',
                                               width: 657
                                           },
                                           title :
                                           {
                                               text : ''
                                           },
                                           xAxis :
                                           {
                                               categories : [
                                                       '월요일', '화요일', '수요일',
                                                       '목요일', '금요일'
                                               ]
                                           },
                                           yAxis :
                                           {
                                               min : 0,
                                               title :
                                               {
                                                   text : ''
                                               }
                                           },
                                           legend :
                                           {
                                               reversed : true
                                           },
                                           plotOptions :
                                           {
                                               series :
                                               {
                                                   stacking : 'normal'
                                               }
                                           },
                                           series : [
                                                   {
                                                       name : '야근/특근',
                                                       data : [
                                                               0.2, 0, 0, 1.2, 0
                                                       ]
                                                   },
                                                   {
                                                       name : '지각/조퇴/외출',
                                                       data : [
                                                               0, 3.2, 0, 0, 0
                                                       ]
                                                   },
                                                   {
                                                       name : '평근/외근',
                                                       data : [
                                                               9, 5.8, 9, 9, 5.8
                                                       ]
                                                   }
                                           ]
                                       });
                                   </script>
							</div>
							<!-- /.panel -->
						</div> 
						<!-- /.col-lg-6 -->
					</td>
  		            <!------------------------------------------------------------------- / 유형별 근태구성  ------------------------------------------------------------->
	            	
  		            <!------------------------------------------------------------------- 기타 근태기록 ------------------------------------------------------------->
	            	<td style="vertical-align:top;">
	            		<div class="col-lg-6" id="table-main">
		                    <div class="panel panel-default">
		                        <div class="panel-heading"  style="text-align: center;">
		                            기타 근태기록
		                        </div>
		                        <!-- /.panel-heading -->
		                        <div class="panel-body" style="padding:0px;">
		                            <div class="table-responsive">
		                                <table class="table table-bordered table-hover" style="margin-bottom:0px;">
		                                    <tbody>
		                                       <tr>
			                                        <td>평근</td>
			                                        <td>182 / 21</td>
			                                    </tr>
			                                    
			                                    <tr>
			                                        <td>야근</td>
			                                        <td>13 / 5</td>
			                                    </tr>
			                                    <tr>
			                                        <td>외근</td>
			                                        <td>0 / 0</td>
			                                    </tr>
			                                    
			                                    <tr>
			                                        <td>특근</td>
			                                        <td>7.4 / 1</td>
			                                    </tr>
			                                    <tr>
			                                        <td>연차</td>
			                                        <td>13 / 1</td>
			                                    </tr>
			                                    
			                                    <tr>
			                                        <td>교육</td>
			                                        <td>12</td>
			                                    </tr>
		                                    </tbody>
		                                </table>
		                            </div>
		                            <!-- /.table-responsive -->
		                        </div>
		                        <!-- /.panel-body -->
		                    </div>
		                    <!-- /.panel -->
		                </div>
		                <!-- /.col-lg-6 -->
		            	
	            	</td>
  		            <!------------------------------------------------------------------- / 기타 근태기록  ------------------------------------------------------------->
            	</tr>
            	<tr>
  		            <!------------------------------------------------------------------- 시각별 업무효율도  ------------------------------------------------------------->
            		<td colspan="2" style="width:75%">
	            	
	            		<!-- 시간별 업무 효율성 차트 -->
		            	<div class="col-lg-6" id="chart-efficiency">
		                    <div class="panel panel-default">
		                        <div class="panel-heading"  style="text-align: center;">
		                            시간별 업무 효율도
		                        </div>
		                        <!-- /.panel-heading -->
		                        <div class="panel-body" style="padding:0px;">
		                            <div class="flot-chart">
		                                <div class="flot-chart-content" id="flot-line-chart-moving"></div>
		                            </div>
		                        </div>
		                        <!-- /.panel-body -->
		                    </div>
		                    <!-- /.panel -->
		                </div>
		                <!-- /.col-lg-6 -->
                
	            	</td>
  		            <!------------------------------------------------------------------- / 시각별 업무효율도  ------------------------------------------------------------->
            	</tr>
            </table>
            
            
            
            
            </div>
            

            
        </div>
        <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

	<%@ include file="/company/pages/attendance/inc/closing.jsp" %>

</body>

<script>



</script>

</html>


















