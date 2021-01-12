<%-- 
    Document   : menu.jsp
    Created on : 07/05/2020, 12:01:39 PM
    Author     : SpyECho
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="tool.Cnx"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        
        <link href="css/styles.css" rel="stylesheet" />
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>formateur</title>
        <link href="css/timedropper.css" rel="stylesheet" type="text/css"/>
        <link href="css/timedropper.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <%
        String log = request.getSession().getAttribute("login").toString();
        Object err = request.getAttribute("insertError");
        ResultSet rsm = Cnx.get().createStatement().executeQuery("select distinct m.* from MODULE m , MODULEFORMATEURGROUPE f where m.idModule = f.idModule and f.MATRICULE ='"+log+"'");
        if (log!=null) {
        %>
    </head>


    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="menu.jsp">NTIC OFPPT</a><button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button
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
                            <a class="nav-link" href=""
                                ><div class="sb-nav-link-icon"><i class="fas fa-arrow-circle-down"></i></div>
                                Ajoute Seance</a>
                            <a class="nav-link" href="consulte_absance.jsp"
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
                 <%
                 if(err!=null){
                     
                 %>
                 <div class="alert alert-danger alert-dismissible fade show mt-1 mr-4 ml-4" role="alert">
                      impossible <strong>d'ajouter une séance </strong> parce que le cumul est supérieur ou égal la masse horaire,<strong> Sauf s’il s’agit d’une séance concernant un EFM</strong>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                 <%
                 }
                 %>
                    <div class="container-fluid">
                        <h1 class="mt-4">Ajoute Seance</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Menu Prancipale / Ajoute Seance</li>
                        </ol>
                        <div class="row justify-content-center">
                            <div class="col-xl-8">
                                <div class="card mb-4">
                                    <div class="card-header"><i class="fas fa-calendar-day"></i> Seance</div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                    <form action="insertionSeance" method="">
                                        
                                        <div class="row">
                                            <div class="col mr-2 ml-4" >
                                                <div class="dates form-group" ><label class="small mb-1"  for="Date">Date Realisation</label><input readonly=""  id="datepicker" class="form-control py-4"  type="text" name="dr" placeholder="DD/MM/YYYY" autocomplete="off" >
                                                </div>
                                            </div>
                                            <div class="col mr-2 ml-2" >
                                                <div class="dates form-group"><label class="small mb-1"  for="Date">HeureDebut</label><input readonly="" id="timepicker1" class="form-control py-4 timepicker" type="text"  name="hd" placeholder="HH:MM" autocomplete="off"/></div>
                                            </div>
                                            <div class="col mr-4 ml-2" >
                                                <div class="dates form-group"><label class="small mb-1"  for="Date">HeureFin</label><input readonly="" id="timepicker2" class="form-control py-4 timepicker" type="text"  name="hf" placeholder="HH:MM" autocomplete="off"/></div>
                                            </div>
                                        </div>
                                        <div class="row" >
                                           <div class="col  col-6" >
                                                <div class=" form-group col-6"><label class="small mb-1">Liste De Modules</label>
                                                    <div class="col-md-2">
                                                        <select class="btn btn-light  btn-lg dropdown-toggle" id="mod" name="mod" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                 
                                                                 <option disabled="" selected="" >--chosie un module--</option>
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
                                       
                                            
                                                        <div class="form-group d-flex  justify-content-between mt-4 mr-3 mb-3"><a class="small" href=""></a><button id="mopen" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">Marqué l'absance</button>
                                            </div>
                                            
                                            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-xl" role="document">
                                                  <div class="modal-content">
                                                    <div class="modal-header">
                                                      <h5 class="modal-title" id="exampleModalLongTitle">List de Etudiants</h5>
                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                      </button>
                                                    </div>
                                                    <div class="modal-body">
                                                      <table id='tab' class="table ml-2 mr-2 table-sm table-striped text-center">
                                                          <thead class="thead-dark">
                                                          <tr>
                                                            <th scope="col">CIN</th>
                                                            <th scope="col">NOM</th>
                                                            <th scope="col">PRENOM</th>
                                                            <th scope="col">Absance</th>
                                                          </tr>
                                                        </thead>
                                                        <tbody id="tb" class="">
                                                         
                                                        </tbody>
                                                     </table>
                                                         <div class="form-group form-check">
                                                             <input type="checkbox" value="EFM" name="EFM" class="form-check-input" id="exampleCheck1">
                                                           <label class="form-check-label font-weight-bold text-danger" for="exampleCheck1">Seance D'EFM</label>
                                                         </div>
                                                    </div>
                                                       
                                                    <div class="modal-footer">
                                                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Retour</button>
                                                      <button id="sub" type="submit"  class="btn btn-primary">Ajoute la Seance</button>
                                                    </div>
                                                  </div>
                                                </div>
                                            </div>
                                                        <input type="text" id="cin" hidden="" name="cin">
                                    </form>
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
        <script src="js/scripts.js"></script>
        <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min_1.js" type="text/javascript"></script>
        <script src="js/scripts.js"></script>
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script src="js/timedropper.js" type="text/javascript"></script>
        <script src="js/timedropper.min.js" type="text/javascript"></script>
        <script src="js/Sawl.js" type="text/javascript"></script>
       <script>
  var today = new Date().toISOString().split('T')[0];
  var t = today.split('-');
  var d = t[1]+"/"+t[2]+"/"+t[0];
  $("#datepicker").val(d);
  
  $( function() {
    $( "#datepicker" ).datepicker();
  });
  
  $("#timepicker1").timeDropper({
      format:'HH:mm',
      meridians:false,
      setCurrentTime:false

      
  });
  $("#timepicker2").timeDropper({
      format:'HH:mm',
      meridians:false,
      setCurrentTime:false
      
  });
  </script>
  <script>
         $(document).ready(function (){
              $("#mopen").prop('disabled', true);
             
             $("#mod").change(function (){
                 $("#mopen").prop('disabled', true);
                $.ajax({
                    url:'remp_grp.jsp',
                    data :{form: '<%=log%>', module: $("#mod").val()},
                    success: function (res){
                        $("#gr").html(res);
                    }
                });
            });
            
            $("#gr").change(function (){
                $.ajax({
                    url:'remp_stage.jsp',
                    data :{idgrp: $("#gr").val()},
                    success: function (res){
                        $("#tb").html(res);
                    }
                });
            
            });
            $("#gr").blur(function (){
                if ($("#gr").val()==="nogroupe" || $("#gr").val()===null) {
                    $("#mopen").prop('disabled', true);
                }
                else{
                    $("#mopen").removeAttr('disabled');
                }
                    
            });
            $("#\n\
            1").click(function (){
                  var cin = $(".abs:checked");
                  var name = "";
                cin.each(function(i) {
                    if (i<cin.length-1) {
                        name+=cin[i].value+",";
                    }
                    else{
                        name+=cin[i].value;
                    }            
                });
               $("#cin").val(name);
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
