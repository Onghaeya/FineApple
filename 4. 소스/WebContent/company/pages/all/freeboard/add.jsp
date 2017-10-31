<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

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

<!-- 스마트 에디터 -->
<script type="text/javascript" src="/Project/smarteditor/workspace/js/service/HuskyEZCreator.js" charset="utf-8"></script>

 <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
 <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
 <!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
 <![endif]-->
<style>
   .table { width: 800px; border: 0px solid red; margin-left: 11px; }
   #addTable { margin-bottom: 0; }
   #addTable #FBCategory { height: 30px; width: 100px; padding: 5px; }
   #addTable td:first-child, #fileTable td:first-child { border-top: 0px; }
   #addTable #title { width: 759px; }
   #fileTable { float: left; width: 400px; }
   #btns { width: 300px; text-align: right; padding-right: 20px; float: left; margin-left: 48px; margin-top: 5px; }
   
   .files { float: left; }
   .fileWrapper { float: left; border: 1px solid #ccc; padding: 3px; border-radius: 3px; }
   .addFileTag { display: inline-block; margin: 5px 8px; margin-right: 0px; padding: 3px; cursor: pointer; }
   .deleteFileTag { display: inline-block; margin: 5px 8px; margin-right: 0px; padding: 3px; cursor: pointer; }
   .fileTd:gt(0) { border: 1px solid red; }
   #fileTable .fa { color: gray; }
   
</style>
<script>
	window.onload = function() {
		$(".fileTd:gt(0)").css("display", "none");
		$('#file2, #file3').attr("disabled", true);
	};
	  
	function addFile() {
 	  
		//2번째 파일이 숨겨져 있다면
		if($("#fileTd2").css("display") == ("none")) {
			$("#fileTd2").css("display", "block"); //보이게하고
			$("#file2").attr("disabled", false); //disabled는 false로
			
		//세번째 파일이 숨겨져 있다면	
		} else if($("#fileTd3").css("display") == ("none")) {
			$("#fileTd3").css("display", "block");
			$("#file3").attr("disabled", false);
		} else {
			alert('파일은 최대 3개까지 업로드 가능합니다.');
		}
 	  
   }
   
	function deleteFile(filename) {
		event.srcElement.parentElement.style.display = "none";	
		$("#" + filename).attr("disabled", true);
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
                        <h1 class="page-header">글쓰기</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            
            <form name="frm" id="frm" action="/Project/all/freeboard/addok.do" method="post" accept-charset="utf-8" enctype="multipart/form-data">
            <table class="table" id="addTable">
               <tr>
                  <td> <!-- 카테고리 -->
                     <select name="FBCategory" id="FBCategory" name="FBCategory" class="form-control">
                        <c:forEach items="${categoryList}" var="category">
                     <option value="${category.seq}">${category.name}</option> 
                     </c:forEach>                 
                     </select>
                  </td>
               </tr>
               <tr>
                  <td> <!-- 제목 -->
                   <input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력하세요" required>
                    </td>
               </tr>
               <tr>
                  <td> <!-- content -->
                  <textarea name="content" id="content" rows="15" cols="105"></textarea>          
               </td>
            </tr>
            
         </table> <!-- 첨부파일들 -->
         <table class="table" id="fileTable">
         	<tr>
               <td class="fileTd" id="fileTd1">
                  <div class="fileWrapper">
                     <input type="file" name="files1" id="file1" class="files">
                  </div>
                  <span class="fa fa-plus addFileTag" id="addFileTag1" onclick='addFile();'></span>
                  <div style="clear:both;"></div>
               </td>
            </tr>
            <tr>
               <td class="fileTd" id="fileTd2">
                  <div class="fileWrapper">
                     <input type="file" name="files2" id="file2" class="files">
                  </div>
                  <span class="fa fa-minus deleteFileTag" onclick="deleteFile('file2');"></span>
                  <div style="clear:both;"></div>
               </td>
            </tr>
            <tr>
               <td class="fileTd" id="fileTd3">
                  <div class="fileWrapper">
                     <input type="file" id="file3" name="files3" class="files">
                  </div>
                  <span class="fa fa-minus deleteFileTag" onclick="deleteFile('file3');"></span>
                  <div style="clear:both;"></div>
               </td>
            </tr>
         </table>
         <div id="btns"> <!-- 전송버튼 -->
            <input type="submit" class="btn btn-outline btn-info" id="send" onclick="submitContents();" value="등록하기">
         </div>
         </form>
         <div style="clear: both"></div>
         <%@include file="/company/inc/texteditor.jsp" %>
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
    
    

</body>

</html>
