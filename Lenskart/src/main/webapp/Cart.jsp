
<%@page import="website.*"%>
<%@page import="website.ProductDao"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="Header.jsp"%>
<title>E-Commerce Cart</title>
<style type="text/css">

.table tbody td{
vertical-align: middle;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 25px;
}
</style>
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
	.bor
	{
		color:white;
		border: 1px solid white;
	}
	.btn
	{
		color: white;
		border: 2px solid white;
	}
	.btn:hover
	{
		background: black;
		color: white;
	}
	</style>
	<%@include file="NavBar.jsp"%>

	<div class="container my-3">
		<div class="bor d-flex py-3"><h3>Total Price: $ ${(total>0)?dcf.format(total):0} </h3> <a class="mx-3 btn" href="cart-check-out">Check Out</a></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Order Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%= dcf.format(c.getPrice())%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
								<input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
				}}%>
			</tbody>
		</table>
		<%@include file="Footer.jsp"%>
	</div>