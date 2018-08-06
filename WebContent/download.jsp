<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@page import="javax.servlet.*"%>


<%
     String file1=null;
     String path=null;
      file1=request.getParameter("file");
     response.setHeader( "Content-disposition","attachment;filename="+file1);
//String path=application.getRealPath("data")+"\\"+file1;


 String type=request.getParameter("type");
  if(type.equals("document")) {
     System.out.println(type);  
      response.setHeader( "Content-disposition","attachment;filename="+file1);
  response.setContentType("text/doc");
  path=application.getRealPath("document")+"\\"+file1;
    System.out.println(type);  
  
  }
 if(type.equals("image")) {
     System.out.println("image");  
     response.setContentType("image/jpeg"); 
  path=application.getRealPath("image")+"\\"+file1;
 }

  if(type.equals("audio")) {
  response.setContentType("audio/mp3");
  path=application.getRealPath("audio")+"\\"+file1;
 }
 if(type.equals("video")) {
response.setContentType("video/x-msvideo");
path=application.getRealPath("video")+"\\"+file1;
 }
 



File ff=new File(path);
out.print(ff);
byte b[]=new byte[(int) ff.length()];
FileInputStream pp=new FileInputStream(ff);
pp.read(b);
OutputStream os=response.getOutputStream();
os.write(b);
pp.close();
os.close();



%>