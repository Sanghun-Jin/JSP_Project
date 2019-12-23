<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String id = (String)session.getAttribute("Oid");

	String fpw = request.getParameter("fPASS");
	String fname = request.getParameter("fNAME");
	String fpn = request.getParameter("fPN");
	String femail = request.getParameter("fEMAIL");
%>
<%		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?serverTimezone=UTC","root","jws020507");
		String sql = "UPDATE user set PW=?, NAME=?, PN=?, EMAIL=? WHERE ID=?";
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, fpw);
		pstmt.setString(2, fname);
		pstmt.setString(3, fpn);
		pstmt.setString(4, femail);
		pstmt.setString(5, id);
		pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("error =>" + e.getMessage());
		}
		out.println("<script>alert('정보가 수정되었습니다.');alert('다시 로그인부탁드립니다.');opener.location.href='index.jsp';close();</script>");
%>