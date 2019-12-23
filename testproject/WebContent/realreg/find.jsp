<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mycss.css">
<meta charset="UTF-8">
<title>계정 찾기</title>
</head>
<body>
<div class="findid">
<h3>아이디 찾기</h3>
<p>이름과 이메일을 입력해주세요</p>
<form  method="post" name="findid" action="idfback.jsp">
<table class="fiad">
  <tr>
	<td>이름</td>
	<td><input type="text" name="findname" value=""></td>
  </tr>
  <tr>
	<td>이메일</td>
	<td><input type="email" name="findemail" value=""></td>
  </tr>
</table>
	<input class="fibtn" value="아이디 찾기" type="submit">
</form>
</div>
<div class="findpw">
<h3>비밀번호 찾기</h3>
<p>아이디와 이름을 입력해주세요</p>
<form method="post" name="findpw" action="pwfback.jsp">
<table class="fiad">
  <tr>
	<td>아이디</td>
	<td><input type="text" name="findid" value=""></td>
  </tr>
  <tr>
	<td>이메일</td>
	<td><input type="email" name="findemail" value=""></td>
  </tr>
</table>
	<input class="fibtn" value="비밀번호 찾기" type="submit">
</form>
</div>
</body>
</html>
