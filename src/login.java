/*
 * To change this license header, choose License Headers in Project Properties.

 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
/**
 *
 * @author sandeep
 */

public class login extends HttpServlet {

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
      HttpSession ss=request.getSession();
           
      String uid=request.getParameter("uname");
        String pwd=request.getParameter("password");
        out.print(" aaaaaaaaaa" +pwd);
     Class.forName("oracle.jdbc.driver.OracleDriver");
     out.print("dddddddddddddddddddddddd");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ram","12345678");
    out.print("bbbbbbbbb"+con);    
    Statement st=con.createStatement();
        out.print("   "+st);
        ResultSet rs=st.executeQuery("select * from LOGINCHECK where USERID='"+uid+"' and USERPASSWORD='"+pwd+"' ");
     if(rs.next())
     {
     if(rs.getString("myuser").equals("user"))
     {ss.setAttribute("uid",rs.getString("userid"));
     response.sendRedirect("userhome.jsp");       
     }
     else if(rs.getString("myuser").equals("admin"))
     {ss.setAttribute("uid",rs.getString("userid"));
         response.sendRedirect("adminhome.jsp");
     }
     else
     {
     out.print("wrong user name or password");
     }
     }
//out.print(uid+" Login SuccessFully");
        else
        {
        	response.sendRedirect("index.html");
        }
    }
        catch(Exception e)
        {
        out.print(e);
        e.printStackTrace();
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
