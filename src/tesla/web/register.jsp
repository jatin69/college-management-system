<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>TESLA | Register</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <!-- Mainly scripts -->
        <script src="js/jquery-2.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
       
    </head>

    <body class="gray-bg">

        <div class="middle-box text-center loginscreen   animated fadeInDown">
            <div>
                <div>
                    <h2 class="logo-name">TESLA</h2>
                </div>
                <h3>Register to TESLA</h3>
                <p>Create account to see it LIVE.</p>
                <form class="m-t" role="form" action="register_s.jsp" method="POST">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Username" required="">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="Email" required="">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Password" required="">
                    </div>
                    <div class="form-group">
                        <div class="checkbox i-checks"><label> <input type="checkbox"><i></i> Agree the terms and policy </label></div>
                    </div>
                    <button type="submit" class="btn btn-primary block full-width m-b">Register</button>

                    <p class="text-muted text-center"><small>Already have an account?</small></p>
                    <a class="btn btn-sm btn-white btn-block" href="login.jsp">Login</a>
                </form>
                <p class="m-t"> <small>TESLA College Management System &copy; 2016</small> </p>
            </div>
        </div>


    </body>

</html>
