<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- Custom Fonts -->
    <link href="/Project/company/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<!-- datepicker -->
	<link href="/Project/company/dist/css/datepicker.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>

	#page-wrapper { padding-bottom: 50px; }
	#tblHeader { width: 850px; margin: 0 auto; margin-bottom: 20px; }/* 제일 상위 테이블 */
	#datepicker { }
	.datepicker-days { letter-spacing: -1px; }
	/* .day.active { background-color: skyblue; } */
	
	#surveyWrapper .short { width: 100px; }
	#surveyWrapper #purpose { float: left; resize: none; width: 680px; height: 100px; display: inline; }
	#surveyWrapper #count { margin: 78px 0px 0px 6px; float: left; }
	#surveyWrapper th { width: 80px; vertical-align: middle; text-align: center; }
	
	
	.tblQuestion { width: 850px; margin: 0 auto; }
	.tblQuestion:hover { background-color: #E2F7FF; }
	.tblQuestion td { padding: 8px; padding-left: 10px; }
	.tblQuestion tr { border-bottom: 1px dashed #ccc; }
	
	
	/* 질문삭제아이콘 */
	.deleteQuestion { 
		float: right;
		background-color: #ddd; 
		color: #444; 
		display: inline-block; 
		width: 30px; height: 30px; 
		text-align: center;
		vertical-align: middle;
		border-radius : 4px;  
		font-size: 20px; 
		margin: 0px 5px; 
		cursor: pointer;
	}
	
	.deleteQuestion:after { content: ""; display: block; clear: both; }
	
	.deleteQuestion i{ padding-top: 4px; }
	
	.questionNumber { border: 0px; font-weight: bold; background-color: rgba( 255, 255, 255, 0 ); }
	
	.tblQuestion tr:nth-child(3) > td > div { float: left; margin-top: 6px; margin-right: 10px; font-weight: bold; } /* 질문 */
	.question { width: 792px; }
	.question:after { content: ""; display: block; clear: both; }
	
	.tblQuestion tr:nth-child(4) td { height: 60px; }
	.tblQuestion tr:nth-child(4) > td:first-child { width: 300px; } /* 응답유형 td */
	.tblQuestion tr:nth-child(4) > td > div { float: left; margin-top: 6px; margin-right: 10px; font-weight: bold; }	/* 응답유형 */
	.answerTypeSeq:after { content: ""; display: block; clear: both; }
	.answerTypeSeq { width: 160px; margin-right: 10px; }
	
	.multipleNumWrapper { float: left; }
	.answerLimitWrapper:after { content: ""; display: block; clear: both; } 
	.answerLimit, .multipleNum { width: 100px; padding-top: 5px; }
	.multipleNumWrapper > div { float: left; margin-top: 5px; margin-right: 10px; }
	.multipleNum:after { content: ""; display: block; clear: both; }
	.answerLimitWrapper > div { float: left; margin-top: 5px; margin-right: 10px; }
	.answerLimit:after { content: ""; display: block; clear: both; }
	
	
	.tblQuestion textarea.example { height: 100px; height: 150px; } /* 예시로 쓰는 textarea */
	.tblQuestion .example { width: 100%;} /* 예시로 스는 textarea, text */
	
	/* 항목 추가 버튼 */
	.tblQuestion .addCheckbox, .tblQuestion .addRadiobox { padding-left: 15px; }
	.addCheckbox span, .addRadiobox span { font-size: 13px; margin-left: 4px; }
	
	
	.checkboxes .fa, .radioboxes .fa { color: #777; margin-left: 4px; cursor: pointer; }
	.checkboxes input, .radioboxes input { margin-right: 4px; margin-bottom: 5px; }
	.checkboxes input[type="text"], .radioboxes input[type="text"] { width: 300px; display: inline; } /* 라디오 박스의 유형 입력 인풋 크기 제어 */
	
	.addQuestion { margin-bottom: 20px; background-color: white; border: 2px dashed #aaa; border-radius: 5px; padding: 6px; }
	.addQuestion:hover { border-color: #444; }
	

	#btns { width: 850px; margin: 0px auto; text-align: right; }
	#btns input { margin-top: 10px; }
	
	/* javascript 관련 */
	
	
	
	
	#questions .tblQuestion:nth-child(n + 2) { display: none; } /* 이번 부터 다 없앰 */
	textarea.example, .radioboxes, .checkboxes { display: none; }
	
	


</style>
<script>
	window.onload =  function() {
		
		//datepicker	
		$('#datepicker1, #datepicker2').datepicker({
			 format: "yyyy-mm-dd",
			 language: "kr"
		});
		
		var nowDate = new Date();
		$("#datepicker1").val(nowDate.toISOString().substring(0, 10));
		
		//글자 수 제한
		$("#purpose").on("keyup", function() {
			
			//최대 글자 수 넘으면 자르고 알림
			if($(this).val().length > 300) {
				alert("최대 300자까지 입력 가능합니다.");
	            $(this).val($(this). val().substring(0, 300));
	        }

			//입력한 글자 수 출력
			$("#count").html($("#purpose").val().length + " / 300");
		});
		
		
		/* $(".q:gt(0)").css("display", "none");
		 */
		 //처음 어떻게 할지
		 $("#questions input,#questions textarea,#questions select").attr("disabled", true); //모두 disabled
		 $("#q1 input,#q1 textarea,#q1 select").attr("disabled", false);	//1번째 셀만 조작 가능하게 
		 $("#questions .valid").attr("disabled", false); //valid는 값을 넘겨줘야하나니까
		 
		 $(".example").attr("disabled", true); //example들 작동 못하게 
		 $(".checkboxes input,.radioboxes input").attr("disabled", true);	//체크박스랑 라디오박스 예제 작동 못하게 
		 $(".answerTypeSeq").val("1");	//응답유형 우선 1로
		 
		 //길이 제한만 보이고 작동하도록
		 $(".answerLimitWrapper").show();
		 $(".multipleNum").attr("disabled",true);
		 $(".multipleNumWrapper").hide();
		 
		 //처음엔 text 박스만 보이게
		 $("#q1 .examples input.example").show();
		 
		 
		 
			
		 //답 유형 바뀔 때마다 예제 바뀌도록
		 $(".answerTypeSeq").on("change", changeLimit);
		 
		 //X 아이콘 클릭할 때마다 옵션 하나씩 없애기
		 $("i.fa-times").on("click", deleteOption);
		 
		 //옵션 추가하기
		 $(".addRadiobox").on("click", addOption);
		 $(".addCheckbox").on("click", addOption);
		 
		 //다음 문항 추가
		 $(".addQuestion").on("click", addQuestion);
		 
		 $(".deleteQuestion").on("click", deleteQuestion);
		 
	};

	function addOption() {		
		var boxes = $(this).parent().parent(); //라디오 박스나 체크 박스
		boxes.children("div:hidden").first().show(); //안먹는다
		boxes.children().children("input:disabled").attr("disabled", false);
	}
	
	function deleteOption() {
		
		//alert($(this).parent().parent().children(":hidden").length); //radioboxes의 자식 div 중 숨겨진애들 몇개인지
		//지금 숨겨진 div가 9개(버튼포함) 9개가 아니라면(버튼이랑 하나 빼면 9개)
		if($(this).parent().parent().children(":hidden").length != 9) {
			$(this).prev().attr("disabled", true); //텍스트박스 disabled
			$(this).parent().hide(); //부모 숨기기
		} else { 
			alert("최소 1개의 항목이 필요합니다.");
		}
	}
	
	//질문지 추가
	function addQuestion() {
		
		//다음꺼 보여주고
		var nextq = $(this).parents(".tblQuestion").next();
		nextq.show();
		
		var tblQuestion = nextq.children(":eq(0)"); //tbody도 없애기
		
		//필수인지 + 질문
		tblQuestion.find(".required").attr("disabled", false); //필수
		tblQuestion.find(".question").attr("disabled", false);
		
		//응답 유형과 제한길이
		var answerTypeSeq = tblQuestion.children(":eq(3)");
		answerTypeSeq.children(":eq(0)").children(".answerTypeSeq").attr("disabled", false);
		answerTypeSeq.children(":eq(1)").children(".answerLimitWrapper").children().attr("disabled", false);
		
		
		//질문지 추가 버튼
		tblQuestion.children(":last").children().children(".addQuestion").attr("disabled", false);
		//valid를 y로 바꾸기
		nextq.find(".valid").val("y");
	}
	

	function deleteQuestion() {
		//해당 테이블의 input과 select 다 없어지게
		$(this).parents(".tblQuestion").find("input,select").attr("disabled", true);
		$(this).parents(".tblQuestion").hide();
		
		//valid n으로 바꾸기
		$(this).parents(".tblQuestion").find(".valid").attr("disabled", false);
		$(this).parents(".tblQuestion").find(".valid").val("n");
	}
	
	function changeLimit() {
		
		//예제 폼들 모아놓은 td
		var formEx = $(this).parents("tr").next().children(":first");
		
		//라디오박스와 체크박스 text 못사용p하게
		formEx.children(".checkboxes input").children().attr("disabled", false);
		formEx.children(".radioboxes input").children().attr("disabled", false);
		
		var multipleNum = $(this).parent().next().children(":eq(0)");
		var answerLimit = $(this).parent().next().children(":eq(1)");
		
		
		//주관식 단답형
		if ($(this).val() == "1") {
			
			//복수선택을 안보이고 disabled로
			//최대길이는 보이고 disabled false로
			answerLimit.children(".answerLimit").attr("disabled", false);
			answerLimit.show();
			multipleNum.children(".multipleNum").attr("disabled", true);
			multipleNum.hide();
			
			formEx.children().hide(); //다른 애들 다 숨기고
			formEx.children("input[type=text]").show(); //text만 보이도록
			
		
			
		//주관식 서술형
		} else if ($(this).val() == "2") {
			
			//복수선택을 안보이고 disabled로
			//최대길이는 보이고 disabled false로
			answerLimit.children(".answerLimit").attr("disabled", false);
			answerLimit.show();
			multipleNum.children(".multipleNum").attr("disabled", true);
			multipleNum.hide();
			
			formEx.children().hide(); //다른애들 다 숨기고
			formEx.children("textarea").show(); //textarea만 보이도록

			
		//단일 선택형
		} else if ($(this).val() == "3") {
			
			answerLimit.children(".answerLimit").attr("disabled", true);
			answerLimit.hide();
			multipleNum.children(".multipleNum").attr("disabled", true);
			multipleNum.hide();	//길이 설정하는거 안보이게
			
			formEx.children().hide(); //다른애들 다 숨기고
			formEx.children(".radioboxes").show(); //라디오박스만 보이도록
			
			formEx.children(".radioboxes").children().hide(); //다 숨기기
			formEx.children(".radioboxes").children(":first,:last").show();
			formEx.children(".radioboxes").children(":first,:last").children().attr("disabled", false);
		
		//복수 선택형
		} else if ($(this).val() == "4") { 
			
			answerLimit.children(".answerLimit").attr("disabled", true);
			answerLimit.hide();
			multipleNum.children(".multipleNum").attr("disabled", false);
			multipleNum.show();	//길이 설정하는거 안보이게
			
			formEx.children().hide();
			formEx.children(".checkboxes").show();
			
			//첫번째만 보이도록
			formEx.children(".checkboxes").children().hide(); //우선 다 숨기기
			formEx.children(".checkboxes").children(":first,:last").show(); //첫번째랑 버튼만보여주기
			formEx.children(".checkboxes").children(":first,:last").children().attr("disabled", false);
			
		}
	}
</script>
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
                        <h1 class="page-header">설문조사</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <form method="POST" action="/Project/all/survey/addok.do">
            <div id="surveyWrapper">
            	<table id="tblHeader" class="table table-bordered">
            		<!-- 주제 -->
            		<tr>
            			<th>주제</th>
            			<td><input type="text" maxlength="100" class="form-control" name="subject" id="subject" required></td>
            		</tr>
            		<!-- 목적 -->
            		<tr>
            			<th>목적</th>
            			<td>
            				<div>
            					<textarea class="form-control" id="purpose" name="purpose" required></textarea>
            					<div id="count">0 / 300</div>
            					<div style="clear: both;"></div>
            				</div>
            			</td>
            		</tr>
            		<!-- 시작일 -->
            		<tr>
            			<th>시작일</th>
            			<td><input id="datepicker1" class="datepicker" type="text" name="startDate" required></td>	 
            		</tr>
            		<!-- 종료일 -->
            		<tr>
            			<th>종료일</th>
            			<td><input id="datepicker2" class="datepicker" type="text" name="endDate" required></td>      		 
            		</tr>
					<tr>
						<th>대상 부서</th>
						<td>
							<select name="targetDepartment" id="targetDepartment" class="form-control short" required>
								<option value="0">전체</option>
								<c:forEach items="${dlist}" var="list">
								<option value="${list.seq}">${list.department}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
 					<tr>
						<th>대상 직급</th>
						<td>
							<select name="targetPosition" id="targetPosition" class="form-control short" required>
								<option value="0">전체</option>
								<c:forEach items="${plist}" var="list">
								<option value="${list.seq}">${list.position}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="checkbox" id="anonymity" name="anonymity" value="y"> <!-- 체크안하면 null -->
	 						<label for="anonymity">익명 조사</label>
	 					</td>
					</tr>
            	</table>
            </div>
            
            <!--------------------------------------------------------------------------------------------- -->
            <div id="questions">
            
            	<!-- q1 -->
	           	<table id="q1" class="tblQuestion">
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required1" name="required1" class="required" value="y">
		      				<label for="required1">필수 여부</label> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber1" class="questionNumber" value="1" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question1" id="question1" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
							<div>유형</div>			   					
	   						<select id="answerTypeSeq1" name="answerTypeSeq1" class="answerTypeSeq form-control">
	   							<c:forEach items="${alist}" var="list">
	   							<option value="${list.seq}">${list.answerType}</option>
	   							</c:forEach>
	   						</select>		   		
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 개수</div>
	      						<input type="number" min="1" min="1" name="multipleNum1" id="multipleNum1" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit1" id="answerLimit1" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes1" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer1"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes1" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group1"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group1"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group1"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group1"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group1"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group1"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group1"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group1"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group1"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer1"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group1"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer1"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr>
	           		<tr>
	           			<td colspan="2">
	           				<input type="button" class="addQuestion" value="질문 추가" id="addQuestion1">
	           				<input type="hidden" id="valid1" class="valid" name="valid1" value="y">
	           			</td>
	           		</tr>
	           	</table>
	           	<!-- /q1 -->
	           	
	           	<!-- q2 -->
	           	<table id="q2" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required2" name="required2" class="required" value="y">
		      				<label for="required2">필수 여부</label>
		      				<span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber2" class="questionNumber" value="2" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question2" id="question2" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
	   						<select id="answerTypeSeq2" name="answerTypeSeq2" class="answerTypeSeq form-control">
	   							<c:forEach items="${alist}" var="list">
	   							<option value="${list.seq}">${list.answerType}</option>
	   							</c:forEach>
	   						</select>
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum2" id="multipleNum2" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit2" id="answerLimit2" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes2" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer2"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes2" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group2"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group2"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group2"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group2"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group2"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group2"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group2"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group2"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group2"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer2"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group2"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer2"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr>       		
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion2" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid2" class="valid" name="valid2" value="n">
		           		</td>
		           	</tr>
	           	</table>
	           	
	           	<!-- /q2 -->
	           	
	           	<!-- q3 -->
	           	<table id="q3" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required3" name="required3" class="required" value="y">
		      				<label for="required3">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber3" class="questionNumber" value="3" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question3" id="question3" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
			   					
	   						<select id="answerTypeSeq3" name="answerTypeSeq3" class="answerTypeSeq form-control">
	   							<c:forEach items="${alist}" var="list">
	   							<option value="${list.seq}">${list.answerType}</option>
	   							</c:forEach>
	   						</select>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum3" id="multipleNum3" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit3" id="answerLimit3" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes3" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer3"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes3" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group3"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group3"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group3"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group3"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group3"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group3"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group3"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group3"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group3"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer3"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group3"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer3"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr>       		
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion3" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid3" class="valid" name="valid3" value="n">
		           		</td>
		           	</tr>
	           	</table>
	           	
	           	<!-- /q3 -->
	           	
	           	<!-- q4 -->
	           	<table id="q4" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required4" name="required4" class="required" value="y">
		      				<label for="required4">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber4" class="questionNumber" value="4" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question4" id="question4" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
			   					
			   						<select id="answerTypeSeq4" name="answerTypeSeq4" class="answerTypeSeq form-control">
			   							<c:forEach items="${alist}" var="list">
			   							<option value="${list.seq}">${list.answerType}</option>
			   							</c:forEach>
			   						</select>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum4" id="multipleNum4" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit4" id="answerLimit4" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes4" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer4"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes4" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group4"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group4"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group4"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group4"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group4"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group4"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group4"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group4"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group4"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer4"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group4"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer4"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr>       		
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion4" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid4" class="valid" name="valid4" value="n">
		           		</td>
		           	</tr>
	           	</table>
	           	
	           	<!-- /q4 -->
	           	
	           	<!-- q5 -->
	           	<table id="q5" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required5" name="required5" class="required" value="y">
		      				<label for="required5">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber5" class="questionNumber" value="5" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question5" id="question5" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
	   						<select id="answerTypeSeq5" name="answerTypeSeq5" class="answerTypeSeq form-control">
	   							<c:forEach items="${alist}" var="list">
	   							<option value="${list.seq}">${list.answerType}</option>
	   							</c:forEach>
	   						</select>
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum5" id="multipleNum5" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit5" id="answerLimit5" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes5" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer5"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes5" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group5"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group5"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group5"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group5"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group5"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group5"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group5"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group5"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group5"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer5"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group5"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer5"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr>       		
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion5" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid5" class="valid" name="valid5" value="n">
		           		</td>
		           	</tr>
	           	</table>
	           	
	           	<!-- /q5 -->
	           	
	           	<!-- q6 -->
	           	<table id="q6" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required6" name="required6" class="required" value="y">
		      				<label for="required6">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber6" class="questionNumber" value="6" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question6" id="question6" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
			   					
			   						<select id="answerTypeSeq6" name="answerTypeSeq6" class="answerTypeSeq form-control">
			   							<c:forEach items="${alist}" var="list">
			   							<option value="${list.seq}">${list.answerType}</option>
			   							</c:forEach>
			   						</select>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum6" id="multipleNum6" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit6" id="answerLimit6" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes6" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer6"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes6" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group6"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group6"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group6"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group6"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group6"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group6"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group6"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group6"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group6"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer6"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group6"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer6"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr>       		
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion6" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid6" class="valid" name="valid6" value="n">
		           		</td>
		           	</tr>
	           	</table>
	           	
	           	<!-- /q6 -->
	           	
	           	<!-- q7 -->
	           	<table id="q7" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required7" name="required7" class="required" value="y">
		      				<label for="required7">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber7" class="questionNumber" value="7" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question7" id="question7" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
			   					
	   						<select id="answerTypeSeq7" name="answerTypeSeq7" class="answerTypeSeq form-control">
	   							<c:forEach items="${alist}" var="list">
	   							<option value="${list.seq}">${list.answerType}</option>
	   							</c:forEach>
	   						</select>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum7" id="multipleNum7" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit7" id="answerLimit7" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes7" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer7"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes7" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group7"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group7"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group7"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group7"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group7"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group7"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group7"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group7"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group7"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer7"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group7"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer7"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr>       		
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion7" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid7" class="valid" name="valid7" value="n">
		           			
		           		</td>
		           	</tr>
	           	</table>
	           	
	           	<!-- /q7 -->
	           	
	           	<!-- q8 -->
	           	<table id="q8" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required8" name="required8" class="required" value="y">
		      				<label for="required8">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber8" class="questionNumber" value="8" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question8" id="question8" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>	
	   						<select id="answerTypeSeq8" name="answerTypeSeq8" class="answerTypeSeq form-control">
	   							<c:forEach items="${alist}" var="list">
	   							<option value="${list.seq}">${list.answerType}</option>
	   							</c:forEach>
	   						</select>
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum8" id="multipleNum8" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit8" id="answerLimit8" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes8" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer8"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes8" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group8"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group8"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group8"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group8"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group8"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group8"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group8"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group8"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group8"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer8"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group8"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer8"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr>       		
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion8" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid8" class="valid" name="valid8" value="n">
		           		</td>
		           	</tr>
	           	</table>
	           	
	           	<!-- /q8 -->
	           	
	           	<!-- q9 -->
	           	<table id="q9" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required9" name="required9" class="required" value="y">
		      				<label for="required9">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber9" class="questionNumber" value="9" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question9" id="question9" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
		       				<div>응답 유형</div>
				   					
	   						<select id="answerTypeSeq9" name="answerTypeSeq9" class="answerTypeSeq form-control">
	   							<c:forEach items="${alist}" var="list">
	   							<option value="${list.seq}">${list.answerType}</option>
	   							</c:forEach>
	   						</select>
	
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum9" id="multipleNum9" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit9" id="answerLimit9" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes9" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer9"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes9" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group9"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group9"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group9"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group9"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group9"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group9"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group9"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group9"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group9"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer9"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group9"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer9"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr> 
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion9" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid9" class="valid" name="valid9" value="n">
		           		</td>
		           	</tr>      		
	           	</table>
	           	<!-- /q9 -->
	           	
	           	<!-- q10 -->
	           	<table id="q10" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required10" name="required10" class="required" value="y">
		      				<label for="required10">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber10" class="questionNumber" value="10" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question10" id="question10" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
			   					
			   						<select id="answerTypeSeq10" name="answerTypeSeq10" class="answerTypeSeq form-control">
			   							<c:forEach items="${alist}" var="list">
			   							<option value="${list.seq}">${list.answerType}</option>
			   							</c:forEach>
			   						</select>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum10" id="multipleNum10" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit10" id="answerLimit10" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes10" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer10"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes10" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group10"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group10"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group10"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group10"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group10"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group10"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group10"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group10"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group10"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer10"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group10"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer10"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr> 
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion10" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid10" class="valid" name="valid10" value="n">
		           		</td>
		           	</tr>      		
	           	</table>
	           	
	           	<!-- /q10 -->
	           	
	           	<!-- q11 -->
	           	<table id="q11" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required11" name="required11" class="required" value="y">
		      				<label for="required11">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber11" class="questionNumber" value="11" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question11" id="question11" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
			   					
			   						<select id="answerTypeSeq11" name="answerTypeSeq11" class="answerTypeSeq form-control">
			   							<c:forEach items="${alist}" var="list">
			   							<option value="${list.seq}">${list.answerType}</option>
			   							</c:forEach>
			   						</select>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum11" id="multipleNum11" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit11" id="answerLimit11" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes11" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer11"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes11" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group11"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group11"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group11"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group11"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group11"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group11"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group11"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group11"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group11"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer11"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group11"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer11"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr> 
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion11" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid11" class="valid" name="valid11" value="n">
		           		</td>
		           	</tr>      		
	           	</table>
	           	<!-- /q11 -->
	           	
	           	<!-- q12 -->
	           	<table id="q12" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required12" name="required12" class="required" value="y">
		      				<label for="required12">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber12" class="questionNumber" value="12" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question12" id="question12" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
			   					
			   						<select id="answerTypeSeq12" name="answerTypeSeq12" class="answerTypeSeq form-control">
			   							<c:forEach items="${alist}" var="list">
			   							<option value="${list.seq}">${list.answerType}</option>
			   							</c:forEach>
			   						</select>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum12" id="multipleNum12" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit12" id="answerLimit12" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes12" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer12"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes12" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group12"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group12"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group12"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group12"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group12"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group12"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group12"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group12"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group12"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer12"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group12"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer12"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr> 
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion12" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid12" class="valid" name="valid12" value="n">
		           		</td>
		           	</tr>      		
	           	</table>
	           	<!-- /q12 -->
	           	
	           	<!-- q13 -->
	           	<table id="q13" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required13" name="required13" class="required" value="y">
		      				<label for="required13">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber13" class="questionNumber" value="13" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question13" id="question13" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
			   					
			   						<select id="answerTypeSeq13" name="answerTypeSeq13" class="answerTypeSeq form-control">
			   							<c:forEach items="${alist}" var="list">
			   							<option value="${list.seq}">${list.answerType}</option>
			   							</c:forEach>
			   						</select>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum13" id="multipleNum13" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit13" id="answerLimit13" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes13" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer13"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes13" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group13"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group13"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group13"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group13"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group13"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group13"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group13"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group13"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group13"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer13"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group13"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer13"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr> 
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion13" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid13" class="valid" name="valid13" value="n">
		           		</td>
		           	</tr>      		
	           	</table>
	           	<!-- /q13 -->
	           	
	           	<!-- q14 -->
	           	<table id="q14" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required14" name="required14" class="required" value="y">
		      				<label for="required14">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber14" class="questionNumber" value="14" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question14" id="question14" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
			   					
			   						<select id="answerTypeSeq14" name="answerTypeSeq14" class="answerTypeSeq form-control">
			   							<c:forEach items="${alist}" var="list">
			   							<option value="${list.seq}">${list.answerType}</option>
			   							</c:forEach>
			   						</select>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum14" id="multipleNum14" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit14" id="answerLimit14" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes14" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer14"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes14" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group14"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group14"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group14"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group14"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group14"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group14"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group14"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group14"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group14"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer14"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group14"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer14"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr>    
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion14" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid14" class="valid" name="valid14" value="n">
		           		</td>
		           	</tr>   		
	           	</table>
	           	
	           	<!-- /q14 -->
	           	
	           	<!-- q15 -->
	           	<table id="q15" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required15" name="required15" class="required" value="y">
		      				<label for="required15">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber15" class="questionNumber" value="15" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question15" id="question15" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
			   					
			   						<select id="answerTypeSeq15" name="answerTypeSeq15" class="answerTypeSeq form-control">
			   							<c:forEach items="${alist}" var="list">
			   							<option value="${list.seq}">${list.answerType}</option>
			   							</c:forEach>
			   						</select>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum15" id="multipleNum15" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit15" id="answerLimit15" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes15" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer15"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes15" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group15"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group15"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group15"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group15"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group15"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group15"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group15"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group15"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group15"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer15"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group15"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer15"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr> 
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion15" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid15" class="valid" name="valid15" value="n">
		           		</td>
		           	</tr>      		
	           	</table>
	           	<!-- /q15 -->
	           	
	           	<!-- q16 -->
	           	<table id="q16" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required16" name="required16" class="required" value="y">
		      				<label for="required16">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber16" class="questionNumber" value="16" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question16" id="question16" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
			   					
			   						<select id="answerTypeSeq16" name="answerTypeSeq16" class="answerTypeSeq form-control">
			   							<c:forEach items="${alist}" var="list">
			   							<option value="${list.seq}">${list.answerType}</option>
			   							</c:forEach>
			   						</select>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum16" id="multipleNum16" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit16" id="answerLimit16" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes16" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer16"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes16" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group16"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group16"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group16"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group16"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group16"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group16"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group16"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group16"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group16"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer16"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group16"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer16"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr> 
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion16" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid16" class="valid" name="valid16" value="n">
		           		</td>
		           	</tr>      		
	           	</table>
	           	<!-- /q16 -->
	           	
	           	<!-- q17 -->
	           	<table id="q17" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required17" name="required17" class="required" value="y">
		      				<label for="required17">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber17" class="questionNumber" value="17" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question17" id="question17" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>응답 유형</div>
			   					
			   						<select id="answerTypeSeq17" name="answerTypeSeq17" class="answerTypeSeq form-control">
			   							<c:forEach items="${alist}" var="list">
			   							<option value="${list.seq}">${list.answerType}</option>
			   							</c:forEach>
			   						</select>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum17" id="multipleNum17" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit17" id="answerLimit17" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes17" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer17"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes17" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group17"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group17"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group17"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group17"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group17"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group17"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group17"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group17"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group17"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer17"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group17"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer17"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr> 
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion17" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid17" class="valid" name="valid17" value="n">
		           		</td>
		           	</tr>      		
	           	</table>
	           	<!-- /q17 -->
	           	
	           	<!-- q18 -->
	           	<table id="q18" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required18" name="required18" class="required" value="y">
		      				<label for="required18">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber18" class="questionNumber" value="18" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question18" id="question18" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>
			       				<div>응답 유형</div>
				   					
				   						<select id="answerTypeSeq18" name="answerTypeSeq18" class="answerTypeSeq form-control">
				   							<c:forEach items="${alist}" var="list">
				   							<option value="${list.seq}">${list.answerType}</option>
				   							</c:forEach>
				   						</select>
				   				</div>
				   			
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum18" id="multipleNum18" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit18" id="answerLimit18" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes18" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer18"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes18" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group18"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group18"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group18"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group18"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group18"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group18"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group18"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group18"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group18"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer18"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group18"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer18"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr> 
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion18" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid18" class="valid" name="valid18" value="n">
		           		</td>
		           	</tr>      		
	           	</table>
	           	<!-- /q18 -->
	           	
	           	<!-- q19 -->
	           	<table id="q19" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required19" name="required19" class="required" value="y">
		      				<label for="required19">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber19" class="questionNumber" value="19" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question19" id="question19" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>
			       				<div>응답 유형</div>
				   					
				   						<select id="answerTypeSeq19" name="answerTypeSeq19" class="answerTypeSeq form-control">
				   							<c:forEach items="${alist}" var="list">
				   							<option value="${list.seq}">${list.answerType}</option>
				   							</c:forEach>
				   						</select>
				   					</div>
			   				
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum19" id="multipleNum19" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit19" id="answerLimit19" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes19" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer19"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes19" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group19"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group19"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group19"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group19"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group19"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group19"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group19"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group19"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group19"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer19"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group19"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer19"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr> 
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion19" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid19" class="valid" name="valid19" value="n">
		           		</td>
		           	</tr>      		
	           	</table>
	           	<!-- /q19 -->
	           	
	           	<!-- q20 -->
	           	<table id="q20" class="tblQuestion">
	           	
	           		<tr>
	           			<td colspan="2">
	           				<input type="checkbox" id="required20" name="required20" class="required" value="y">
		      				<label for="required20">필수 여부</label><span class="deleteQuestion"><i class="fa fa-trash-o"></i></span> 
		      			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<input type="text" id="questionNumber20" class="questionNumber" value="20" readonly>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2">
	           				<div>질문</div>
	           				<input type="text" maxlength="200" name="question20" id="question20" class="question form-control" required>
	           			</td>
	           		</tr>
	           		
	           		<tr>
	           			<td>
			       			<div>
			       				<div>응답 유형</div>			
		   						<select id="answerTypeSeq20" name="answerTypeSeq20" class="answerTypeSeqSeq form-control">
		   							<c:forEach items="${alist}" var="list">
		   							<option value="${list.seq}">${list.answerType}</option>
		   							</c:forEach>
		   						</select>
		   					</div>
	   					</td>
	   					<td>
	   						<div class="multipleNumWrapper">
	      						<div>복수 선택 가능 개수</div>
	      						<input type="number" min="1" name="multipleNum20" id="multipleNum20" class="multipleNum form-control" required>				
	      					</div>
							
	      					<div class="answerLimitWrapper">
	      						<div>답변 최대 길이</div>
	      						<input type="number" min="1" name="answerLimit20" id="answerLimit20" class="answerLimit form-control" required>		
	      					</div>
	   					</td>
	           		</tr>
	           		
	           		<tr>
	           			<td colspan="2" class="examples">
	           				<input type="text" class="form-control example" disabled placeholder="답안 입력 창입니다."> <!-- 텍스트 박스 -->
		      				<textarea class="form-control example" disabled>답안 입력 창입니다.</textarea> <!-- 긴 텍스트 박스 -->
		      				<div id="checkboxes20" class="checkboxes"> <!-- 체크 박스들 -->
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="cAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="cAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="cAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="cAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="cAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="cAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="cAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="cAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="cAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="checkbox" disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="cAnswer20"><i class="fa fa-times"></i></div>
		      					<div><i class="addCheckbox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      				<div id="radioboxes20" class="radioboxes"> <!-- 라디오 박스들 -->
		      					<div><input type="radio" name="group20"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션1" name="rAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group20"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션2" name="rAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group20"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션3" name="rAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group20"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션4" name="rAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group20"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션5" name="rAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group20"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션6" name="rAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group20"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션7" name="rAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group20"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션8" name="rAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group20"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션9" name="rAnswer20"><i class="fa fa-times"></i></div>
		      					<div><input type="radio" name="group20"  disabled><input type="text" maxlength="50" class="form-control"  placeholder="옵션10" name="rAnswer20"><i class="fa fa-times"></i></div>
		      					<div><i class="addRadiobox fa fa-plus"><span>항목 추가</span></i></div>
		      				</div>
		      			</td>
	           		</tr> 
	           		<tr>
	           			<td colspan="2">
		           			<input type="button" id="addQuestion20" class="addQuestion" value="질문 추가">
		           			<input type="hidden" id="valid20" class="valid" name="valid20" value="n">
		           		</td>
		           	</tr>      		
	           	</table>
	           	<!-- /q20 -->
            </div>
  			
            <!-- /questions -->
            <div id="btns">
            	<input type="submit" value="등록하기" id="submit" class="btn btn-outline btn-primary">
            </div>
            </form>
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
    
    <!-- datepicker -->
	<script src="/Project/company/dist/js/bootstrap-datepicker.js"></script>
	<script src="/Project/company/dist/js/bootstrap-datepicker.kr.js"></script>
	
</body>

</html>
