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
<link href="/Project/company/dist/css/datepicker.css" rel="stylesheet">
<link href="/Project/company/dist/css/datepicker3.css" rel="stylesheet">
<link href="/Project/company/dist/css/jquery-ui.min.css"
	rel="stylesheet">
<!-- Custom Fonts -->
<link
	href="/Project/company/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="/Project/company/vendor/jquery/jquery.min.js"></script>
<script src="/Project/company/dist/js/bootstrap-datepicker.js"></script>
<script src="/Project/company/dist/js/bootstrap-datepicker.kr.js"></script>
<script src="/Project/company/dist/js/jquery-ui.min.js"></script>


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
	padding-bottom: 20px;
	margin: 0px 0 5px;
	border-bottom: 1px solid #eee;
	padding-top: 20px;
}

.page-header a {
	color: #444;
	text-decoration: none;
}

.vote {
	float: left;
}

.profile {
	width: 10%;
	height: 100%;
	padding: 10px 30px;
}

.profile img {
	border: 1px solid #c6c6c6;
	border-radius: 50%;
	width: 55px;
}

.word {
	width: 90%;
	height: 100%;
}

.detail {
	height: 50%;
	font-size: 1.1em;
	font-weight: 100;
}

.title {
	color: #444;
	padding: 14px 0px 0px;
}

.info {
	color: #c6c6c6;
	padding: 5px 0px 10px;
}

.info div {
	float: left;
}

.voterow {
	height: 82px;
	border-bottom: 1px solid #eee;
	/* width: 99%; */
	margin: 0px auto;
}

.detail div {
	margin: auto 20px;
}

.vote a {
	color: #333;
}

#vote-btns {
	padding: 20px 43%;
}

#vote-btns button {
	background-color: sandybrown;
	border-color: #fff;
}

#vote-btns button {
	background-color: #C78247;
	border-color: #fff;
}

@media ( min-width : 768px) {
	.modal-dialog {
		width: 400px;
		margin: 130px auto;
	}
}

.modal-body input[type=text] {
	border: 1px solid #ddd;
	height: 45px;
	padding-left: 15px;
	width: 100%;
	color: #333;
	background-color: #fff;
}

.mb-title {
	margin-bottom: 5px;
}

.mb-title div {
	padding: 7px 0px;
}

.mb-items {
	margin-bottom: 5px;
}

.mb-items div {
	padding: 7px 0px;
}

.mb-add {
	margin-bottom: 12px;
}
.mb-add a:focus{
	text-decoration: none;
}
.mb-add a:hover{
	text-decoration: none;
}
.mb-add a:active{
	text-decoration: none;
}
.mb-time>div {
	padding: 7px 0px;
	width:100%;
}

.mb-time input[type=text] {
	border: 1px solid #ddd;
	height: 45px;
	padding-left: 15px;
	margin-left: 10px;
	width: 80%;
	color: #ccc;
	background-color: #fff;
	width: 80%;
}
.mb-time button{
	width:34px;
}
</style>

<script type='text/javascript'>
	var index=0;
	$(document).ready(function() {
	
		$.datepicker.regional['ko'] = {closeText: '닫기',prevText: '이전달',nextText: '다음달',currentText: '오늘',monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],dayNames: ['일','월','화','수','목','금','토'],dayNamesShort: ['일','월','화','수','목','금','토'],dayNamesMin: ['일','월','화','수','목','금','토'],weekHeader: 'Wk',dateFormat: 'yy-mm-dd',firstDay: 0,isRTL: false,showMonthAfterYear: true,yearSuffix: ''};
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		$('#datePicker').datepicker({changeMonth: true,changeYear: true,showButtonPanel:false,yearRange: 'c-99:c+99'
			,constrainInput: true,maxDate: '+1y',beforeShowDay: noBefore	});
	
		
		$("#dateChoice").click(function(){
			
			if($(this).attr("title")=="unchecked"){
				$(this).attr('class','btn btn-info btn-sm');
				$(this).empty();
				$(this).html("<i class='fa fa-check'></i>");
				$(this).attr("title","checked")
				$('#datePicker').prop("disabled",false);
			}else{
				
				$('#dateChoice').attr('class','btn btn-default btn-sm');
				$('#dateChoice').empty();
				$('#dateChoice').html("&nbsp;&nbsp;");
				$('#dateChoice').attr("title","unchecked")
				$('#datePicker').prop("disabled",true);
			}
		});
		
		

	});
	function noBefore(date){
		if(date<=new Date()) return [false];
		return[true];
	}
	
	function addBtn(){
		index++;
		$(".mb-items").append('<div><input type="text" id="item'+index+'" name="item" placeholder="항목을 입력하세요"></div>');
	}</script>


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
				<c:forEach items="${list}" var="dto">
					<div class="row voterow">
						<div class="vote profile">
							<a href=""><img src="/Project/company/images/empimg.png"></a>
						</div>
						<div class="vote word">
							<div class="detail title">
								<div>
									<a
										href="/Project/club/voteview.do?clubseq=${clubseq}&seq=${dto.seq}">${dto.title}</a>
								</div>
							</div>
							<div class="detail info">
								<div>
									<span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>
								</div>
								<div>${dto.gap}${dto.dateText}</div>
								<div>${fn:length(dto.joiners)}참여</div>
								<div>${dto.processText}</div>
								<div>0 조회수</div>
								<div>게시자:${dto.writer}</div>
							</div>

						</div>
					</div>
				</c:forEach>
				<!-- voterow -->
				<div class="row">
					<div id="vote-btns">
						<button type="button" class="btn btn-primary" id="addbtn"
							name="addbtn" data-toggle="modal" data-target="#myModal">투표
							올리기</button>
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">투표 등록</h4>
							</div>
							<form method="post" action="/Project/club/voteaddok.do?clubseq=${clubseq}">
							<div class="modal-body">
							
								<div class="mb-title">
									<div>투표 제목</div>
									<div>
										<input type="text" id="title" name="title"
											placeholder="제목을 입력하세요">
									</div>
								</div>
								<div class="mb-items">
									<div>투표 항목</div>
									<div>
										<input type="text" id="item1" name="item"
											placeholder="항목을 입력하세요">
									</div>
									<div>
										<input type="text" id="item2" name="item"
											placeholder="항목을 입력하세요">
									</div>
									<div>
										<input type="text" id="item3" name="item"
											placeholder="항목을 입력하세요">
									</div>
								</div>
								<div class="mb-add">
									<div>
										<a href="#" onclick="addBtn();"><span class="glyphicon glyphicon-plus"
											aria-hidden="true"></span> 항목 추가하기</a>
									</div>
								</div>
								<div class="mb-time">
									<div>마감날짜 설정</div>

									<div class="input-group input-append date">
										<button type="button" class="btn btn-default btn-sm" id="dateChoice" title="unchecked">&nbsp;&nbsp;</button>
										<input id="datePicker" class="datePicker" type="text"
											name="endDate" placeholder="이틀 후 마감" disabled="disabled">
									</div>



								</div>

							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-default" value="올리기">
								<input type="hidden" name="clubseq" value="${clubseq}">
							</div>
							</form>
						</div>

					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
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
