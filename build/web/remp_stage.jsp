<%-- 
    Document   : remp_stag
    Created on : 03/05/2020, 11:41:24 AM
    Author     : SpyECho
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="tool.Cnx"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String idg = request.getParameter("idgrp");
    String req = "Select * from STAGIAIRE where CODEGRP ="+idg;
    ResultSet rs = Cnx.get().createStatement().executeQuery(req);
    while (rs.next()) {%>            
    <tr class="trr">
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><input type="checkbox" class="abs" value="<%=rs.getString(1) %>"/></td>
    </tr>
<%        }
%>
