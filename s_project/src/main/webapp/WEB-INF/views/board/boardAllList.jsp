<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	border-color:#A6A6A6;
	border: 3px solid lime;
	text-align: left; 
	
}	
div {
	overflow: hidden;
	
}

</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
<div align="center">
	<table border="1">
		<colgroup>
        <col style="width:150px;" span="3">
       	
    	</colgroup>
		<tr>
			<th>번호</th> <th>id</th> <th>제목</th> <th>날짜</th>
			<th>조회수</th> <th>image_file_name</th>
		</tr>
		<c:if test="${boardList.size()==0 }">
			<tr> <th colspan="6">등록된 글이 없습니다</th> </tr>
		</c:if>
		<c:forEach items="${boardList }" var="dto">
		<tr>
			<td>${dto.writeNo }</td> <td>${dto.id }</td> 
			<td>
				<a href="${contextPath }/board/contentView?writeNo=${dto.writeNo}">
				${dto.title }
				</a>
				</td>
			<td>${dto.saveDate }</td>
			<td>${dto.hit }</td> <td>${dto.imageFileName }</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="right">
				<div align="center" font-size="50px">
				<c:if test="${num > 1 }">
					<a href="boardAllList?num=${num-1 }">
					이전
					</a>
				</c:if>
				<c:forEach var="num" begin="1" end="${repeat }">
					<a href="boardAllList?num=${num }">[${num }]</a>
				</c:forEach>
				<c:if test="${num < repeat }">
					<a href="boardAllList?num=${num + 1 }">
					다음
					</a>
				</c:if>
				</div>
			
			
				<a href="${contextPath }/board/writeForm">글작성</a>
			</td>
		</tr>
	</table>
</div>
	
	<c:import url="../default/footer.jsp"/>
</body>
</html>