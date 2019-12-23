<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*"  %>
	<%
	String asdasd = request.getParameter("cidx");
	int idx = Integer.parseInt(asdasd);
	
	Connection conn = null;
	ResultSet ars = null;
	PreparedStatement apstmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	int total = 0;
	
    try {
    	conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/user?serverTimezone=UTC" , "root", "jws020507");
    	
    	String sql = "select count(*) from ccomm where num = ?";
   		apstmt = conn.prepareStatement(sql);

   		apstmt.setInt(1, idx);
   		ars = apstmt.executeQuery();
   		ars.next();

   		total = ars.getInt(1);	
   		
    	sql = "select * from ccomm where num=?;";
    	apstmt = conn.prepareStatement(sql); 
    	
    	apstmt.setInt(1, idx);
    	
    	ars = apstmt.executeQuery();
   		ars.last();

   		
request.setCharacterEncoding("utf-8");

java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String today = formatter.format(new java.util.Date());

String cNAME = (String)session.getAttribute("Oname");

Class.forName("com.mysql.cj.jdbc.Driver");
PreparedStatement pstmt = null;
ResultSet rs = null;

String title = null;
String maker = null;
String day = null;
String data = null;	

session.setAttribute("idx",idx);

try {
	conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/user?serverTimezone=UTC" , "root", "jws020507");
	sql = "SELECT title, maker, day, data FROM comnot WHERE idx=?";
	pstmt = conn.prepareStatement(sql); 
	
	pstmt.setInt(1, idx); 
	
	rs = pstmt.executeQuery();
	rs.next();
	 title = rs.getString(1);
	 maker = rs.getString(2);
	 day = rs.getString(3);
	 data = rs.getString(4);	
		 
		}catch(Exception e) {
		 
		}

%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <link rel="stylesheet" href="main.css">
    <meta charset="utf-8">
    <style>
    	.coment{
    		float:left;
    	}
    </style>
    <script type="text/javascript">
    function checkcoomt(){
    	if(!document.cccomt.commmt.value){
    		alert("댓글을 입력해주세요");
    		return false;
    	}
    	else{
    	alert("댓글작성 완료!!");
    	}
	}
    
    
    </script>
    <title>게시판 메인</title>
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
		if(cNAME == null)
		{
			out.println("<script>alert('로그인을 해주세요.');location.href='main2.jsp';</script>");
		}
		out.println(cNAME);
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
    <section class="no">
    <br>
    <br>
    <br>
    <div class="contit"><h3><%= title %></h3></div>
	<table>
	<tr>
	<td>
	<div class="right">
	</div>
	</td>
	<td>
	<div class="mid">
	<table style="margin-left: 58%">
	<tr>
	<td>
	<p>글쓴이: <%= maker %></p>
	<p>시간: <%= day %></p>
	</td>
	</tr>
	</table>
	<table style="margin-left: 78px;">
	<tr>
	<td>
	<textarea style="resize:none; font-size:16px; width: 600px; height: 500px;"  rows="10" cols="10"readonly="readonly">
	<%=data %>
	</textarea>
	</td>
	</tr>
	<form method="post" name="cccomt" action="ccomt.jsp" onsubmit="return checkcoomt()">
	<tr>
	<td>
	<div class="coment">
	<textarea name="commmt" style="width: 450px; height: 75px; resize: none; " rows="10" cols="10"></textarea>
	</div>
	<div class="coment">
	<input  style= "width: 140px; height: 80px;" type="submit" value="댓글달기">
	</div>
	</td>
	</tr>
	</form>
	</table>
	<div style="margin-top: 50px;">
	<div class="notcontent">
		<table class="contable" style="margin-left: 51px;">
			<tr bgcolor="skyblue" style="text-align: center;"> 
			<td width="90">글쓴이</td><td width="400">내용</td><td width="210" >날짜</td>
		</table>
		</div>
	<div style="margin-left: 14%;">
<table style="margin-left: -70px;">
<%

	while(total != 0)
		{
   			String cmaker = ars.getString("maker");
   			String cdata = ars.getString("value");
   			String cdayy = ars.getString("day");
%>
			<tr class="comment" height="25" align="center">
			<td>&nbsp;</td>
			<td></td>
			<td align="center" width="75"><%= cmaker %></td>
			<td align="center" width="390"><%= cdata %></td>
			<td align="center" width="200"><%= cdayy %></td>
			<td>&nbsp;</td>
			</tr>
			
<%
	ars.previous();
	total--;
		}
	  conn.close();
	  ars.close();
	  apstmt.close();
    } catch (Exception e) {
    	System.out.println("error => " + e.getMessage());
    }
%>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6"></td></tr>
 </table>
	</div>
	</div>
	</td>
	</tr>
	</table>
    </section>
  </body>
</html>
ㅁㅁㅁㅁㅁㅁㅁㅁㅁ
