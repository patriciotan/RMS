<%@include file="nonvigation.jsp"%>

<div id="bodiv">
    <div class="row">
        <div style="float: left; margin-left: 2.3%;">
            <h2>My Projects With Alliance</h2>
        </div>
    </div>
    <br/>
    <div id="clientsSummary" class="col-md-12">
        <table id="clientSummary" class="display">
            <thead>
                <tr>
                    <th style="text-align: center">Project Name</th>
                    <th style="text-align: center">Current Milestone</th>
                    <th style="text-align: center">Resource Count</th>
                    <th style="text-align: center">End Date</th>
                    <th style="text-align: center">Status</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody id="clientsTable">
                <c:forEach items="${clients}" var="client">
                <tr>
                    <input type="hidden" class="projid" value="<c:out value='${client.projId}' />"/>
                    <td class="projName"><c:out value="${client.projectName}" /></td>
                    <td><c:out value="${client.mileStone}" /></td>
                    <td><c:out value="${client.resCount}" /></td>
                    <td><c:out value="${client.end}" /></td>
                    <td><c:out value="${client.projectStatus}" /></td>
                    <td>
                        <button class="btn btn-primary viewRm" data-toggle="modal" data-target="#viewRemarks">View Remarks</button>
                        <input type="hidden" class="remarkss" value="<c:out value='${client.remarks}' />"/>
                    </td>
                    <td><button class="btn btn-success upRm" data-toggle="modal" data-target="#reMark">Update remarks</button></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
     
</div>
</div>
</div><!-- closing div from navigation-->

    <!-- Start modal for update remarks-->                
    <div class="modal fade" id="reMark" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Update Remarks of <code id="uName"></code></b>
                        </div>
                        <form id="add" name="add" action='<c:url value="updateRemarks"/>' method="post" modelAttribute="feedback">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Remarks</label>
                                    <textarea id="updateArea" class="form-control" required="required" name="remarks" rows="10" maxlength="100"></textarea>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input type="hidden" id="myprojid" name="projId" value=""/>
                                    <input class="btn btn-success" id="add-but" type="submit" value="Save">
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for update remarks-->
    
    <!-- Start modal for view remarks-->            
    <div class="modal fade" id="viewRemarks" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Remarks of <code id="vName"></code></b>
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
            
            $('#clientSummary').DataTable({
                "order": [[ 3, "asc" ]],
                "scrollCollapse": true,
                "paging":         false,
                "bInfo":          false,
                "bFilter":        false
            });

            $(".viewRm").click(function(){
                $("#remarksArea").html($(this).next().val());
                $("#vName").text($(this).parent().siblings(".projName").text());
            });

            $(".upRm").click(function(){
                $("#uName").text($(this).parent().siblings(".projName").text());
                $("#updateArea").html($(this).parent().prev().children().next().val());
                $("#myprojid").val($(this).parent().parent().children().val());
            });
        });
    </script>
</html>