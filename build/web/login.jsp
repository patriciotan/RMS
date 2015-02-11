<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%      response.setDateHeader("Expires", 0);
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RMS - Log in</title>
        <link href='<c:url value="/res/css/bootstrap.css"/>' type="text/css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href='<c:url value="/res/css/dataTables.bootstrap.css"/>'>
        <link type="text/css" rel="stylesheet" href='<c:url value="/res/css/view.css"/>'>
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
        <link rel="shortcut icon" href='<c:url value="/res/images/mini_alliance.png"/>'>
        <script src='<c:url value="/res/js/jquery.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/bootstrap.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/jquery.dataTables.js"/>' type="text/javascript"></script>    
    </head>
    <body>

        <div id="home" >
            <div class="overlay">
                <div class="container">
                    <img class="pull-right" style="width: 50%; margin-top: 7%;" src='<c:url value="/res/images/rms_label.png"/>' alt="rms label">
                    <div class="row">
                        <div style=" width: 25%; margin-left: 73%; margin-top: 15%;">
                            <form action='<c:url value="loginSubmit"/>' method="post" modelAttribute="user">
                            <div class="div-trans text-center">
                                <br/>
                                <img style="width: 60%" src='<c:url value="/res/images/asi_logo_login.png"/>' class="img-rounded" alt="alliance logo">
                                <br/><br/><br/>
                                <div class="col-lg-12 col-md-12 col-sm-12" >
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="username" placeholder="Username" required />
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" name="password" placeholder="Password" required />
                                    </div>
                                    <br/>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-login btn-block btn-lg">Sign in</button>
                                    </div>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--./ HOME SECTION END -->