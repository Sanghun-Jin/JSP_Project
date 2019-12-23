<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ page import="user.userDTO" %>
 <%@ page import="user.userDAO" %>
 <%@ page import="java.io.PrintWriter" %>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String userID = null;
 	String userPassword = null;
 	if(request.getParameter("id") != null){
 		userID = (String) request.getParameter("id");
 	}
 	if(request.getParameter("password") != null){
 		userPassword = (String) request.getParameter("password");
 	}
 	if(userID == null || userPassword == null)
 	{
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		script.println("alert('입력이 안 된 사항이 있습니다.');");
 		script.println("history.back();");
 		script.println("</script>");
 		script.close();
 		return;
 	}
 	userDAO user = new userDAO();
 	int result = user.join(userID, userPassword);
 %>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
   <link rel="stylesheet" href="style.css">
</head>
  <body>
    <table>
      <th>환영합니다</th>
      <tr>
        <td>
        	<%=
        		request.getParameter("name")+"님"
        	%>
        </td>
      </tr>
    </table>
  </body>
</html>
