<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <%
            MultipartRequest mpr=null;
         Class.forName("oracle.jdbc.driver.OracleDriver");
         Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ram","12345678");
        Statement st=con.createStatement();
        int limit=1024*1024*1024;
         String saveDir = application.getRealPath("video");
         File f = new File(saveDir);
         f.mkdirs(); 
        String s=session.getAttribute("uid").toString();
        mpr = new MultipartRequest(request, application.getRealPath("video"), limit);
       String t=mpr.getParameter("filetype");
        System.out.print("t="+t);    
         String w=mpr.getOriginalFileName("upload");
        int rs=st.executeUpdate("insert into SHAREFILES values('"+s+"','video','"+w+"')");
    if(rs>0)
    	request.getRequestDispatcher("userhome.jsp").include(request, response);

    else
    {
        out.print("update failed");
    
    }
        %>
    <body>
    </body>
</html>
