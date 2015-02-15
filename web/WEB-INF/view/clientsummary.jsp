<%@include file="navigation.jsp"%>

<div id="bodiv">
    <div class="row">
        <div style="float: left; width: 20%; margin-left: 2.3%;">
            <h2>Client Summary</h2>
        </div>
        <div style="float: left; margin-left: 65%; margin-right: -10px; margin-top: 12px;">
            <button type="button" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#addClient">New Client</button>
        </div>
    </div>
    <div id="clientsSummary" class="col-md-12">
        <table id="clientSummary" class="display">
            <thead>
                <tr>
                    <th style="text-align: center">Name</th>
                    <th style="text-align: center">Added By</th>
                    <th style="text-align: center">Added Date</th>
                </tr>
            </thead>
            <tbody id="clientsTable">
                <c:forEach items="${clients}" var="client">
                <tr>
                    <td class="clientName"><c:out value="${client.name}" /></td>
                    <td class="addedBy"><c:out value="${client.addedBy}" /></td>
                    <td class="addedDate"><c:out value="${client.addedDate}" /></td>
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
                            <b>Add Project</b>
                        </div>
                        <form id="add" name="add" action='<c:url value="addClient"/>' method="post" modelAttribute="client">
                            <div class="panel-body">
                                <input class="form-control" type="hidden" name="addedBy" value="${sessVar}">
                                <div class="form-group">
                                    <label for="">Name</label>
                                    <input class="form-control" autocomplete="off" required="required"  type="text" name="name" size="20">
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input value="Outlook" name="reference" hidden="hidden">
                                    <input class="btn btn-success" id="add-but" type="submit" value="Submit">
                                    <button class="btn btn-danger" type="button" data-dismiss="modal"><span style="color: white">Cancel</span></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for add client-->

    </body>
    <script>
        $(document).ready(function(){
           $("#4").attr("class","active");
           $("#clientSummary").dataTable();
           
        });
    </script>
</html>