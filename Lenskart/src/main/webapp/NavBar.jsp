
<%@page import="website.*"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
	<style background-color: black ></style>
		<a class="navbar-brand" href="index.jsp"><b>LENSKART</b></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="Index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="Cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
				<%
				if (auth != null) {
				%>
				<li class="nav-item"><a class="nav-link" href="Orders.jsp">Orders</a></li>
				<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="userregister.jsp">Register</a></li>
				<li class="nav-item"><a class="nav-link" href="userlogin.jsp">Login</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</nav>