<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<style>
#foot{
position:relative;
margin:0;
margin-left:45%;
top:200px;
}
table {
    border-collapse: collapse;
}

table, th, td {
    border: 1px solid black;
}
input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=text] {
    width: 80%;
    padding: 4px 10px;
    margin: 2px 0;
    box-sizing: border-box;
    border: 1px solid black;
    border-radius: 4px;
}

input[type=submit]:hover {
    background-color: #45a049;
}
*{
    padding:0;
    margin:0;
}
body{
    font-family:'Roboto', sans-serif;
}
#ad{
position:relative;
top:100px;
}
</style>
</head>
<body bgcolor="Orange">
		<div>
		<center>
		<img src="images/a.png">
		</center>
		</div>
		<div id="ad">
		<center>
        <table align="center" border="1">
            <tr><td>Welcome  <%=session.getAttribute("uid")%></td><td align="right"><a href="logout.jsp">Logout</a></td></tr>
            <tr><td align="center" colspan="2"><h1>welcome to the admin window</h1></td></tr>
            
            <tr><td align="center" colspan="2"><a href="show.jsp">show all user records</a></td></tr>
            </table>
            </center>
            </div>
            <div id="foot">
<h2>- made by Ram</h2>
</div>
    </body>
</html>