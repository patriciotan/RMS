<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="navigation.jsp" %>
<button type="button" class="btn btn-lg btn-primary pull-left" data-toggle="modal" data-target="#addProject">Add new project</button>
    <div id="projectSummary" class="col-md-12">
        <table id="projSummary" class="display">
            <thead>
                <tr>
                    <th style="text-align: center">Name</th>
                    <th style="text-align: center">Start Date</th>
                    <th style="text-align: center">End Date</th>
                    <th style="text-align: center">Type</th>
                    <th style="text-align: center">Business Unit</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${projects}" var="project">
                <tr>
                    <input type="hidden" class="projId" value="${project.projectId}"/>
                    <td class="projectName"><c:out value="${project.name}" /></td>
                    <td class="startDate"><c:out value="${project.start}" /></td>
                    <td class="endDate"><c:out value="${project.end}" /></td>
                    <td class="projType"><c:out value="${project.type}" /></td>
                    <td class="bUnit"><c:out value="${project.bUnit}" /></td>
                    <td>
                        <div class="btn-group dropup">
                            <button type="button" class="btn btn-warning" disabled="disabled"><small>Manage</small></button>
                            <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#" data-toggle="modal" data-target="#view">View resources</a></li>
                                <li><a href="#" class="assignOption" data-toggle="modal" data-target="#assign">Assign new resource</a></li>
                                <li><a href="#" class="editOption" data-toggle="modal" data-target="#editProject">Edit project</a></li>
                            </ul>
                        </div>
                    </td>
                    <td><button id="deleteButton3" class="btn btn-danger end" data-toggle="modal" data-target="#endProject">End</button></td>
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
                        <form id="add" name="add" action='<c:url value="addProject"/>' method="post" modelAttribute="project">
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
                                    <label for="">Business Unit</label>
                                    <select class="form-control" name="bUnit" required="required" >
                                        <option disabled="true" selected default></option>
                                        <option value="Local">Local</option>
                                        <option value="JP Independent">JP Independent</option>
                                        <option value="ROW">ROW</option>
                                        <option value="Alliance">Alliance</option>
                                    </select>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input value="Ongoing" name="status" hidden="hidden">
                                    <input value="Summary" name="reference" hidden="hidden">
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
                        <form id="edit" name="edit" action='<c:url value="editSummary"/>' method="post" modelAttribute="project">
                            <input type="text" name="projectId" id="editProjId"/>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Name</label>
                                    <input class="form-control" autocomplete="off" required="required" id="field1" type="text" name="name" size="20">
                                </div>
                                <div class="form-group">
                                    <label for="">Start Date</label>
                                    <input class="form-control" type="date" id="field2" required="required" name="start" value="yyyy-mm-dd">
                                </div>
                                <div class="form-group">
                                    <label for="">End Date</label>
                                    <input class="form-control" type="date" id="field3" required="required" name="end" value="yyyy-mm-dd">
                                </div>
                                <div class="form-group">
                                    <label for="">Type</label>
                                    <select class="form-control" name="type" required="required" id="field4">
                                        <option disabled="true" selected default></option>
                                        <option value="Project-Based">Project-Based</option>
                                        <option value="Time and Material">Time and Material</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Business Unit</label>
                                    <select class="form-control" name="bUnit" required="required" id="field5">
                                        <option disabled="true" selected default></option>
                                        <option value="Local">Local</option>
                                        <option value="JP Independent">JP Independent</option>
                                        <option value="ROW">ROW</option>
                                        <option value="Alliance">Alliance</option>
                                    </select>
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
    
    <!-- Start modal for view resources-->            
    <div class="modal fade" id="view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-l">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Resources assigned</b>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="">Effort</label>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
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
                                    <tbody>
                                        <tr class="vRes" data-dismiss="modal" data-toggle="modal" data-target="#editResource">
                                            <td id="aResource">EmpName</td>
                                            <td>yyyy</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div style="text-align: right">
                                <button class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for view resources-->
    
    <!-- Start modal for assign resources-->            
    <div class="modal fade" id="assign" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-l">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Assign resource</b>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="">Name:</label>
                                <select class="form-control" name="status" required="required" id="empName">
                                    <option disabled="true" value="default" selected default></option>
                                    <option value=""> Emp name </option>
                                    <option value=""> Emp name </option>
                                    <option value=""> Emp name </option>
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
                                    <tbody id="addResTable">
                                        <tr>
                                            <input type="hidden" id="selectedStart"/>
                                            <input type="hidden" id="selectedEnd"/>
                                            <td><input type="number" step="1" class="year"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1" class="month1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1" class="month2"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1" class="month3"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1" class="month4"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1" class="month5"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1" class="month6"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1" class="month7"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1" class="month8"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1" class="month9"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1" class="month10"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1" class="month11"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1" class="month12"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div style="text-align: right">
                                <input class="btn btn-success" id="add-but" type="submit" value="Assign">
                                <button class="btn btn-danger" type="button" data-dismiss="modal"><span>Cancel</span></button>
                            </div>
                        </div>
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
                            <b>Edit resource</b>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for=""><b id="eResource"></b></label>
                                <a class="pull-right" data-dismiss="modal" data-toggle="modal" data-target="#removeRes">
                                    <img style="width: 30px;" src='<c:url value="/res/images/delete.png"/>'>
                                </a>
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
                                    <tbody>
                                        <tr>
                                            <td><input type="number" min="2014" max="3000" step="1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1"/></td>
                                            <td><input type="number" min="0" max="1" step="0.1"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div style="text-align: right">
                                <input class="btn btn-success" id="add-but" type="submit" value="Save">
                                <button class="btn btn-danger removeRes" type="button" data-dismiss="modal" data-toggle="modal" data-target="#view"><span>Cancel</span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for edit resources-->
    
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
                            <input type="text" name="projectId" id="delProjId"/>
                            <div class="panel-body">
                                <div class="form-group" style="text-align: center;">
                                    <label>End Project <b id="endName"></b>?</label>
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
    <!-- End modal for end project-->
    
    <!-- Start modal for remove resource-->            
    <div class="modal fade" id="removeRes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-s">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Remove Resource</b>
                        </div>
                        <form id="del" name="del" action='<c:url value="delSummary"/>' method="post" modelAttribute="project">
                            <div class="panel-body">
                                <div class="form-group" style="text-align: center;">
                                    <label>Remove Employee <b id="remName"></b>?</label>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right;">
                                    <input class="btn btn-success" id="add-but" type="submit" value="Yes"/>&nbsp;
                                    <button class="btn btn-danger" type="button"  data-dismiss="modal" data-toggle="modal" data-target="#editResource"><span>No</span></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for remove resource-->
    <script>
        $(document).ready(function(){
           $("#2").attr("class","active"); 
           $("#projSummary").dataTable();
           
           $(".end").click(function(){
                $("#endName").text($(this).parent().siblings(".projectName").text());
                $("#delProjId").val($(this).parent().siblings(".projId").val());
           });
           
           $(".vRes").click(function(){
              $("#eResource").html($(this).children("#aResource").text()); 
           });
           
           $(".removeRes").click(function(){
               $("#remName").html($(this).parent().parent().parent().find("#eResource").text());
           });
           
           $(".editOption").click(function(){
               $("#editProjId").val($(this).parent().parent().parent().parent().siblings(".projId").val());
               $("#field1").val($(this).parent().parent().parent().parent().siblings(".projectName").text());
               $("#field2").val($(this).parent().parent().parent().parent().siblings(".startDate").text());
               $("#field3").val($(this).parent().parent().parent().parent().siblings(".endDate").text());
               $("#field4").val($(this).parent().parent().parent().parent().siblings(".projType").text());
               $("#field5").val($(this).parent().parent().parent().parent().siblings(".bUnit").text()); 
           });
           
           $(".assignOption").click(function(){
               var start = $(this).parent().parent().parent().parent().siblings(".startDate").text();
               var end = $(this).parent().parent().parent().parent().siblings(".endDate").text();
               var startYear = start.substring(0,4);
               var endYear = end.substring(0,4);
               var diffYear=endYear-startYear;
               for(var i=0;i<diffYear;i++){
                   $("#addResTable").append("<tr>"+
                                            "<td><input type='number' step='1' class='year'/></td>"+
                                            "<td><input type='number' min='0' max='1' step='0.1' class='month1'/></td>"+
                                            "<td><input type='number' min='0' max='1' step='0.1' class='month2'/></td>"+
                                            "<td><input type='number' min='0' max='1' step='0.1' class='month3'/></td>"+
                                            "<td><input type='number' min='0' max='1' step='0.1' class='month4'/></td>"+
                                            "<td><input type='number' min='0' max='1' step='0.1' class='month5'/></td>"+
                                            "<td><input type='number' min='0' max='1' step='0.1' class='month6'/></td>"+
                                            "<td><input type='number' min='0' max='1' step='0.1' class='month7'/></td>"+
                                            "<td><input type='number' min='0' max='1' step='0.1' class='month8'/></td>"+
                                            "<td><input type='number' min='0' max='1' step='0.1' class='month9'/></td>"+
                                            "<td><input type='number' min='0' max='1' step='0.1' class='month10'/></td>"+
                                            "<td><input type='number' min='0' max='1' step='0.1' class='month11'/></td>"+
                                            "<td><input type='number' min='0' max='1' step='0.1' class='month12'/></td>"+
                                        "</tr>");
               }
               
               $("#empName").val("default");
               $(".year").val(null);
               $(".year").attr("min",startYear);
               $(".year").attr("max",endYear);
               $(".year").attr("disabled","true");
               $("#selectedStart").val(start);
               $("#selectedEnd").val(end);
               for(var i=1;i<=12;i++){
                   $(".month"+i).attr("disabled",true);
                   $(".month"+i).val(null);
                }
           });
           
           $("#empName").change(function(){
               $(".year").removeAttr("disabled");
               for(var i=1;i<=12;i++){
                   $(".month"+i).removeAttr("disabled");
                }
           });
           
           
           $(".year").change(function(){
                for(var i=1;i<=12;i++){
                    $(".month"+i).val(null);
                   $(".month"+i).removeAttr("disabled");
                }
                var currentYear=$(this).val();
                var start = $(this).parent().siblings("#selectedStart").val();
                var end = $(this).parent().siblings("#selectedEnd").val();
                
                var startYear = start.substring(0,4);
                var endYear = end.substring(0,4);
                
                
                var startMonth = start.substring(5,7);
                var endMonth = end.substring(5,7);
                if(startYear==endYear){
                    for(var i=1;i<=12;i++){
                       $(".month"+i).removeAttr("disabled");
                       if(i<startMonth ||i>endMonth){
                           $(".month"+i).attr("disabled","true");
                       }
                    }
                }else{
                    if(currentYear==startYear){
                        for(var i=1;i<=12;i++){
                            if(i<startMonth){
                                $(".month"+i).attr("disabled","true");
                            }
                        }
                    }else if(currentYear==endYear){
                        for(var i=1;i<=12;i++){
                            if(i>endMonth){
                                $(".month"+i).attr("disabled","true");
                            }
                        }
                    }
                }
           });
           
        });
        
        
    </script>
    </body>
</html>