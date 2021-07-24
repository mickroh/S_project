<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../default/header.jsp"/>
	<div align="right">
	<form action="user_check" method="post">
		<input type="text" name="id" placeholder="input id"><br>
		<input type="text" name="pw" placeholder="input password"><br>
		<input type="submit" name="" value="로그인">
		<a href="register_form">회원가입</a><br>
		<input type="checkbox" name="autoLogin">
		로그인 유지
	</form>
	</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>