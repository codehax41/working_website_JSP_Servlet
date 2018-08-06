<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <%

        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ram","12345678");
        Statement st=con.createStatement();
        String s=request.getParameter("uid");
        int rs=st.executeUpdate("delete  from USERREGISTER where USERID='"+s+"'");
   
    %>
    </head>
   
    <body>
               
 
      <%
        if(rs>0)
    response.sendRedirect("show.jsp");
      else
            out.print("not deleted");
      %>
    </body>
</html>
