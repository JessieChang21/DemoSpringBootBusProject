<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<meta charset="utf-8">
<title>無事坐Bus - Login</title>

    <!-- Custom fonts for this template-->
    <link href="/ServerSide/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/ServerSide/css/sb-admin-2.min.css" rel="stylesheet">
<style>
        body.place_img{
            background-image: url("/ServerSide/img/img03.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }

        div.col-md-9n{
            flex: 0 0 40%;
            max-width: 75%; 
        }

        div.col-lg-6n{
            flex: 0 0 100%;
            max-width: 100%; 
        }

        div.my-5n{
            margin-top:8rem!important;
        }
    </style>

</head>
<body class="place_img">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-md-9n">

                <div class="card o-hidden border-0 shadow-lg my-5n">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6n">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!
                                        <c:choose>
											<c:when test='${ ! empty logoutMessage}'>
												<br><h3 class="h4 text-gray-900 mb-4">${logoutMessage}</h3>
										   	</c:when>
										</c:choose>
											<%
												session.removeAttribute("logoutMessage");
											%>
                                        </h1>
                                    </div>
                                    <form class="user"  action="EmployeeLogin.controller" method="post">
                                        <div class="form-group">
                                            <input type="text" name="id" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Enter EmployeeID...">
                                                ${errors.name}
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="pwd" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password">
                                                ${errors.pwd}
                                        </div>
                                        <button type="submit" name="Login" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </button>
                                        ${errors.msg}
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

	
	
    <!-- Bootstrap core JavaScript-->
    <script src="/ServerSide/vendor/jquery/jquery.min.js"></script>
    <script src="/ServerSide/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/ServerSide/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/ServerSide/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/ServerSide/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/ServerSide/js/demo/chart-area-demo.js"></script>
    <script src="/ServerSide/js/demo/chart-pie-demo.js"></script>
	
</body>
</html>