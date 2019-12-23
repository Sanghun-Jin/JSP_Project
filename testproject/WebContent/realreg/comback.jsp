<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*, java.text.*"  %>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");

	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String today = formatter.format(new java.util.Date());

	Connection search = null;
	Statement stmt = null;
	ResultSet rs = null;
	int idx = 0;
	
	String id = (String)session.getAttribute("Oid");
	String pw  = (String)session.getAttribute("Opw");
	String name = (String)session.getAttribute("Oname");
	String pn = (String)session.getAttribute("Opn");
	String email = (String)session.getAttribute("Oemail");
	String bday = (String)session.getAttribute("Obday");
	
	try{
		search = DriverManager.getConnection( "jdbc:mysql://localhost:3306/user?serverTimezone=UTC" , "root", "jws020507");
		String sql2 = "select * from comnot";
		stmt = search.createStatement();
		rs = stmt.executeQuery(sql2);
		if(rs.last())
			idx = rs.getInt("idx") + 1;
		else
			idx = 1;
		stmt.close();
		rs.close();
		search.close();
	} catch (Exception e){
		
	}
	
	String title = request.getParameter("title");
	String val = request.getParameter("val");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/user?serverTimezone=UTC" , "root", "jws020507");
		pstmt = conn.prepareStatement("insert into comnot (idx,title,maker,day,data)values(?,?,?,?,?);");
		pstmt.setInt(1, idx);
		pstmt.setString(2, title);
		pstmt.setString(3, name);
		pstmt.setString(4, today);
		pstmt.setString(5, val);
		pstmt.execute();
	
	}catch(Exception e) {
		System.out.println(e.getMessage());
	}
	
	response.sendRedirect("commrp.jsp");
%>