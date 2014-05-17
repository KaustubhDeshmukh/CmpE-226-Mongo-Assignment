<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />


<title>Footer</title>
</head>
<body>

<div class="container well">

<div class="row">

<div class="col-md-3">
<h3>&nbsp;&nbsp;&nbsp;&nbsp;About <span>${fn:toUpperCase(tenantName)}</span></h3>
<p>
<ul>
<li>Investor relations</li>
<li>Global citizenship</li>
<li>Events</li>
<li>Jobs</li>
</ul>
</p>
</div>

<div class="col-md-3">
<h3>&nbsp;&nbsp;&nbsp;&nbsp;Social Media</h3>
<p>
<ul>
<li>Consumer Support forum</li>
<li>Enterprise Business community</li>
<li>Corporate blogs</li>

</ul>
</p>
</div>

<div class="col-md-3">
<h3>&nbsp;&nbsp;&nbsp;<span>${fn:toUpperCase(tenantName)}</span> Partners</h3> 
<p>
<ul>
<li>Become a partner</li>
<li>Find a reseller</li>
<li>PartnerOne</li>
</ul>
</p>
</div>

<div class="col-md-3">
<h3>Customer Support</h3> 
<p>
<ul>
<li>Authorized service providers</li>
<li>Training & Certification</li>
</ul>
</p>
</div>

</div>

</div>

</body>
</html>