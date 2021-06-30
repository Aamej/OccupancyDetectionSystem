<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Admin Login</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/all.css">
        <link rel="icon" href="images/logo.png" />
        <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/all.js" type="text/javascript"></script>
        <style>
            .bg-new{
                background-image:url('images/vmsbg.jpg');        
                background-size:100%;
                background-position:-50%;
                box-shadow: 0 0 2px 2px gray;
            }
            body{
                background-image:url('images/vmsbg.jpg');        
                background-size:100% 100%;
            }
        </style>
    </head>
    <body style="height: 100vh; background-color: rgb(234, 245, 250);">
        <div class="jumbotron rounded-0 p-3 mb-2 bg-transparent text-white text-center" style="box-shadow: 0 0 5px 2px white">
            <h2 class="text-center ml-5" style="text-shadow:2px 2px 2px black;">Visitors Management System</h2>            
            <h2 class="text-center ml-5" style="text-shadow:2px 2px 2px black;">Admin Login</h2>            
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-4 offset-10 bg-white text-center mt-5 shadow p-4">
                    <img src="images/logo.png" style="width:200px;" class="my-2"/>
                    <form method="post" autocomplete="off" action="Validate">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-danger border-0 text-white">
                                        <i class="fas fa-user-tie"></i></span>
                                </div>
                                <input type="text" placeholder="User ID here" name="userid" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-danger border-0 text-white">
                                        <i class="fas fa-key"></i>
                                    </span>
                                </div>
                                <input type="password" name="pwd" placeholder="Password here" class="form-control">
                            </div>
                        </div>                                                                     
                        <input type="submit" value="Login" class="btn btn-danger btn-block" />
                    </form>
                    <%
                        if (session.getAttribute("error") != null) {
                    %>
                    <div class="alert alert-danger text-bold text-center mt-2">
                        <%= session.getAttribute("error")%>
                    </div>
                    <%
                            session.removeAttribute("error");
                        }
                    %>
                </div>
            </div>
        </div>
    </form>
</body>
</html>