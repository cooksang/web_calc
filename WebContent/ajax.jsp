<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="calc.calc" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
calc c = new calc();
String calc_text = request.getParameter("calc_text");
String result = URLDecoder.decode(calc_text, "UTF-8");
result = c.print(result);
%>
<%=result%>