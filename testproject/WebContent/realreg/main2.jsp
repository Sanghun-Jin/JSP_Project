<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>로그인 메인</title>
<link rel="stylesheet" href="mainlog.css">
<script type="text/javascript">
  function logcheckValue()
  {
    if (!document.log1.logID.value){
      alert("아이디를 입력해주세요")
      return false;
    }
    if (!document.log1.logPASS.value) {
      alert("비밀번호를 입력해주세요")
      return false;
    }
  }
</script>
</head>
<body>
<div class="mainlog1">
<form method="post" action="logback.jsp" name="log1" onsubmit= "return logcheckValue()">
  <h3>로그인</h3>
    <table>
      <tr>
        <td class="ti">아이디</td>
        <td><input class="in" type="text" tabindex="1" name="logID" value=""></td>
        <td rowspan="2"><input class="logbtn"type="submit" tabindex="3" name="" value="로그인"</td>
      </tr>
      <tr>
        <td class="ti">비밀번호</td>
        <td><input class="in" type="password"  tabindex="2" name="logPASS" value=""></td>
	  </tr>
	  </table>
	  <div class="findmanu">
	  <a class="logf" href="find.jsp">아이디,비밀번호 찾기</a>
	  <a class="logf" href="main.jsp">회원가입</a>
	  </div>
</form>
</div>
</body>
</html>