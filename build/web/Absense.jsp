<%-- 
    Document   : Absense
    Created on : 23/05/2020, 11:27:33 AM
    Author     : SpyECho
--%>


<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="tool.Cnx"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String gr = request.getParameter("groupe");
String mod = request.getParameter("module");
String prei = request.getParameter("prei");

if (prei.equals("Seance")) {
        String req = "select ABSENCE,to_char(DATEREALISATION,'yyyy/mm/dd'),to_char(HEUREDEBUT,'HH24:MI'),to_char(HEUREFIN,'HH24:MI') from SEANCE where  DATEREALISATION =(Select max(DATEREALISATION) from SEANCE where IDMODULE ="+mod+" and CODEGRP = "+gr+" and ABSENCE is not null)";
        System.out.println(req);
        ResultSet rs = Cnx.get().createStatement().executeQuery(req);
        if (rs.next()) {
                System.out.println("JSON but still OBJECT ="+rs.getString(1));
                
                JSONParser jp = new JSONParser();
                
                JSONArray ary = (JSONArray) jp.parse(rs.getString(1));
                
                System.out.println("JSON Array"+ary);
                
                String req2 = "Select cin,Nom,Prenom from STAGIAIRE where 1=1 ",cond  =" and  cin in(";
                for (int i = 0; i < ary.size(); i++) {
                    JSONObject jb =(JSONObject) ary.get(i);
                        if (i<ary.size()-1) {
                                cond+="'"+jb.get("cin")+"',";
                            }
                        else{
                            cond+="'"+jb.get("cin")+"')";
                        }
                    }
               
                System.out.println("requete de Stagaire Absante est ::::  "+req2+cond);
                ResultSet rs2 = Cnx.get().createStatement().executeQuery(req2+cond);
                %>
                <p class="lead text-center">L'absance de La Séance <strong> <%=rs.getString(2)%> </strong>|<strong> <%=rs.getString(3)%></strong>-<strong><%=rs.getString(4)%></strong></p>
                    <table id='tab' class="table table-sm table-striped text-center">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">CIN</th>
                                <th scope="col">PRENOM</th>
                                <th scope="col">NOM</th>
                            </tr>
                        </thead>
                        <tbody id="tb" class="">
                <%
                while (rs2.next()) {                        
                        %>
                        <tr>
                            <td><%=rs2.getString(1) %></td>
                            <td><%=rs2.getString(2)%></td>
                            <td><%=rs2.getString(3)%></td>
                        </tr>
<%
                    }
                %>
                        </tbody>
                    </table>
<%
            }
        
}else if(prei.equals("Semaine")){
    String req = "select ABSENCE,to_char(DATEREALISATION,'yyyy/mm/dd'),to_char(HEUREDEBUT,'HH24:MI'),to_char(HEUREFIN,'HH24:MI') from SEANCE where  NUMSEANCE in(Select NUMSEANCE from SEANCE where IDMODULE ="+mod+" and CODEGRP = "+gr+" and ABSENCE is not null and DATEREALISATION between sysdate-7 and sysdate) order by DATEREALISATION";
    System.out.println(req);
    ResultSet rs = Cnx.get().createStatement().executeQuery(req);
    while (rs.next()) {            
                System.out.println("JSON but still OBJECT ="+rs.getString(1));
                
                JSONParser jp = new JSONParser();
                
                JSONArray ary = (JSONArray) jp.parse(rs.getString(1));
                
                System.out.println("JSON Array"+ary);

                String req2 = "Select cin,Nom,Prenom from STAGIAIRE where 1=1 ",cond  =" and  cin in(";
                for (int i = 0; i < ary.size(); i++) {
                    JSONObject jb =(JSONObject) ary.get(i);
                        if (i<ary.size()-1) {
                                cond+="'"+jb.get("cin")+"',";
                            }
                        else{
                            cond+="'"+jb.get("cin")+"')";
                        }
                    }
                System.out.println("requete de Stagaire Absante est ::::  "+req2+cond);
                ResultSet rs2 = Cnx.get().createStatement().executeQuery(req2+cond);
                %>
                <p class="lead text-center">L'absance de La Séance <strong> <%=rs.getString(2)%> </strong>|<strong> <%=rs.getString(3)%></strong>-<strong><%=rs.getString(4)%></strong></p>
                    <table id='tab' class="table table-sm table-striped text-center">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">CIN</th>
                                <th scope="col">PRENOM</th>
                                <th scope="col">NOM</th>
                            </tr>
                        </thead>
                        <tbody id="tb" class="">
                <%
                while (rs2.next()) {                        
                        %>
                        <tr>
                            <td><%=rs2.getString(1) %></td>
                            <td><%=rs2.getString(2)%></td>
                            <td><%=rs2.getString(3)%></td>
                        </tr>
<%
                    }
                 %>
                        </tbody>
                    </table>
<%
        }
}else if(prei.equals("Mois")){
    String req = "select ABSENCE,to_char(DATEREALISATION,'yyyy/mm/dd'),to_char(HEUREDEBUT,'HH24:MI'),to_char(HEUREFIN,'HH24:MI') from SEANCE where  NUMSEANCE in(Select NUMSEANCE from SEANCE where IDMODULE ="+mod+" and CODEGRP = "+gr+" and ABSENCE is not null and DATEREALISATION between sysdate-30 and sysdate) order by DATEREALISATION";
    System.out.println(req);
    ResultSet rs = Cnx.get().createStatement().executeQuery(req);
    while (rs.next()) {            
                System.out.println("JSON but still OBJECT ="+rs.getString(1));
                
                JSONParser jp = new JSONParser();
                
                JSONArray ary = (JSONArray) jp.parse(rs.getString(1));
                
                System.out.println("JSON Array"+ary);

                String req2 = "Select cin,Nom,Prenom from STAGIAIRE where 1=1 ",cond  =" and  cin in(";
                for (int i = 0; i < ary.size(); i++) {
                    JSONObject jb =(JSONObject) ary.get(i);
                        if (i<ary.size()-1) {
                                cond+="'"+jb.get("cin")+"',";
                            }
                        else{
                            cond+="'"+jb.get("cin")+"')";
                        }
                    }
                System.out.println("requete de Stagaire Absante est ::::  "+req2+cond);
                ResultSet rs2 = Cnx.get().createStatement().executeQuery(req2+cond);%>
                  <p class="lead text-center">L'absance de La Séance <strong> <%=rs.getString(2)%> </strong>|<strong> <%=rs.getString(3)%></strong>-<strong><%=rs.getString(4)%></strong></p>
                    <table id='tab' class="table table-sm table-striped text-center">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">CIN</th>
                                <th scope="col">PRENOM</th>
                                <th scope="col">NOM</th>
                            </tr>
                        </thead>
                        <tbody id="tb" class="">  
                <%while (rs2.next()) {                        
                        %>
                        <tr>
                            <td><%=rs2.getString(1)%></td>
                            <td><%=rs2.getString(2)%></td>
                            <td><%=rs2.getString(3)%></td>
                        </tr>

                <%}%>
                    </tbody>
                    </table>
                  <%

    }
}
%>
