<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style type="text/css">
*{
    padding:0;
    margin:0;
}
body{
    font-family:'Roboto', sans-serif;
}
#foot{
position:relative;
margin:0;
text-align:center;
top:100px;
}
table {
    border-collapse: collapse;
    
}
a{
text-decoration:none;
}

table, th, td {
    border: 1px solid black;
    width:50%;
    
}
#head ul
{
margin-left:20px;
margin-right:20px;
padding left:10px;
font-size:30px;
background-color:BlueViolet ;
font-family: Raleway, sans-serif;
margin:0;
padding:0;
list-style-type:none;

}
#head ul li
{
display:inline-block;
}
#head ul li a
{
text-decoration:none;  // makes default things null;
color:cornflowerblue;
background-color:gray;

}
#head ul li a:hover
{
color:#fff;
background-color:grey;
white-space: nowrap;
}
#head ul li a:active
{
color:chocolate;
}
#a1
{
margin-top:110px;
background-color:BlueViolet;
}

.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

.button1 {
    background-color: white; 
    color: black; 
    border: 2px solid #4CAF50;
}

.button1:hover {
    background-color: #4CAF50;
    color: white;
}

.button2 {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
}

.button2:hover {
    background-color: #008CBA;
    color: white;
}

.button3 {
    background-color: white; 
    color: black; 
    border: 2px solid #f44336;
}

.button3:hover {
    background-color: #f44336;
    color: white;
}

.button4 {
    background-color: white;
    color: black;
    border: 2px solid blue;
}

.button4:hover {background-color: #e7e7e7;}

.button5 {
    background-color: white;
    color: black;
    border: 2px solid #555555;
}

.button5:hover {
    background-color: #555555;
    color: white;
}
</style>
</head>
<body bgcolor="Orange">
<center>
<table align="center" border="1">
            
            <tr><td>Welcome  <%=session.getAttribute("uid")%></td><td align="right"><a href="logout.jsp">Logout</a></td></tr>
            <tr><td colspan="2"><h1><br><center>Welcome to the user window</center><br></h1></td></tr>
            
                
            <br><tr><td align="center" colspan="2"><a href="uview.jsp"  ><br>view data<br></a><br></td></tr>
           <br> <tr><td align="center" colspan="2"><a href="delete.jsp">delete account</a><br></td></tr>
            <br><tr><td align="center" colspan="2"><a href="update.jsp">update</a><br></td></tr>
            <br><tr><td align="center" colspan="2"><a href="change.jsp">change password</a><br></td></tr>
            <br><tr><td align="center" colspan="2"><a href="logout.jsp">logout</a><br></td></tr>
          <br><tr><td align="center" colspan="2"><a href="Downloadlist.jsp">download</a><br></td></tr>
          <tr><td align="center" colspan="2"><a href="uploaddata.jsp">upload</a><br></td></tr>
        </table>
</center>

<div id="foot">
<h2>- made by Ram</h2>
</div>
</body>
</html>