<%@include file="clientnav.jsp"%>

<div id="bodiv">
    <div class="row page-header" style="margin-top: 0%;">
        <div style="float: left; width: 100%;">
            <ol class="breadcrumb">
                <li class="active">My projects</li>
            </ol>
        </div>
    </div>
    <div id="clientsSummary" class="col-md-12">
        <div style="float: left;">
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
            <br/><br/>
        </div>
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
                        <button class="btn btn-success viewRm" data-toggle="modal" data-target="#viewRemarks">
                            <span style="color: #333333" class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> <b>View remarks</b>
                        </button>
                        <input type="hidden" class="remarkss" value="<c:out value='${client.remarks}' />"/>
                    </td>
                    <td>
                        <button class="btn btn-primary upRm" data-toggle="modal" data-target="#reMark">
                            <span style="color: #333333" class="glyphicon glyphicon-plus" aria-hidden="true"></span> <b>Update remarks</b>
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

            $("#clientSummary").on("click",".viewRm",function(){
                $("#remarksArea").html($(this).next().val());
                $("#vName").text($(this).parent().siblings(".projName").text());
            });

            $("#clientSummary").on("click",".upRm",function(){
                $("#uName").text($(this).parent().siblings(".projName").text());
                $("#updateArea").html($(this).parent().prev().children().next().val());
                $("#myprojid").val($(this).parent().parent().children().val());
            });
        });
    </script>
</html>