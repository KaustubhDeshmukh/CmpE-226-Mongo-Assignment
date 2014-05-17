<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../views/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View your product extensions here...</title>
</head>
<body class="body">

	<br>
	<br>
	<br>
	<br>
		<div class="container">
			<div class="row">
				<h3 style="color: red">
				Below are the products matching your search!!!
				</h3>
				<br><br>
				<c:forEach items="${it}" var="map">
				<div class="col-md-12 jumbotron">
				<br>
				<img src="${map.imageUrl }"/>
				<br><br>
				<c:forEach items="${map}" var="entry">
    				 <span class="text-info text-prominent">
					 ${entry.key}
					 </span> 
					 :
					  <span class="text-info text-sub-prominent">
					  ${entry.value}
					</span>
					<br>
    			</c:forEach>
    			<br>
    			<p><a class="btn btn-primary btn-lg">
         		Buy</a>
      			</p>
    			</div>
				</c:forEach>
			</div>
		</div>
<%@ include file="../views/footer.jsp" %>	
</body>
</html>