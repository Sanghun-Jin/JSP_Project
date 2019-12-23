<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = (String)session.getAttribute("Oid");
    String pw  = (String)session.getAttribute("Opw");
    String name = (String)session.getAttribute("Oname");
    String pn = (String)session.getAttribute("Opn");
    String email = (String)session.getAttribute("Oemail");
    String bday = (String)session.getAttribute("Obday");
    %>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet" href="mycss.css">
</head>
<body>
<form method="post" action="fixback.jsp" name="mainfix">
<div class="myinf2">
	<h3>내 정보</h3>
	<table class="mytable">
	<tr>
    <td>아이디</td>
    <td><nav><% out.println(id); %></nav></td>
  </tr>
    <tr>
    <td>비밀번호</td>
    <td><nav class="int"><input type="password" name="fPASS" value="<%= pw %>"></nav></td>
  </tr>
    <tr>
    <td>이름</td>
    <td><nav class="int"><input type="text" name="fNAME" value="<%= name %>"></nav></td>
  </tr>
    <tr>
    <td>전화번호</td>
    <td><nav class="int"><input type="text" name="fPN" value="<%= pn %>"></nav></td>
  </tr>
    <tr>
    <td>이메일</td>
    <td><nav class="int"><input type="text" name="fEMAIL" value="<%= email %>"></nav></td>
  </tr>
    <tr>
    <td>생년월일</td>
    <td><nav><% out.println(bday); %></nav></td>
  </tr>
  </table>
   <input class="butn1" type="submit" value="정보수정 ">
</form>
</div>
</body>
</html>
