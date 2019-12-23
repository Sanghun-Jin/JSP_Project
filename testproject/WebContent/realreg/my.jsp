<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>
   <%
   String id = (String)session.getAttribute("Oid");
   String pw  = (String)session.getAttribute("Opw");
   String name = (String)session.getAttribute("Oname");
   String pn = (String)session.getAttribute("Opn");
   String email = (String)session.getAttribute("Oemail");
   String bday = (String)session.getAttribute("Obday");

   if(id == null){
   response.sendRedirect("index.jsp");
   }
   %>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet" href="mycss.css">
<link rel="stylesheet" href="main.css">
<script>
function fix()
	{
	window.open("myfix.jsp", "회원정보수정", "width=605px, height=420px, left=2450px, top=50px");
	}
function del()
{
window.open("mydel.jsp", "회원탈퇴", "width=400, height=300, left=100, top=50");
}
function back() {
	history.go(-1);
}
</script>
</head>
 <body>
    <div class="top">
      <table>
        <tr>
        <td>
      <div class="home"><a class="homeli" href="index2.jsp">jsp게시판</a></div>
        </td>
        <td>
      <div class="menu">
        <ul>
      <li><a class="menulink" href="commrp.jsp">일반게시판</a></li>
      <li>|</li>
      <li><a class="menulink" href="imgrp.jsp">이미지게시판</a></li>
      <li>|</li>
      <li><a class="menulink" href="vidrp.jsp">영상게시판</a></li>
      <li>|</li>
      <li><a class="menulink" href="filerp.jsp">파일게시판</a></li>
      </ul>
    </div>
    </td>
    <td>
<span class="dropdown2">
<button class="dropbtn"><%
		if(name == null)
		{
			out.println("<script>alert('로그인을 해주세요.');location.href='main2.jsp';</script>");
		}
		out.println(name);
	%></button>
<div class="dropdown-content">
<a href="my.jsp">내정보</a>
<a href="#">내 게시물</a>
<a href="logout.jsp">로그아웃</a>
</div>
</span>
</td>
  </tr>
  </table>
    </div>
    <br>
    <br>
    <br>
<div class="myinf"style=>
	<h3 class="maintitle">내 정보</h3>
    <table class="mytable" >
      <tr>
        <td class="ti"><nav class="tti">아이디</nav></td>
        <td class="ti"><nav class="tti"><%=id%></nav></td>
      </tr>
      <tr>
        <td class="ti"><nav class="tti">비밀번호</nav></td>
        <td class="ti"><nav class="tti"><%=pw%></nav></td>
      </tr>
      <tr>
        <td class="ti"><nav class="tti">이름</nav></td>
        <td class="ti"><nav class="tti"><%=name%></nav></td>
      </tr>
      <tr>
        <td class="ti"><nav class="tti">생일</nav></td>
        <td class="ti"><nav class="tti"><%=bday%></nav></td>
      </tr>
      <tr>
        <td class="ti"><nav class="tti">휴대폰</nav></td>
        <td class="ti"><nav class="tti"><%=pn%></nav></td>
      </tr>
      <tr>
        <td class="ti"><nav class="tti">이메일</nav></td>
        <td class="ti"><nav class="tti"><%=email%></nav></td>
      </tr>
    </table>
  <tr>
   <td><input class="butn2" type="button" value="정보수정 " onclick="return fix()"></td>
   <td><input class="butn2" type="button" value="회원탈퇴" onclick="return del()"></td>
   <td><input class="butn2" type="button" value="뒤로가기" onclick="return back()"></td>
  </tr>
</div>
</body>
</html>
