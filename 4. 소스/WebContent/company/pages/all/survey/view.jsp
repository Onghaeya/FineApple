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

    <!-- Custom Fonts -->
    <link href="/Project/company/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- jQuery -->
    <script src="/Project/company/vendor/jquery/jquery.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
/* 위쪽 주제 부분 */
	#page-wrapper { padding-bottom: 50px; }
	#tblHeader { width: 850px; margin: 0 auto; margin-bottom: 20px; }/* 제일 상위 테이블 */
	#tblHeader th { background-color: #eee; }
	
	/* .day.active { background-color: skyblue; } */
	
	
	
	#surveyWrapper .subject { font-size: 29px; width: 850px; margin: 10px auto; font-weight: bold; padding-left: 2px; }
	#surveyWrapper .purpose { 
	 	border: 5px solid #B4DBF4; 
	 	border-radius: 10px; 
	 	width: 850px;
	 	margin: 40px auto; 
	 	font-size: 20px; 
	 	font-weight: normal;
	 	padding: 30px 15px; 
	 	line-height: 1.5em;
	 }
	#surveyWrapper .anonymity { width: 850px; margin: 0 auto; color: #2F5C93; margin-bottom: 10px; }
	#surveyWrapper th { width: 80px; vertical-align: middle; text-align: center; }
	
	.tblQuestion:last-child { border-bottom: 0; }
	.tblQuestion { width: 850px; margin: 0px auto; font-size: 16px; border-bottom: 1px dashed #ccc; padding: 15px; }
	.tblQuestion .question { font-weight: bold; }
	.tblQuestion td { padding: 8px; }
	.tblQuestion .text-answer { width: 90% }
	.tblQuestion textarea.text-answer { height: 200px; display: inline; resize: none; float: left; }
	.tblQuestion .count { color: #444; margin-bottom: 5px; float: left; margin-top: 175px; margin-left: 10px; }
	
	.tblQuestion td.question { padding-top: 30px; }
	.tblQuestion .answer { padding-bottom: 30px; }
	.tblQuestion label { color: #444; font-weight: normal; }
	
	#btns { width: 850px; margin: 0px auto; text-align: left; padding: 8px; }
	#btns input { margin-top: 10px; }
	
	/* 이미 참여한 경우 */
	.confirmBox { /* border: 1px solid #ccc; */ border-radius: 5px; margin: 0px auto; text-align: center; margin: 100px 40px; }		
	.end { font-size: 16px; margin: 20px; }		
	.end div { margin-bottom: 10px; }	
	.reject.fa { font-size: 18px; margin-bottom: 10px; }
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
            <c:if test="${result == 1}"> <!-- 참여 안해본 경우만 가능 -->
            <div id="surveyWrapper">
            	
            		<!-- 주제 -->
            		
            		<h1 class="subject">${dto.subject}</h1>
            		
            		<!-- 목적 -->
            		<h2 class="purpose">${dto.purpose}</h2>
            		
            		<!-- 익명 여부 -->
            		
            		<div class="anonymity">
					<c:if test="${dto.anonymity == 'y' }">* 본 조사는 익명으로, 대상자의 정보를 조회할 수 없습니다.</c:if>
					<c:if test="${dto.anonymity == 'n' }">* 본 조사는 익명 조사가 아닙니다.</c:if>
 					</div>
 					
 					
 					<table id="tblHeader" class="table table-bordered">
            		<!-- 시작일 -->
            		<tr>
            			<th>조사 기간</th>
            			<td colspan="3">${dto.startDate } ~ ${dto.endDate }</td>	 
            		</tr>
            		<!-- 종료일 -->
            		
					<tr>
						<th>대상 부서</th>
						<td>
							<c:choose>
			            		<c:when test="${dto.department == null}">전체</c:when>
			            		<c:otherwise>${dto.department}</c:otherwise>
			            	</c:choose>
						</td>
						<th>대상 직급</th>
						<td>
							<c:choose>
			            		<c:when test="${dto.position == null}">전체</c:when>
			            		<c:otherwise>${dto.position}</c:otherwise>
			            	</c:choose>
						</td>
					</tr>
 					
				
            	</table>
            </div>
            
            <!--------------------------------------------------------------------------------------------- -->
           	<form action="/Project/all/survey/answeraddok.do" method="POST">
            <div id="questions">
            
            	<!-- q1 -->
            	<c:forEach items="${dto.sqList}" var="sqdto">
	           	<table id="q${sqdto.questionNumber}" class="tblQuestion">
	           		<tr>
	           			<td class="question">
		           		<c:if test="${sqdto.required == 'y' }"> <!-- 필수 출력 여부 -->
		           		<div style="color: #2E5788; font-weight: normal; font-size: 13px;">* 필수</div>
		           		</c:if>           		
	           			${sqdto.questionNumber}. ${sqdto.question } <c:if test="${sqdto.answerTypeSeq == 4}">(최대 ${sqdto.multipleNum}개)</c:if>
	           			
	           			</td>
	           		</tr>
	     
	   					
	           		<tr>
	           			<td class="answer">
	           			<!-- 라디오 버튼과 체크 박스의 경우 name을 a + questionSeq로 한다. -->
	           				
	           				<c:if test="${sqdto.answerTypeSeq == 1}"> <!-- 단답형 -->
	           				<input type="text" class="form-control text-answer" placeholder="답안을 입력해주세요." max="${sqdto.answerLimit}" name="a${sqdto.seq}" <c:if test="${sqdto.required == 'y'}">required</c:if>> <!-- 텍스트 박스 -->
	           				</c:if>
	           				
	           				<c:if test="${sqdto.answerTypeSeq == 2}"> <!-- 서술형 -->
		      				<textarea class="form-control text-answer" id="a${sqdto.seq}" name="a${sqdto.seq}" <c:if test="${sqdto.required == 'y'}">required</c:if>></textarea>
		      				<div id="count${sqdto.seq}" class="count">0 / ${sqdto.answerLimit}</div><!-- 긴 텍스트 박스 -->
		      				<div style="clear: both;"></div>
		      				<script>
			      				$("#a${sqdto.seq}").on("keyup", function() {
			      					
			      					//최대 글자 수 넘으면 자르고 알림
			      					if($(this).val().length > "${sqdto.answerLimit}") {
			      						alert("최대 ${sqdto.answerLimit}자까지 입력 가능합니다.");
			      			            $(this).val($(this). val().substring(0, "${sqdto.answerLimit}"));
			      			        }
	
			      					//입력한 글자 수 출력
			      					$("#count${sqdto.seq}").html($("#a${sqdto.seq}").val().length + " / ${sqdto.answerLimit}");
			      				});
		      				</script>
		      				
		      				</c:if>
		      				
		      				<c:if test="${sqdto.answerTypeSeq == 3}"> <!-- 단일 선택 -->
		      				
			      				<c:forEach items="${sqdto.smcList}" var="smcdto">
		      					<div>
		      						<input type="radio" class="a${sqdto.seq}" name="a${sqdto.seq}" value="${smcdto.seq}" <c:if test="${sqdto.required == 'y'}">required</c:if>>
		      						<label for="a${sqdto.seq }">${smcdto.answer}</label>
		      					</div>
			      				</c:forEach>
		      				
		      				</c:if>
		      				
		      				
		      				<c:if test="${sqdto.answerTypeSeq == 4}"> <!-- 복수 선택 -->
		      				
			      				<c:forEach items="${sqdto.smcList}" var="smcdto">
		      					<div>
		      						<input type="checkbox" class="a${sqdto.seq}" name="a${sqdto.seq}" value="${smcdto.seq}" onclick="CountChecked(this)">
		      						<label for="a${sqdto.seq }">${smcdto.answer}</label>
		      					</div>
			      				</c:forEach>
		      				
		      				<script>

								// 설정 시작
								var maxChecked = "${sqdto.multipleNum}";
								var totalChecked = 0;
								// 설정 끝
								function CountChecked(field) {
									if (field.checked)
										totalChecked += 1;
									else
										totalChecked -= 1; 
									
									if (totalChecked > maxChecked) {
										alert ("최대 ${sqdto.multipleNum}개 까지만 가능합니다.");
										field.checked = false;
										totalChecked -= 1;
									} 
								}
								
							</script>
		      				</c:if>
		      				
		      			</td>
	           		</tr>
	           		
	           	</table>
	           	</c:forEach>
	           	<!-- /q1 -->
            </div>
  			
            <!-- /questions -->
            <div id="btns">
            	<input type="submit" value="제출하기" id="submit" class="btn btn-outline btn-primary">
            	<input type="hidden" value="${dto.seq}" name="seq"> <!-- 무슨 설문인지 모르니까 번호 넘겨줌 -->
            </div>
           	</form>
            
            </c:if>
            <c:if test="${result == 0}">
            <div class="confirmBox">
	            	<div class="end">
	            		<div style="margin-bottom: 3px;"><i class="reject fa fa-times"></i></div>
	            		<div style="font-weight: bold;">이미 참여한 설문조사입니다.</div> 
	            	</div>
	            	<div class="btns">
	            		<input type="button" value="목록으로" class="btn btn-primary" onclick="location.href='/Project/all/survey/list.do'">
	            	</div>
	            </div>
            </c:if>
            
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->


    <!-- jQuery -->
    

    <!-- Bootstrap Core JavaScript -->
    <script src="/Project/company/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/Project/company/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/Project/company/dist/js/sb-admin-2.js"></script>

</body>

</html>
