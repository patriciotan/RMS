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
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'excel',escape:'false'});"> <img src='<c:url value="/res/images/xls.png"/>' width='16px'> XLS</a></li>
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'csv',escape:'false'});"> <img src='<c:url value="/res/images/csv.png"/>' width='16px'> CSV</a></li>
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'txt',escape:'false'});"> <img src='<c:url value="/res/images/txt.png"/>' width='16px'> TXT</a></li>
                </ul>
            </div>
            <br/><br/>
        </div>
        <table id="clientSummary" class="display">
            <thead>
                <tr>
                    <th style="display:none"></th>
                    <th style="text-align: left"><b>Project Name</b></th>
                    <th style="text-align: left"><b>Current Milestone</b></th>
                    <th style="text-align: left"><b>Resource Count</b></th>
                    <th style="text-align: left"><b>End Date</b></th>
                    <th style="text-align: left"><b>Status</b></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody id="clientsTable">
                <c:forEach items="${clients}" var="client">
                <tr>
<!--                    <input type="hidden" class="projid" value="<c:out value='${client.projId}' />"/>-->
                    <td style="display:none" class="projId"><c:out value="${client.projId}" /></td>
                    <td style="text-align: left" class="projName"><c:out value="${client.projectName}" /></td>
                    <td style="text-align: left"><c:out value="${client.mileStone}" /></td>
                    <td style="text-align: left"><c:out value="${client.resCount}" /></td>
                    <td style="text-align: left"><c:out value="${client.end}" /></td>
                    <td style="text-align: left"><c:out value="${client.projectStatus}" /></td>
                    <td>
                        <button class="btn btn-success viewRm" data-toggle="modal" data-target="#viewRemarks">
                            <span style="color: #333333" class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> <b>View remarks</b>
                        </button>
                        <input type="hidden" class="remarkss" value="<c:out value='${client.remarks}' />"/>
                    </td>
                    <td>
                        <button class="btn btn-primary addRm" data-toggle="modal" data-target="#addRemarks">
                            <span style="color: #333333" class="glyphicon glyphicon-plus" aria-hidden="true"></span> <b>Add remarks</b>
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
    
    <!-- Start modal for add remarks-->                
    <div class="modal fade" id="addRemarks" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Add Remarks on <code id="aRem"></code></b>
                        </div>
                        <form id="add" name="add" action='<c:url value="addRemarks"/>' method="post" modelAttribute="feedback">
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
                                    <input type="hidden" id="myProjid" name="projId" value=""/>
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
    <!-- End modal for add remarks-->
    
    <!-- Start modal for view remarks-->            
    <div class="modal fade" id="viewRemarks" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-l">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Remarks of <code id="vRem"></code></b>
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
                                <tbody id="viewRmTable">

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
            
            $("#clientsSummary").on('click',".addRm",function(){
                $("#myProjid").val($(this).parent().siblings(".projId").text());
                $("#aRem").text($(this).parent().siblings(".projName").text());
            });

            $("#clientsSummary").on('click',".viewRm",function(){
                $("#viewRmTable").html("");
                $("#vRem").text($(this).parent().siblings(".projName").text());
                $.ajax({
                    url:'getRemarks.htm',
                    type:'post',
                    data:{'projId': $(this).parent().siblings(".projId").text()},
                    success:function(data){
                        var x = data.toString();
                        var parts = x.split("@");
                        var row = parts[0].split("$");
                        for(var i = 0; i < parseInt(parts[1]); i ++){
                            var rec = row[i].split("%");
                            $("#viewRmTable").append("<tr>" +
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

            $("#clientSummary").on("click",".upRm",function(){
                $("#uName").text($(this).parent().siblings(".projName").text());
                $("#updateArea").html($(this).parent().prev().children().next().val());
                $("#myprojid").val($(this).parent().parent().children().val());
            });
        });
    </script>
</html>