<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Message | Fine Apple</title>
<style>
	#table th:NTH-CHILD(1) { width: 30px; }
	#table th:NTH-CHILD(2) { width: 520px; }
	#table th:NTH-CHILD(3) { width: 100px; }
	#table th:NTH-CHILD(4) { width: 134px; }
	#table th:NTH-CHILD(5) { width: 135px; }
	#table td, #table th {
		text-align: center;
		vertical-align: middle;
	}
	#table tr td:NTH-CHILD(2) {
		text-align: left;
	}
	
	#headerInbox {
		border: 0px solid red;
		vertical-align: middle;
	}
	.btns {
		border: 0px solid red;
		margin: 0px 15px;
		display: inline;
		float: right;
	}
</style>
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
<script>

function MsgboxMove() {
	if ($(MsgboxSel).val() == 1){
		location.href="/Project/message/inbox.do";
	} else if ($(MsgboxSel).val() == 2) {
		location.href="/Project/message/inboxsent.do";
	} else if ($(MsgboxSel).val() == 3) {
		location.href="/Project/message/inboxsave.do";
	}
}

var cbAll, cbs;
var btnSend;

window.onload = function(){
	cbAll = document.all.cbAll;
	cbs = document.all.cbs;
	btnSend = document.all.btnSend;
	
	cbAll.onchange = function(){
		if(cbAll.checked) {
			//하나일때 선택
			if (cbs.length == undefined) {
				cbs.checked = true;
			}
			//전부 선택
			for(var i=0; i<=cbs.length; i++) {
				cbs[i].checked = true;
			}
		} else {
			//하나일때 해제
			if (cbs.length == undefined) {
				cbs.checked = false;
			}
			//전부 해제
			for(var i=0; i<=cbs.length; i++) {
				cbs[i].checked = false;
			}
		}
	};
}

function save() {
	if ($(".cbs:checked").length != 0) {
		$("#form").attr("action", "/Project/message/save.do");
		$("#form").submit();
	} else {
		alert("체크된 쪽지가 없습니다.")
	}
}

function del() {
	if ($(".cbs:checked").length != 0) {
		if (confirm("삭제하시면 복구할수 없습니다.\n정말 삭제하시겠습니까?")) {
			$("#form").attr("action", "/Project/message/del.do");
			$("#form").submit();
		}
	} else {
		alert("체크된 쪽지가 없습니다.")
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

        <div id="page-wrapper">
            <div class="row">
                <div id="headerInbox" class="col-lg-12">
                    <h1 class="page-header">보낸쪽지함 <span style="font-size: 0.5em">총 쪽지 개수: ${slist.size()}개</span></h1>
                <!-- /.col-lg-12 -->
	            </div>
            </div>
            <!-- /.row -->
            
            <div class="row" style="position: relative;">
            	<div style="position: absolute; top: -60px; left: 730px;">
            		<select name="MsgboxSel" id="MsgboxSel" style="height: 30px;">
            			<option value="1">받은쪽지함</option>
            			<option value="2" selected="selected">보낸쪽지함</option>
						<option value="3">쪽지보관함</option>
            		</select>
            		<input type="button" value="이동하기" style="height: 30px;" onclick="MsgboxMove();"/>
            	</div>
            </div>
            <!-- /.row -->
            
            <div class="row">
            	<form id="form" method="post" action="/">
	                <div class="col-lg-12">
	                	<div style="color: #2F73C0; margin-bottom: 10px;">* 쪽지는 100일 후 자동 삭제됩니다. 중요한 쪽지는 보관함에 저장하세요.<br>* 수신자가 쪽지를 확인하기 전에 보낸 쪽지를 삭제하면 발송취소가 됩니다.</div> 
		                <table width="100%" id="table" class="table table-striped table-bordered table-hover" id="dataTables-example">
		                    <thead>
		                        <tr>
		                            <th><input type="checkbox" name="cbAll"/></th>
		                            <th>제목</th>
		                            <th>받는사람</th>
		                            <th>보낸시간</th>
		                            <th>읽은시간</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    	<c:forEach items="${slist}" var="dto">
		                        <tr class="odd">
		                            <td><input type="checkbox" name="cbs" class="cbs" value="${dto.sseq}"/></td>
		                            
		                            <c:if test="${dto.readDate == null}">
		                            <td><a href="/Project/message/view.do?sseq=${dto.sseq}&rseq=${dto.rseq}" style="font-size: 1.2em;">${dto.title}</a></td>
		                            </c:if>
		                            <c:if test="${dto.readDate != null}">
		                            <td><a href="/Project/message/view.do?sseq=${dto.sseq}&rseq=${dto.rseq}" style="color: #8F8F8F;">${dto.title}</a></td>
		                            </c:if>
		                            
		                            <c:if test="${dto.readEmployeeNum == num}">
		                            <td style="font-size: 0.8em; color: #8F8F8F;">내게쓴쪽지</td>
		                            </c:if>
		                            <c:if test="${dto.readEmployeeNum != num}">
		                            <td>${dto.addedreadEmployeeName}(${dto.readEmployeeNum})</td>
		                            </c:if>
		                            
		                            <td>${dto.sentDate}</td>
		                            <c:if test="${dto.readDate != null}">
		                            <td>${dto.readDate}</td>
		                            </c:if>
		                            <c:if test="${dto.readDate == null}">
		                            <td>읽지않음</td>
		                            </c:if>		                            
		                        </tr>
		                        </c:forEach>
		                    </tbody>
		                </table>
	                </div>
	                
	                <div class="btns" style="float: left;">
			            	<input type="button" class="btn btn-success" value="보관하기" onclick="save();"/>
				            <input type="button" class="btn btn-danger" value="삭제하기" onclick="del();"/>
			        </div>
			        <input type="hidden" name="boardnum" value="2" />
			    </form>
		        
	            <div class="btns" style="float: right;">		            
		            <input type="button" class="btn btn-info" value="쪽지쓰기" onclick="location.href='/Project/message/add.do';"/>
		            <input type="button" class="btn btn-default" value="환경설정" onclick="location.href='/Project/message/setting.do';"/>
		        </div>
		           
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
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

    <!-- DataTables JavaScript, 여기에 페이지 다 있음 -->
    <script src="/Project/company/vendor/datatables/js/jquery.dataTables.js"></script>
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