<%@include file="navigation.jsp" %>
<div id="bodiv">
    <div class="row page-header" style="margin-top: 0%;">
        <div style="float: left; width: 80%;">
            <ol class="breadcrumb">
                <li><a href="pSummary">Project Summary</a></li>
                <li class="active">${projectName}</li>
                <li class="pull-right">Duration <code>${start}</code> to <code>${end}</code></li>
            </ol>
            <input type="hidden" id="startDate" value="${start}" />
            <input type="hidden" id="endDate" value="${end}" />
        </div>
        <div style="float: left;" class="pull-right">
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <span style="color: #333333" class="glyphicon glyphicon-export" aria-hidden="true"></span> <b>Export table</b> <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#" onClick ="$('#respSummary').tableExport({type:'json',escape:'false'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON</a></li>
                    <li><a href="#" onClick ="$('#respSummary').tableExport({type:'json',escape:'false',ignoreColumn:'[2,3]'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON (ignoreColumn)</a></li>
                    <li><a href="#" onClick ="$('#respSummary').tableExport({type:'json',escape:'true'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON (with Escape)</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#respSummary').tableExport({type:'xml',escape:'false'});"> <img src='<c:url value="/res/images/xml.png"/>' width='16px'> XML</a></li>
                    <li><a href="#" onClick ="$('#respSummary').tableExport({type:'sql'});"> <img src='<c:url value="/res/images/sql.png"/>' width='16px'> SQL</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#respSummary').tableExport({type:'excel',escape:'false'});"> <img src='<c:url value="/res/images/xls.png"/>' width='16px'> XLS</a></li>
                    <li><a href="#" onClick ="$('#respSummary').tableExport({type:'csv',escape:'false'});"> <img src='<c:url value="/res/images/csv.png"/>' width='16px'> CSV</a></li>
                    <li><a href="#" onClick ="$('#respSummary').tableExport({type:'txt',escape:'false'});"> <img src='<c:url value="/res/images/txt.png"/>' width='16px'> TXT</a></li>
                </ul>
            </div>
            <button type="button" class="btn btn-primary addOption" data-toggle="modal" data-target="#addTask">
                <span style="color: #333333" class="glyphicon glyphicon-plus" aria-hidden="true"></span> <b>New task</b>
            </button>
        </div>
    </div>
    <div id="resourceSummary" class="col-md-12">
        <div class="row">
            <c:forEach items="${tasks}" var="task">
                <div>
                    <div class="taskName" style="background-color:#2e2e2e;color:white;padding: 5px 20px 5px 20px;" data-toggle="tooltip" data-placement="top" title="Click to show / hide task details">
                        <table border="0" style="width:100%;">
                            <tr>
                                <td>Name <code class="tName"><c:out value="${task.name}" /></code></td>
                                <td>Status <code class="tStatus"><c:out value="${task.status}" /></code></td>
                                <td style="width: 50%;text-align: center">Click to show / hide task details</td>
                                <td style="text-align: right">End <code><c:out value="${task.end}" /></code></td>
                                <td style="text-align: right">Start <code><c:out value="${task.start}" /></code></td>
                            </tr>
                        </table>
                    </div>
                    <input type="hidden" class="taskStart" value="${task.start}" />
                    <input type="hidden" class="taskEnd" value="${task.end}" />
                    <input type="hidden" class="taskId" value="${task.taskId}"/>
                    <div style="display:none;" class="content" >
                        <br/>
                        <div style="float: left;">
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <span style="color: #333333" class="glyphicon glyphicon-tasks" aria-hidden="true"></span> <b>Task actions</b> <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#" class="editOption" data-toggle="modal" data-target="#editTask">Edit task</a></li>
                                    <li><a href="#" class="assignOption" data-toggle="modal" data-target="#assign">Assign new resource</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#" class="deleteOption" data-toggle="modal" data-target="#deleteTask">Delete task</a></li>
                                </ul>
                            </div>
                        </div>
                        <div style="float: left;" class="pull-right">
                            <button class="btn btn-success viewFeedback" data-toggle="modal" data-target="#viewFeedback">
                                <span style="color: #333333" class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> <b>Feedbacks</b>
                                &nbsp;<span class="badge">${task.fbcount}</span>
                            </button>
                        </div>
                        <br/><br/><br/>
                        <table id="respSummary" class="resProjects" class="display">   
                            <thead>
                                <tr>
                                    <th style="display:none;"></th>
                                    <th style="display:none;"></th>
                                    <th style="text-align: left"><b>Name</b></th>
                                    <th style="text-align: left"><b>Year</b></th>
                                    <th style="text-align: left"><b>Jan</b></th>
                                    <th style="text-align: left"><b>Feb</b></th>
                                    <th style="text-align: left"><b>Mar</b></th>
                                    <th style="text-align: left"><b>Apr</b></th>
                                    <th style="text-align: left"><b>May</b></th>
                                    <th style="text-align: left"><b>Jun</b></th>
                                    <th style="text-align: left"><b>Jul</b></th>
                                    <th style="text-align: left"><b>Aug</b></th>
                                    <th style="text-align: left"><b>Sep</b></th>
                                    <th style="text-align: left"><b>Oct</b></th>
                                    <th style="text-align: left"><b>Nov</b></th>
                                    <th style="text-align: left"><b>Dec</b></th>
                                    <th style="text-align: left"><b>Performance</b></th>
                                </tr>
                            </thead>
                            <tbody class="resources">
                                <c:forEach items="${task.resources}" var="resource">
                                <tr class="resourceRow" data-toggle="modal" data-target="#editResource" data-toggle="tooltip" data-placement="top" title="Click to edit / delete resource">  
                                    <td style="display:none;"><input type="hidden" class="resoId" value="${resource.empId}"/></td>
                                    <td style="display:none;"><input type="hidden" class="resoEId" value="${resource.effortId}"/></td>
                                    <td style="text-align: left;" class="aResource"><c:out value="${resource.fname} ${resource.lname}" /></td>						
                                    <td class="resoYear"><c:out value="${resource.year}" /></td>   
                                    <td class="resoJan"><c:out value="${resource.jan}" /></td>   
                                    <td class="resoFeb"><c:out value="${resource.feb}" /></td>   
                                    <td class="resoMar"><c:out value="${resource.mar}" /></td>   
                                    <td class="resoApr"><c:out value="${resource.apr}" /></td>   
                                    <td class="resoMay"><c:out value="${resource.may}" /></td>   
                                    <td class="resoJun"><c:out value="${resource.jun}" /></td>   
                                    <td class="resoJul"><c:out value="${resource.jul}" /></td>   
                                    <td class="resoAug"><c:out value="${resource.aug}" /></td>   
                                    <td class="resoSep"><c:out value="${resource.sep}" /></td>   
                                    <td class="resoOct"><c:out value="${resource.oct}" /></td>   
                                    <td class="resoNov"><c:out value="${resource.nov}" /></td>   
                                    <td class="resoDece"><c:out value="${resource.dece}" /></td>
                                    <td class="resoPerformance"><c:out value="${resource.performance}" /></td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
            
    <!-- Start modal for add task-->            
    <div class="modal fade" id="addTask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Add Task for ${projectName}</b>
                        </div>
                        <form id="add" name="add" action='<c:url value="addTask"/>' method="post" modelAttribute="task">
                            <div class="panel-body">
                                <input type="hidden" name="projectId" value="${projectId}"/>
                                <div class="form-group">
                                    <label for="">Task Name</label>
                                    <input class="form-control" autocomplete="off" required="required"  type="text" name="name" maxlength="40" pattern=".{4,40}" title="4 to 40 Characters">
                                </div>
                                <div class="form-group">
                                    <label for="">Start Date<font style="margin-left:20px;display:none;" color="red" id="error1"></font></label>
                                    <input class="form-control" type="date" min="${start}" max="${end}"  required="required" name="start" id="start1">
                                </div>
                                <div class="form-group">
                                    <label for="">End Date<font style="margin-left:20px;display:none;" color="red" id="error2"></font></label>
                                    <input class="form-control" type="date" min="${start}" max="${end}"  required="required" name="end" id="end1">
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <button class="btn btn-success" id="add-but1" type="submit">
                                        <span style="color: #333333" class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> <b>Submit</b>
                                    </button>
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">
                                        <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>Cancel</b>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for add task-->
        
    <!-- Start modal for assign resources-->            
    <div class="modal fade" id="assign" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-l">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Assign resource to ${projectName} with Task of <code id="aTask"></code></b>
                            <input type="hidden" id="assignStart" />
                            <input type="hidden" id="assignEnd"/>
                        </div>
                        <form name="assign" action='<c:url value="assignResource"/>' method="post" modelAttribute="effort">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Name:</label>
                                    <select class="form-control" name="empId" required="required" id="empName">
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Effort</label>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Year</th>
                                                <th>Jan</th>
                                                <th>Feb</th>
                                                <th>Mar</th>
                                                <th>Apr</th>
                                                <th>May</th>
                                                <th>Jun</th>
                                                <th>Jul</th>
                                                <th>Aug</th>
                                                <th>Sep</th>
                                                <th>Oct</th>
                                                <th>Nov</th>
                                                <th>Dec</th>
                                            </tr>
                                        </thead>
                                        <tbody id="addResTable" class="effBody" data-toggle="tooltip" data-placement="top" title="0.0 = No effort, 1.0 = 100% effort">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input type="hidden" name="projId" id="projectId" value="${projectId}"/>
                                    <input type="hidden" name="count" id="count"/>
                                    <input type="hidden" name="taskId" id="tID"/>
                                    <button class="btn btn-success" id="add-but" type="submit">
                                        <span style="color: #333333" class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> <b>Assign</b>
                                    </button>
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">
                                        <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>Cancel</b>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for assign resources-->
            
    <!-- Start modal for edit resources-->            
    <div class="modal fade" id="editResource" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-l">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <b>Edit resource effort</b>
                            <input type="hidden" id="editStart" />
                            <input type="hidden" id="editEnd"/>
                        </div>
                        <form name="edit" action='<c:url value="editResource"/>' method="post" modelAttribute="effort">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for=""><code><b id="eResource"></b></code></label>
                                    <a href="#" class="pull-right removeRes" data-dismiss="modal" data-toggle="modal" data-target="#removeRes">
                                        <span style="color: #333333" class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    </a>
                                </div>
                                <div class="form-group">
                                    <label for="">Effort
                                        <input type="hidden" name="empId" id="eId"/>
                                        <input type="hidden" name="effortId" id="effortId" />
                                        <input type="hidden" id="eTId">
                                        <input type="hidden" name="projId" value="${projectId}"/>
                                    </label>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Year</th>
                                                <th>Jan</th>
                                                <th>Feb</th>
                                                <th>Mar</th>
                                                <th>Apr</th>
                                                <th>May</th>
                                                <th>Jun</th>
                                                <th>Jul</th>
                                                <th>Aug</th>
                                                <th>Sep</th>
                                                <th>Oct</th>
                                                <th>Nov</th>
                                                <th>Dec</th>
                                                <th>Performance</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="effRow" data-toggle="tooltip" data-placement="top" title="0.0 = No effort, 1.0 = 100% effort">
                                                <td><input type="number" name="year" style="width:55px;" id="eYear" readonly/></td>
                                                <td><input type="number" name="jan" style="width:55px;" value="0" min="0" step="0.1" id="e1"/></td>
                                                <td><input type="number" name="feb" style="width:55px;" value="0" min="0" step="0.1" id="e2"/></td>
                                                <td><input type="number" name="mar" style="width:55px;" value="0" min="0" step="0.1" id="e3"/></td>
                                                <td><input type="number" name="apr" style="width:55px;" value="0" min="0" step="0.1" id="e4"/></td>
                                                <td><input type="number" name="may" style="width:55px;" value="0" min="0" step="0.1" id="e5"/></td>
                                                <td><input type="number" name="jun" style="width:55px;" value="0" min="0" step="0.1" id="e6"/></td>
                                                <td><input type="number" name="jul" style="width:55px;" value="0" min="0" step="0.1" id="e7"/></td>
                                                <td><input type="number" name="aug" style="width:55px;" value="0" min="0" step="0.1" id="e8"/></td>
                                                <td><input type="number" name="sep" style="width:55px;" value="0" min="0" step="0.1" id="e9"/></td>
                                                <td><input type="number" name="oct" style="width:55px;" value="0" min="0" step="0.1" id="e10"/></td>
                                                <td><input type="number" name="nov" style="width:55px;" value="0" min="0" step="0.1" id="e11"/></td>
                                                <td><input type="number" name="dece" style="width:55px;" value="0" min="0" step="0.1" id="e12"/></td>
                                                <td><input type="number" name="performance" style="width:55px;" value="0" min="1" max="5" step="1" id="e13"/></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        <div class="panel-footer">
                            <div style="text-align: right">
                                <button class="btn btn-success" id="add-but" type="submit">
                                    <span style="color: #333333" class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> <b>Save</b>
                                </button>
                                <button class="btn btn-danger" type="button" data-dismiss="modal">
                                    <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>Cancel</b>
                                </button>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for edit resources-->

    <!-- Start modal for remove resource-->            
    <div class="modal fade" id="removeRes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-s">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Remove Resource</b>
                        </div>
                        <form name="del" action='<c:url value="deleteResource"/>' method="post" modelAttribute="effort">
                            <div class="panel-body">
                                <div class="form-group" style="text-align: center;">
                                    <label>Are you sure you want to remove <b id="remName"></b>?</label>
                                    <input type="hidden" name="empId" id="removeId"/>
                                    <input type="hidden" name="taskId" id="removeTId"/>
                                    <input type="hidden" name="projId" value="${projectId}"/>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right;">
                                    <button class="btn btn-success" id="add-but" type="submit">
                                        <span style="color: #333333" class="glyphicon glyphicon-floppy-ok" aria-hidden="true"></span> <b>Yes</b>
                                    </button>
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">
                                        <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>No</b>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for remove resource-->   
    
    <!-- Start modal for edit task-->            
    <div class="modal fade" id="editTask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Edit Task</b>
                        </div>
                        <form id="edit" name="edit" action='<c:url value="editTask"/>' method="post" modelAttribute="task">
                            <input type="hidden" name="taskId" id="editTaskId" />
                            <input type="hidden" name="projectId" value="${projectId}"/>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Task Name</label>
                                    <input class="form-control" autocomplete="off" required="required" id="field1" type="text" name="name" maxlength="40" pattern=".{4,40}" title="4 to 40 Characters">
                                </div>
                                <div class="form-group">
                                    <label for="">Status</label>
                                    <select class="form-control" id="field2" name="status" required="required">
                                        <option disabled="true" selected default></option>
                                        <option value="Assigned">Assigned</option>
                                        <option value="Done">Done</option>
                                        <option value="Tested">Tested</option>
                                        <option value="Accepted">Accepted</option>
                                    </select>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <button class="btn btn-success" id="add-but" type="submit">
                                        <span style="color: #333333" class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> <b>Save</b>
                                    </button>
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">
                                        <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>Cancel</b>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for edit task-->
    
    <!-- Start modal for remove task-->            
    <div class="modal fade" id="deleteTask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-s">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Delete Task</b>
                        </div>
                        <form name="del" action='<c:url value="deleteTask"/>' method="post" modelAttribute="effort">
                            <div class="panel-body">
                                <div class="form-group" style="text-align: center;">
                                    <label>Are you sure you want to delete  <code id="dTask"></code>?</label>
                                    <input type="hidden" name="taskId" id="deleteTId"/>
                                    <input type="hidden" name="projId" id="deletePId" value="${projectId}"/>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right;">
                                    <button class="btn btn-success" id="add-but" type="submit">
                                        <span style="color: #333333" class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> <b>Yes</b>
                                    </button>
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">
                                        <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>No</b>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for remove task-->   
    
    <!-- Start modal for view feedbacks-->            
    <div class="modal fade" id="viewFeedback" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-l">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Feedbacks of ${projectName} - <code id="vfName"></code></b>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover fbs">
                                <thead>
                                    <tr>
                                        <th style="display: none;"></th>
                                        <th style="text-align: left;" width="200px">Subject</th>
                                        <th style="text-align: left;">Content</th>
                                        <th style="text-align: right;" width="200px">Added by</th>
                                        <th style="text-align: right;" width="100px">Added on</th>
                                        <th width="200px"></th>
                                    </tr>
                                </thead>
                                <tbody id="viewFbTable">

                                </tbody>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <div style="float: left">
                                <button class="btn btn-primary readAllFb">
                                    <span style="color: #333333" class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> <b>Mark all as read</b>
                                </button>
                                <button class="btn btn-success unreadAllFb">
                                    <span style="color: #333333" class="glyphicon glyphicon-eye-close" aria-hidden="true"></span> <b>Mark all as unread</b>
                                </button>
                            </div>
                            <div style="text-align: right">
                                <button class="btn btn-danger" onclick="location.reload(true)" type="button" data-dismiss="modal">
                                    <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>Close</b>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for view feedbacks-->
    
