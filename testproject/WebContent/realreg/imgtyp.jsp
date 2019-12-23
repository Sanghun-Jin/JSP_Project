<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String name = (String)session.getAttribute("Oname");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지게시판 글쓰기</title>
<link rel="stylesheet" href="typi.css">
<script type="text/javascript">
function upck(){
	if(!document.upload.title.value){
		alert("제목을 입력해주세요.");
		return false;
	}
	if(!document.upload.val.value){
		alert("내용을 입력해주세요.");
		return false;
	}
	alert("글을 작성하였습니다.")
}
function back() {
	history.back();
}	
</script>
</head>
 <body>
<div class="cupload">
<h3>글 쓰기</h3>	
<form method="post" name="upload" action="imgback.jsp" onsubmit="return upck()">
<table>
<tr>
<td width="80">제목</td>
<td width="700"><input class="title" name="title" type="text" value=""></td>
</tr>
<tr>
<td width="80">내용</td>
<td width="700"><textarea class="val" name="val" rows="12" cols="50"></textarea></td>
</tr>
</table>
<div class="btns"><td><input class="btn2" type="submit" value="작성"></td><td><input class="btn2" type="button" value="뒤로가기" onclick="return back()"></td></div>
</form>
</div>
</body>
</html>