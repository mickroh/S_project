<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<c:import url="../default/header.jsp"/>
	<div align="center">
		<font size="5"><b>회 원 정 보</b></font>
		<table  class="table table-bordered">
			<tr><th>id</th> <th>pw</th> <th>addr</th></tr>
			<c:forEach var="dto" items="${memberList }">
				<tr>
					<td>
						<a href="info?id=${dto.id }">
							${dto.id }
						</a>
					</td>
					<td>${dto.pw }</td>
					<td>${dto.addr }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
<c:import url="../default/footer.jsp"/>
	
</body>
</html>







