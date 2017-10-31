<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>직급 관련 게시판</title>

<%@ include file="/company/inc/asset_css.jsp"%>
<%@ include file="/company/inc/asset_js.jsp"%>
<link href="/Project/company/dist/css/department.css" rel="stylesheet">

<style type="text/css">
body, h1, th, td, p, div, span, text, tspan {
		font-family: 빙그레체;
		color: #444;
	}
	#main {
		width: 750px;
		margin: 0px auto;
	}
	#container {
		width: 750px;
	}
	h1, th {
		color: #555;
	}
	#tbl {
		border: 1px solid gray;
		border-collapse: collapse;
		width: 750px;
		margin-top: 30px;
	}
	#tbl th, #tbl td {
		border: 1px solid gray;
		padding: 7px;
		text-align: center;
	}
	
	#tbl tr:nth-child(odd) { background-color: #eee; }
	#tbl tr:nth-child(1) { background-color: #ddd; }
	#btnList {text-align : right;}
</style>
<script language="javascript">
<script src="/Project/company/pages/position/schedule/chart/js/jquery-1.12.4.js"></script>
<script src="/Project/company/pages/position/schedule/chart/js/highcharts.js"></script>



  </script>
</head>

<body>

	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<!-- uppderHeader -->
			<%@ include file="/company/inc/upperHeader.jsp"%>
			<%@ include file="/company/inc/leftHeader.jsp"%>
		</nav>

		<div id="page-wrapper">
			

<div id="main">
		<h1>Schedule Chart</h1>
		<div id="container"></div>
		<table id="tbl">
			<tr>
				<th>Category name</th>
			<c:forEach items="${list.get(0).data}" var="subdto">
				<th>${subdto.year}년</th>
			</c:forEach>
				
			</tr>
			
			<c:forEach items="${list}" var="dto"><!-- ChartDTO -->
			<tr>
				<th>${dto.name}</th>
				<c:forEach items="${dto.data}" var="subdto">
				<td>${subdto.count}</td>
				</c:forEach>
			</tr>
			</c:forEach>
			
		</table>
	</div>
	
	
				<div id="btnList">
				<br><br>

					<input type="button" value="돌아가기" class="btn btn-info"
						onclick="history.back();">
				</div>
			

			
	
	
	<script>
	Highcharts.chart('container', {

	    title: {
	        text: '카테고리별 스케줄, 2010-2018'
	    },


	    yAxis: {
	        title: {
	            text: '년도별 카테고리 총 합'
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
	        name: '${dto.name}',
	        data: [
	        
	        	
	        	<c:forEach items="${dto.data}" var="subdto" varStatus="substatus">
	        	
	        	${subdto.count}
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
	    	/* {
		        name: 'AAA',
		        data: [
		        
		        	
		        	0,0,0,0,0,0,0,
		        	
		        	6
		        	
		        	,
		        	
		        	
		        	
		        	1
		        	
		        	
		        ]
		  		} */

	    ]

	});	
	
	// var list = [100, 200, 300];
	// var list = [100, 200, 300, ];
	</script>
			
			
		</div>
		
	</div>
	<!-- /#wrapper -->

</body>

</html>
