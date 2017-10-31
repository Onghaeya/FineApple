<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

	<%@ include file="/company/pages/attendance/inc/asset.jsp" %>
	<title>SB Admin 2 - Bootstrap Admin Theme</title>

</head>

<style>

/* 카테고리 옵션 */
#category {
	width: 10%;
	text-align-last: center;
	float: left;
	margin-right: 20px;
}
/* 제목입력 폼 옵션 */
#subject {
	width: 70%;
	margin-bottom: 20px;
	display: inline;
}

/* 첨부파일 추가 버튼 */
#addFile {
	display: inline;
	float: right;
}
/* 첨부파일 목록 박스 */
#file-div {
	margin-top: 20px;
}

#addFile {
	
}



</style>








<body>

    <div id="wrapper">
    
		<%@ include file="/company/pages/attendance/inc/navigation.jsp" %>

            

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
               <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
		<form method="post" action="/Project/attendance/bbsAddOk.do" enctype="multipart/form-data">
           <!-- 카테고리, 제목, 첨부파일 추가 -->
           <div class="row">
				<select class="form-control" name="category" id="category">
				    <option value="2">일반</option>
				    <option value="3">질문</option>
				    <option value="4">건의</option>
				    <option value="1">공지</option>
				</select>           
				<input class="form-control" placeholder="게시글 제목을 입력하세요" name="subject" id="subject">
				
				
				<button type="button" class="btn btn-success" id="addFile">파일 추가</button>
				
				
           </div>
			<!-- /.row -->           
			
			<!-- 에디터 -->
	       <div class="row">
				<%@ include file="/company/pages/attendance/inc/bbsEditor.jsp" %>
           </div>
           	<!-- <div class="row">
				<textarea name="content" id="content" class="form-control" style="min-height: 500px;"></textarea>
			</div> -->
			
			<!-- 첨부파일 폼 -->
			<div class="row" id="fileForm"></div>	
					
			
			<!-- 확인버튼 -->
			<div class="row">
				<button type="submit" class="btn btn-warning btn-circle btn-lg" style="margin:20px 50%;"><i class="fa fa-check"></i>
				</button>
			</div>
		</form>


      



          
	       </div>
	       <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    
	<%@ include file="/company/pages/attendance/inc/closing.jsp" %> 
    

</body>

<script>
 	<!-- 에디터를 클릭하면, 자동 포커스 -->
	$('#editor').click(function() { $('#editor > div.ql-editor.ql-blank').focus(); });
	$('#editor').click(function() { $('#editor > div.ql-editor').focus(); });

	<!-- 에디터에 name, id 부여 -->
	$('#editor > div.ql-editor.ql-blank').attr('id', 'content');
	$('#editor > div.ql-editor.ql-blank').attr('name', 'content');
 
	/* 동적 첨부파일추가/삭제 */	
	$(function(){
		$('#addFile').click(addFileForm);
		$(document).on('click', '.deleteFile', function(event) {
			$(this).parent().remove();
		});
	});
	var count = 0;
	function addFileForm() {
		var html = "<div id='item_"+count+"'>";
		html += "<input type='file' name='fileup[]' />";
		html += "<button class='deleteFile'>삭제</button></div>";
		count++;
		$("#fileForm").append(html);
	}
	
	
	

	
	
</script>

<script>

</script>







</html>
