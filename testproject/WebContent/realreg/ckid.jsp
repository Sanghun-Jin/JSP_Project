<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <%
    request.setCharacterEncoding("utf-8");
    
    String checkid = request.getParameter("ID");
    String checkname = request.getParameter("NAME");
    String checkpassword = request.getParameter("PASS");
    String checkbday = request.getParameter("bday");
    String checkpn = request.getParameter("PN");
    String checkemail = request.getParameter("EMAIL");

    session.setAttribute("checkid",checkid);
    session.setAttribute("checkname",checkname);
    session.setAttribute("checkpassword",checkpassword);
    session.setAttribute("checkbday",checkbday);
    session.setAttribute("checkpn",checkpn);
    session.setAttribute("checkemail",checkemail);
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
    	conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/user?serverTimezone=UTC" , "root", "jws020507");
    	String sql = "select count(*) as cnt from user where id=?";
    	pstmt = conn.prepareStatement(sql); 
    	pstmt.setString(1, checkid); 
    	
    	rs = pstmt.executeQuery();
    	rs.next();
    	
    	if(rs.getString("cnt").equals("1")) {
    		
    		out.println("<script>alert('이미 사용중인 아이디입니다'); history.back();</script>"); 
    		}
    	else {
				
    			out.println("<script>alert('사용가능한 아이디입니다'); alert('회원가입을 완료했습니다'); location.href='back.jsp';</script>");
    		    
    		}
    		 
    		}catch(Exception e) {
    		 
    		}
    		%>
    