<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="navigation.jsp" %>

<div id="bodiv">
    <div class="row" style="margin-top: -2%;">
        <div style="float: left; width: 20%; margin-left: 2.3%;">
            <h2>Project Summary</h2>
        </div>
        <div style="float: left; margin-left: 65%; margin-right: -10px; margin-top: 12px;">
            <button type="button" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#addProject">New project</button>
        </div>
    </div>
    <div id="projectSummary" class="col-md-12">
        <table id="projSummary" class="display">
            <thead>
                <tr>
                    <th style="text-align: center">Name</th>
                    <th style="text-align: center">Client Name</th>
                    <th style="display:none"></th>
                    <th style="text-align: center">Start Date</th>
                    <th style="text-align: center">End Date</th>
                    <th style="text-align: center">Type</th>
                    <th style="text-align: center">Business Unit</th>
                    <th style="text-align: center">Current Milestone</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody id="projTable">
                <c:forEach items="${projects}" var="project">
                <tr>
                    <form class="specificProject" action='<c:url value="openProject"/>' method="get">
                        <input type="hidden" name="getId" class="projId" value="${project.projectId}"/>
                        <td class="projectName"><a class="projectnamelink"  data-toggle="tooltip" data-placement="top" title="Click me to open project contents."><c:out value="${project.name}" /></a></td>
                    </form>
                    <td class="clientN"><c:out value="${project.clientName}" /></td>
                    <td style="display:none" class="clientI"><c:out value="${project.clientId}" /></td>
                    <td class="startDate"><c:out value="${project.start}" /></td>
                    <td class="endDate"><c:out value="${project.end}" /></td>
                    <td class="projType"><c:out value="${project.type}" /></td>
                    <td class="bUnit"><c:out value="${project.bUnit}" /></td>
                    <td class="mileSto"><c:out value="${project.milestone}" /></td>
                    <td><button class="btn btn-warning editOption" data-toggle="modal" data-target="#editProject">Edit</button></td>
                    <td><button id="deleteButton3" class="btn btn-danger end" data-toggle="modal" data-target="#endProject">End</button></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
    
</div>
</div>
</div><!-- closing div from navigation-->

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
                                    <input class="form-control" autocomplete="off" required="required" id="name1" type="text" name="name" maxlength="30" pattern=".{4,30}" title="4 to 30 Characters">
                                </div>
                                <div class="form-group">
                                    <label for="">Client Name</label>
                                    <select class="form-control" name="clientId" required="required">
                                        <option disabled="true" selected default></option>
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
    
    <!-- Start modal for edit project-->            
    <div class="modal fade" id="editProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Edit Project</b>
                        </div>
                        <form id="edit" name="edit" action='<c:url value="editProjSumm"/>' method="post" modelAttribute="project">
                            <input type="text" name="projectId" id="editProjId" />
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Name</label>
                                    <input class="form-control" autocomplete="off" required="required" id="field1" type="text" name="name" maxlength="30" pattern=".{4,30}" title="4 to 30 Characters">
                                </div>
                                <div class="form-group">
                                    <label for="">Client Name</label>
                                    <select class="form-control" name="clientId" required="required" id="field6">
                                        <c:forEach items="${clients}" var="client">
                                            <option value="${client.clientId}"><c:out value="${client.name}" /></option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Start Date</label>
                                    <input class="form-control" type="date" id="field2" required="required" name="start">
                                </div>
                                <div class="form-group">
                                    <label for="">End Date</label>
                                    <input class="form-control" type="date" id="field3" required="required" name="end">
                                </div>
                                <div class="form-group">
                                    <label for="">Type</label>
                                    <select class="form-control" name="type" required="required" id="field4">
                                        <option value="Project-Based">Project-Based</option>
                                        <option value="Time and Material">Time and Material</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Business Unit</label>
                                    <select class="form-control" name="bUnit" required="required" id="field5">
                                        <option value="Philippines">Philippines</option>
                                        <option value="Japan">Japan</option>
                                        <option value="Rest of the World">Rest of the World</option>
                                        <option value="Alliance">Alliance</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Current Milestone</label>
                                    <input class="form-control" type="text" name="milestone" required="required" id="field7" />
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input class="btn btn-success" id="add-but2" type="submit" value="Save">
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for edit project-->
    
    <!-- Start modal for end project-->            
    <div class="modal fade" id="endProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-s">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>End Project</b>
                        </div>
                        <form id="del" name="del" action='<c:url value="delSummary"/>' method="post" modelAttribute="project">
                            <input type="hidden" name="projectId" id="delProjId"/>
                            <div class="panel-body">
                                <div class="form-group" style="text-align: center;">
                                    <br/>
                                    <label>Are you sure you want to end <b id="endName"></b>?</label>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right;">
                                    <input class="btn btn-success" id="add-but" type="submit" value="Yes"/>&nbsp;
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">No</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for end project-->
    <script>
        $(document).ready(function(){
           $("#2").attr("class","active"); 
           $("#projSummary").dataTable();
            $(".projectnamelink").tooltip();
            $("#add-but1").click(function(event){
                $.ajax({
                    url:'nameExists.htm',
                    type:'post',
                    data:{'name':$("#name1").val()},
                    success:function(data,status){
                        var x = data.toString();
                        var msg = "";
                        if(x === "true"){
                            msg += "Project name already exists!";
                            if($("#start1").val()>$("#end1").val()){
                                msg += "\nStart date cannot be ahead of end date!";
                                alert(msg);
                                event.preventDefault();
                            }else {
                                alert(msg);
                                event.preventDefault();
                            }
                        }
                        else {
                            if($("#start1").val()>$("#end1").val()){
                                msg += "Start date cannot be ahead of end date!";
                                alert(msg);
                                event.preventDefault();
                            }
                        }
                    },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }

                });
            });
            
            $("#add-but2").click(function(event){
                 if($("#field2").val()>$("#field3").val()){
                     alert("End date should be greater than start date.");
                     event.preventDefault();
                 } 
            });
           
           
            $("#projTable").on("click",".end",function(){
                $("#endName").text($(this).parent().siblings(".projectName").text());
                $("#delProjId").val($(this).parent().siblings(".projId").val());
            });
           
            $("#projTable").on("click",".editOption",function(){ 
               $("#editProjId").val($(this).parent().siblings(".projId").val());
               $("#field1").val($(this).parent().siblings(".projectName").text());
               $("#field2").val($(this).parent().siblings(".startDate").text());
               $("#field3").val($(this).parent().siblings(".endDate").text());
               $("#field4").val($(this).parent().siblings(".projType").text());
               $("#field5").val($(this).parent().siblings(".bUnit").text()); 
               $("#field6").val($(this).parent().siblings(".clientI").text());
               $("#field7").val($(this).parent().siblings(".mileSto").text());
               $.ajax({
                    url:'checkProjectTask.htm',
                    type:'post',
                    data:{'id':$(this).parent().siblings(".projId").val()},
                    success:function(data,status){
                        var x = data.toString();
                        if(x=="1"){
                            $("#field2").attr("readonly","true");
                            $("#field3").attr("readonly","true");
                        }else{
                            $("#field2").removeAttr("readonly");
                            $("#field3").removeAttr("readonly");
                        }
                    }
                });
            });
        
            $("#projTable").on("click","a.projectnamelink",function(){
                $(this).parent().parent().find(".specificProject").submit();
                return false;
            });
        });
    </script>
    </body>
</html>