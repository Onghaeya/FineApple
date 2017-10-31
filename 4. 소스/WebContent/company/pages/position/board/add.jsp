<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% session.setAttribute("seq", 10); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="/company/pages/attendance/inc/asset.jsp" %>
	<title>SB Admin 2 - Bootstrap Admin Theme</title>
</head>

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
			<form method="POST" action="/Project/company/pages/position/board/addok.do">		<!-- 그다음일처리할 서블릿 호출/ 항상 서블릿을 호출 jsp -> jsp x  -->
			<table id="tbl" class="table table-striped" style="width:100%">
				
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" id="subject" class="form-control long" required /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea  style="height: 400px;" name="content" id="content" class="form-control long" required></textarea></td>
				</tr>
					<!-- 
					
					<th>카테고리</th>
					<td>
					<select name="pbcategory" id="pbcategory" class="form-control short" required>
					 
					 
						 <option value="21">사장</option>
						 <option value="22">부장</option>
						 <option value="23">과장</option>
						 <option value="24">사장</option>
						 <option value="25">부장</option>
						
						
					</select>
					</td>
					
				<tr>
					<th>태그</th>
				
				
					<td>
						<select name="tag" id="tag" class="form-control short">
							<option value="y">적용함</option>
							<option value="n">적용안함</option>
						</select>
					</td>
				</tr>
				<tr>3
					<th>파일</th>
					<td><input type="file" name="attach" id="attach" class="form-control" /></td>
				</tr> -->
				
				
			</table>
			<input type="hidden" name="seq" id="seq" value="${seq}">
			<div id="btns">
				<input type="button" value="돌아가기" class="btn btn-default" onclick="history.back();" />
				<input type="submit" value="글쓰기" class="btn btn-primary" />
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
