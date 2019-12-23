<%@page import="jdk.internal.jline.console.history.History"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*"  %>
<%
request.setCharacterEncoding("utf-8");

java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String today = formatter.format(new java.util.Date());

try{
int idx = 0;

String maker = (String)session.getAttribute("Oname");
idx = (int)session.getAttribute("idx");
String comt = request.getParameter("commmt");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


	conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/user?serverTimezone=UTC" , "root", "jws020507");
	pstmt = conn.prepareStatement("insert into icomm(num, day, maker,value)values(?,?,?,?);");
	pstmt.setInt(1, idx);
	pstmt.setString(2, today);
	pstmt.setString(3, maker);
	pstmt.setString(4, comt);

	pstmt.execute();

	response.sendRedirect("iview.jsp?cidx="+idx);
conn.close();	
pstmt.close();
conn.close();
} catch (Exception e) {
	out.println("<script>alert('로그인을 해주세요.');location.href='main2.jsp';</script>");
}
%>