<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page Title</title>
<style>

	h3{
		margin: 0px; margin-top: 15px;
	}
</style>
<c:if test="${boardnum == 1}">
	<script>
		alert("삭제가 완료되었습니다.");
		location.href="/Project/message/inbox.do";
	</script>
</c:if>
<c:if test="${boardnum == 2}">
	<script>
		alert("삭제가 완료되었습니다.");
		location.href="/Project/message/inboxsent.do";
	</script>
</c:if>
<c:if test="${boardnum == 3}">
	<script>
		alert("삭제가 완료되었습니다.");
		location.href="/Project/message/inboxsave.do";
	</script>
</c:if>
</head>

<body>

</body>
</html>


