<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
<link href="/Project/company/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/Project/company/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/Project/company/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="/Project/company/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- jQuery -->
	<script src="/Project/company/vendor/jquery/jquery.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.col-lg-12 {
	
}

.col-lg-12 .page-header {
	float: left;
	width: 33.3%;
	text-align: center;
	font-size: 18px;
	font-weight: 100;
}

.page-header a {
	color: #444;
	text-decoration: none;
}

.v-header {
	margin-top: 15px;
	padding-left: 60px;
	padding-right: 60px;
}

.v-profile {
	width: 15%;
	float: left;
	padding-left: 15px;
}

.v-profile img {
	border: 1px solid #c5c5c5;
	border-radius: 50%;
	outline: none;
}

.v-writer {
	width: 80%;
	float: left;
	padding-left: 30px;
	font-size: 14px;
}

.v-writer:after {
	clear: both;
}

.v-writer div {
	line-height: 1.5em;
	margin-top: 8px;
	font-size: 16px;
	margin-bottom: 8px;
}

.v-writer span {
	font-size: 16px;
	line-height: 1.5em;
	color: #868686;
}

.v-writer #clubname {
	margin-left: 30px;
	font-size: 16px;
	font-weight: 400;
	color: #868686;
	line-height: 1.33em;
	word-spacing: -10;
}

.v-body {
	margin-top: 25px;
	padding-left: 60px;
	padding-right: 60px;
}

.v-title {
	font-size: 25px;
	line-height: 36px;
	font-weight: 100;
	color: #333;
	margin-bottom: 25px;
}

.v-content {
	line-height: 1.33;
	margin-bottom: 1em;
	min-height: 30px;
	overflow-x: auto;
	font-size: 14px;
}

.v-regdate {
	font-weight: 400;
	margin: 0 0 21px;
	font-size: 14px;
	line-height: 24px;
	color: #999;
}

.v-btn {
	text-align: center;
	margin-top: 15px;
}

.v-btn .btn-default:hover {
	border-color: #c5c5c5;
	background-color: #eee;
}

.v-btn .btn-primary {
	border-color: #c5c5c5;
	background-color: #666;
	color: #fff;
}

.v-btn .btn-primary:hover {
	border-color: #c5c5c5;
	background-color: #c5c5c5;
}

.wrap {
	padding: 0px 30px;
}

.v-detail{
	float:left;
	height:60px;
	overflow:hidden;
}
.v-detail > div:first-child{
	margin-bottom:10px;	
}
.v-detail:after{
	content:"";
}
.v-content > div:nth-child(1){
	width:10%;
	padding-top:5px;
}
.v-content > div:nth-child(2){
	width:90%;
	padding-left:16px;
	padding-right:16px;
}

</style>
<script>
	$(document).ready(function(){
		if($("#checkitem").val()=="0"){
			$("#votego").attr("class","btn btn-primary disabled");
			$("#votego").prop("disabled",true);
		}
		
		$(".v-content button").click(function(){
			
			////중복 X
			if($(this).attr("title")=="unchecked"){ //하나선택하기
				$.emptyButton();
				
				$(this).attr('class','btn btn-warning btn-circle btn-lg');
				$(this).html("<i class='fa fa-check'></i>");
				$(this).attr('title','checked');
				$("#checkitem").val($(this).val());
				$("#votego").attr("class","btn btn-primary");
				$("#votego").prop("disabled",false);
				
				
			}else{ //모두선택취소해버리기
				$(this).attr("title","unchecked");
				$(this).attr('class',"btn btn-default btn-circle btn-lg");
				$(this).empty();	
				$("#checkitem").val("0");
				$("#votego").attr("class","btn btn-primary disabled");
				$("#votego").prop("disabled",true);
			}
			
		});
		
	
	});
	$.emptyButton = function(){
		$(".v-content button").attr("title","unchecked");
		$(".v-content button").attr('class',"btn btn-default btn-circle btn-lg");
		$(".v-content button").empty();	
	};
	
			
</script>
</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">

			<!-- upperHeader -->
			<%@ include file="/company/inc/upperHeader.jsp"%>
			<!-- leftHeader -->
			<%@ include file="/company/inc/leftHeader.jsp"%>


		</nav>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-header">
							<a href="/Project/club/myclubboard.do?clubseq=${clubseq}">게시판</a>
						</div>
						<div class="page-header">
							<a href="/Project/club/myclubvote.do?clubseq=${clubseq}">투표</a>
						</div>
						<div class="page-header">
							<a href="/Project/club/myclubschedule.do?clubseq=${clubseq}">일정</a>
						</div>
					</div>	
					<!-- /.col-lg-12 -->
				</div>

				<!-- vote-row -->
				<div class="wrap">
					<div class="v-header row">

						<div class="v-profile">
							<img src="/Project/company/images/empimg.png">
						</div>
						<div class="v-writer">
							<div>${dto.writer }</div>


							<span>${dto.writervo.department} · ${dto.writervo.position}</span> <span id="clubname"
								class="glyphicon glyphicon-asterisk" aria-hidden="true">
								축구왕 슛돌이</span>
						</div>

					</div>

					<div class="v-body row">
						<div class="v-title">Q. ${dto.title}</div>
						<div class="v-regdate">${dto.endDate } 마감</div>
						<c:forEach items="${dto.items}" var="item">
						<div class="v-content">
							<div class="v-detail"><button type="button" class="btn btn-default btn-circle btn-lg" title="unchecked" value="${item.seq}"></button></div>
							<div class="v-detail">	
								<div>${item.content } <span style="padding-left:10px;" class="glyphicon glyphicon-user" aria-hidden="true"></span> ${item.voteCount}</div>
								<div class="progress">
								<div class="progress-bar progress-bar-warning"
										role="progressbar" aria-valuenow="${item.voteCount/(fn:length(dto.joiners))*100}" aria-valuemin="0"
									aria-valuemax="100" style="width: ${item.voteCount/(fn:length(dto.joiners))*100}%"></div>
								</div>
							</div>	
						</div>
						</c:forEach>
			

					</div>
					<!-- vbodyrow -->
					<form action="/Project/club/voteok.do" method="post">
					<div class="v-btn" class="row">
					
						<input type="submit" id="votego" name="votego"
							value="투표하기" class="btn btn-primary">
						<c:if test="${dto.writerSeq==empSeq}">
						<input type="submit" value="투표종료" class="btn btn-primary"
							onclick="">
						</c:if>
						<input type="button" value="돌아가기" class="btn btn-default"
							onclick="history.back();"> 
						<input type="hidden" name="checkitem" id="checkitem" value="0">
						<input type="hidden" name="clubseq" id="clubseq" value="${clubseq}">
					</div>
					</form>
				</div>

			</div>


		</div>
		<!-- wrap -->
	</div>
	<!-- /#page-wrapper -->
	

	<!-- /#wrapper -->

	
	<!-- Bootstrap Core JavaScript -->
	<script src="/Project/company/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/Project/company/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/Project/company/dist/js/sb-admin-2.js"></script>

</body>

</html>
