<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="empnavigation.jsp" %>

<div id="bodiv">
    <div class="row page-header" style="margin-top: 0%;">
        <div style="float: left; width: 100%;">
            <ol class="breadcrumb">
                <li class="active">My tasks</li>
            </ol>
        </div>
    </div>
    <div id="taskSummary" class="col-md-12">
        <div style="float: left;">
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <span style="color: #333333" class="glyphicon glyphicon-export" aria-hidden="true"></span> <b>Export table</b> <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#" onClick ="$('#effortTable').tableExport({type:'json',escape:'false'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON</a></li>
                    <li><a href="#" onClick ="$('#effortTable').tableExport({type:'json',escape:'false',ignoreColumn:'[2,3]'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON (ignoreColumn)</a></li>
                    <li><a href="#" onClick ="$('#effortTable').tableExport({type:'json',escape:'true'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON (with Escape)</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#effortTable').tableExport({type:'xml',escape:'false'});"> <img src='<c:url value="/res/images/xml.png"/>' width='16px'> XML</a></li>
                    <li><a href="#" onClick ="$('#effortTable').tableExport({type:'sql'});"> <img src='<c:url value="/res/images/sql.png"/>' width='16px'> SQL</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#effortTable').tableExport({type:'excel',escape:'false'});"> <img src='<c:url value="/res/images/xls.png"/>' width='16px'> XLS</a></li>
                    <li><a href="#" onClick ="$('#effortTable').tableExport({type:'csv',escape:'false'});"> <img src='<c:url value="/res/images/csv.png"/>' width='16px'> CSV</a></li>
                    <li><a href="#" onClick ="$('#effortTable').tableExport({type:'txt',escape:'false'});"> <img src='<c:url value="/res/images/txt.png"/>' width='16px'> TXT</a></li>
                </ul>
            </div>
            <br/><br/>
        </div>
        <table class="table table-striped" id="effortTable">
            <thead>
                <tr>
                    <th style="text-align: left"><b>Task Name</b></th>
                    <th style="text-align: left"><b>Project Name</b></th>
                    <th style="text-align: left"><b>Status</b></th>
                    <th style="text-align: left"><b>Year</b></th>
                    <th style="text-align: left"><b>Start Date</b></th>
                    <th style="text-align: left"><b>End Date</b></th>
                    <th style="display:none;">Year</th>
                    <th style="display:none;">Jan</th>
                    <th style="display:none;">Feb</th>
                    <th style="display:none;">Mar</th>
                    <th style="display:none;">Apr</th>
                    <th style="display:none;">May</th>
                    <th style="display:none;">Jun</th>
                    <th style="display:none;">Jul</th>
                    <th style="display:none;">Aug</th>
                    <th style="display:none;">Sep</th>
                    <th style="display:none;">Oct</th>
                    <th style="display:none;">Nov</th>
                    <th style="display:none;">Dec</th>
                    <th style="text-align: left"><b>Performance</b></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${projects}" var="project">
                    <tr class="effortRow">
                        <input type="hidden" class="taskid" value="${project.taskId}"/>
                        <td style="text-align: left" class="taskName"><c:out value="${project.taskName}" /></td>
                        <td style="text-align: left" class="projectName"><c:out value="${project.name}" /></td>
                        <td style="text-align: left" class="projStats"><c:out value="${project.status}" /></td>
                        <td style="text-align: left"><c:out value="${project.year}" /></td>
                        <td style="text-align: left"><c:out value="${project.start}" /></td>
                        <td style="text-align: left"><c:out value="${project.end}" /></td>
                        <td style="display:none;" class="hYear"><c:out value="${project.year}" /></td>
                        <td style="display:none;" class="h1"><c:out value="${project.jan}" /></td>
                        <td style="display:none;" class="h2"><c:out value="${project.feb}" /></td>
                        <td style="display:none;" class="h3"><c:out value="${project.mar}" /></td>
                        <td style="display:none;" class="h4"><c:out value="${project.apr}" /></td>
                        <td style="display:none;" class="h5"><c:out value="${project.may}" /></td>
                        <td style="display:none;" class="h6"><c:out value="${project.jun}" /></td>
                        <td style="display:none;" class="h7"><c:out value="${project.jul}" /></td>
                        <td style="display:none;" class="h8"><c:out value="${project.aug}" /></td>
                        <td style="display:none;" class="h9"><c:out value="${project.sep}" /></td>
                        <td style="display:none;" class="h10"><c:out value="${project.oct}" /></td>
                        <td style="display:none;" class="h11"><c:out value="${project.nov}" /></td>
                        <td style="display:none;" class="h12"><c:out value="${project.dece}" /></td>
                        <td style="text-align: left"><c:out value="${project.performance}" /></td>
                        <td>
                            <div class="btn-group dropup">
                                <button type="button" class="btn btn-success" disabled>
                                    <span style="color: #333333" class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> <b>View</b>
                                </button>
                                <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#" class="viewEffort" data-toggle="modal" data-target="#viewEffort">Effort</a></li>
                                    <li><a href="#" class="viewFeedback" data-toggle="modal" data-target="#viewFeedback">Feedbacks</a></li>
                                </ul>
                            </div>
                        </td>
                        <td>
                            <button class="btn btn-primary addFeedback" data-toggle="modal" data-target="#addFeedback">
                                <span style="color: #333333" class="glyphicon glyphicon-plus" aria-hidden="true"></span> <b>Add Feedback</b>
                            </button>
                        </td>
                    </tr>    
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
    
