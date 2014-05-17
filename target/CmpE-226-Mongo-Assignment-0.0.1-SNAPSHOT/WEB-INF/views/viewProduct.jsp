<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../views/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View your product extensions here...</title>
</head>
<body class="body">

	</br>
	</br>
	</br>
	</br>
	<c:if test="${user eq 'admin' }">
		<div class="container">
			<div class="nav">
				<button class="btn btn-default">
						<a href="addProduct.htm">Create Product</a>
					</button>
				<button class="btn btn-default">
						<a href="createExtension.htm">Create Extensions</a>
					</button>
				<button class="btn btn-default">
						<a href="viewExtensions.htm">View Extensions</a>
					</button>
					<button class="btn btn-default" ><a class="no-deco" href="viewOrderHistory.htm">View Order History</a></button>
			</div>
		</div>
	</c:if>

	<form action="processOrder.htm" name="theForm">
		<div class="container">
			<div class="row">
				<span class="text-info"><h3>Product
						Details:${product[1].productName}</h3>
				</span> <input type="hidden" name="productName"
					value="${product[1].productName}"> <input type="hidden"
					name="imageURL" value="${product[0]}"> <input type="hidden"
					name="productPrice" value="${product[1].price}"> <input type="hidden" name="selectedProductId"
					value="${product[2]}"></br>
				</br>

				<div class="col-md-4">
					<img alt="${product[0]}" src="${product[0]}"> </br>
					</br> <span class="text-success"><h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Just
							for:$${product[1].price}</h3>
					</span> </br>
					<c:if test="${user ne 'admin' }">
						<button class="btn btn-default"
							onclick="document.theForm.submit();">
							<span class="text-info">Order Now</span>
						</button>
					</c:if>
					<button class="btn btn-default">
						<a href="catalog.htm">Back to Catalog</a>
					</button>
				</div>

				<div class="col-md-8">
					<legend>Specifications:
					</legend>
					
					</br>
					<span class="text-info text-prominent">Processor:&nbsp;&nbsp;</span><span
						class="text-info text-sub-prominent">${product[1].processor}
					</span> </br>
					</br> <span class="text-info text-prominent">RAM:&nbsp;&nbsp;</span><span
						class="text-info text-sub-prominent">${product[1].ram} </span> </br>
					</br> <span class="text-info text-prominent">Display:&nbsp;&nbsp;</span><span
						class="text-info text-sub-prominent">${product[1].display}
					</span> </br>
					</br> <span class="text-info text-prominent">Storage:&nbsp;&nbsp;</span><span
						class="text-info text-sub-prominent">${product[1].hdd} </span> </br>
					</br> <span class="text-info text-prominent">Battery-backup:&nbsp;&nbsp;</span><span
						class="text-info text-sub-prominent">${product[1].battery}
					</span> </br>
					</br> <span class="text-info text-prominent">Mother-board:&nbsp;&nbsp;</span><span
						class="text-info text-sub-prominent">${product[1].motherBoard}
					</span> </br>
					</br> <span class="text-info text-prominent">Operating
						System:&nbsp;&nbsp;</span><span class="text-info text-sub-prominent">${product[1].operatingSystem}
					</span> </br>
					</br> <span class="text-info text-prominent">Wi-Fi:&nbsp;&nbsp;</span><span
						class="text-info text-sub-prominent">${product[1].wiFi} </span> </br>
					</br> <span class="text-info text-prominent">Weight:&nbsp;&nbsp;</span><span
						class="text-info text-sub-prominent">${product[1].weight}
						gms</span><br><br>
										
					<%
						int i = 0;
					%>
					<c:forEach items="${product[1].catalogExtension}" varStatus="loop">
						<span class="text-info text-prominent">${product[1].catalogMetadataMap[product[1].catalogExtension[loop.index].extensionID].extLabel}:&nbsp;&nbsp;</span>
						<span class="text-info text-sub-prominent">${product[1].catalogExtension[loop.index].value}
						</span>
						<br>
						<br>
					</c:forEach>

				</div>

			</div>
		</div>
	</form>
<%@ include file="../views/footer.jsp" %>	
</body>
</html>