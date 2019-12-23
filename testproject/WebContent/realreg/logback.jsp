<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page import="user.dbuser"%>
<%
String id = null;
id = request.getParameter("logID");
String pw = request.getParameter("logPASS");
 
Connection conn = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
try {
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?serverTimezone=UTC","root","jws020507");
String sql = "select count(*) as cnt from user where id=? and pw=?";
pstmt = conn.prepareStatement(sql); 
pstmt.setString(1, id);
pstmt.setString(2, pw);
rs = pstmt.executeQuery(); 
rs.next();

 
if(rs.getString("cnt").equals("1")) {

session.setAttribute("id",id);
response.sendRedirect("index2.jsp");
}else {

response.sendRedirect("main2.jsp");
}
 
}catch(Exception e) {
 
}
%>