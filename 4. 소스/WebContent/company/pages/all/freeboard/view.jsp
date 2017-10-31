<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	.table { width: 850px; margin-left: 11px; }
	.table { font-size: 15px; }
	#viewTable { margin-bottom: 0; margin: 0px auto; }
	#viewTable td { height: 40px; padding-left: 2px; border: 0px; }
	#viewTable #categoryTitle { border-bottom: 1px dashed #bbb; }
	#viewTable #categoryTitle span { color: #808080; font-size: 14px; margin-right: 5px; }
	#viewTable #readCountRegDate { font-size: 13px; color: #808080; } 
	#viewTable #contents div { min-height: 300px; }
	#viewTable #contents { border-top: 0; padding: 30px 5px; }
	
	#viewTable #contentFile { margin-top: 20px; }
   	#viewTable #contentFile div { margin-bottom: 5px; min-height: 0; width: 800px; }
	#viewTable #contentFile div img { max-width: 100%; }
	
	#fileTable { width: 850px; border-top: 1px solid #bbb; border-bottom: 1px solid #bbb; min-height: 100px;  }
	#fileTable td { border: 0; padding-left: 10px;}
	#fileTable #thumb { color: #333; margin-right: 10px; }
	#fileTable #thumb:hover { text-decoration: none; color: #333; }
	
	#btns { width: 850px; text-align: right; margin-left: 10px; margin-top: 10px;}
	
	.files { float: left; }
	.fileWrapper { float: left; padding: 3px; border-radius: 3px; }
	.addFileTag { display: inline-block; margin: 5px 8px; margin-right: 0px; padding: 3px; cursor: pointer; }
	.deleteFileTag { display: inline-block; margin: 5px 8px; margin-right: 0px; padding: 3px; cursor: pointer; }
	.fileTd:gt(0) { border: 1px solid red; }
	#viewTable .fa { color: gray; }
	
	a:hover { text-decoration: none; }

</style>
<script>
	window.onload = function() {
		
	};
	  
	function check() {
		if(confirm("게시물을 삭제하시겠습니까?")) {
			location.href = "/Project/all/freeboard/delete.do?seq=${dto.seq}";
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
        <div id="page-wrapper" style="padding-bottom: 50px; ">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">자유게시판</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            
			<table class="table" id="viewTable">
				<tr>
			    	<td id="categoryTitle"><span>[ ${dto.fbCategory} ]</span>${dto.title}</td><!-- 카테고리 -->
				</tr>
				<tr>
					<td id=readCountRegDate>
						<span style="padding-right: 7px; border-right: 1px solid #ccc;">${dto.name}</span>
						<span style="padding: 0px 7px 0px 5px; border-right: 1px solid #ccc;">조회 ${dto.readCount}</span>
						<span style="padding-left: 5px;">${dto.regDate}</span>
					</td>
               	</tr>
               	<tr>
                  	<td id="contents">
                  		<div>
                  			${dto.content} <!-- 순수 텍스트 내용 -->
                  			
                  			<!-- 첨부파일 -->
                  			<div id="contentFile">
	                  		<c:if test="${!empty dto.fileList}"><!-- 파일이 있다면 -->
		         			<c:forEach items="${dto.fileList}" var="file"><!-- 보여주기 -->
		         			
		         			<c:choose>
		         				<c:when test="${file.extension eq '.mp3'}"><!-- 음악일 경우 -->
		         				<div>
		         					<audio controls>
									  <source src="/Project/company/pages/all/freeboard/FBFiles/${file.fileName}" type="audio/ogg">
									  <source src="/Project/company/pages/all/freeboard/FBFiles/${file.fileName}" type="audio/mpeg">
									</audio>
								</div>
		         				</c:when>
		         				<c:when test="${file.extension eq '.mp4'}">	<!--음악일 경우-->
		         				<div>
		         					<audio controls>
										<source src="/Project/company/pages/all/freeboard/FBFiles/${file.fileName}" type="audio/ogg">
										<source src="/Project/company/pages/all/freeboard/FBFiles/${file.fileName}" type="audio/mpeg">
									</audio>
								</div>
		                  		</c:when>
		                  		<c:otherwise> <!-- 그외일경우 -->
		                  		<div>
		                  			<img src="/Project/company/pages/all/freeboard/FBFiles/${file.fileName}"></img>
		                  		</div>
		                  		</c:otherwise>
		         			</c:choose>
		         			
	                  		</c:forEach>
	                  		</c:if>	
	                  		</div>
                  		</div>
                  	</td>
            	</tr>
            </table> <!-- 첨부파일들 -->
         	<c:if test="${!empty dto.fileList}"><!-- 파일이 있다면 -->
         	<table class="table" id="fileTable">
         	<c:forEach items="${dto.fileList}" var="file"><!-- 다운 -->
				<tr>
					<td>
						<a href="/Project/company/pages/all/freeboard/FBFiles/${file.fileName}" id="thumb">${file.orgFileName}</a>
						<a href="/Project/all/freeboard/download.do?file=${file.fileName}&seq=${dto.seq}">다운받기</a>
					</td>
				</tr>
			</c:forEach>
			</table>
			</c:if>	
			<div id="btns"> <!-- 답변달기 + 수정하기 -->
				<input type="button" class="btn btn-outline btn-primary" id="reply" onclick="location.href='/Project/all/freeboard/add.do?seq=${dto.seq}'" value="답변달기">
			   	<input type="button" class="btn btn-outline btn-info" id="edit" onclick="location.href='/Project/all/freeboard/edit.do?seq=${dto.seq}';" value="수정하기">
			   	<input type="button" class="btn btn-outline btn-default" id="delete" onclick="check();" value="삭제하기">
			</div>
			
			<div style="clear: both"></div>
			
			 
	         <div id="commentWrapper">
	         	<table id="tblComment" class="table">
	         		<c:forEach items="${clist}" var="cdto">
					<tr>
						<td>${cdto.name}<br>${cdto.regDate}</td>
						<td>${cdto.comments} <span style="float: right; cursor: pointer;" class="fa fa-times" onclick="del(${cdto.seq})"></span></td>
					</tr>
					</c:forEach>
	         	
	         	</table>
	         	
	         
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

    <!-- Custom Theme JavaScript -->
    <script src="/Project/company/dist/js/sb-admin-2.js"></script>
    
    

</body>

</html>
