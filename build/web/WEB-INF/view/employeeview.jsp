<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="nonvigation.jsp" %>

<div id="bodiv">
    <div class="row">
        <div style="float: left; width: 20%; margin-left: 2.3%;">
            <h2>My Projects</h2>
        </div>
    </div>
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
                    <input class="projId" type="hidden" value="${project.projectId}"/>
                    <td class="projectName"><c:out value="${project.name}" /></td>
                    <td class="startDate"><c:out value="${project.start}" /></td>
                    <td class="endDate"><c:out value="${project.end}" /></td>
                    <td class="projType"><c:out value="${project.type}" /></td>
                    <td class="bUnit"><c:out value="${project.bUnit}" /></td>
                    <td><button class="btn btn-success addFeedback" data-toggle="modal" data-target="#addFeedback">Add Feedback</button></td>
                    <td class="tdFb"><button class="btn btn-primary viewFeedback" data-toggle="modal" data-target="#viewFeedback">View Feedbacks</button></td>
                </tr>
<!--                <table class="table table-striped" id="effortTable">
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
                        <tr class="effortRow">
                            <td><c:out value="${project.year}" /></td>
                            <td><c:out value="${project.jan}" /></td>
                            <td><c:out value="${project.feb}" /></td>
                            <td><c:out value="${project.mar}" /></td>
                            <td><c:out value="${project.apr}" /></td>
                            <td><c:out value="${project.may}" /></td>
                            <td><c:out value="${project.jun}" /></td>
                            <td><c:out value="${project.jul}" /></td>
                            <td><c:out value="${project.aug}" /></td>
                            <td><c:out value="${project.sep}" /></td>
                            <td><c:out value="${project.oct}" /></td>
                            <td><c:out value="${project.nov}" /></td>
                            <td><c:out value="${project.dece}" /></td>
                        </tr>
                    </tbody>
                </table>-->
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
    
</div>
</div>
</div><!-- closing div from navigation-->

    <!-- Start modal for add feedback-->                
    <div class="modal fade" id="addFeedback" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Add Feedback</b>
                        </div>
                        <form id="add" name="add" action='<c:url value="addFeedback"/>' method="post" modelAttribute="feedback">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Subject</label>
                                    <input class="form-control" autocomplete="off" required="required" type="text" name="subject" size="20">
                                </div>
                                <div class="form-group">
                                    <label for="">Content</label>
                                    <textarea class="form-control" required="required" name="content"rows="10"></textarea>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input type="text" id="myprojid" name="projId" value=""/>
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
    
    <!-- Start modal for view resources-->            
    <div class="modal fade" id="viewFeedback" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-l">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b><code>Feedbacks</code></b>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th width="100px">Subject</th>
                                        <th>Content</th>
                                        <th width="100px">Added by</th>
                                        <th width="100px">Added on</th>
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
    <!-- End modal for view resources-->
    
    <script>
        $(document).ready(function(){
            $("#2").attr("class","active"); 
            $("#projSummary").dataTable();

            $(".addFeedback").click(function(){
                $("#myprojid").val($(this).parent().siblings(".projId").val());
            });

            $("#projTable").on('click',".viewFeedback",function(){
                $("#viewFbTable").html("");
                $.ajax({
                    url:'getFeedbacks.htm',
                    type:'post',
                    data:{'projId': $(this).parent().siblings(".projId").val()},
                    success:function(data){
                        var x = data.toString();
                        var parts = x.split("@");
                        var row = parts[0].split("$");
//                        alert("subject: "+rec[0]+", content: "+rec[1]+", res id: "+rec[2]+", date added: "+rec[3]);
                        for(var i = 0; i < parseInt(parts[1]); i ++){
                            var rec = row[i].split("%");
                            $("#viewFbTable").append("<tr>" +
                                                        "<td>"+rec[0]+"</td>" +
                                                        "<td>"+rec[1]+"</td>" +
                                                        "<td>"+rec[3]+"</td>" +
                                                        "<td>"+rec[4]+"</td>" +
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