<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="navigation.jsp" %>

<div id="bodiv">
    <div class="row page-header" style="margin-top: 0%;">
        <div style="float: left; width: 100%;">
            <ol class="breadcrumb">
                <li class="active">About</li>
            </ol>
        </div>
    </div>
    <div id="boards">
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="well"> 
                    <h3 style="text-align: center"><b>Irvin</b></h3>
                    <img style="margin-left: 32%" class="img-circle" width="120" height="120" src="<c:url value="/res/images/irvin.png"/>">
                    <h5 style="text-align: center">Developer</h5>
                    <h5 style="text-align: center"><a href="irvin@gmail.com">irvin@gmail.com</a><br/></h5>
                    <h5 style="text-align: center">
                        <a href="#" class="icon-button twitter"><i class="icon-twitter"></i><span></span></a>
                        <a href="#" class="icon-button facebook"><i class="icon-facebook"></i><span></span></a>
                        <a href="#" class="icon-button google-plus"><i class="icon-google-plus"></i><span></span></a>
                    </h5>
                    <em><p style="text-align: center">Insert something here!</p></em>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="well"> 
                    <h3 style="text-align: center"><b>Sean</b></h3>
                    <img style="margin-left: 32%" class="img-circle" width="120" height="120" src="<c:url value="/res/images/sean.png"/>">
                    <h5 style="text-align: center">Developer</h5>
                    <h5 style="text-align: center"><a href="http://www.xanpatan@gmail.com">xanpatan@gmail.com</a><br/></h5>
                    <h5 style="text-align: center">
                        <a href="#" class="icon-button twitter"><i class="icon-twitter"></i><span></span></a>
                        <a href="https://www.facebook.com/xanpatan" class="icon-button facebook"><i class="icon-facebook"></i><span></span></a>
                        <a href="https://plus.google.com/u/0/114146712719168854285" class="icon-button google-plus"><i class="icon-google-plus"></i><span></span></a>
                    </h5>
                    <em><p style="text-align: center">Can you be my private variable? I want to be the only one with access to you.</p></em>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="well"> 
                    <h3 style="text-align: center"><b>Mark</b></h3>
                    <img style="margin-left: 32%" class="img-circle" width="120" height="120" src="<c:url value="/res/images/mark.png"/>">
                    <h5 style="text-align: center">Developer</h5>
                    <h5 style="text-align: center"><a href="mark@gmail.com">mark@gmail.com</a><br/></h5>
                    <h5 style="text-align: center">
                        <a href="#" class="icon-button twitter"><i class="icon-twitter"></i><span></span></a>
                        <a href="#" class="icon-button facebook"><i class="icon-facebook"></i><span></span></a>
                        <a href="#" class="icon-button google-plus"><i class="icon-google-plus"></i><span></span></a>
                    </h5>
                    <em><p style="text-align: center">Insert something here!</p></em>
                </div>
            </div>
        </div>
    </div>
</div>  

    <script>
        $(document).ready(function(){
            $("#5").attr("class","active");
    </script>
</html>