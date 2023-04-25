
<%@page import="website.*"%>
<%@page import="website.DbCon"%>
<%@page import="website.User"%>
<%@page import="website.ProductDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null)
	{
    	request.setAttribute("person", auth);
	}
		ProductDao pd = new ProductDao(DbCon.getConnection());
		List<Product> products = pd.getAllProducts();
		ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
		if (cart_list != null)
		{
			request.setAttribute("cart_list", cart_list);
		}
		%>
	
<!DOCTYPE html>
<html> 

<head>
<meta charset="ISO-8859-1">
<title>Index</title>
<%@ include file="Header.jsp" %>
</head>
<body>
	<style>
		body
{
    margin: 0;
    padding: 0;
    height: 100vh;
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,111,121,1) 35%, rgba(0,212,255,1) 100%);
    overflow: hidden;
}

	.container
	{
	 background: transparent;
	}
	.card-header
	{
		color:white;
		border: 1px solid white;
	}
	</style>
	<%@include file="NavBar.jsp"%>
	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="product-image/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Price: $<%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> <a
								class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else
			{
			out.println("There are no proucts");
			}
			%>
			<%@include file="Footer.jsp"%>

</body>
</html>