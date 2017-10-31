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
<style>
#tbl th, #tbl td { text-align: center; height:34;}
#tbl td:nth-child(2) { text-align: left; }
#tbl .short { width: 20%; }
#tbl #content { height: 300px; }
#a div {margin:0; padding: 0; float:left;width:400px;height:34px;}
#a div input {margin:0;padding:0;width:100px;height:34px;}
</style>
<style>

#tbl{
}

#tbl th{
width:150px;
text-align:right;
}

#tbl td{
width:550px;
}

.short { width: 100px; }
.shorts { width: 500px; }

#title #content{height: 50px; }

</style>
<script>

$(document).ready(function(){
	
	
});
</script>


    <!-- Bootstrap Core CSS -->
    <link href="/Project/company/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/Project/company/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

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
                        <h1 class="page-header">회원가입 <small>정보입력하세요.</small></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <!-- 테이블 내용 -->
                    


<div id="main">
<%-- <%@include file="../inc/header.jsp" %> --%>
<div id="mcontent">
<!--register.jsp:회원 가입 폼  -->
<h2 id="title">나의 정보</h2>
<form method="post"action="registerok.jsp"enctype="multipart/form-data">
<table id="tbl"class="table">
<tr>
<th>이름</th>
<td><input type="text"name="name"id="name"required class="form-control short" value="룰루라"></td>
</tr>

<tr>
<th>주민번호</th>

	<td>
		<input type="text" name="jumin" class="form-control short" style="display:inline;" value="123765">-
	   <input type="password" name="jumin_2" class="form-control short" style="display:inline;" value="8766575">
	</td>
</tr>

<tr>
<th>암호</th>
<td><input type="password"name="pw"id="pw"required class="form-control short" value="1111"></td>
</tr>

<tr>
<th>전화번호</th>
<td><input type="text"name="cel1"class="form-control short" style="display:inline;" value="010"> -
               <input type="text" name="cel2_1" title="전화번호"class="form-control short" style="display:inline;" value="2345" > -
               <input type="text" name="cel2_2"class="form-control short" style="display:inline;" value="5463">
</td>
</tr>

<tr>
<th>이메일</th>
<td> <input type='text' name="email" class="form-control short" style="display:inline;" value="yh" >@
            <input type='text' name="email_dns" class="form-control short" style="display:inline;">
              <select name="emailaddr">
                 <option value="">직접입력</option>
                 <option value="daum.net">daum.net</option>
                 <option value="empal.com">empal.com</option>
                 <option value="gmail.com">gmail.com</option>
                 <option value="hanmail.net">hanmail.net</option>
                 <option value="msn.com">msn.com</option>
                 <option value="naver.com">naver.com</option>
                 <option value="nate.com">nate.com</option>
              </select>
</td>
</tr>

<tr>
<th>입사일</th>
<td><input type="date"name="firstDate"id="firstDate"required class="form-control shorts" value="11"></td>
</tr>

<tr>
<th>퇴사일</th>
<td><input type="date"name="endDate"id="endDate"required class="form-control shorts" value="11"></td>
</tr>

<tr>
<th>연봉</th>
<td><input type="text"name="payment"id="payment"required class="form-control short" value="50000000"></td>
</tr>




<tr>
<th>비밀번호 힌트</th>
<td><input type="text"name="pwHint"id="pwHint"required class="form-control shorts" value="친한 친구 이름"></td>
</tr>

<tr>
<th>비밀번호 힌트 정답</th>
<td><input type="text"name="pwAnswer"id="pwAnswer"required class="form-control shorts" value="아무게"></td>
</tr>

<tr>
<th>성별</th>
<td><select name="gender">
		<option value="남자">남자</option>
		<option value="여자">여자</option></select></td>
</tr>

<tr>
<th>담당전화번호</th>
<td><input type="text"name="phone1"class="form-control short" style="display:inline;" value="02"> -
               <input type="text" name="phone2_1" title="전화번호"class="form-control short" style="display:inline;" value="654" > -
               <input type="text" name="phone2_2"class="form-control short" style="display:inline;" value="7890"></td>
</tr>

<tr>
<th>프로필 사진</th>
<td><input type="file"name="profilePic"id="profilePic"class="form-control shorts" ></td>
</tr>

<tr>
<th>담당업무</th>
<td><select name="departmentSeq"class="form-control short">

		<option value="1">개발부</option>
		<option value="2">인사부</option>
		<option value="3">총무부</option>
		<option value="4">영업부</option></select></td>
</tr>

<tr>
<th>급여지급은행</th>
<td><input type="text"name="bank"id="bank"required class="form-control short" value="국민은행"></td>
</tr>

<tr>
<th>계좌번호</th>
<td><input type="text"name="bankAccount"id="bankAccount"required class="form-control shorts" value="1"></td>
</tr>

<tr>
<th>직급번호</th>
<td><input type="number"name="positionSeq"id="positionSeq"required class="form-control short" value="1"></td>
</tr>











</table>
<div id="btns">
<input type="button"value="돌아가기"
onclick="location.href='../index.jsp';"class="btn btn-default">
<input type="submit"value="가입하기"class="btn btn-info">
</div>

</form>


</div>
</div>

				
                    
                    
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
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
