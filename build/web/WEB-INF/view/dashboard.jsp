<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="navigation.jsp" %>

<div id="bodiv">
    <div class="row">
        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading"><a href="rSummary" class="pull-right">View more</a> <h5><b>Under loaded resources for February</b></h5></div>
                <div class="panel-body">
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <th style="text-align: left">Resource Name</th>
                                <th style="text-align: right">Total Effort</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${underload}" var="ul">
                                    <tr>
                                        <td style="text-align: left"><c:out value="${ul.fname} ${ul.lname}" /></td>
                                        <td style="text-align: right"><c:out value="${ul.jan}" /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="well"> 
                <form class="form">
                    <h5><b>Add new project or client</b></h5>
                    <br/>
                    <div style="width: 100%" class="input-group text-center">
                        <input style="float: left; width: 60%;" disabled type="text" class="form-control" placeholder="New project">
                        <button style="float: left; width: 40%;" class="btn btn-primary" type="button">Add</button>
                    </div>
                    <br/>
                    <div style="width: 100%" class="input-group text-center">
                        <input style="float: left; width: 60%;" disabled type="text" class="form-control" placeholder="New client">
                        <button style="float: left; width: 40%;" class="btn btn-primary" type="button">Add</button>
                    </div>
                </form>
                <br/>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading"><a href="cSummary" class="pull-right">View more</a> <h5><b>Latest clients added</b></h5></div>
                <div class="panel-body">
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <th style="text-align: left">Client Name</th>
                                <th style="text-align: right">Date Added</th>
                            </thead>
                            <tbody>
                                <c:forEach end="2" items="${clients}" var="client">
                                    <tr>
                                        <td style="text-align: left">${client.name}</td>
                                        <td style="text-align: right">${client.addedDate}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading"><a href="pSummary" class="pull-right">View more</a> <h5><b>Latest projects added</b></h5></div>
                <div class="panel-body">
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <th style="text-align: left">Project Name</th>
                                <th style="text-align: right">Date Added</th>
                            </thead>
                            <tbody>
                                <c:forEach end="2" items="${projects}" var="project">
                                    <tr>
                                        <td style="text-align: left">${project.name}</td>
                                        <td style="text-align: right">${project.addedDate}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading"><a href="pSummary" class="pull-right">View more</a> <h5><b>Projects ending this month</b></h5></div>
                <div class="panel-body">
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <th style="text-align: left">Project Name</th>
                                <th style="text-align: right">End Date</th>
                            </thead>
                            <tbody>
                                <c:forEach end="2" items="${unPro}" var="up">
                                    <tr>
                                        <td style="text-align: left">${up.name}</td>
                                        <td style="text-align: right">${up.end}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
</div>
</div><!-- closing div from navigation-->


    <script>
        $(document).ready(function(){

            $("#0").attr("class","active");
            
            $('.table').DataTable({
                "order": [[ 1, "desc" ]],
                "scrollCollapse": true,
                "paging":         false,
                "bInfo":          false,
                "bFilter":        false
            });

        });
    </script>
</html>