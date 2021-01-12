<%-- 
    Document   : consulte_absance
    Created on : 23/05/2020, 11:03:28 AM
    Author     : SpyECho
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="tool.Cnx"%>
<%@page import="tool.Cnx"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>formateur</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
                <%
        String log = request.getSession().getAttribute("login").toString();
        ResultSet rsm = Cnx.get().createStatement().executeQuery("select distinct m.* from MODULE m , MODULEFORMATEURGROUPE f where m.idModule = f.idModule and f.MATRICULE ='"+log+"'");
        if (log!=null) {
%>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="index.html">NTIC OFPPT</a><button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button
            ><!-- Navbar Search-->
            <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                
            </div>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="deco">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Espace Formateur</div>
                            <a class="nav-link" href="menu.jsp"
                                ><div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Menu prancipale</a>
                            <a class="nav-link" href="ajoute_absance.jsp"
                                ><div class="sb-nav-link-icon"><i class="fas fa-arrow-circle-down"></i></div>
                                Ajoute Seance</a>
                            <a class="nav-link" href="#"
                                ><div class="sb-nav-link-icon"><i class="fab fa-readme"></i></div>
                                Consulte l'absance</a>
                            
                            
                            
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav"><a class="nav-link" href="layout-static.html">Static Navigation</a><a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a></nav>
                            </div>   
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                            <div class="small">Compte De:</div>
                        Formateur  <strong><%=log %></strong>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Consulte l'absance</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Menu Prancipale/ Consulte l'absance</li>
                        </ol>
                        <div class="row justify-content-center">
                            <div class="col-xl-8">
                                <div class="card mb-4">
                                    <div class="card-header"><i class="fas fa-table"></i> Choisissez une Période</div>
                                   
                                    <div class="row mt-2" >
                                           <div class="col  col-6" >
                                                <div class=" form-group col-6"><label class="small mb-1">Liste De Modules</label>
                                                    <div class="col-md-2">
                                                        <select class="btn btn-light  btn-lg dropdown-toggle" id="mod" name="mod" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                 
                                                                 <option disabled="" selected="nomod" >--chosie un module--</option>
                                                                 <%
                                                                        while (rsm.next()) {%>             
                                                                        <option value="<%=rsm.getString(1)%>"><%=rsm.getString(3)%></option>
                                                                            <%}
                                                                 %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col col-6" >
                                                <div class=" form-group col-6"><label class="small mb-1">Liste De Groupes</label>
                                                    <div class="col-md-2">
                                                        <select class="btn btn-light btn-lg dropdown-toggle" width="40%" id="gr" name="gr" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <option disabled="" selected="" value="nogroupe">--chosie un groupe--</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col mr-2 ml-4">
                                                 <div class="form-check form-check-inline">
                                                     <input class="form-check-input periode" type="radio" name="Periode" id="Radio1" value="Seance">
                                                     <label class="form-check-label" for="inlineRadio1">Derniére Séance</label>
                                                 </div>
                                            </div>
                                             <div class="col mr-2 ml-4">
                                                 <div class="form-check form-check-inline">
                                                     <input class="form-check-input periode" type="radio" name="Periode" id="Radio2" value="Semaine">
                                                     <label class="form-check-label" for="inlineRadio1">Derniére Semaine</label>
                                                 </div>
                                            </div>
                                             <div class="col mr-2 ml-4">
                                                 <div class="form-check form-check-inline">
                                                     <input class="form-check-input periode" type="radio" name="Periode" id="Radio3" value="Mois">
                                                     <label class="form-check-label" for="inlineRadio1">Derniére Mois</label>
                                                 </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-xl-8">
                                <div  class="card mb-4">
                                    <div class="card-header"><i class="fas fa-list"></i> Liste d'Absance</div>
                                    <div id="tbb">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; NTIC OFPPT 2020</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
             
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="js/Sawl.js" type="text/javascript"></script>
        <script>
            $(document).ready(function (){
                
            $("#mod").change(function (){
                $.ajax({
                    url:'remp_grp.jsp',
                    data :{form: '<%=log%>', module: $("#mod").val()},
                    success: function (res){
                        $("#gr").html(res);
                    }
                });
            });
            
            $("input.periode").click(function(){
                var p = $('.periode:checked').val();
               
                $.ajax({
                    
                    url:'Absense.jsp',
                    data :{groupe: $("#gr").val(), module: $("#mod").val() ,prei :p},
                    success: function (res){
                        $("#tbb").html(res);
                    }
                });
                
            });
         
            });
        </script>
    </body>
        <%
}else{

request.getRequestDispatcher("login.jsp").forward(request,response);
}
        
    
        %>
</html>
