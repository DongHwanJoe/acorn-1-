<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/views/shop/insert.jsp</title>
</head>
<body>
	<script>
		alert("새 메뉴가 추가되었습니다.")
		location.href="${pageContext.request.contextPath}/shop/detail?num=${param.num }";
	</script>
</body>
</html>