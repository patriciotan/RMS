<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="navigation.jsp" %>

<div id="bodiv">
    <button type="button" class="btn btn-lg btn-add pull-left" data-toggle="modal" data-target="#addProject">
        <image src='<c:url value="/res/images/add.png"/>' height="20px;"/> New project
    </button>
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
            <tbody id="projTable">
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
                                <li><a href="#" class="viewOption" data-toggle="modal" data-target="#view">View resources</a></li>
                                <li><a href="#" class="assignOption" data-toggle="modal" data-target="#assign">Assign new resource</a></li>
                                <li><a href="#" class="editOption" data-toggle="modal" data-target="#editProject">Edit project</a></li>
                            </ul>
                        </div>
                    </td>
                    <td><button id="deleteButton3" class="btn btn-danger end" data-toggle="modal" data-target="#endProject">
                        <image src='<c:url value="/res/images/remove.png"/>' height="20px;"/>
                    </button></td>
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
                            <input type="text" name="projectId" id="editProjId" hidden="hidden"/>
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
                                        <option value="Philippines">Philippines</option>
                                        <option value="Japan">Japan</option>
                                        <option value="Rest of the World">Rest of the World</option>
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
                            <b>Resources assigned to <code id="vProj"></code></b>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="">Effort<input type="text" id="startYear"/><input type="text" id="endYear"/></label>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Emp Name</th>
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
                                    <tbody id="viewResTable">
                                        
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
                            <b>Assign resource to <code id="aProj"></code></b>
                        </div>
                        <form id="assign" name="assign" action='<c:url value="assignResource"/>' method="post" modelAttribute="effort">
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="">Name:</label>
                                <select class="form-control" name="empId" required="required" id="empName">
                                    <option disabled="true" value="default" selected default></option>
                                    <c:forEach items="${employees}" var="employee">
                                        <option value="${employee.empId}"><c:out value="${employee.fname} ${employee.lname}" /></option>
                                    </c:forEach>
                                </select>
                                <input type="hidden" id="selectedStart"/>
                                <input type="hidden" id="selectedEnd"/>
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
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div style="text-align: right">
<!--                                <a href="#" class="ass">display jan value</a>-->
                                <input type="hidden" name="projId" id="projectId"/>
                                <input type="hidden" name="count" id="count"/>
                                <input class="btn btn-success" id="add-but" type="submit" value="Assign">
                                <button class="btn btn-danger" type="button" data-dismiss="modal"><span>Cancel</span></button>
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
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for=""><b id="eResource"></b></label>
                                <a class="pull-right" data-dismiss="modal" data-toggle="modal" data-target="#removeRes">
                                    <img style="width: 30px;" src='<c:url value="/res/images/delete.png"/>'>
                                </a>
                            </div>
                            <div class="form-group">
                                <label for="">Effort<input type="text" id="eId"/></label>
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
                                            <td><input type="number" name="year" readonly="readonly" id="eYear"/></td>
                                            <td><input type="number" name="jan" disabled="true" value="0" min="0" step="0.1" id="e1"/></td>
                                            <td><input type="number" name="feb" disabled="true" value="0" min="0" step="0.1" id="e2"/></td>
                                            <td><input type="number" name="mar" disabled="true" value="0" min="0" step="0.1" id="e3"/></td>
                                            <td><input type="number" name="apr" disabled="true" value="0" min="0" step="0.1" id="e4"/></td>
                                            <td><input type="number" name="may" disabled="true" value="0" min="0" step="0.1" id="e5"/></td>
                                            <td><input type="number" name="jun" disabled="true" value="0" min="0" step="0.1" id="e6"/></td>
                                            <td><input type="number" name="jul" disabled="true" value="0" min="0" step="0.1" id="e7"/></td>
                                            <td><input type="number" name="aug" disabled="true" value="0" min="0" step="0.1" id="e8"/></td>
                                            <td><input type="number" name="sep" disabled="true" value="0" min="0" step="0.1" id="e9"/></td>
                                            <td><input type="number" name="oct" disabled="true" value="0" min="0" step="0.1" id="e10"/></td>
                                            <td><input type="number" name="nov" disabled="true" value="0" min="0" step="0.1" id="e11"/></td>
                                            <td><input type="number" name="dece" disabled="true" value="0" min="0" step="0.1" id="e12"/></td>
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
                                    <label>Are you sure you want to remove <b id="remName"></b>?</label>
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
           
            $("#projTable").on("click",".end",function(){
                $("#endName").text($(this).parent().siblings(".projectName").text());
                $("#delProjId").val($(this).parent().siblings(".projId").val());
            });
           
            $("#viewResTable").on("click",".vRes",function(){
                $("#eResource").html($(this).children(".aResource").text()); 
                var yearSelected=$(this).children(".resoYear").text();
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
                
                var start = $(this).parent().parent().siblings().find("#startYear").val();
                var end = $(this).parent().parent().siblings().find("#endYear").val();
                
                var startYear = start.substring(0,4);
                var endYear = end.substring(0,4);
                
                var startMonth = start.substring(5,7);
                var endMonth = end.substring(5,7);
                
                //-----------------------------------------------------------------------------
                //lacking diri dapat disable and stuff
                if(startYear==endYear){
                    for(var i=1;i<=12;i++){
                        if(i>=startMonth&&i<=endMonth){
                            $("#e"+i).removeAttr("disabled");
                        }
                    }
                }else{
                    if(startYear==yearSelected){
                        for(var i=startMonth;i<=12;i++){
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
                $("#eId").val($(this).children(".resoId").val());
                $.ajax({
                    url:'getTotalEffort.htm',
                    type:'post',
                    data:{'year':yearSelected,'resId':$(this).children(".resoId").val()},
                    success:function(data,status){
                        var x = data.toString();
                        var res=x.split("%");
                        for(var i=1;i<=12;i++){
                            var wait = Math.round((1-res[i])*10)/10;
                            var final = Math.round((wait+parseFloat($("#e"+i).val()))*10)/10; 
                            $("#e"+i).attr("max",final);
                        }
                    },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }

                });
                
            });
           
            $("#projTable").on("click",".viewOption",function(){
                $("#vProj").text($(this).parent().parent().parent().parent().siblings(".projectName").text());
                $("#viewResTable").html("");
                $("#startYear").val($(this).parent().parent().parent().parent().siblings(".startDate").text());
                $("#endYear").val($(this).parent().parent().parent().parent().siblings(".endDate").text());
                $.ajax({
                    url:'getResourcesProjects.htm',
                    type:'post',
                    data:{'id':$(this).parent().parent().parent().parent().siblings(".projId").val()},
                    success:function(data,status){
                        var x = data.toString();
                        var res=x.split("%");
                        if(data!=""){
                            $("#viewResTable").append('<tr class="vRes" data-dismiss="modal" data-toggle="modal" data-target="#editResource">'+
                                            '<input type="hidden" value="'+res[18]+'" class="resoId"/>'+
                                            '<td class="aResource">'+res[0]+" "+res[2]+'</td>'+
                                            '<td class="resoYear">'+res[5]+'</td>'+
                                            '<td class="resoJan">'+res[6]+'</td>'+
                                            '<td class="resoFeb">'+res[7]+'</td>'+
                                           '<td class="resoMar">'+res[8]+'</td>'+
                                            '<td class="resoApr">'+res[9]+'</td>'+
                                            '<td class="resoMay">'+res[10]+'</td>'+
                                            '<td class="resoJun">'+res[11]+'</td>'+
                                            '<td class="resoJul">'+res[12]+'</td>'+
                                            '<td class="resoAug">'+res[13]+'</td>'+
                                            '<td class="resoSep">'+res[14]+'</td>'+
                                            '<td class="resoOct">'+res[15]+'</td>'+
                                            '<td class="resoNov">'+res[16]+'</td>'+
                                            '<td class="resoDece">'+res[17]+'</td>'+
                                        '</tr>');
                        }else{
                            $("#viewResTable").append("No data to display!");
                        }
                    },  
                            error : function(e) {  
                            alert('Error: ' + e);   
                        }

                });
            });
           
           $(".removeRes").click(function(){
               $("#remName").html($(this).parent().parent().parent().find("#eResource").text());
           });
           
           
            $("#projTable").on("click",".editOption",function(){ 
               $("#editProjId").val($(this).parent().parent().parent().parent().siblings(".projId").val());
               $("#field1").val($(this).parent().parent().parent().parent().siblings(".projectName").text());
               $("#field2").val($(this).parent().parent().parent().parent().siblings(".startDate").text());
               $("#field3").val($(this).parent().parent().parent().parent().siblings(".endDate").text());
               $("#field4").val($(this).parent().parent().parent().parent().siblings(".projType").text());
               $("#field5").val($(this).parent().parent().parent().parent().siblings(".bUnit").text()); 
            });
           
            $("#projTable").on("click",".assignOption",function(){ 
               $("#addResTable").html("");
               $("#aProj").text($(this).parent().parent().parent().parent().siblings(".projectName").text());
               
               var start = $(this).parent().parent().parent().parent().siblings(".startDate").text();
               var end = $(this).parent().parent().parent().parent().siblings(".endDate").text();
               var startYear = start.substring(0,4);
               var endYear = end.substring(0,4);
               var diffYear=endYear-startYear;
               $("#selectedStart").val(start);
               $("#selectedEnd").val(end);
               $("#count").val(diffYear+1);
               $("#projectId").val($(this).parent().parent().parent().parent().siblings(".projId").val());
               for(var i=0;i<=diffYear;i++){
                   var t=i*12;
                   $("#addResTable").append("<tr>" +
                                            "<input type='hidden' name='year' value='"+(parseInt(startYear)+i)+"' class='year'/>" +
                                            "<td>"+(parseInt(startYear)+i)+"</td>" +
                                            "<td><input type='number' name='jan' value='0' min='0' max='1' step='0.1' class='month"+(parseInt(t)+1)+"'/></td>" +
                                            "<td><input type='number' name='feb' value='0' min='0' max='1' step='0.1' class='month"+(parseInt(t)+2)+"'/></td>" +
                                            "<td><input type='number' name='mar' value='0' min='0' max='1' step='0.1' class='month"+(parseInt(t)+3)+"'/></td>" +
                                            "<td><input type='number' name='apr' value='0' min='0' max='1' step='0.1' class='month"+(parseInt(t)+4)+"'/></td>" +
                                            "<td><input type='number' name='may' value='0' min='0' max='1' step='0.1' class='month"+(parseInt(t)+5)+"'/></td>" +
                                            "<td><input type='number' name='jun' value='0' min='0' max='1' step='0.1' class='month"+(parseInt(t)+6)+"'/></td>" +
                                            "<td><input type='number' name='jul' value='0' min='0' max='1' step='0.1' class='month"+(parseInt(t)+7)+"'/></td>" +
                                            "<td><input type='number' name='aug' value='0' min='0' max='1' step='0.1' class='month"+(parseInt(t)+8)+"'/></td>" +
                                            "<td><input type='number' name='sep' value='0' min='0' max='1' step='0.1' class='month"+(parseInt(t)+9)+"'/></td>" +
                                            "<td><input type='number' name='oct' value='0' min='0' max='1' step='0.1' class='month"+(parseInt(t)+10)+"'/></td>" +
                                            "<td><input type='number' name='nov' value='0' min='0' max='1' step='0.1' class='month"+(parseInt(t)+11)+"'/></td>" +
                                            "<td><input type='number' name='dece' value='0' min='0' max='1' step='0.1' class='month"+(parseInt(t)+12)+"'/></td>" +
                                        "</tr>");
               }
                $("#empName").val("default");
                for(var x=0;x<=diffYear;x++){
                    var t=x*12;
                    for(var i=1;i<=12;i++){
                       $(".month"+(parseInt(t)+i)).attr("disabled",true);
                    }
                }
            });
           
            $("#empName").change(function(){
                var start = $(this).siblings("#selectedStart").val();
                var end = $(this).siblings("#selectedEnd").val();
                
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
                            }
                        }
                        
                        for(var i=1;i<=last;i++){
                            if(i>=startMonth && i<=end){
                                $(".month"+i).removeAttr("disabled");
                                $(".month"+i).attr("max",Math.round( (1-res[i]) * 10 ) / 10);
                            }
                        }
                        
                    }
                });
                
                
            });
        }); 
    </script>
    </body>
</html>