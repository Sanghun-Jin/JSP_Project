<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
dsdsd
	<%
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/mysql?characterEncoding=UTF-8&serverTimezone=UTC";
		String id = "root";                     //MySQL�� ������ ���� ������ ID
		String pwd = "jws020507";            //MySQL�� ������ ���� ������ ��ȣ
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, id, pwd);
		out.println("<h1>MySQL DB ���� ����</h1>");
	%>
</body>
</html>
