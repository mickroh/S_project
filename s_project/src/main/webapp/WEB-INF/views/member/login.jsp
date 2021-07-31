<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
// 비밀번호 표시 숨기기 기능
$("#key").keyup(function() {
        
    });
</script>
</head>
<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  
}
.buttoncolor{
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
}
.buttoncolor:hover{
	background-color: #4CAF50;
	color:white;
}
.testbutton{
	font-size: 15px;
}

</style>
<body>
<c:import url="../default/header.jsp"/>
	<div align="right">
	<form action="user_check" method="post">
		<input type="text" class="testbutton" name="id" placeholder="아이디"><br>
		<input autocomplete="false" type="password" class="testbutton" name="pw" id="key" placeholder="비밀번호"/>
		<br>
		<input type="submit" class="button buttoncolor" name="" value="로그인">
		<a href="register_form">회원가입</a><br>
		<input type="checkbox" name="autoLogin">
		<b> 로그인 상태 유지 </b> <br>
		



	</form>
	</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>