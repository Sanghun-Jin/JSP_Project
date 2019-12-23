<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
	
<%
	String id = (String)session.getAttribute("id");
	String cID = null;
	String cPW = null;
	String cNAME = null;
	String cPN = null;
	String cEMAIL = null;
	String cBDAY = null;
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?serverTimezone=UTC","root","jws020507");
	String sql = "select * from user where id=?";
	pstmt = conn.prepareStatement(sql); 
	pstmt.setString(1, id);
	rs = pstmt.executeQuery(); 
	rs.next();
		
		cID = rs.getString("ID");
		cPW = rs.getString("PW");
		cNAME = rs.getString("NAME");
		cPN = rs.getString("PN");
		cEMAIL = rs.getString("EMAIL");
		cBDAY = rs.getString("BDAY");
		
		session.setAttribute("Oid",cID);
		session.setAttribute("Opw",cPW);
		session.setAttribute("Oname",cNAME);
		session.setAttribute("Opn",cPN);
		session.setAttribute("Oemail",cEMAIL);
		session.setAttribute("Obday",cBDAY);
		
	}catch(Exception e) {
	 
	}
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <link rel="stylesheet" href="main.css">
    <meta charset="utf-8">
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
      <li><a class="menulink1" href="filerp.jsp">파일게시판</a></li>
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
    <div class="contit"><h3>파일게시판</h3></div>
	<table>
	<tr>
	<td>
	<div class="right">
	
	</div>
	</td>
	<td>
	<div class="mid">
	<div class="content">
	<a class="typc" href="filetyp.jsp">글쓰기</a>
		<table class="contable">
			<tr bgcolor="skyblue">
			<td width="80">번호</td><td width="400">제목</td><td width="150" >글쓴이</td><td width="220">날짜</td>
		</table>
	</div>
	</div>
	</td>
	<td>
	<div class="left">
	
	
	</div>
	</td>
	</tr>
	</table>
    </section>
  </body>
</html>
