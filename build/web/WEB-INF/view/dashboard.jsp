<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="navigation.jsp" %>

<div id="bodiv">
    <div class="row" style="margin-top: -2%;">
        <div style="float: left; width: 30%; margin-left: 1%;">
            <h2>Dashboard</h2>
        </div>
    </div>
    <div id="boards">
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
                        <button style="float: left; width: 40%;" class="btn btn-primary" type="button" data-toggle="modal" data-target="#addProject">Add</button>
                    </div>
                    <br/>
                    <div style="width: 100%" class="input-group text-center">
                        <input style="float: left; width: 60%;" disabled type="text" class="form-control" placeholder="New client">
                        <button style="float: left; width: 40%;" class="btn btn-primary" type="button" data-toggle="modal" data-target="#addClient">Add</button>
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

<!-- Start modal for add project-->                
    <div class="modal fade" id="addProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Add Project</b>
                        </div>
                        <form id="add" name="add" action='<c:url value="addProject"/>' method="post" modelAttribute="project">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Name</label>
                                    <input class="form-control" autocomplete="off" required="required"  type="text" name="name" size="20">
                                </div>
                                <div class="form-group">
                                    <label for="">Client Name</label>
                                    <select class="form-control" name="clientId" required="required" >
                                        <option disabled="true" value="default" selected default></option>
                                        <c:forEach items="${clients}" var="client">
                                            <option value="${client.clientId}"><c:out value="${client.name}" /></option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Start Date</label>
                                    <input class="form-control" type="date"  required="required" name="start" id="start1">
                                </div>
                                <div class="form-group">
                                    <label for="">End Date</label>
                                    <input class="form-control" type="date"  required="required" name="end" id="end1">
                                </div>
                                <div class="form-group">
                                    <label for="">Type</label>
                                    <select class="form-control" name="type" required="required" >
                                        <option disabled="true" selected default></option>
                                        <option value="Project-Based">Project-Based</option>
                                        <option value="Time and Material">Time and Material</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Business Unit</label>
                                    <select class="form-control" name="bUnit" required="required">
                                        <option disabled="true" selected default></option>
                                        <option value="Philippines">Philippines</option>
                                        <option value="Japan">Japan</option>
                                        <option value="Rest of the World">Rest of the World</option>
                                        <option value="Alliance">Alliance</option>
                                    </select>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input value="Ongoing" name="status" hidden="hidden">
                                    <input value="Summary" name="reference" hidden="hidden">
                                    <input class="btn btn-success" id="add-but1" type="submit" value="Submit">
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for add project-->

<!-- Start modal for add client-->            
    <div class="modal fade" id="addClient" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Add Client</b>
                        </div>
                        <form id="add" name="add" action='<c:url value="addClient"/>' method="post" modelAttribute="client">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Name</label>
                                    <input class="form-control" autocomplete="off" required="required"  type="text" name="name" size="20">
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input value="Outlook" name="reference" hidden="hidden">
                                    <input class="btn btn-success" id="add-but" type="submit" value="Submit">
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for add client-->

</div>
</div>
</div><!-- closing div from navigation-->


    <script>
        $(document).ready(function(){
            $("#0").attr("class","active");
            
            $("#add-but1").click(function(event){
                 if($("#start1").val()>$("#end1").val()){
                     alert("End date should be greater than start date.");
                     event.preventDefault();
                 } 
            });
            
            $('.table').DataTable({
                "order": [[ 1, "desc" ]],
                "scrollCollapse": true,
                "paging":         false,
                "bInfo":          false,
                "bFilter":        false
            });
            
            $('#btnToggle').click(function(){
                if ($(this).hasClass('on')) {
                    $('#boards .col-md-6').addClass('col-md-4').removeClass('col-md-6');
                    $(this).removeClass('on');
                }
                else {
                    $('#boards .col-md-4').addClass('col-md-6').removeClass('col-md-4');
                    $(this).addClass('on');
                }
            });

        });
    </script>
</html>