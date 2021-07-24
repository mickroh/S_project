<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div align="center" >
		<h1 style="color:black; font-size:60px; font-family:Gabriola;">
			<h1>로그인 성공(${loginUser}님 환영합니다)</h1>
		<!-- nbsp = 공백 --> 
		</h1>
	</div>
	
	<c:import url="../default/footer.jsp"/>
</body>
</html>