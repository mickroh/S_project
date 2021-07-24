<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		ul li{	display:inline;	padding:0 10px; }
	</style>
</head>
<body>
	<div align="center" >
		<h1 style="color:burlywood; font-size:60px; font-family:Gabriola;">
			CARE &nbsp; LAB
		</h1>
	</div>
	<div align="right">
		<hr>
		<ul>
			<li><a href="/root/index">HOME</a></li>
			<li>
					<a href="/root/member/memberInfo">회원정보</a>
					</li>
			<li>
			<li>
					<a href="/root/board/boardAllList">게시판</a>
					</li>
			<li>
				<c:if test="${loginUser != null}">
					<a href="/root/member/logout">로그아웃</a>
				</c:if>
				<c:if test="${loginUser == null}">
					<a href="/root/member/login">로그인</a>
				</c:if>
			</li>
		</ul>
		<hr>
	</div>
</body>

</html>