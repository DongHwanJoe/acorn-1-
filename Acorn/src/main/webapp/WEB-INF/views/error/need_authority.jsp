<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/error/info.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/error.css">
</head>
<body class="text-center">
	<div class="container">
		<img src="${pageContext.request.contextPath}/resources/images/access_denied.png" alt="" />
		<br />
		<br />
		<br />
		<h3>관리자 권한이 필요한 페이지 입니다</h3>
		<br />
		<a class="btn btn-outline-warning" href="${pageContext.request.contextPath}">HOME PAGE</a>
	</div>
</body>
</html>