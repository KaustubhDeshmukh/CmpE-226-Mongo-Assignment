<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Catalog Operations</title>
</head>
<body>

	</br></br></br>	</br>

	<form action="orderProduct.htm" name="theForm" method="post">

		<div class="container well">
			<div class="row">
				<c:forEach var="category" items="${it}" varStatus="loop">
					<a href="fetch/products/${category}">
						<div class="col-md-3">
							<div class="thumbnail">
								<img alt="${category}" src="images/product.png">
								<div class="caption">
									<span class="text-primary text-center"><h3>${category}</h3>
									</span> <span class="text-info text-center">
										<h4>Click to browse the products</h4> </span>
										</div></div></div>
					</a>
					</c:forEach>
			</div>
		</div>	
	</form>
	<%@ include file="footer.jsp" %>
</body>
</html>