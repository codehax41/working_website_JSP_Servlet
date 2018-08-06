<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page contentType="image/gif"%>
 <%
                     OutputStream o = response.getOutputStream();
//String id=request.getParameter("val");
String saveDir = application.getRealPath("data");
   
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ram","12345678");
        Statement st=con.createStatement();
         String s=session.getAttribute("uid").toString();
         ResultSet rs=st.executeQuery("select IMGNAME from USERREGISTER where USERID='"+s+"'");
        rs.next();
        String s1=rs.getString("IMGNAME");
    
  

   InputStream is = new FileInputStream(new File
           (saveDir+"\\"+s1));        
                            byte[] buf = new byte[32 * 1024];
                 int nRead = 0;
    while( (nRead=is.read(buf)) != -1 ) {
        o.write(buf, 0, nRead);
    }
    o.flush();
    o.close();
      
%>
