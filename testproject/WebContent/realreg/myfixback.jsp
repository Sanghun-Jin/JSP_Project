<%@page import="com.sun.jdi.Location"%>
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
	
	String fixpw = request.getParameter("fixpw");
	
	if(fixpw.equals(pw))
	{
		out.println("<script>location.href='myfixbackback.jsp'</script>");
	}
	else
	{
		out.println("<script>alert('비밀번호가 옳지않습니다');history.go(-1);</script>");
	}
%>