<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <% 
            try
            {
            Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ram","12345678");
        Statement st=con.createStatement();
        String s=session.getAttribute("uid").toString();
        String t=request.getParameter("word1");
        String u=request.getParameter("word2");
        out.print("s="+s);
        out.print("t="+t);
        int rs=st.executeUpdate("update USERREGISTER set USERPASSWORD='"+t+"' where USERID='"+s+"'");
        int rs1=st.executeUpdate("update LOGINCHECk set USERPASSWORD='"+t+"' where USERID='"+s+"'");
  //  out.print("rs="+rs);
  //  out.print("rs1="+rs1);
            
    %>

    </head>
    <body>
          <%
        if(rs>0)
    response.sendRedirect("userhome.jsp");
      else
            out.print("not updated");
            }
            catch(Exception e)
            {
            out.print(e);
            }
          %>
    </body>
</html>
