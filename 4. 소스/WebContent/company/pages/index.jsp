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

	<title>Fine Apple</title>
	<jsp:include page="/company/inc/asset_css.jsp"></jsp:include>
</head>

<body>

<script>
	<% if (session.getAttribute("seq") != null) { %>
	<% System.out.println(session.getAttribute("seq")); %>
	<% System.out.println(session.getAttribute("name")); %>
	<% System.out.println(session.getAttribute("positionSeq")); %>
	<% System.out.println(session.getAttribute("departmentSeq")); %>
	<% } else { %>
	<% System.out.println("로그인 안 넘어옴"); %>
	<% } %>
</script>





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
                    <h1 class="page-header">Fine Apple Inc.</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
         <!-- /.row -->
         <div class="row">
            <div class="col-lg-3 col-md-6">
               <div class="panel panel-primary">
                  <div class="panel-heading">
                     <div class="row">
                        <div class="col-xs-3">
                               <i class="fa fa-comments fa-5x"></i>
                           </div>
                           <div class="col-xs-9 text-right">
                               <div class="huge">26</div>
                               <div>New Comments!</div>
                           </div>
                       </div>
                   </div>
                   <a href="#">
                       <div class="panel-footer">
                           <span class="pull-left">View Details</span>
                           <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                           <div class="clearfix"></div>
                       </div>
                   </a>
               </div>
             </div>
             <div class="col-lg-3 col-md-6">
                 <div class="panel panel-green">
                     <div class="panel-heading">
                         <div class="row">
                             <div class="col-xs-3">
                                 <i class="fa fa-tasks fa-5x"></i>
                             </div>
                             <div class="col-xs-9 text-right">
                                 <div class="huge">12</div>
                                 <div>New Tasks!</div>
                             </div>
                         </div>
                     </div>
                     <a href="#">
                         <div class="panel-footer">
                             <span class="pull-left">View Details</span>
                             <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                             <div class="clearfix"></div>
                         </div>
                     </a>
                 </div>
             </div>
             <div class="col-lg-3 col-md-6">
                 <div class="panel panel-yellow">
                     <div class="panel-heading">
                         <div class="row">
                             <div class="col-xs-3">
                                 <i class="fa fa-shopping-cart fa-5x"></i>
                             </div>
                             <div class="col-xs-9 text-right">
                                 <div class="huge">124</div>
                                 <div>New Orders!</div>
                             </div>
                         </div>
                     </div>
                     <a href="#">
                         <div class="panel-footer">
                             <span class="pull-left">View Details</span>
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
                                 <i class="fa fa-support fa-5x"></i>
                             </div>
                             <div class="col-xs-9 text-right">
                                 <div class="huge">13</div>
                                 <div>Support Tickets!</div>
                             </div>
                         </div>
                     </div>
                     <a href="#">
                         <div class="panel-footer">
                             <span class="pull-left">View Details</span>
                             <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                             <div class="clearfix"></div>
                         </div>
                     </a>
                 </div>
             </div>
         </div>
         <!-- /.row -->
         
         
         <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 2017년도 성장 그래프
                            <div class="pull-right">
                                <div class="btn-group">
 
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="yearlyChart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> 2017년 기업 목표
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="timeline">
                                <li>
                                    <div class="timeline-badge"><i class="fa fa-check"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">지속가능경영</h4>
                                            
                                        </div>
                                        <div class="timeline-body">
                                            <p>FineApple의 지속가능경영은 이윤과 주주가치 극대화를 통한 경제적 가치와 글로벌 시민사회의 일원으로서 Citizenship 강화에 따른 사회적 가치를 결합한 통합적 가치 창출을 목표로 합니다. FineApple의 핵심가치를 근간으로 사회에 기여하는 혁신적 제품과 서비스를 제공하는 가치 사슬을 통해 경제적 · 사회적 · 환경적 가치를 창출하며, 이 과정에서 FinApple이 사회에 미치는 재무적 · 비재무적 영향을 모니터링하여 긍정적인 영향을 극대화하고 부정적인 영향을 최소화 하고자 노력할 것입니다.</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-badge warning"><i class="fa fa-credit-card"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">사회공헌</h4>
                                        </div>
                                        <div class="timeline-body">
                                        <p>글로벌 사회 현안을 반영한 글로벌 사회공헌 프로그램을 발굴하여 FineApple의 기술 및 글로벌 네트워크, 우수한 인재를 활용하여 세상의 긍정적인 변화를 이끌어내고자 합니다.</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="timeline-badge danger"><i class="fa fa-bomb"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">경영철학 실현</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>FinApple은 사람과 사회를 생각하는 글로벌 일류기업을 추구합니다. ‘경영이념, 핵심가치, 경영원칙’의 가치체계를 경영의 나침반으로 삼고, 인재와 기술을 바탕으로 최고의 제품과 서비스를 창출하여 인류사회에 공헌하는 것을 궁극적인 목표로 삼고 있습니다. 이를 위해 FinApple이 지켜나갈 약속인 5가지 경영원칙을 세부원칙과 행동지침으로 구체화하여 FineApple 임직원이 지켜야 할 행동규범(Global Code of Conduct)으로 제정하였으며, 모든 임직원의 사고와 행동에 5가지 핵심가치를 내재화하여 FineApple의 지속적인 성장을 견인하고 미래 방향성을 제시하고자 합니다.</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                <div class="timeline-badge info"><i class="fa fa-save"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">고객 중시</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>경영의 출발점은 고객입니다. 항상 고객을 최우선으로 생각하며 소비자의 관점에서 판단하고 평가하는 능력이 필요합니다. 2017년에는 고객의 필요를 보다 적극적으로 분석하고 파악하여 보다 만족도 높은 기업으로 거듭나는 것을 목표로 합니다</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    
                                    
                                
                                <li>
                                    <div class="timeline-badge success"><i class="fa fa-graduation-cap"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">사람 중심의 기업문화</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>인재를 중시하고 키우는 기업문화를 지향합니다. '기업이 곧 사람'이라는 신념을 바탕으로 모든 사람이 각자 고유한 역량과 잠재력을 가진 우수한 인재이며 세상을 움직이는 원동력임을 믿습니다. 사원의 역량 강화를 위한 지원으로 사람이 먼저라는 기업의 목표를 지켜내겠습니다.</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
                
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

   <%@ include file="/company/inc/asset_js.jsp" %>
   <script>
      Morris.Area({
        element: 'yearlyChart',
        /* behaveLikeLine: true, */
        data: [
          {x: '1월', 매출액: 100, 사원수: 50},
          {x: '2월', 매출액: 90, 사원수: 55},
          {x: '3월', 매출액: 150, 사원수: 53},
          {x: '4월', 매출액: 120, 사원수: 53},
          {x: '5월', 매출액: 130, 사원수: 20},
          {x: '6월', 매출액: 134, 사원수: 60},
          {x: '7월', 매출액: 172, 사원수: 68},
          {x: '8월', 매출액: 132, 사원수: 69},
          {x: '9월', 매출액: 186, 사원수: 69}
        ],
        xkey: 'x',
        ykeys: ['매출액', '사원수'],
        labels: ['매출액', '사원수'],
        lineColors: ['#FE7676', '#7BCFF3']
      });
   </script>
</body>

</html>