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

    <!-- DataTables CSS -->
    <link href="/Project/company/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/Project/company/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

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
<style>
	#listTable { width: 870px; margin: 0px auto; font-size: 14px; text-align: center; letter-spacing: -1px; padding: 3px; }
	#listTable td { height: 50px; vertical-align: middle; padding: 3px; }
	#listTable th { text-align: center; padding: 3px; padding-bottom: 8px; }
	#listTable .seq { width: 60px; }
	#listTable td.date { width: 100px; font-size: 13px; }
	#listTable td.endDate { width: 90px; font-size: 13px; }
	#listTable td.subject { width: 300px; text-align: left; color: #444; }
	#listTable td.subject a { color: #444; }
	#listTable .subject a:hover { text-decoration: none; color: #444; }
	#listTable .name { width: 50px; }
	#listTable .targetDepartment, #listTable .targetPosition { width: 60px; }
	#listTable .anonymity { width: 40px; }
	#listTable .result { width: 30px; }
	#listTable .questionCount { width: 50px; }
	#listTable .participantsCount { width: 50px; }
	#listTable .title a { color: #333; }
	#listTable .title a:hover { text-decoration: none; color: #333; }
	#listTable .label { cursor: onclick; }
	
	/* 종료된 경우 */
	#listTable tr.end td.subject a { color: #aaa; }
	#listTable tr.end td.subject span { color: #aaa; }
	#listTable tr.end { color: #aaa; }
	/* 페이징 */
	.pagination>.active>a, .pagination>.active>a:hover { background-color: #337ab7; }	
	.pagination>li>a, .pagination>li>span { color: #555; }
	
	/* 버튼 */
	#pageButton { width: 850px; margin: 0 auto; }
	#pagebar { width: 440px; text-align: left; float: left; }
	#write { width: 400px; text-align: right; float: left; margin-top: 23px; }
</style>
<script>
			
	window.onload = function() {

		function blinker() {
			$(".blink").fadeOut(500);
			$(".blink").fadeIn(500);
		}
		
		setInterval(blinker,2000);
		
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
            
            <table id="listTable" class="table table-hover">
			    <thead>
			        <tr>
			            <th class="seq">번호</th>
			            <th class="subject">주제</th>
			            <th class="date">조사기간</th>         
			            <th class="targetDepartment">대상부서</th>
			            <th class="targetPosition">대상직급</th>
			            <th class="anonymity">익명</th>
			            <th class="questionCount">문항수</th>
			            <th class="participantsCount">참여자</th>
			            <th class="name">게시자</th>
			            <th class="result"></th>
			            
			        </tr>
			    </thead>
			    <tbody>
			    	<c:forEach items="${surveyList}" var="dto">
			    	
			    	
			        <tr <c:if test="${dto.end < 0 or ((departmentSeq != dto.targetDepartment) and (dto.targetDepartment != null)) or ((positionSeq != dto.targetPosition) and (dto.targetPosition != null))}">class="end"</c:if>>
			            <td class="seq">${dto.seq}</td>
			            <td class="subject">
			             	<!-- 시간 아직 안지났으면 -->
			           		<c:if test="${dto.end >= 0}">
			           		<c:if test="${(departmentSeq == dto.targetDepartment) or (dto.targetDepartment == null) }">
			           		<c:if test="${(positionSeq == dto.targetPosition) or (dto.targetPosition == null)}">
			            	<a href="/Project/all/survey/view.do?seq=${dto.seq}" class="toView" title="${dto.purpose }">${dto.subject}</a>
			            	</c:if>
			            	</c:if>
			            	</c:if>
			            	<!-- 시간 지났으면 -->
			            	<c:if test="${dto.end < 0 or ((departmentSeq != dto.targetDepartment) and (dto.targetDepartment != null)) or ((positionSeq != dto.targetPosition) and (dto.targetPosition != null))}">
			            	<span>${dto.subject}</span>
			            	</c:if>
			            </td>
			            <td class="date">${dto.startDate} ~<br> ${dto.endDate}</td>
			            
			            <td class="targetDepartment">
			            	<c:choose>
			            		<c:when test="${dto.department == null}">전체</c:when>
			            		<c:otherwise>${dto.department}</c:otherwise>
			            	</c:choose>
			            </td>
			            <td class="targetPosition">
							<c:choose>
			            		<c:when test="${dto.position == null}">전체</c:when>
			            		<c:otherwise>${dto.position}</c:otherwise>
			            	</c:choose>
						</td>
			            <td class="anonymity">
			            	<c:if test="${dto.anonymity == 'y'}">O</c:if>
			            	<c:if 	test="${dto.anonymity == 'n'}">X</c:if>
			           	</td>
			            <td class="questionCount">${dto.questionCount}</td>
			            <td class="participantsCount">${dto.participantsCount}</td>
			            <td class="name">${dto.name}</td>
			      		<td class="result">
			      			<c:if test="${seq == dto.empSeq}"> <!-- 결과 버튼 -->
			      			<div class="label label-success blink" style="cursor: pointer;" onclick="location.href = '/Project/all/survey/result.do?seq=${dto.seq}';">결과</div>
			      			</c:if>
			      		</td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>       
			<div id="pageButton">       
            	<div id="pagebar">${pagebar}</div>
            	<div id="write"><input type="button" value="설문등록" class="btn btn-outline btn-primary" onclick="location.href='/Project/all/survey/add.do';"></div>
	            <div style="clear:both;"></div>
            </div>
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

    <!-- DataTables JavaScript -->
    <script src="/Project/company/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/Project/company/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/Project/company/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/Project/company/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

</body>

</html>
