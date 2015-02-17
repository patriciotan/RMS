<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="empnavigation.jsp" %>

<div id="bodiv">
    <div class="row">
        <div style="float: left; width: 20%; margin-left: 2.3%;">
            <h2>My Tasks</h2>
        </div>
    </div>
    <div id="taskSummary" class="col-md-12">
        <table class="table table-striped" id="effortTable">
            <thead>
                <tr>
                    <th>Task Name</th>
                    <th>Project Name</th>
                    <th>Year</th>
                    <th>Start Date</th>
                    <th>End Date</th>
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
                    <th>Performance</th>
                    <th>View Effort</th>
                    <th>Add</th>
                    <th>View</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${projects}" var="project">
                    <tr class="effortRow">
                        <input type="hidden" class="taskid" value="${project.taskId}"/>
                        <td class="taskName"><c:out value="${project.taskName}" /></td>
                        <td class="projectName"><c:out value="${project.name}" /></td>
                        <td><c:out value="${project.year}" /></td>
                        <td><c:out value="${project.start}" /></td>
                        <td><c:out value="${project.end}" /></td>
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
                        <td><c:out value="${project.performance}" /></td>
                        <td><button class="btn btn-info viewEffort" data-toggle="modal" data-target="#viewEffort">View Effort</button></td>
                        <td><button class="btn btn-success addFeedback" data-toggle="modal" data-target="#addFeedback">Add Feedback</button></td>
                        <td class="tdFb"><button class="btn btn-primary viewFeedback" data-toggle="modal" data-target="#viewFeedback">View Feedbacks</button></td>
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
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
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
                                    <textarea class="form-control" required="required" name="content" rows="10" required="required"></textarea>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input type="text" id="myTaskid" name="taskId" value=""/>
                                    <input class="btn btn-success" id="add-but" type="submit" value="Add">
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button>
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
                                <button class="btn btn-danger" data-dismiss="modal">Close</button>
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
                $("#TaskName").text($(this).parent().siblings(".taskName").text());
                $(".vYear").text($(this).parent().siblings(".hYear").text());
                for(var i=0;i<=12;i++){
                    $(".v"+i).text($(this).parent().siblings(".h"+i).text());
                }
            });
            
            $("#taskSummary").on('click',".addFeedback",function(){
                $("#myTaskid").val($(this).parent().siblings(".taskid").val());
                $("#aFeed").text($(this).parent().siblings(".projectName").text()+"/"+$(this).parent().siblings(".taskName").text());
            });

            $("#taskSummary").on('click',".viewFeedback",function(){
                $("#viewFbTable").html("");
                $("#vFeed").text($(this).parent().siblings(".projectName").text()+"/"+$(this).parent().siblings(".taskName").text());
                $.ajax({
                    url:'getFeedbacks.htm',
                    type:'post',
                    data:{'taskId': $(this).parent().siblings(".taskid").val()},
                    success:function(data){
                        var x = data.toString();
                        var parts = x.split("@");
                        var row = parts[0].split("$");
//                        alert("subject: "+rec[0]+", content: "+rec[1]+", res id: "+rec[2]+", date added: "+rec[3]);
                        for(var i = 0; i < parseInt(parts[1]); i ++){
                            var rec = row[i].split("%");
                            $("#viewFbTable").append("<tr>" +
                                                        "<td style='text-align: left;'>"+rec[0]+"</td>" +
                                                        "<td style='text-align: left;'>"+rec[1]+"</td>" +
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