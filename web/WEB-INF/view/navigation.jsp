<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%      response.setDateHeader("Expires", 0);
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
        <link href='<c:url value="/res/css/bootstrap.css"/>' type="text/css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href='<c:url value="/res/css/dataTables.css"/>'>
        <link type="text/css" rel="stylesheet" href='<c:url value="/res/css/view.css"/>'>
        <link rel="shortcut icon" href='<c:url value="/res/images/favicon.ico"/>'>
        <script src='<c:url value="/res/js/jquery.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/bootstrap.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/jquery.dataTables.js"/>' type="text/javascript"></script>    
    </head>
    <body>
        
        <div class="outer">
        <div class="middle">
        <div class="inner">
            
            <div class="top">
                <img style="height: 81px;" src='<c:url value="/res/images/header_logo.png"/>' class="img-rounded" alt="Responsive image">
                <div class="pull-right">
                    <p align="right">
                        <img src='<c:url value="/res/images/flag_jp.gif"/>'>
                        <img src='<c:url value="/res/images/divider_flag.gif"/>'>
                        <img src='<c:url value="/res/images/flag_ph_b.gif"/>'>
                    </p>
                    <p align="right">
                        <b id="username">${sessVar}</b>
                        <br/>
                        <form action='<c:url value="logoutSubmit"/>' method="post">
                            <input type="submit" class="btn btn-danger btn-sm btn-block" value="Logout"/>
                        </form>
                    </p>
                </div>
            </div>
            <div id="navigation">
                <nav class="navbar navbar-default " role="navigation">
                    <div class="container-fluid">
                        <ul class="nav navbar-nav ">
                            <li id="1"><a href="outlook">Project Outlook Summary</a></li>
                            <li id="2"><a href="pSummary"> Project Summary</a></li>
                            <li id="3"><a href="rSummary"> Resource Summary</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
    <!--last div should be with the content-->