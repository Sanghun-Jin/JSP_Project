<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
</head>
<body>
<%

		Connection conn = null;

	      

                //localhost는 MySQL이 설치된 곳의 IP

                //mysql : DB 명

                //3306 : MySQL 접속을 위한 디폴트 포트

		String url = "jdbc:mysql://localhost:3306/user";

		String id = "root";                     //MySQL에 접속을 위한 계정의 ID

		String pwd = "jws020507";            //MySQL에 접속을 위한 계정의 암호

		

		Class.forName("com.mysql.jdbc.Driver");

		conn = DriverManager.getConnection(url, id, pwd);

		

		out.println("<h1>MySQL DB 연결 성공</h1>");

	%>

</body>
</html>