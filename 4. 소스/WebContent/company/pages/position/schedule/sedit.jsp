<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			
			
			<form method="POST" action="/Project/company/pages/position/seditok.do">		<!-- 그다음일처리할 서블릿 호출/ 항상 서블릿을 호출 jsp -> jsp x  -->
			<table id="tbl" class="table table-striped" style="width:100%">
				
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" id="subject" class="form-control long" required value="${dto.subject}"/></td>
				</tr>
					
				<tr>
					<th>카테고리</th>
					<td>
					<select name="scategorySeq" id="scategorySeq" class="form-control short" required value="${dto.categorySeq}">
					 <option value="">-- 카테고리 선택 --</option>
						
						 <option value="21">회의</option>
						 <option value="22">업무</option>
						 <option value="23">행사</option>
						 <option value="24">기타</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<th>대상 직원</th>
					<td>
					<select name="positionSeq" id="positionSeq" required class="form-control short" >
					<option value="4">-- 사원 --</option>
					 
						 <option value="1">사장</option>
						 <option value="2">부장</option>
						 <option value="3">과장</option>
					</select>
					
					
					</td>
				</tr>
				<tr>
					<th>장소</th>
					<td><textarea  name="place" id="place" class="form-control long" required >${dto.place}</textarea></td>
				</tr>
				
				<!-- <script>
				window.onload=function() {
				    alert("로딩완");


					function time(){
						if(document.frm1.startDate > document.frm1.endDate)
							startDate.value==default;
							alert("올바른 시간을 입력해주세요!!")
					}
				
				}
					
					</script> -->
				
				<tr>
				<th>시작시간    :  ${dto.startDate}</th>
					<td>
					<input type = "text" value = "${dto.startDate}" name = "startDate" id="startDate" class="form-control short" required />
					 
					
					</td>
				</tr>
				<tr>
				<th>끝시간 ('xxxx-xx-xx xx:xx:xx')</th>
					<td>
					<input type = "text" value = "${dto.endDate}" name = "endDate" id="endDate" class="form-control short" required />
					</td>
				</tr>
					 
					
				<tr>
					<th>내용</th>
					<td><textarea  style="height: 400px;" name="content" id="content" class="form-control long" required >${dto.content}</textarea></td>
				</tr>
				<tr>
					<th>공개여부</th>
					<td><input type="checkbox" name="open" id = "open" >허용</td>
				

				</tr>
				<tr>
					<th>알람설정</th>
					<td>

					<select name="alarm" id="alarm" class="form-control short" >
					 
					 <option value="0">-- 알람없음 --</option>
					 
						 <option value="1">1시간 전</option>
						 <option value="2">2시간 전</option>
						 <option value="3">3시간 전</option>
						 <option value="4">5시간 전</option>
						 <option value="5">10시간 전</option>
						 <option value="6">1일 전</option>
						 <option value="7">2일 전</option>
						 <option value="8">7일 전</option>
					</select>
					</td>
				</tr>

				

<!-- <tr>
					<th>태그</th>
					<td>
						<select name="tag" id="tag" class="form-control short">
							<option value="y">적용함</option>
							<option value="n">적용안함</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>파일</th>
					<td><input type="file" name="attach" id="attach" class="form-control" /></td>
				</tr> -->
				
				
			
			</table>
			<div id="btns">
				<input type="button" value="돌아가기" class="btn btn-default" onclick="history.back();" />
				<input type="submit" value="수정하기" class="btn btn-primary" />
			</div>
			<!-- 수정할 글 번호 -->
			<input type="hidden" name="seq" value="${dto.seq}">
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
