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
.normal a {
	color: black;
	text-decoration: none;
}

.saturday a {
	color: blue;
	text-decoration: none;
}

.sunday a {
	color: red;
	text-decoration: none;
}

.header {
	background-color: #FAED7D;
/* 	background-color: #c8ffc8; */
	width: 400px;
}

.today {
	border: solid 2px #FFA500;
	font-weight: bold;
	color: #EA0000;
}

.saturday {
	background-color: #FFFFFF;
	color: #0000FF;
}

.sunday {
	background-color: #FFFFFF;
	color: #FF0000;
}

.normal {
	background-color: #FFFFFF;
}

.otherMonth {
	background-color: #EAEAEA;
	/* 다른달 날짜(0)이면 색을 바꾸 */
}

#currentMonth {
	background-color: #FFFFFF;
	font-size: 14pt;
	text-align: center;
}

#prevMonth {
	background-color: #FFFFFF;
	font-size: 10pt;
	text-align: center;
}

#nextMonth {
	background-color: #FFFFFF;
	font-size: 10pt;
	text-align: center;
}

#calendarTable {
	height: 600px;
}

#calendarTable td {
		border: solid 1px #eee;
		
}
#calendarTable tbody tr:nth-child(1) td:nth-child(1){
	border-right : 0px;
}
#calendarTable tbody tr:nth-child(1) td:nth-child(2){
	border-left : 0px;
	border-right : 0px;
}
#calendarTable tbody tr:nth-child(1) td:nth-child(3){
	border-left : 0px;
}
</style>
<script language="javascript">
$(document).ready(function(){
	buildCalendar();
})
   var today = new Date();
   
   function buildCalendar() {
    var tempDate = new Date(today.getFullYear(), today.getMonth(), 1);//가져온 년,월,일
    var objCalendar = document.getElementById("calendarTable");//캘린터 테이블을 objCalendar에?
    var objCurrentMonthCell = document.getElementById("currentMonth");//이번달을 나타내는 셀에..
    var objDayArray = new Array();	//배열로...날짜를 정렬함
    
    objCurrentMonthCell.innerHTML = tempDate.getFullYear() + "년 " + (tempDate.getMonth() + 1) + "월";
    //이번달 셀에 현재 년 + 달 + 일을 가져옴.
    
    while (objCalendar.rows.length > 2) {
     objCalendar.deleteRow(objCalendar.rows.length - 1);
    }//달력이 쌓이지 않도록 지워주는 역할
    
    var weekDay = tempDate.getDay();//첫날
    var lastDay = getLastDay(tempDate);//마지막날
    
    for (i=0;i<weekDay;i++) {		//아직 달의 시작 전날은...0을 넣는다.
     objDayArray.push(0);
    }
    
    for (var i=1;i<=lastDay;i++) {	//달이 시작하고나면 i를 넣는다. 마지막날 까지.
     objDayArray.push(i);
    }
    
    tempDate.setDate(lastDay);
    weekDay = tempDate.getDay();
    for (i=weekDay;i<6;i++) {	//마지막날이 끝나고 0을 넣는다. 회색공백칸
     objDayArray.push(0);
    }
    
    var row = null;
    for (var i=0;i<objDayArray.length;i++) {
     if (i % 7 == 0) {		//7로 나누어 떨어지면
      row = objCalendar.insertRow();	//한줄을 더 넣는다.
     }
     
     
     var cell = row.insertCell();//objCalendar.insertRow.insertCell
     
     if (objDayArray[i] > 0) {
      tempDate.setDate(objDayArray[i]);	//정의된 날짜를 담아줌.
      
      
      var dtemp = tempDate.getFullYear() + "-" + getNum(tempDate.getMonth() + 1) + "-" + getNum(objDayArray[i]);
      					// 현재 페이지의 년 -월 -일 을 dtemp에 담습니다.
 
      					
      					
      cell.innerHTML = "<a class='date' href='/Project/company/pages/position/sadd.do?dtemp=" + dtemp + "'>" + objDayArray[i] +"</a>";	//cell 안에 날짜를 적어넣는다. 날짜를 누르면 등록하기로 이동할 수 있다.
      
      
      
      //cell.innerHTML += "<br>" + tempDate.getFullYear() + getNum(tempDate.getMonth() + 1) + getNum(objDayArray[i]);
     
   	  //Project/company/sdfsdf?seq=1
   			  
      <c:forEach items="${list}" var="dto">
    	//DB에 있는 데이터중 시작일이 해당 날짜와 같은것을 찾으면, 날짜 옆에 데이터의 제목을 띄웁니다.
      	if ("${dto.startDate}" == dtemp) {		
      		cell.innerHTML += 
      		"<div><a href='/Project/company/pages/position/sview.do?dtemp=" 
      				+ dtemp + "'>${dto.subject}<a></div>";
      	}
      </c:forEach>
      
     //cell.innerHTML += dtemp;
     cell.align = "left margin:10px auto";
      
    
      
      
      
      if (i % 7 == 0) {
       cell.className = "sunday";
      }
      else if (i % 7 == 6) {
       cell.className = "saturday";
      }
      else {
       cell.className = "normal";
      }
     }//if
     else {	//다른달이면
      cell.className = "otherMonth";
     }
     
     var now = new Date();
     if (tempDate.toDateString() == now.toDateString()) {
      cell.className += " today";
     }
    }
    
    $("a.date").on("click", function(){
		
	})
   }
   
   function getLastDay(objDate) {
    var year = objDate.getFullYear();
    var month = objDate.getMonth() + 1;
    var day = 0;
    
    switch (month) {	//달마다 끝 날짜를 지정해줌.
     case 1:
     case 3:
     case 5:
     case 7:
     case 8:
     case 10:
     case 12:
      day = 31;
      break;
     case 4:
     case 6:
     case 9:
     case 11:
      day = 30;
      break;
     case 2:             //윤년 계산
      if ((year % 4 == 0) &&
       (year % 100 == 0) &&
       (year % 400 == 0)) {
       day = 29;
      }
      else {
       day = 28;
      }
      break;
    }
    return day;
   }
   
   function gotoPrevMonth() {
    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    buildCalendar();
   }
   
   function gotoNextMonth() {
    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    buildCalendar();
   }
   
   

	
	
	function getNum(n) {
		if (n <10)
			return "0" + n;
		else
			return "" + n;
	}

   
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
			일정관리 게시판입니다.
				<table border="0" cellpadding="5" cellspacing="1" id="calendarTable"
					bgcolor="#404000" style="width: 800px; margin: 20px auto;">
					<tr>
						<td id="prevMonth"><a href="javascript:gotoPrevMonth()">&lt;</a></td>
						<td colspan="5" id="currentMonth"></td>
						<td id="nextMonth"><a href="javascript:gotoNextMonth()">&gt;</a></td>
					</tr>
					<tr>
						<td align="center" class="header">일</td>
						<td align="center" class="header">월</td>
						<td align="center" class="header">화</td>
						<td align="center" class="header">수</td>
						<td align="center" class="header">목</td>
						<td align="center" class="header">금</td>
						<td align="center" class="header">토</td>
					</tr>
				</table>

				<div id="btnList">

					<input type="button" value="돌아가기" class="btn btn-info"
						onclick="history.back();">
				</div>


			
		</div>
		




		<%-- 		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header"></h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 개발부 프로젝트 현황
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<!-- 실제 사용시에는 복붙해서 가져오기 -->
							<%@ include file="/company/pages/department/templates/ref_project_gantt.jsp" %>
							<!-- <div id="morris-area-chart"></div> -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			<!-- /.panel -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 다른 프로젝트 목록
						</div>
						<div class="panel-body">
							<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th>현황</th>
										<th>주제</th>
										<th>시작일</th>
										<th>종료일</th>
										<th>작성자</th>
									</tr>
								</thead>
								<tbody>
									 <c:forEach items="" var="">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									 </c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
							<form action="">
								<div class="form-group input-group">
									<input type="text" class="form-control">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
									</span>
								</div>
							</form>
							<div id="btns">
								<button type="button" class="btn btn-outline btn-default">목록갱신</button>
								<!-- if, 부장일때만 -->
								<button type="button" class="btn btn-outline btn-primary">새 프로젝트</button>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- row -->
		</div> --%>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

</body>

</html>
