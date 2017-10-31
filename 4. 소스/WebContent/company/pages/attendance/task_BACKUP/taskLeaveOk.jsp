<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="/company/pages/attendance/inc/asset.jsp" %>
	<title>Fine Apple</title>
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
					<!-- AddOk.java 에서 지정한 속성을 그대로 꺼내 씀 -->
					<c:if test="${result==1}">
						<script>
							alert('${name} ${position}, 안녕히가십시오');
							location.href = "/Project/index.do";
						</script>
					</c:if>
					<c:if test="${result==0}">
						<script>
						alert('출근을 먼저 해주세요.');
						history.back();
						</script>
					</c:if>
				</section>
           
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <%@ include file="/company/pages/attendance/inc/closing.jsp" %>

</body>

</html>
