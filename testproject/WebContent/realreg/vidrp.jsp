<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
	
<%
	Connection conn = null;
	ResultSet ars = null;
	PreparedStatement apstmt = null;	
	String sql = null;
	
	session.setAttribute("total", 0);
	String id = (String)session.getAttribute("Oid");
	String pw  = (String)session.getAttribute("Opw");
	String name = (String)session.getAttribute("Oname");
	String pn = (String)session.getAttribute("Opn");
	String email = (String)session.getAttribute("Oemail");
	String bday = (String)session.getAttribute("Obday");
	
	int total = 0;
	
    try {
    	conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/user?serverTimezone=UTC" , "root", "jws020507");
    	
    	sql = "select count(*) from vidnot";
   		apstmt = conn.prepareStatement(sql);

   		ars = apstmt.executeQuery();
   		ars.next();
		
   		total = ars.getInt(1);	
   		
    	sql = "select * from vcomm where num=?;";
    	apstmt = conn.prepareStatement(sql); 
    	
    	ars = apstmt.executeQuery();
   		ars.last();
       }	catch(Exception e) {
		 
		}
   		
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <link rel="stylesheet" href="main.css">
    <meta charset="utf-8">
    <title>게시판 메인</title>
    <script type="text/javascript">
    function schck(){
    	if (!document.schval.search.value) {
    		alert("해당값은 검색할수없습니다");
			return false;	
		}
		
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
      <li><a class="menulink1" href="vidrp.jsp">영상게시판</a></li>
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
   <section class="no">
    <br>
    <br>
    <br>
    <div class="contit"><h3>영상게시판</h3></div>
	<table>
	<tr>
	<td>
	<div class="right">
	
	</div>
	</td>
	<td>
	<div class="mid">
	<div class="content">
	<form method="post" name="schval" action="commrpsch.jsp" onsubmit="return schck()">
	<table>
	<tr>
	<td><input name="search" type="text" value="" placeholder="게시물 또는 글쓴이"></td>
	<td><input type="submit" value="검색"></td>
	<td width="750px;"><div style="margin-left: 74%;"><a  href="comtyp.jsp">글쓰기</a><br></div></td>
	</tr>
	</table>
	</form>
	<%
	
	int cidx = 0;
	String ctitle = null;
	String cmaker = null;
	String cday = null;
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");

    try {
    	conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/user?serverTimezone=UTC" , "root", "jws020507");
    	sql = "select * from vidnot;";
    	pstmt = conn.prepareStatement(sql); 
    	
    	rs = pstmt.executeQuery();
   		rs.last();
    
	} catch (Exception e) {
    	System.out.println("error => " + e.getMessage());
    }
%>
	<div class="notcontent"></div>
		<table class="contable">
			<tr bgcolor="skyblue">
			<td width="80">번호</td><td width="400">제목</td><td width="150" >글쓴이</td><td width="220">날짜</td>
		</table>
	</div>
	<div style="margin-left: 14%;">
<table>
<%  if(total == 0){
%>
<div style="margin-top: 15px; margin-left: 40%">게시물이 없습니다 ㅠㅜ</div>
<%
}
	while(total != 0)
		{
   			cidx = rs.getInt("idx");
   			ctitle = rs.getString("title");
 	  		cmaker = rs.getString("maker");
  	 		cday = rs.getString("day");
%>
	<tr class="cdrow" height="25" align="center"onclick="location.href='view.jsp?cidx=<%=cidx%>'">
	<td>&nbsp;</td>
	<td></td>
	<td align="center" width="80"><%= cidx %></td>
	<td align="center" width="400"><%= ctitle %></td>
	<td align="center" width="150"><%= cmaker %></td>
	<td align="center" width="220"><%= cday %></td>
	<td>&nbsp;</td>
	</tr>
<%
rs.previous();
	total--;
		}
	  conn.close();
	  rs.close();
	  pstmt.close();
%>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6"></td></tr>
 </table>
	</div>
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

