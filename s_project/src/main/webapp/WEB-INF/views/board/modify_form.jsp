<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function readURL(input){
		var file = input.files[0] //파일에 대한 정보
		if(file != ''){
			var reader = new FileReader();
			reader.readAsDataURL(file) //파일의 정보를 토대로 파일을 읽어옴
			reader.onload = function(e){ //파일(이미지) 표현
				$("#preview").attr('src', e.target.result)
			}
		}		
	}
</script>

</head>
<body>

<c:import url="../default/header.jsp"/>
<div style="width:300px; margin: 0 auto;">
	<form action="${contextPath }/board/modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="writeNo" value="${personalData.writeNo }">
		<input type="hidden" name="originFileName" value="${personalData.imageFileName }">
		제목 : <input type="text" size="30" name="title" value="${personalData.title }"><hr>
		내용 <textarea rows="5" cols="30" name="content">${personalData.content }</textarea>
		<hr>
		
			<img width="200px" height="100px" id="preview" alt="이미지가 존재하지 않습니다"
			src="${contextPath }/board/download?imageFileName=${personalData.imageFileName }">	
		
		<input type="file" name="imageFileName" onchange="readURL(this)">
		<hr>
		<input type="submit" value="수정하기">
		<input type="button" onclick="history.back()" value="이전으로 이동">
	</form>

</div>
<c:import url="../default/footer.jsp"/>

</body>
</html>