</div>
</div>
</div><!-- closing div from navigation-->
    </body>
    <script>
        $(document).ready(function(){
           $("#2").attr("class","active"); 
           $(".resProjects").dataTable();
           $(".taskName").tooltip();
           $(".resourceRow").tooltip();
           $(".effRow").tooltip();
           $(".effBody").tooltip();
            
            if($(".badge").html() == '0')
                $(".badge").css("display","none");
           
           $("#end1").change(function(){
                $("#error2").html("");
                var startDate = new Date($("#start1").val());
                var endDate = new Date($(this).val());
                if(startDate>endDate){
                    $("#error2").css("display","true");
                    $("#error2").text("End date should be after or equal the start date.");
                    $("#add-but1").attr("disabled","true");
                }else{
                    $("#add-but1").removeAttr("disabled");
                }
            });
            
            $("#start1").change(function(){
               $("#end1").change(); 
            });
           
           $("#resourceSummary").on('click',".viewFeedback",function(){
                $("#viewFbTable").html("");
                $("#vfName").text($(this).parent().parent().siblings().find(".tName").text());
                $.ajax({
                    url:'getFeedbacks.htm',
                    type:'post',
                    data:{'taskId': $(this).parent().parent().siblings(".taskId").val()},
                    success:function(data){
                        var x = data.toString();
                        var parts = x.split("@");
                        var row = parts[0].split("$");
//                        alert("subject: "+rec[0]+", content: "+rec[1]+", res id: "+rec[2]+", date added: "+rec[3]);
                        for(var i = 0; i < parseInt(parts[1]); i ++){
                            var rec = row[i].split("%");
                            if(rec[5] == '1') {
                                $("#viewFbTable").append("<tr>" +
                                                            "<td class='idFb' style='display:none;'>"+rec[6]+"</td>" +
                                                            "<td style='text-align:left;color:red;'>"+rec[0]+"</td>" +
                                                            "<td style='text-align:left;color:red;'><p>"+rec[1]+"</p></td>" +
                                                            "<td style='text-align:right;color:red;'>"+rec[3]+"</td>" +
                                                            "<td style='text-align:right;color:red;'>"+rec[4]+"</td>" +
                                                            "<td><button class='btn btn-warning readFb'>" +
                                                                "<span style='color: #333333' class='glyphicon glyphicon-eye-open' aria-hidden='true'></span> <b>Mark as read</b>" +
                                                            "</button></td>" +
                                                        "</tr>");
                            }
                            else {
                                $("#viewFbTable").append("<tr>" +
                                                            "<td class='idFb' style='display:none;'>"+rec[6]+"</td>" +
                                                            "<td style='text-align: left;'>"+rec[0]+"</td>" +
                                                            "<td style='text-align: left;'><p>"+rec[1]+"</p></td>" +
                                                            "<td style='text-align: right;'>"+rec[3]+"</td>" +
                                                            "<td style='text-align: right;'>"+rec[4]+"</td>" +
                                                            "<td><button class='btn btn-warning unreadFb'>" +
                                                                "<span style='color: #333333' class='glyphicon glyphicon-eye-close' aria-hidden='true'></span> <b>Mark as unread</b>" +
                                                            "</button></td>" +
                                                        "</tr>");
                            }
                        }
                    },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }
                }); 
            });
            
            $(".readAllFb").click(function(){
                $.ajax({
                    url:'readAllFb.htm',
                    success:function(){
                        $(".viewFeedback").click();
                    },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }
                });
            });
            
            $(".unreadAllFb").click(function(){
                $.ajax({
                    url:'unreadAllFb.htm',
                    success:function(){
                        $(".viewFeedback").click();
                    },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }
                });
            });
           
           $(".fbs").on('click',".readFb",function(){
               var id = $(this).parent().siblings(".idFb").text();
               $.ajax({
                    url:'readFeedback.htm',
                    type:'post',
                    data:{'id':id},
                    success:function(){
                        $(".viewFeedback").click();
                    },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }
                });
           });
           
           $(".fbs").on('click',".unreadFb",function(){
               var id = $(this).parent().siblings(".idFb").text();
               $.ajax({
                    url:'unreadFeedback.htm',
                    type:'post',
                    data:{'id':id},
                    success:function(){
                        $(".viewFeedback").click();
                    },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }
                });
           });
           
           $(".taskName").click(function(){
               $(".content").slideUp();
               $(this).siblings(".content").slideToggle();
           });
        
            $(".removeRes").click(function(){
               $("#remName").text($("#eResource").text()); 
               $("#removeId").val($("#eId").val());
               $("#removeTId").val($("#eTId").val());
            });
            
            $(".editOption").click(function(){
                $("#editTaskId").val($(this).parent().parent().parent().parent().parent().siblings(".taskId").val());
                $("#field1").val($(this).parent().parent().parent().parent().parent().siblings().find(".tName").text());
                $("#field2").val($(this).parent().parent().parent().parent().parent().siblings().find(".tStatus").text());
            });
            
            $(".deleteOption").click(function(){
               $("#dTask").text($(this).parent().parent().parent().parent().parent().siblings().find(".tName").text());
               $("#deleteTId").val($(this).parent().parent().parent().parent().parent().siblings(".taskId").val());
            });
            
            $(".resources").on("click",".resourceRow",function(){
                var yearSelected=$(this).children(".resoYear").text();
                
                $("#effortId").val($(this).children().children(".resoEId").val());
                $("#eId").val($(this).children().children(".resoId").val());
                $("#eResource").html($(this).children(".aResource").text());
                $("#eTId").val($(this).parent().parent().parent().parent().parent().find(".taskId").val());
                $("#eYear").val(yearSelected);
                $("#e1").val($(this).children(".resoJan").text());
                $("#e2").val($(this).children(".resoFeb").text());
                $("#e3").val($(this).children(".resoMar").text());
                $("#e4").val($(this).children(".resoApr").text());
                $("#e5").val($(this).children(".resoMay").text());
                $("#e6").val($(this).children(".resoJun").text());
                $("#e7").val($(this).children(".resoJul").text());
                $("#e8").val($(this).children(".resoAug").text());
                $("#e9").val($(this).children(".resoSep").text());
                $("#e10").val($(this).children(".resoOct").text());
                $("#e11").val($(this).children(".resoNov").text());
                $("#e12").val($(this).children(".resoDece").text());
                $("#e13").val($(this).children(".resoPerformance").text());
                
                $("#editStart").val($(this).parent().parent().parent().parent().parent().find(".taskStart").val());
                $("#editEnd").val($(this).parent().parent().parent().parent().parent().find(".taskEnd").val());
                var start = $("#editStart").val();
                var end = $("#editEnd").val();
                var startYear = start.substring(0,4);
                var endYear = end.substring(0,4);
                
                var startMonth = start.substring(5,7);
                var endMonth = end.substring(5,7);
                
                for(var i=1;i<=12;i++){
                    $("#e"+i).attr("disabled","true");
                }
                
                if(startYear==endYear){
                    for(var i=1;i<=12;i++){
                        if(i>=startMonth&&i<=endMonth){
                            $("#e"+i).removeAttr("disabled");
                        }
                    }
                }else{
                    if(startYear==yearSelected){
                        for(var i=parseInt(startMonth);i<=12;i++){
                            $("#e"+i).removeAttr("disabled");
                        }
                    }else if(endYear==yearSelected){
                        for(var i=1;i<=endMonth;i++){
                            $("#e"+i).removeAttr("disabled");
                        }
                    }else{
                        for(var i=1;i<=12;i++){
                            $("#e"+i).removeAttr("disabled");
                        }
                    }
                }
                $.ajax({
                    url:'getTotalEffort.htm',
                    type:'post',
                    data:{'year':yearSelected,'resId': $("#eId").val()},
                    success:function(data,status){
                        var x = data.toString();
                        var res=x.split("%");
                        for(var i=1;i<=12;i++){
                            var wait = Math.round((1-res[i])*10)/10;
                            var finall = Math.round((wait+parseFloat($("#e"+i).val()))*10)/10; 
                            $("#e"+i).attr("max",finall);
                            $("#e"+i).tooltip('destroy');
                            $("#e"+i).tooltip({'trigger':'focus','placement':"bottom", 'title':" Maximum effort for the selected month is "+finall+"."});
                        }
                    },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }
                });
                
            });
            
            
            $(".assignOption").click(function(){ 
               $("#addResTable").html("");
               $("#assignStart").val($(this).parent().parent().parent().parent().parent().siblings(".taskStart").val());
               $("#assignEnd").val($(this).parent().parent().parent().parent().parent().siblings(".taskEnd").val());
               $("#tID").val($(this).parent().parent().parent().parent().parent().siblings(".taskId").val());

               $("#aTask").text($(this).parent().parent().parent().parent().parent().siblings().find(".tName").text());
               var start = $("#assignStart").val();
               var end = $("#assignEnd").val();
               var startYear = start.substring(0,4);
               var endYear = end.substring(0,4);
               var diffYear=endYear-startYear;
               
               $("#count").val(diffYear+1);
               for(var i=0;i<=diffYear;i++){
                   var t=i*12;
                   $("#addResTable").append("<tr>" +
                                            "<input type='hidden' name='year' value='"+(parseInt(startYear)+i)+"' class='year'/>" +
                                            "<td>"+(parseInt(startYear)+i)+"</td>" +
                                            "<td><input type='number' name='jan' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+1)+"'/></td>" +
                                            "<td><input type='number' name='feb' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+2)+"'/></td>" +
                                            "<td><input type='number' name='mar' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+3)+"'/></td>" +
                                            "<td><input type='number' name='apr' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+4)+"'/></td>" +
                                            "<td><input type='number' name='may' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+5)+"'/></td>" +
                                            "<td><input type='number' name='jun' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+6)+"'/></td>" +
                                            "<td><input type='number' name='jul' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+7)+"'/></td>" +
                                            "<td><input type='number' name='aug' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+8)+"'/></td>" +
                                            "<td><input type='number' name='sep' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+9)+"'/></td>" +
                                            "<td><input type='number' name='oct' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+10)+"'/></td>" +
                                            "<td><input type='number' name='nov' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+11)+"'/></td>" +
                                            "<td><input type='number' name='dece' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+12)+"'/></td>" +
                                        "</tr>");
               }
                
                
                $.ajax({
                    url:'getEmployeesNotTask.htm',
                    type:'post',
                    data:{'id':$(this).parent().parent().parent().parent().parent().siblings(".taskId").val()},
                    success:function(data,status){
                        $("#empName").html("");
                        var line = data.toString().split("$$$");
                        for(var x=0;x<line.length-1;x++){
                            var each = line[x].split("%-.");
                            $("#empName").append('<option value="'+each[0]+'">'+each[1]+'</option>');
                        }
                        $("#empName").val("default");
                    }
                })
            });
           
            $("#empName").change(function(){
                var start = $("#assignStart").val();
                var end = $("#assignEnd").val();
                
                var startYear = start.substring(0,4);
                var endYear = end.substring(0,4);
                var diffYear=endYear-startYear;
                
                var startMonth = start.substring(5,7);
                var endMonth = end.substring(5,7);
                
                var last=(diffYear+1)*12;
                var end=parseInt(endMonth)+(diffYear*12);
                
                var resId=$(this).val();
                $.ajax({
                    url:'getSpecificEffortMonth.htm',
                    type:'post',
                    data:{'year':startYear,'noYears':diffYear+1,'resId':resId},
                    success:function(data,status){
                        var x = data.toString();
                        var res=x.split("%");
                        for(var x=0;x<=diffYear;x++){
                            var t=x*12;
                            for(var i=1;i<=12;i++){
                               $(".month"+(parseInt(t)+i)).val("0");
                               $(".month"+(parseInt(t)+i)).removeAttr("disabled");
                            }
                        }
                        
                        for(var i=1;i<=last;i++){
                            if(i>=startMonth && i<=end){
                                $(".month"+i).removeAttr("readonly");
                                $(".month"+i).attr("max",Math.round( (1-res[i]) * 10 ) / 10);
                                var z=Math.round( (1-res[i]) * 10 ) / 10;
                                $(".month"+i).tooltip({'trigger':'focus','placement':"bottom" ,'title':" Maximum effort for the selected month is "+z+"."});
                            }
                        }
                        
                    }
                });
            });
        });
    </script>
</html>