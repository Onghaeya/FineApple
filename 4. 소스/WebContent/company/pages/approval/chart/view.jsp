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
<style>
   h1, th, td, p, div, span {
      /* font-family: 바탕체; */
      color: #444;
   }
   
   text {
      /* font-family: 굴림; */
   }
   
   tspan {
      font-family: 빙그레체;
   }
   #main {
      width: 750px;
      margin: 0px auto;
   }
   #container {
      width: 750px;
   }
   h1 {
      color: #555;
   }
   #tbl {
      font-family: 굴림;
      border-collapse: collapse;
      border: 1px solid gray;
      width: 750px;
      margin-top: 30px;
   }
   #tbl th, #tbl td {
      border: 1px solid gray;
      padding: 7px;
      text-align: center;
   }
   
   
   #tbl tr:nth-child(1) { background-color: #ddd; }
   #tbl th:first-child { background-color: #eee; }
   
   #tbl {
      /* border-radius: 7px; */
      border: 0px;
   }
   #tbl tr:nth-child(1) th {
/*       border-top-left-radius: 7px;
      border-top-right-radius: 7px; */
   }
   #tbl tr:last-child th {
      /* border-bottom-left-radius: 7px; */
   }
   #tbl tr:last-child td:last-child {
      /* border-bottom-right-radius: 7px; */
   }
   
</style>
<script src="/Project/company/pages/approval/chart/js/jquery-1.12.4.js"></script>
<script src="/Project/company/pages/approval/chart/js/highcharts.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="/Project/company/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/Project/company/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/Project/company/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/Project/company/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">년도별 결재 카테고리 건수</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div id="main">
      <!-- <h1>년도별 결재 카테고리 건수</h1> -->
      <div id="container"></div>
      <table width="100%" id="tbl" class="table table-striped table-bordered table-hover">
         <tr>
            <th>결재 카테고리</th>
            <c:forEach items="${list.get(0).data}" var="subdto">
            <th>${subdto.year}년</th>
            </c:forEach>
         </tr>
         
         <c:forEach items="${list}" var="dto"><!-- ChartDTO -->
         <tr>
            <th>${dto.approvalcategoryname}</th>
            <c:forEach items="${dto.data}" var="subdto">
            <td 
            <c:if test="${subdto.num >= 10000}">style='background-color:cornflowerblue;color:white;border:0px;border-radius:7px;'</c:if>
            <c:if test="${subdto.num <= 1}">style='background-color:tomato;color:white;border:0px;border-radius:7px;'</c:if>
            >${subdto.num}</td>
            </c:forEach>
         </tr>
         </c:forEach>
         
      </table>
   </div>
   			<script>
   Highcharts.chart('container', {

        title: {
           text: '년도별 결재 카테고리 누적 량, 2010-2014'
       }, 


       yAxis: {
           title: {
               text: '년도별 결재 건수(합)'
           }
       },
       
       legend: {
           layout: 'vertical',
           align: 'right',
           verticalAlign: 'middle'
       },

       plotOptions: {
           series: {
               pointStart: 2010
           }
       },

       series: [
          <c:forEach items="${list}" var="dto" varStatus="status">
          {
           name: '${dto.approvalcategoryname}',
           data: [
              <c:forEach items="${dto.data}" var="subdto" varStatus="substatus">
              ${subdto.num}
              <c:if test="${dto.data.size() > substatus.count}">
              ,
              </c:if>
              </c:forEach>
           ]
           }
          <c:if test="${list.size() > status.count}">
          ,
          </c:if>
          </c:forEach>
       ],
       selection: function(event) {
          alert("aa");
       }

   });
   
   // var list = [100, 200, 300];
   // var list = [100, 200, 300, ];
   </script>
   
   			
                    
                          
                    
                    
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/Project/company/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/Project/company/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/Project/company/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/Project/company/dist/js/sb-admin-2.js"></script>

</body>

</html>
