<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>회원가입</title>
    <style>
 	   #wrap
 	   {
    		width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
  		 }   
    	th
    	{
    		background-color:silver;
    	}
    	
    	table
    	{
    		margin-left:70px;
    		border:3px solid skyblue;
    	}
    	
    	td
    	{
    		border:1px solid skyblue;
    	}
    	#title
    	{
    		background-color:skyblue;
    	}
    </style>
    <script>
      function Check(){
        if(document.register.password.value != document.register.passcheck.value)
        {
          window.alert("비밀번호가 다릅니다.");
          location.reload();
          return false;
        }
        else {
          {
            alert(document.register.name.value + "님 회원가입을 축하합니다.");
            return true;
          }
        }
      }
    </script>
  </head>
  <body>
  <div id="wrap">
    <br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>
    <form action="index.jsp" method="post" name="register" onsubmit="return Check()">
      <table>
        <tr>
          <td id="title">아이디</td>
          <td><input type="text" name="id" autofocus placeholder="영문+숫자(15자 이내로)" required maxlength="15"></td>
        </tr>
        <tr>
          <td id="title">비밀번호</td>
          <td><input type="password" name="password" placeholder="영문자+숫자(20자 이내)" required maxlength="20"></td>
        </tr>
        <tr>
          <td id="title">비밀번호 확인</td>
          <td><input type="password" name="passcheck" placeholder="비밀번호 확인" required maxlength="20"></td>
        </tr>
        <tr>
          <td id="title">이메일</td>
          <td>
            <input type="text" name="email" required>@
            <select name="juso">
            <option value="naver">naver.com</option>
            <option value="daum">daum.net</option>
            <option value="gmail">gmail.com</option>
            </select>
          </td>
        </tr>
        <tr>
          <td id="title">이름</td>
          <td><input autocomplete="on" type="text" name="name" placeholder="ex)홍길동" required></td>
        </tr>
         <tr>
       	  <td id="title">성별</td>
       	  <td>
       	 	<input type="radio" name="gender" value="남자"> 남자
      	   	<input type="radio" name="gender" value="여자"> 여자
       	 </td>
         </tr>
        <tr>
          <td id="title">생년월일</td>
          <td>
            <input type="text" name="birth_yy" maxlength="4" placeholder="년(4자)" size="6" >
                        <select name="birth_mm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birth_dd" maxlength="2" placeholder="일" size="4" >
          </td>
        </tr>
        <tr>
          <td id="title">취미</td>
          <td><input type="text" name="enjoy" placeholder="ex)컴퓨터 게임"></td>
        </tr>
        <tr>
          <td id="title">우편</td>
          <td><input type="text" name="up" placeholder=""></td>
        </tr>
        <tr>
          <td id="title">전화번호</td>
          <td>
            <input type="number" name="tellphone" placeholder="ex)01012341234">
          </td>
        </tr>
        </table>
        	<br><br>
          <button type="submit" name="button">작성 완료</button>
          <button type="button" name="represh" onclick="history.back()">취소</button>
    </form>
    </div>
  </body>
</html>
