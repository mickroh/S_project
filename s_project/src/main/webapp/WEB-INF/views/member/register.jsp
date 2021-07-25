<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function daumpost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 도로명 R, 지번 J
        console.log("data.userSelectedType: " + data.userSelectedType)
        console.log("data.roadAddress: " + data.roadAddress)
        console.log("data.jibunAddress: " + data.jibunAddress)
        console.log("data.zonecode(우편번호): " + data.zonecode)
        var addr="";
        if(data.userSelectedType === 'R') {
        	addr = data.roadAddress
        } else {
        	addr = data.jibunAddress
        }
        
    	$("#addr1").val(data.zonecode)
    	$("#addr2").val(addr)
        $("#addr3").focus()
        }
    }).open();
}
	function register(){
	addr1 =	$("#addr1").val()
    addr2 = $("#addr2").val()
    addr3 = $("#addr3").val()
    addr = addr1 + "/" + addr2 + "/"  + addr3
    $("#addr1").val(addr)
    fo.submit()
	}
</script>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div style="width: 300px; margin: 0 auto;">
		<form id="fo" action="register" method="post">
			<input type="text" style="vertical-align:10px" name="id" placeholder="아이디"><br>
			<input type="text" style="vertical-align:10px" name="pw" placeholder="비밀번호"><br>
			<input type="text" style="vertical-align:10px"id="addr1" name="addr" placeholder="우편번호">
			<input type="button" style="vertical-align:10px" onclick="daumpost()" value="주소검색"><br>
			<input type="text" style="vertical-align:10px" id="addr2" placeholder="주 소"> 
			<input type="text" style="vertical-align:10px" id="addr3" placeholder="상 세 주 소"><br>
			<input type="button" style="vertical-align:10px" onclick="register()" value="register">
		</form>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>