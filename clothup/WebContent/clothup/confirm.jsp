<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,clothup.*, java.text.*"%>
<%
 	String id=request.getParameter("id");
	boolean check=UserDAO.idCheck(id);
	out.println(check);
%>


