<%@include file="navigation.jsp"%>

<div id="bodiv">
    <div class="row page-header" style="margin-top: 0%;">
        <div style="float: left; width: 79%;">
            <ol class="breadcrumb">
                <li class="active">Client Summary</li>
            </ol>
        </div>
        <div style="float: left;" class="pull-right">
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <span style="color: #333333" class="glyphicon glyphicon-export" aria-hidden="true"></span> <b>Export table</b> <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'json',escape:'false'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON</a></li>
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'json',escape:'false',ignoreColumn:'[2,3]'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON (ignoreColumn)</a></li>
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'json',escape:'true'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON (with Escape)</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'xml',escape:'false'});"> <img src='<c:url value="/res/images/xml.png"/>' width='16px'> XML</a></li>
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'sql'});"> <img src='<c:url value="/res/images/sql.png"/>' width='16px'> SQL</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'csv',escape:'false'});"> <img src='<c:url value="/res/images/csv.png"/>' width='16px'> CSV</a></li>
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'txt',escape:'false'});"> <img src='<c:url value="/res/images/txt.png"/>' width='16px'> TXT</a></li>
                    <li class="divider"></li>	
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'excel',escape:'false'});"> <img src='<c:url value="/res/images/xls.png"/>' width='16px'> XLS</a></li>
                     <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'pdf',escape:'false'});"> <img src='<c:url value="/res/images/pdf.png"/>' width='16px'> PDF</a></li>
                </ul>
            </div>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addClient">
                <span style="color: #333333" class="glyphicon glyphicon-plus" aria-hidden="true"></span> <b>New client</b>
            </button>
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
                        <button class="btn btn-success viewRm" data-toggle="modal" data-target="#viewRemarks">
                            <span style="color: #333333" class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> <b>Remarks</b>
                        </button>
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
                                    <button class="btn btn-success" id="add-but" type="submit">
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