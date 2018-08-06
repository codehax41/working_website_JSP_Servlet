/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.oreilly.servlet.MultipartRequest;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
      

/**
 *
 * @author sandeep
 */
@WebServlet(urlPatterns = {"/register"})
public class register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

             Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ram","12345678");
        Statement st=con.createStatement();
     final int limit = 1024 * 1024 * 1024;
    
                String saveDir = getServletContext().getRealPath("data");
                File f = new File(saveDir);
               System.out.println( f.mkdir());                                           
                 MultipartRequest mpr = new MultipartRequest(request, getServletContext().getRealPath("data"), limit);
                 String imgname=mpr.getOriginalFileName("photo");
               
      String u= mpr.getParameter("userid");
      String w= mpr.getParameter("userpassword");
      String m=mpr.getParameter("mobileno");
            System.out.println("mobile="+m);
      String n=mpr.getParameter("cityname");
      String o=mpr.getParameter("emailid");
        int i=st.executeUpdate("insert into userregister  values('"+u+"','"+w+"','"+m+"','"+n+"','"+imgname+"','"+o+"')");
        int j=st.executeUpdate("insert into logincheck values('"+u+"','"+w+"','user')");
        if(i>0) {
    out.println("<html><center><h1>Registered</h1></center></html>");
    request.getRequestDispatcher("index.html").include(request, response);
    
}
 else
	 response.sendRedirect("index.html");
    out.println("failed");
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        
        finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
