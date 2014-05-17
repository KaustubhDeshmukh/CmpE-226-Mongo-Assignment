<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>First JSP</title>
</head>
<%@ page import="java.util.Date" %>
<body>
<h3>Hello there!!!</h3><br>
<strong>Welcome to Mongo powered Storefront</strong>: <%=new Date() %>

<h2> Below are the product categories you can browse for the products !!! </h2>
<form action="/fetch/products" method="get" >
  <p>
    <c:forEach var="category" items="${it}">
     <a href="fetch/products/${category}" > ${category}</a><br />
    </c:forEach>
  </p>
 </form>
</body>
</html>