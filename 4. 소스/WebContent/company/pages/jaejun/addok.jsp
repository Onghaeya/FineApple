<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	h3{
		margin: 0px; margin-top: 15px;
	}
</style>
<script>

</script>
</head>

<body>
	<div id="main">
		<section>
			<c:if test="${rresult == 1}">
				<c:if test="${readEmployeeNum != num}">
				<script>
					<!-- script의 location.href은 Get방식임, 주소표시줄 변경됨 -->
					alert("${nameresult}(${readEmployeeNum})님께 쪽지를 보냈습니다.")
					location.href = "/Project/message/inboxsent.do";
				</script>
				</c:if>
				<c:if test="${readEmployeeNum == num}">
				<script>
					<!-- script의 location.href은 Get방식임, 주소표시줄 변경됨 -->
					location.href = "/Project/message/inboxsent.do";
				</script>
				</c:if>
				
				<%-- <jsp:forward page=""> 는 Post방식임, 주소표시줄에 변경없음 --%>
				<%-- <jsp:forward page="/message/inbox.do"></jsp:forward> --%>
			</c:if>
			<c:if test="${rresult == 0}">
				<script>
					alert("수신하는 ID가 존재하지 않거나 탈퇴 또는 휴면상태인 회원입니다.")
					history.back();
				</script>
			</c:if>
		</section>
	</div>
</body>
</html>


