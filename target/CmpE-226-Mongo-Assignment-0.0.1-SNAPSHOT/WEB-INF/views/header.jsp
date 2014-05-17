<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>
			
		<%=request.getContextPath()%>	
	<div class="navbar navbar-fixed-top navbar-default navbar-background">
		<div class="container navbar-background">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"	data-target=".navbar-collapse">
					<span class="icon-bar">	</span>
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="home.htm"><h4>Home</h4></a></li>
					<li><a href="catalog.htm"><h4>Catalog</h4></a></li>
					<li><a href="#"><h4>Contact US</h4></a></li>
					<li><a href="#"><h4>About US</h4></a></li>
				</ul>
				<div style="float:right">
						<form class="form-inline">
						<input type="text" align="right" class="span4"  />
						<button class="btn btn-primary">Search</button>
					</form>
			</div>
			</div>
		</div>
	</div>

</body>

</html>