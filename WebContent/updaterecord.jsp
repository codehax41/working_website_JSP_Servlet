<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Confirm</title>
    </head>
    <body>
    <%
         Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ram","12345678");
        Statement st=con.createStatement();
        int limit=1024*1024*1024;
        MultipartRequest mpr = new MultipartRequest(request, application.getRealPath("data"), limit);
        String s=mpr.getParameter("uid");
        String t=mpr.getParameter("word");
        String u=mpr.getParameter("mob");
        String v=mpr.getParameter("city");
        String w=mpr.getOriginalFileName("photo");
      //  String w1=mpr.getOriginalFileName("photo1");
        int rs=st.executeUpdate("update USERREGISTER set USERPASSWORD='"+t+"',MOBILENO='"+u+"',CITYNAME='"+v+"',IMGNAME='"+w+"' where USERID='"+s+"'");
        int ra=st.executeUpdate("update LOGINCHECK set USERPASSWORD='"+t+"' where USERID='"+s+"'");

        %>
        
        <%
        if(rs>0 && ra>0)
    response.sendRedirect("show.jsp");
      else
    	  out.println("<html><center><h1>Not Updated</h1></center></html>");
      %>
    </body>
</html>
