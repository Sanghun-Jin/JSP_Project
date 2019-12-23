<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html lang="java" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>home</title>
  </head>
  <body>
    <form class="" action="index.jsp" method="post">

    <table>
      <tr><th>어서오세요.</th></tr>
      <tr>
        <td>ID</td>
        <td><input type="text" name="id" value=""></td>
        <td rowspan="2"><button type="submit" name="login">로그인</button></td>
        <td rowspan="2"><a href="register.jsp"><button type="button" name="regi">회원가입</button></a></td>
      </tr>
      <tr>
        <td>PASSWORD</td>
        <td><input type="text" name="pass" value=""></td>
      </tr>
    </table>
    </form>
  </body>
</html>
