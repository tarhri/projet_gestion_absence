


<%@page import="tool.Cnx"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%
    String forma = request.getParameter("form");
    String mod = request.getParameter("module");
    String req = "Select g.* from GROUPE g , MODULEFORMATEURGROUPE f where g.codegrp = f.codegrp and f.MATRICULE ='"+forma+"' and IDMODULE ="+mod;
    ResultSet rs =Cnx.get().createStatement().executeQuery(req);%>
    %><option disabled="" selected="" value="nogroupe">--chosie un groupe--</option>
<%   while (rs.next()) {%>
    <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>    
    <% }
rs.close();
%>