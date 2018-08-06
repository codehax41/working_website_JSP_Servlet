>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
    <head>
        
        <%
            MultipartRequest mpr=null;
         Class.forName("oracle.jdbc.driver.OracleDriver");
         Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ram","12345678");
        Statement st=con.createStatement();
        int limit=1024*1024*1024;
        
        String s=session.getAttribute("uid").toString();
        String saveDir = application.getRealPath("image");
                File f = new File(saveDir);
                f.mkdir(); 
        mpr = new MultipartRequest(request, application.getRealPath("image"), limit);
        String w=mpr.getOriginalFileName("upload");
        int rs=st.executeUpdate("insert into SHAREFILES values('"+s+"','image','"+w+"')");
    if(rs>0)
    	request.getRequestDispatcher("userhome.jsp").include(request, response);
    else
    {
        out.print("update failed");
    
    }
        %>