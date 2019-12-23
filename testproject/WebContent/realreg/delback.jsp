<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
	String id = (String)session.getAttribute("Oid");
	String pw  = (String)session.getAttribute("Opw");
	String name = (String)session.getAttribute("Oname");
	String pn = (String)session.getAttribute("Opn");
	String email = (String)session.getAttribute("Oemail");
	String bday = (String)session.getAttribute("Obday");
	
	String delpw = request.getParameter("delpw");
	
	if(delpw.equals(pw))
	{	
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?serverTimezone=UTC","root","jws020507");
		String sql = "DELETE FROM user WHERE ID=?";
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, id);
		pstmt.execute(); 
			
		}catch(Exception e) {
			System.out.println("error => " + e.getMessage());
		}
		session.invalidate();
		out.println("<script>alert('회원탈퇴가 완료되었습니다');window.opener.location.reload();close();</script>");
	}
	else
	{
		out.println("<script>alert('비밀번호가 옳지않습니다');history.go(-1);</script>");
	}
%>