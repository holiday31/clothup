<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, clothup.*"%>
<%
	String userid="";
	Boolean autologin=false;
	   if(session!=null){
          userid=(String)session.getAttribute("userid");
		  autologin=(Boolean)session.getAttribute("autologin");
		  
		}
	
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="homepage_1.css">
    <link href="https://fonts.googleapis.com/css?family=Text+Me+One" rel="stylesheet">
    <title>Cloth Up</title>
    <style>
 	body{
 		font-family: 'Text Me One', sans-serif;
 	}
 	</style>
  </head>
  <body>

    <header>
      <a id="Top of Cloth Up"><h1>Cloth Up</h1></a>
      <%
       	if(session.getAttribute("userid")==null){
      %>
   
        <a href ="login.jsp">
          <input type="button" name="login" style="font-family: 'Text Me One', sans-serif;" value="Login">
        </a>
       <% } else{ %>
		 
    	 <a href ="main.jsp">
           <input type="button" name="logout" style="font-family: 'Text Me One', sans-serif;" value="Logout">
         </a>
       <% 
        session.removeAttribute("userid");  
        session.removeAttribute("autologin");  
        }%>
        
      <br>
	 
      <nav>
        <div class="hover1">homepage</div>
        <div class="hover1">top</div>
        <div class="hover1">bottom</div>
        <div class="hover1">dress</div>
        <div class="hover1">Review</div>
        <div class="hover1">Mypage</div>
        <div class="hover1">Q&A</div>
      </nav>

    </header>

    <section>
      사진 첨부
    </section>

    <aside>
    <div class="left">
      오늘의 글귀<p>
      Event
    </div>
    <div class="right">
      광고<p>
      <img src="">
      이 달의 Best
    </div>
    </aside>

    <footer>
      <a href="#Top of Clothe Up">Clothe Up!</a><br>
      <id class="copy">Copyright ⓒ 개발자들 Cloth Up 조_수연, 은학, 민지, 미리, 지민</id>
    </footer>
  </body>
</html>

