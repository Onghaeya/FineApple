<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="/company/pages/attendance/inc/asset.jsp" %>
	<title>SB Admin 2 - Bootstrap Admin Theme</title>
</head>
<style>
	
#tbl1 { width: 800px; margin: 30px auto; }

#tbl1 th { width: 150px; text-align: center; }
#tbl1 td { width: 650px; }
#tbl1 #name, #tbl1 #tag, #tbl1 #pw { width: 150px; }
#tbl1 #content { height: 200px; }
#btnList { width: 800px; margin: 30px auto; }
	
</style>

<body>

    <div id="wrapper">


	    <%@ include file="/company/pages/attendance/inc/navigation.jsp" %>

	
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><!-- 헤더 --></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->

				<section>
		
			<!-- 글쓰기 폼 -->
			<!-- 이름,시간등은 받아와서 쓰겠다. -->
			<!-- <form method="POST" action="/Project/company/pages/position/board/addok.do" enctype="multipart/form-data"> -->		<!-- 그다음일처리할 서블릿 호출/ 항상 서블릿을 호출 jsp -> jsp x  -->
			
			
			
			<!-- <form method="POST" action="/Project/company/pages/position/saddok.do">		그다음일처리할 서블릿 호출/ 항상 서블릿을 호출 jsp -> jsp x  -->
			<table id="tbl" class="table table-striped" style="width:100%">
				
				<tr>
						<th>번호</th>
						<td>${dto.seq}</td>
				</tr>
					
				<tr>
					<th>카테고리</th>
					<td>${dto.categorySeq}</td>
				</tr>	
				<tr>
					<th></th>
					<td></td>
				</tr>	
				<tr>
					<th>제목</th>
					<td>${dto.subject}</td>
				</tr>
				
				
				<tr>
					<th>대상 직원</th>
					<td>${dto.positionSeq}</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${dto.startDate}</td>
				</tr>
				<tr>
					<th>장소</th>
					<td>${dto.place}</td>
				</tr>
				<tr style="height: 300px;">
					<th style="vertical-align: middle;">내용</th>
					<td style="vertical-align: middle;">${dto.content}</td>
				</tr>
				
				
			
				
			
			</table>
			<div id="btns">
				<input type="button" value="돌아가기" class="btn btn-default" onclick="history.back();" />
				<input type="submit" value="수정하기" class="btn btn-primary" onclick="location.href='/Project/company/pages/position/sedit.do?seq=${dto.seq}';"/>
				<input type="submit" value="삭제하기" class="btn btn-primary" onclick="location.href='/Project/company/pages/position/sdel.do?seq=${dto.seq}';"/>
			</div>																														
			
			<!-- 지금 작성중인 글이 새글? 답변글? -->
			<%-- <input type="hidden" name = "reply" value="${reply}" /> --%>
	<%-- 		<input type="hidden" name = "thread" value ="${thread }" />
			<input type="hidden" name ="depth" value="${depth }" /> --%>
			</form>
		</section>
           
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
	<!-- template.jsp -> (복사) -> add.jsp -->

		
	
    <%@ include file="/company/pages/attendance/inc/closing.jsp" %>

</body>

</html>
