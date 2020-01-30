<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>TESLA | Login</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <!-- Mainly scripts -->
        <script src="js/jquery-2.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="js/jquery-2.1.1.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#password').bind("enterKey", function (e) {
                    loginClicked();
                });
                $('#password').keyup(function (e) {
                    if (e.keyCode == 13)
                    {
                        $(this).trigger("enterKey");
                    }

                });
            });
        </script>
        <c:set var="base" scope="application" value="http://localhost:8080/tesla" />
    </head>

    <body class="gray-bg">
       

        <div class="middle-box text-center loginscreen animated fadeInDown">
            <div>
                <div>   <h2 class="logo-name">TESLA</h2>                </div>
                <h3>Welcome to TESLA Login</h3>
                <form action="login_s.jsp" method="POST">
                    <div class="m-t">
                        <div class="form-group" id="message" style="color:red;">

                        </div>
                        <div class="form-group">
                            <input id="email" name="email" type="email" class="form-control" placeholder="Username" required="">
                        </div>
                        <div class="form-group">
                            <input id="password" name="password" type="password" class="form-control" placeholder="Password" required="">
                        </div>
                        <button onclick="loginClicked()" class="btn btn-primary block full-width m-b">Login</button>

                        <a href="resetpass.jsp"><small>Forgot password?</small></a>
                        <p class="text-muted text-center"><small>Do not have an account?</small></p>
                        <a class="btn btn-sm btn-white btn-block" href="register.jsp">Create an account</a>
                    </div>
                </form>
                <p class="m-t"> <small>All Rights Reserved &copy; 2016</small> </p>
            </div>
        </div>



    </body>

</html>
