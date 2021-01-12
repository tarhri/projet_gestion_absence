/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tool;

import com.sun.org.apache.regexp.internal.REUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author SpyECho
 */
public class insertionSeance extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String dr = request.getParameter("dr");
            String hd = request.getParameter("hd");
            String hf = request.getParameter("hf");
            String mod = request.getParameter("mod");
            String grp = request.getParameter("gr");
            String cin [] = request.getParameter("cin").split(",");
            String EFM = request.getParameter("EFM");
            try {
                
            if (EFM!=null) {
                 Cnx.get().createStatement().executeUpdate("update MODULEFORMATEURGROUPE set DATEEFM = to_date('"+dr+"','MM/DD/YYYY') where CODEGRP="+grp+"and  IDMODULE="+mod);
            }
            } catch (Exception e) {
                e.printStackTrace();
            }
           
            JSONArray ary = new JSONArray();
            if (cin.length>0){       
                
                for (int j = 0; j < cin.length; j++) {
                    JSONObject obj  = new JSONObject();
                    obj.put("cin",cin[j]);
                    ary.add(obj);
                }
                
            }
            
            
                
            
            try {
                String req2 = "select CUMUL ,MASSEHORAIRE from MODULE m,MODULEFORMATEURGROUPE f where m.IDMODULE=f.IDMODULE and  f.CODEGRP="+grp+" and  f.IDMODULE="+mod;
                    System.out.println(req2);
                ResultSet rs = Cnx.get().createStatement().executeQuery(req2);
                if (rs.next()) {    
                
                    if (EFM!=null && (rs.getDouble(1) < rs.getInt(2)  ) || rs.getDouble(1)<rs.getInt(2)  ) {

                        String req="insert into seance values (id_sea.nextval,to_date('"+dr+"','MM/DD/YYYY'),to_date('"+hd+"','HH24:MI'),to_date('"+hf+"','HH24:MI'),"+mod+","+grp+",'"+ary+"')";
                        System.out.println(req);
                        Cnx.get().createStatement().executeUpdate(req);
                        Cnx.get().createStatement().close();
                        request.setAttribute("insert","La séance a été <strong> ajoutée avec succès </strong>");
                        request.getRequestDispatcher("menu.jsp").forward(request, response);
                    }
                    else{
                        request.setAttribute("insertError","error");
                        request.getRequestDispatcher("ajoute_absance.jsp").forward(request, response);
                    }
                }
            } 
            catch (Exception e) {
                e.printStackTrace();
            }
           
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
