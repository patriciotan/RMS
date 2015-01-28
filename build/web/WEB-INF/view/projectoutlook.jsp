<%@include file="navigation.jsp"%>
    <button type="button" class="btn btn-lg btn-primary pull-left" data-toggle="modal" data-target="#addProject">Add new project</button>
    <div id="projectOutlook" class="col-md-12">
        <table id="projOutlook" class="display">
            <thead>
                <tr>
                    <th style="text-align: center">Name</th>
                    <th style="text-align: center">Start Date</th>
                    <th style="text-align: center">End Date</th>
                    <th style="text-align: center">Type</th>
                    <th style="text-align: center">Status</th>
                    <th style="text-align: center">Business Unit</th>
                    <th style="text-align: center">Resources Needed</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${projects}" var="project">
                <tr>
                    <td class="projectName"><c:out value="${project.name}" /></td>
                    <td class="startDate"><c:out value="${project.start}" /></td>
                    <td class="endDate"><c:out value="${project.end}" /></td>
                    <td class="projType"><c:out value="${project.type}" /></td>
                    <td class="projStat"><c:out value="${project.status}" /></td>
                    <td class="bUnit"><c:out value="${project.bUnit}" /></td>
                    <td class="resNeeded"><c:out value="${project.resNeeded}" /></td>
                    <td><button class="btn btn-info editButton" data-toggle="modal" data-target="#editProject">Edit</button></td>
                    <td><button id="deleteButton" class="btn btn-danger deleteButton" data-toggle="modal" data-target="#deleteProject">X</button></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
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
                        <form id="add" name="add" action='<c:url value="addOutlook"/>' method="post" modelAttribute="project">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Name</label>
                                    <input class="form-control" autocomplete="off" required="required"  type="text" name="name" size="20">
                                </div>
                                <div class="form-group">
                                    <label for="">Start Date</label>
                                    <input class="form-control" type="date"  required="required" name="start">
                                </div>
                                <div class="form-group">
                                    <label for="">End Date</label>
                                    <input class="form-control" type="date"  required="required" name="end">
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
                                    <label for="">Status</label>
                                    <select class="form-control" name="status" required="required" >
                                        <option disabled="true" selected default></option>
                                        <option value="No movement">No movement </option>
                                        <option value="Proposal">Proposal </option>
                                        <option value="Official go">Official go</option>
                                        <option value="Verbal go">Verbal go</option>
                                        <option value="For estimation">For estimation</option>
                                        <option value="Ongoing estimation">Ongoing estimation</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Business Unit</label>
                                    <select class="form-control" name="bUnit" required="required" >
                                        <option disabled="true" selected default></option>
                                        <option value="Local">Local</option>
                                        <option value="JP Independent">JP Independent</option>
                                        <option value="ROW">ROW</option>
                                        <option value="Alliance">Alliance</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Resources Needed</label>
                                    <input class="form-control" autocomplete="off"  required="required" type="number" min="1" name="resNeeded" size="20">
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input value="Outlook" name="reference" hidden="hidden">
                                    <input class="btn btn-success" id="add-but" type="submit" value="Submit">
                                    <button class="btn btn-danger" type="button" data-dismiss="modal"><span>Cancel</span></button>
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
                        <form id="add" name="add" action="" method="post">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Name</label>
                                    <input class="form-control" autocomplete="off" required="required" id="field1" type="text" name="projectname" size="20">
                                </div>
                                <div class="form-group">
                                    <label for="">Start Date</label>
                                    <input class="form-control" type="date" id="field2" required="required" name="from" value="yyyy-mm-dd">
                                </div>
                                <div class="form-group">
                                    <label for="">End Date</label>
                                    <input class="form-control" type="date" id="field3" required="required" name="to" value="yyyy-mm-dd">
                                </div>
                                <div class="form-group">
                                    <label for="">Type</label>
                                    <select class="form-control" name="projecttype" required="required" id="field6">
                                        <option disabled="true" selected default></option>
                                        <option value="Project-Based">Project-Based</option>
                                        <option value="Time and Material">Time and Material</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Status</label>
                                    <select class="form-control" name="status" required="required" id="field4">
                                        <option disabled="true" selected default></option>
                                        <option value="No movement"> No movement </option>
                                        <option value="Proposal"> Proposal </option>
                                        <option value="Official go"> Official go</option>
                                        <option value="Verbal go"> Verbal go</option>
                                        <option value="For estimation"> For estimation</option>
                                        <option value="Ongoing estimation"> Ongoing estimation</option>
                                        <option value="Dropped"> Dropped</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Business Unit</label>
                                    <select class="form-control" name="businessunit" required="required" id="field5">
                                        <option disabled="true" selected default></option>
                                        <option value="Local">Local</option>
                                        <option value="JP Independent">JP Independent</option>
                                        <option value="ROW">ROW</option>
                                        <option value="Alliance">Alliance</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Resources Needed</label>
                                    <input class="form-control" autocomplete="off" id="field7" required="required" type="number" min="0" name="resourcesneeded" size="20">
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input class="btn btn-success" id="add-but" type="submit" value="Save">
                                    <button class="btn btn-danger" type="button" data-dismiss="modal"><span>Cancel</span></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for edit project-->
    
    
    <!-- Start modal for delete project-->            
    <div class="modal fade" id="deleteProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-s">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Delete Project</b>
                        </div>
                        <form id="add" name="add" action="" method="post">
                            <div class="panel-body">
                                <div class="form-group" style="text-align: center;">
                                    <label>Delete Project <b id="delName"></b>?</label>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right;">
                                    <input class="btn btn-success" id="add-but" type="submit" value="Yes"/>&nbsp;
                                    <button class="btn btn-danger" type="button" data-dismiss="modal"><span>No</span></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for delete project-->
    
    </body>
    <script>
        $(document).ready(function(){
           
           var val="";
           $("#1").attr("class","active");
           $("#projOutlook").dataTable();
           
           $(".deleteButton").click(function(){
                $("#delName").text($(this).parent().siblings(".projectName").text());
           });
           
           $(".editButton").click(function(){
               $("#field1").val($(this).parent().siblings(".projectName").text());
               $("#field2").val($(this).parent().siblings(".startDate").text());
               $("#field3").val($(this).parent().siblings(".endDate").text());
               $("#field4").val($(this).parent().siblings(".projStat").text());
               $("#field5").val($(this).parent().siblings(".bUnit").text());
               $("#field6").val($(this).parent().siblings(".projType").text());
               $("#field7").val($(this).parent().siblings(".resNeeded").text());
           });
        });
    </script>
</html>