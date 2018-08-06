<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
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
<center><br><br><br><br>
<h1><u>Download List</u></h1>
 <table align="center" border="1">
            <tr>
                <th><br>User ID<br><br></th>
                <th>File Type</th>
                <th>File Name</th>
                <th>Download</th>
            </tr>
            </center>
            <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ram","12345678");
  Statement st=con.createStatement();
             
                ResultSet rs=st.executeQuery("select *  from SHAREFILES");
            	String ss=null;
                while(rs.next())
       {
           String t=rs.getString("FTYPE");
    		ss=rs.getString("FNAME");
    		String a=rs.getString("USERID");
        %>
        <tr>
            <td><%=a%></td>
            <td><%=t%></td>
            <td><%=ss%></td>
            <td><a href="download.jsp?file=<%=ss%>&type=<%=t%>">Download</a></td>
            
        </tr>

<br/>
<%}  %>   
<br/>
 </table>
 

<div id="foot">
<h2>- made by Ram</h2>
</div>
</body>
</html>