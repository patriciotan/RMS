<%@include file="navigation.jsp"%>

<div id="bodiv">
    <div class="row" style="margin-top: -2%;">
        <div style="float: left; width: 20%; margin-left: 2.3%;">
            <h2>Client Summary</h2>
        </div>
        <div style="float: left; margin-left: 65.7%; margin-top: 12px;">
            <button type="button" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#addClient">New Client</button>
        </div>
    </div>
    <br/>
    <div id="clientsSummary" class="col-md-12">
        <table id="clientSummary" class="display">
            <thead>
                <tr>
                    <th style="text-align: center">Client Name</th>
                    <th style="text-align: center">Project Name</th>
                    <th style="text-align: center">Current Milestone</th>
                    <th style="text-align: center">Resource Count</th>
                    <th style="text-align: center">End Date</th>
                    <th style="text-align: center">Status</th>
                    <th style="text-align: center"></th>
                </tr>
            </thead>
            <tbody id="clientsTable">
                <c:forEach items="${clients}" var="client">
                <tr>
                    <td class="clientName"><c:out value="${client.name}" /></td>
                    <td class="projName"><c:out value="${client.projectName}" /></td>
                    <td><c:out value="${client.mileStone}" /></td>
                    <td><c:out value="${client.resCount}" /></td>
                    <td><c:out value="${client.end}" /></td>
                    <td><c:out value="${client.projectStatus}" /></td>
                    <td>
                        <button class="btn btn-primary viewRm" data-toggle="modal" data-target="#viewRemarks">View Remarks</button>
                        <input type="hidden" class="remarkss" value="<c:out value='${client.remarks}' />"/>
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
                                    <label for="">Name<font style="margin-left:20px;display:none;" color="red" id="cerror1"></font></label>
                                    <input class="form-control" autocomplete="off" required="required"  type="text" name="name" id="cname1" maxlength="30" pattern=".{4,30}" title="4 to 30 Characters" />
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

    <!-- Start modal for view remarks-->            
    <div class="modal fade" id="viewRemarks" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Remarks of <code id="viewName"></code></b>
                        </div>
                        <div class="panel-body">
                            <p id="remarksArea"></p>
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
    <!-- End modal for view remarks-->
    
    </body>
    <script>
        $(document).ready(function(){
            $("#4").attr("class","active");
            $("#clientSummary").dataTable();
           
           
            $("#cname1").change(function(){
                $("#cerror1").html("");
                $.ajax({
                    url:'clientExists.htm',
                    type:'post',
                    data:{'name':$(this).val()},
                    success:function(data,status){
                        if(data=="true"){
                            $("#cerror1").css("display","true");
                            $("#cerror1").text("Client Name Already Exist!");
                            $("#add-but").attr("disabled","true");
                        }else{
                            $("#add-but").removeAttr("disabled");
                        }
                    }
                });
            });
           
            $("#clientSummary").on("click",".viewRm",function(){
                $("#remarksArea").html($(this).next().val());
                $("#viewName").text($(this).parent().siblings(".projName").text());
            });
        });
    </script>
</html>