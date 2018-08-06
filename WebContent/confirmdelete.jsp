<%-- 
    Document   : confirmdelete
    Created on : Sep 14, 2014, 5:18:06 PM
    Author     : Ashish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
         <%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ram","12345678");
        Statement st=con.createStatement();
         String s=session.getAttribute("uid").toString();
          int rs=st.executeUpdate("delete  from USERREGISTER where USERID='"+s+"'");
          int rs1=st.executeUpdate("delete from LOGINCHECK where USERID='"+s+"'");
   
       %>
        
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
         <%
        if(rs>0)
    response.sendRedirect("index.html");
       
      else
    	  out.println("<html><center><h1>Not Deleted</h1></center></html>");
      %>
    </body>
</html>
