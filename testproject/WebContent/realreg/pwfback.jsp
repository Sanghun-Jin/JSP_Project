<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% 
	String id = request.getParameter("findid");
	String email = request.getParameter("findemail");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
    	conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/user?serverTimezone=UTC" , "root", "jws020507");
    	String sql = "select * from user where id=? and email=?";
    	pstmt = conn.prepareStatement(sql); 
    	pstmt.setString(1, id);
    	pstmt.setString(2, email);
    	
    	rs = pstmt.executeQuery();
    	rs.next();
    	String asd = rs.getString("id");
    	String pw = rs.getString("PW");
  %>
  <script>
  	var s = "<%= pw%>";
  </script>
  <%
    	if(asd.equals(id))
    	{
    		out.println("<script>alert('당신의 비밀번호는 ' + s + '입니다.');location.href='main2.jsp';</script>");
    	}
    		}catch(Exception e) {
    			out.println("<script>alert('회원정보가 없습니다 다시확인해주세요');history.go(-1);</script>");
    		}
	%>