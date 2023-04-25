	
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="website.DbCon"%>
<%@page import="website.User"%>
    <% 
		User auth =(User) request.getSession().getAttribute("auth");
		if(auth!=null)
		{
			request.setAttribute("auth", auth);
		}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Register</title>
<%@include file="Header.jsp"%>
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
.center
{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    width: 400px;
    background-color: white;
    border-radius: 10px;
}
.center h1
{
    text-align: center;
    padding: 0 0 20px 0;
    border-bottom: 1px solid silver;
}
.center form
{
    padding:0 40px;
    box-sizing: border-box;
}
form .text
{
    position: relative;
    border-bottom: 2px solid #adadad;
    margin: 30px 0;
}
.text input
{
    width: 100%;
    padding: 0 5px;
    height: 40px;
    font-size: 16px;
    border: none;
    background: none;
    outline: none;
}
.text label
{
    position: absolute;
    top: 50%;
    left: 5px;
    color: #adadad;
    transform: translateY(-50%);
    font-size: 16px;
    pointer-events: none;
    transition: 0.5s;
}
.text span::before
{
    content: ''; 
    position: absolute;
    top: 40px;
    left: 0;
    width: 0%;
    height: 2px;
    background: rgb(18, 177, 226);
}
.text input:focus ~ label,
.text input:valid ~ label
{
    top: -5px;
    color: #2691d9;
}
.text input:focus ~ span::before,
.text input:valid ~ span::before
{
    width: 100%;
}
input[type="submit"]
{
    width: 100%;
    height: 50px;
    border: 1px solid;
    background: rgb(18, 177, 226);
    border-radius: 25px;
    color: white;
    cursor: pointer;
    outline: none;
    transition: 0.5s;
}
input[type="submit"]:hover
{
    background: rgb(22, 131, 163);

}
.login
{
    margin: 30px 0;
    text-align: center;
    font-size: 16px;
    color: #666666;
}
.login a
{
    color: rgb(18, 177, 226);
    text-decoration: none;
}
.login a:hover
{
    text-decoration: underline;
}
	</style>
	<%@include file="NavBar.jsp"%>
	<div class="center">
        <h1>SIGN-UP</h1>
            <form action="register-user" method="post">
                <div class="text">
                    <input type="text" required name="userid">
                    <span></span>
                    <label>ID</label>
                </div>
                <div class="text">
                    <input type="text" required name="username">
                    <span></span>
                    <label>NAME</label>
                </div>
                <div class="text">
                    <input type="text" required name="useremail">
                    <span></span>
                    <label>EMAIL</label>
                </div>
                <div class="text">
                    <input type="password" required name="userpass">
                    <span></span>
                    <label>PASSWORD</label>
                </div>
                <input type="submit" value="REGISTER">
                <div class="login">
                    Already have an Account?
                    <a href="userlogin.jsp">LOGIN HERE</a>
                </div>
            </form>
    </div>
</body>
</html>