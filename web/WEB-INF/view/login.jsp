<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%      response.setDateHeader("Expires", 0);
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RMS | Log in</title>
        <link href='<c:url value="/res/css/bootstrap.css"/>' type="text/css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href='<c:url value="/res/css/dataTables.bootstrap.css"/>'>
        <link type="text/css" rel="stylesheet" href='<c:url value="/res/css/view.css"/>'>
        <link rel="shortcut icon" href='<c:url value="/res/images/mini_alliance.png"/>'>
        <script src='<c:url value="/res/js/jquery.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/bootstrap.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/jquery.dataTables.js"/>' type="text/javascript"></script>    
    </head>
    <body>
        
        <div class="outer">
        <div class="middle">
        <div class="inner-login">
            
            <div class="top">
                <img src='<c:url value="/res/images/asi_logo.png"/>' class="img-rounded" alt="Responsive image">
                <b style="margin-top: 30px;" class="pull-right">Log in to access RMS!</b>
            </div>
            <div id="row1">&nbsp;
            </div>
                <!--last div should be with the content-->
        
        <br />
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <form action='<c:url value="loginSubmit"/>' method="post" modelAttribute="user">
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" class="form-control" name="username" required />
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="password" required />
                    </div>
                    <br/>
                    <input type="submit" class="btn btn-danger btn-sm btn-block" value="Sign in" />
                </form>
                <br/>
            </div>
        </div>
        <div id="row1"><br/></div>
        <div class="row footer">
            <p class="text-right"><small><em>&copy; 2014</em></small></p>
        </div>
    
    </div>
    </div>
    </div>
        
    </body>
</html>