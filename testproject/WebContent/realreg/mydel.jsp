<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mycss.css">
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<div class="deld">
<form method="post" class="del" name="delet"action="delback.jsp">
	<nav class="delti"><p>회원탈퇴를 하시려면 비밀번호를 입력해주세요.</p></nav>
	<table>
	<tr>
	<td><input name="delpw" type="password"></td>
	<td><input class="btn" type="submit"></td>
	</tr>
	</table>
</form>
</div>
</body>
</html>
