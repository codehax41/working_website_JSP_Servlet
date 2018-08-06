<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Update Photo</title>
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
<%
    Class.forName("oracle.jdbc.driver.OracleDriver");
     Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ram","12345678");
        Statement st=con.createStatement();
     
    	int limit=1024*1024*1024;
        MultipartRequest mpr = new MultipartRequest(request, application.getRealPath("data"), limit);
        String s1=session.getAttribute("uid").toString();
        String w1=mpr.getOriginalFileName("img");
        int rs=st.executeUpdate("update USERREGISTER set IMGNAME='"+w1+"' where userid='"+s1+"'");
    
        %>
        
        <%
        if(rs>0)
    response.sendRedirect("uview.jsp");
      else
    	  out.println("<html><center><h1>Not Updated</h1></center></html>");
        System.out.println("Updated");
      %>
</body>
</html>