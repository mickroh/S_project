<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<div style="width:400px; margin: 0 auto;">
	<h1> 글 쓰 기 </h1>
<form action="${contextPath }/board/writeSave" method="post"
									enctype="multipart/form-data">
	<b>작성자</b>
	<input type="text" name="id" value="${loginUser }" readonly>
	<hr>
	<b>제 목</b> <br> <input type="text" size="50" name="title"> <hr>
	<b>내 용</b><br>
	<textarea rows="10" cols="50" name="content"></textarea>
	<b>이미지파일 첨부</b>
	<input type="file" name="image_file_name" onchange="readURL(this)">
	<img id="preview" src="#" width="100px" height="100px">
	<hr>
	<input type="submit" value="글쓰기">
	<input type="button" value="목록이동"
	 onclick="location.href='${contextPath }/board/boardAllList'">

</form>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>