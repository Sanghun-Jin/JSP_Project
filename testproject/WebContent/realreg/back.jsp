<%@page import="jdk.javadoc.internal.doclets.formats.html.markup.Script"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import = "java.sql.*, java.util.*" %>
<%
String id = (String)session.getAttribute("checkid");
String name = (String)session.getAttribute("checkname");
String password = (String)session.getAttribute("checkpassword"); 
String bday = (String)session.getAttribute("checkbday");
String pn = (String)session.getAttribute("checkpn");
String email = (String)session.getAttribute("checkemail");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null;
PreparedStatement pstmt = null;

StringBuffer sql = new StringBuffer();

try {
	conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/user?serverTimezone=UTC" , "root", "jws020507");
	pstmt = conn.prepareStatement("insert into user (id,pw,name,pn,email,bday)values(?,?,?,?,?,?);");
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, pn);
	pstmt.setString(5, email);
	pstmt.setString(6, bday);
	
	pstmt.execute();
	
} catch (Exception e) {
	System.out.println(e.getMessage());
}
pstmt.close();
conn.close();

response.sendRedirect("index.jsp");
%>