</div>
</div>
</div><!-- closing div from navigation-->

    <!-- Start modal for view effort -->
        <div class="modal fade" id="viewEffort" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" style="width: 50%;">
                <div class="modal-content-sm">
                    <div class="modal-body-sm">
                        <div class="panel panel-primary">  
                            <div class="panel-heading">
                                <b>Effort for <code id="TaskName"></code></b>
                            </div>
                            <div class="panel-body">
                                <div class="col-md-12">
                                    <table class="table table-hover display tablee">
                                        <thead>
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
                                        </thead>
                                        <tbody>
                                            <td class="vYear"></td>
                                            <td class="v1"></td>
                                            <td class="v2"></td>
                                            <td class="v3"></td>
                                            <td class="v4"></td>
                                            <td class="v5"></td>
                                            <td class="v6"></td>
                                            <td class="v7"></td>
                                            <td class="v8"></td>
                                            <td class="v9"></td>
                                            <td class="v10"></td>
                                            <td class="v11"></td>
                                            <td class="v12"></td>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right;">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                                        <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>Close</b>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- End modal for view effort -->  

    
    <!-- Start modal for add feedback-->                
    <div class="modal fade" id="addFeedback" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Add Feedback on <code id="aFeed"></code></b>
                        </div>
                        <form id="add" name="add" action='<c:url value="addFeedback"/>' method="post" modelAttribute="feedback">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Subject</label>
                                    <input class="form-control" autocomplete="off" required="required" type="text" name="subject" maxlength="30">
                                </div>
                                <div class="form-group">
                                    <label for="">Content</label>
                                    <textarea class="form-control" required="required" name="content" rows="10" maxlength="500" required="required"></textarea>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input type="hidden" id="myTaskid" name="taskId" value=""/>
                                    <button class="btn btn-success" id="add-but" type="submit">
                                        <span style="color: #333333" class="glyphicon glyphicon-plus" aria-hidden="true"></span> <b>Add</b>
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
    <!-- End modal for add feedback-->
    
    <!-- Start modal for view feedbacks-->            
    <div class="modal fade" id="viewFeedback" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-l">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Feedbacks of <code id="vFeed"></code></b>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="text-align: left;" width="200px">Subject</th>
                                        <th style="text-align: left;">Content</th>
                                        <th style="text-align: right;" width="200px">Added by</th>
                                        <th style="text-align: right;" width="100px">Added on</th>
                                    </tr>
                                </thead>
                                <tbody id="viewFbTable">

                                </tbody>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <div style="text-align: right">
                                <button class="btn btn-danger" data-dismiss="modal">
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
    
    <script>
        $(document).ready(function(){
            $("#1").attr("class","active"); 
            $("#effortTable").dataTable();

            $("#taskSummary").on("click",".viewEffort",function(){
                $("#TaskName").text($(this).parent().parent().parent().parent().siblings(".taskName").text());
                $(".vYear").text($(this).parent().parent().parent().parent().siblings(".hYear").text());
                for(var i=0;i<=12;i++){
                    $(".v"+i).text($(this).parent().parent().parent().parent().siblings(".h"+i).text());
                }
            });
            
            $("#taskSummary").on('click',".addFeedback",function(){
                $("#myTaskid").val($(this).parent().siblings(".taskid").val());
                $("#aFeed").text($(this).parent().siblings(".projectName").text()+"/"+$(this).parent().siblings(".taskName").text());
            });

            $("#taskSummary").on('click',".viewFeedback",function(){
                $("#viewFbTable").html("");
                $("#vFeed").text($(this).parent().parent().parent().parent().siblings(".projectName").text()+"/"+$(this).parent().parent().parent().parent().siblings(".taskName").text());
                $.ajax({
                    url:'getFeedbacks.htm',
                    type:'post',
                    data:{'taskId': $(this).parent().parent().parent().parent().parent().find(".taskid").val()},
                    success:function(data){
                        var x = data.toString();
                        var parts = x.split("@");
                        var row = parts[0].split("$");
                        for(var i = 0; i < parseInt(parts[1]); i ++){
                            var rec = row[i].split("%");
                            $("#viewFbTable").append("<tr>" +
                                                        "<td style='text-align: left;'>"+rec[0]+"</td>" +
                                                        "<td style='text-align: left;'><p>"+rec[1]+"</p></td>" +
                                                        "<td style='text-align: right;'>"+rec[3]+"</td>" +
                                                        "<td style='text-align: right;'>"+rec[4]+"</td>" +
                                                    "</tr>");
                        }
                    },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }
                }); 
            });
        });
    
    </script>
    </body>
</html>