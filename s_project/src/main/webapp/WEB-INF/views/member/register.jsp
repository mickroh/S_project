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
    alert('회원가입이 성공적으로 완료되었습니다')
    
    
	}
	$(function(){
	    $('#userPw').keyup(function(){
	      $('#chkNotice').html('');
	    });

	    $('#userPwChk').keyup(function(){

	        if($('#userPw').val() != $('#userPwChk').val()){
	          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
	          $('#chkNotice').attr('color', '#f82a2aa3');
	        } else{
	          $('#chkNotice').html('비밀번호 일치함<br><br>');
	          $('#chkNotice').attr('color', '#199894b3');
	        }

	    });
	});
	
</script>
</head>
<style>
.v-align{
	vertical-align:10px;
}
.regibutton{
	vertical-align:10px;
	width:175px;
	color:#FFFFFF;
	background-color:#03C75A;
	padding: 15px 30px;
	margin: 4px 2px;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 16px;
}
#btnjoin {
    border: none;
    outline:none;
}
.addsearch{
	color:#FFFFFF;
	background-color:#03C75A;
	vertical-align:10px;
}
</style>
<body>
	<c:import url="../default/header.jsp" />
	<div style="width: 300px; margin: 0 auto;">
		<form id="fo" action="register" method="post" style="vertical-align:10px">
			<input type="text"  class="v-align" name="id" placeholder="아이디"><br>
			<input type="password" class="v-align" id="userPw" name="pw"  placeholder="비밀번호"><br>
			<input type="password" class="v-align" id="userPwChk" name="pw"  placeholder="비밀번호 재확인"><br>
			<font id="chkNotice" size="2"></font><br>
			<input type="text" class="v-align" id="addr1" name="addr" placeholder="우편번호">
			<input type="button" id=btnjoin class="addsearch" onclick="daumpost()" value="주소검색"><br>
			<input type="text" class="v-align" id="addr2" placeholder="주 소"> 
			<input type="text" class="v-align" id="addr3" placeholder="상 세 주 소"><br>
			<input type="button" id=btnjoin class="regibutton" onclick="register()" value="가입하기">
		</form>
	</div>
	
	<c:import url="../default/footer.jsp" />
	</div>
</body>
</html>