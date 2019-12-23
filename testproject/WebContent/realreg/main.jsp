<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>회원가입 메인</title>
<link rel="stylesheet" href="mainreg.css">
<script type="text/javascript"> 
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 )
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9a-z]/g, "");
}function onlyNumeng(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)  || (keyID >= 65 && keyID <= 90) || keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 )
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9a-z]/g, "");
}
	function checkValue()
  {
    if (!document.mainreg.ID.value){
      alert("아이디를 입력해주세요")
      return false;
    }
    if (!document.mainreg.PASS.value) {
      alert("비밀번호를 입력해주세요")
      return false;
    }
    if (!document.mainreg.PASSRE.value) {
        alert("비밀번호 확인을 입력해주세요")
        return false;
      }
    if (!document.mainreg.NAME.value) {
        alert("이름을 입력해주세요")
        return false;
      }
    if (!document.mainreg.PN.value) {
        alert("전화번호를 입력해주세요")
        return false;
      }
    if (!document.mainreg.EMAIL.value) {
        alert("이메일를 입력해주세요")
        return false;
      }
    if (!document.mainreg.bday.value) {
        alert("생년월일을 입력해주세요")
        return false;
      }
    if (document.mainreg.PASS.value != document.mainreg.PASSRE.value) {
      alert("비밀번호가 일치하지않습니다")
      return false;
    }	
  }
  </script>
</head>
<body>
<div class="main1">
<form method="post" action="ckid.jsp" name="mainreg" onsubmit="return checkValue()">
  <h3>jsp게시판 회원가입</h3>
    <table>
      <tr>
        <td class="ti">아이디</td>
    <td><input class="int" type="text" name="ID" value="" placeholder="제발 영어랑 숫자만 입력해주세요" onkeydown='return onlyNumeng(event)' onkeyup='removeChar(event)'></td>
      </tr>
      <tr>
        <td class="ti">비밀번호</td>
        <td><input class="int" type="password" name="PASS" value=""></td>
      </tr>
      <tr>
        <td class="ti">비밀번호 확인</td>
        <td><input class="int" type="password" name="PASSRE" value=""></td>
      </tr>
      <tr>
        <td class="ti">이름</td>
        <td><input class="int" type="text" name="NAME" value=""  placeholder="제발 한글만입력해주세요" pattern="[ㄱ-ㅎㅏ-ㅣ가-힣]*" title="한글로입력해주세요"></td>
      </tr>
      <tr>
        <td class="ti">생일</td>
        <td><input class="int" type="date" name="bday" min="1900-01-01" max="2112-12-31"></td>
      </tr>
      <tr>
        <td class="ti">휴대폰</td>
        <td><input class="int" type="text" name="PN" value=""  placeholder="제발 숫자만 입력해주세요" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
      </tr>
      <tr>
        <td class="ti">이메일</td>
        <td><input class="int" type="email" name="EMAIL" value="" placeholder="제발 영어랑 숫자만 입력해주세요"></td>
      </tr>
    </table>
      <td><input style="margin-left: 135px;" class="btn1" type="submit" name="submit"></td>

</form>
</div>
</body>
</html>
