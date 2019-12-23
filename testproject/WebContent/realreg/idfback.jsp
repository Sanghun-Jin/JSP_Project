<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% 
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("findname");
	String email = request.getParameter("findemail");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
    	conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/user?serverTimezone=UTC" , "root", "jws020507");
    	String sql = "select * from user where name=? and email=?";
    	pstmt = conn.prepareStatement(sql); 
    	pstmt.setString(1, name);
    	pstmt.setString(2, email);
    	
    	rs = pstmt.executeQuery();
    	rs.next();
    	String asd = rs.getString("NAME");
    	String id = rs.getString("ID");
  %>
  <script>
  	var s = "<%= id%>";
  </script>
  <%
    	if(name.equals(asd))
    	{
    		out.println("<script>alert('당신의 아이디는 ' + s + '입니다.');location.href='main2.jsp';</script>");
    	}
    		}catch(Exception e) {
    			System.out.println("error => " + e.getMessage());
    			out.println("<script>alert('회원정보가 없습니다 다시확인해주세요');history.go(-1);</script>");
    		}
	%>