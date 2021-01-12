<%-- 
    Document   : login
    Created on : 07/05/2020, 11:34:14 AM
    Author     : SpyECho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login</title>
        <link href="css/styles.css" rel="stylesheet" />
       <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <%
        String msg =(String) request.getAttribute("msg");
        
        if (!(msg!=null)) {
                msg="";
            }
        %>
    </head>
    <body class="bg-info">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                        <form action="connection_login" method="">
                                            <div class="form-group"><label class="small mb-1"  for="inputEmailAddress">Matrecule</label><input class="form-control py-4" type="text" name="log" placeholder="Enter Matricule" /></div>
                                            <div class="form-group"><label class="small mb-1"  for="inputPassword">Password</label><input class="form-control py-4" type="password"  name="mdp" placeholder="Enter password" /></div>
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0"><a class="small" href=""></a><button type="submit" value="Send" class="btn btn-primary" id="submit" />Login</button></div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small text-danger"><span href=""><%=msg%></span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; NTIC OFFPT 2020</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
       <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
