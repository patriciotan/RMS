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
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'excel',escape:'false'});"> <img src='<c:url value="/res/images/xls.png"/>' width='16px'> XLS</a></li>
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'csv',escape:'false'});"> <img src='<c:url value="/res/images/csv.png"/>' width='16px'> CSV</a></li>
                    <li><a href="#" onClick ="$('#clientSummary').tableExport({type:'txt',escape:'false'});"> <img src='<c:url value="/res/images/txt.png"/>' width='16px'> TXT</a></li>
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
                    <th style="text-align: left"><b>Client Name</b></th>
                    <th style="display:none"></th>
                    <th style="text-align: left"><b>Project Name</b></th>
                    <th style="text-align: left"><b>Current Milestone</b></th>
                    <th style="text-align: left"><b>Resource Count</b></th>
                    <th style="text-align: left"><b>End Date</b></th>
                    <th style="text-align: left"><b>Status</b></th>
                    <th style="text-align: left"></th>
                </tr>
            </thead>
            <tbody id="clientsTable">
                <c:forEach items="${clients}" var="client">
                <tr>
                    <td style="text-align: left" class="clientName"><c:out value="${client.name}" /></td>
                    <td style="display:none" class="projId"><c:out value="${client.projId}" /></td>
                    <td style="text-align: left" class="projName"><c:out value="${client.projectName}" /></td>
                    <td style="text-align: left"><c:out value="${client.mileStone}" /></td>
                    <td style="text-align: left"><c:out value="${client.resCount}" /></td>
                    <td style="text-align: left"><c:out value="${client.end}" /></td>
                    <td style="text-align: left"><c:out value="${client.projectStatus}" /></td>
                    <td>
                        <button class="btn btn-success viewRemarks" data-toggle="modal" data-target="#viewRemarks">
                            <span style="color: #333333" class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> <b>Remarks</b>
                            <c:if test="${client.rmcount!=0}">
                            &nbsp;<span class="badge">${client.rmcount}</span>
                            </c:if>
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
        <div class="modal-dialog-l">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Remarks of <code id="vRem"></code></b>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover rms">
                                <thead>
                                    <tr>
                                        <th style="display: none;"></th>
                                        <th style="text-align: left;" width="200px">Subject</th>
                                        <th style="text-align: left;">Content</th>
                                        <th style="text-align: right;" width="200px">Added by</th>
                                        <th style="text-align: right;" width="100px">Added on</th>
                                        <th width="200px"></th>
                                    </tr>
                                </thead>
                                <tbody id="viewRmTable">

                                </tbody>
                            </table>
                        </div>
                        <div class="panel-footer">
                            <div style="float: left">
                                <input type="hidden" id="idProjRm"/>
                                <button class="btn btn-primary readAllRm">
                                    <span style="color: #333333" class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> <b>Mark all as read</b>
                                </button>
                                <button class="btn btn-success unreadAllRm">
                                    <span style="color: #333333" class="glyphicon glyphicon-eye-close" aria-hidden="true"></span> <b>Mark all as unread</b>
                                </button>
                            </div>
                            <div style="text-align: right">
                                <button class="btn btn-danger" onclick="location.reload(true)" data-dismiss="modal">
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

            $("#clientsSummary").on('click',".viewRemarks",function(){
                $("#viewRmTable").html("");
                $("clicked").removeClass("clicked");
                $(this).addClass("clicked");
                $("#vRem").text($(this).parent().siblings(".projName").text());
                $("#idProjRm").val($(this).parent().siblings(".projId").text());
                $('#viewRemarks').modal({
                backdrop: 'static',
                keyboard: false
                });
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
                            if(rec[5] == '1') {
                                $("#viewRmTable").append("<tr>" +
                                                            "<td class='idRm' style='display:none;'>"+rec[6]+"</td>" +
                                                            "<td style='text-align:left;color:red;'>"+rec[0]+"</td>" +
                                                            "<td style='text-align:left;color:red;'><p>"+rec[1]+"</p></td>" +
                                                            "<td style='text-align:right;color:red;'>"+rec[3]+"</td>" +
                                                            "<td style='text-align:right;color:red;'>"+rec[4]+"</td>" +
                                                            "<td><button class='btn btn-warning readRm'>" +
                                                                "<span style='color: #333333' class='glyphicon glyphicon-eye-open' aria-hidden='true'></span> <b>Mark as read</b>" +
                                                            "</button></td>" +
                                                        "</tr>");
                            }
                            else {
                                $("#viewRmTable").append("<tr>" +
                                                            "<td class='idRm' style='display:none;'>"+rec[6]+"</td>" +
                                                            "<td style='text-align: left;'>"+rec[0]+"</td>" +
                                                            "<td style='text-align: left;'><p>"+rec[1]+"</p></td>" +
                                                            "<td style='text-align: right;'>"+rec[3]+"</td>" +
                                                            "<td style='text-align: right;'>"+rec[4]+"</td>" +
                                                            "<td><button class='btn btn-warning unreadRm'>" +
                                                                "<span style='color: #333333' class='glyphicon glyphicon-eye-close' aria-hidden='true'></span> <b>Mark as unread</b>" +
                                                            "</button></td>" +
                                                        "</tr>");
                            }
                        }
                    },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }
                }); 
            });
            
            
            
                                            $(".readAllRm").click(function(){
                                                $.ajax({
                                                    url:'readAllRm.htm',
                                                    type:'post',
                                                    data:{'projectId':$("#idProjRm").val()},
                                                    success:function(){
                                                        $(".clicked").click();
                                                    },  
                                                        error : function(e) {  
                                                        alert('Error: ' + e);   
                                                    }
                                                });
                                            });

                                            $(".unreadAllRm").click(function(){
                                                $.ajax({
                                                    url:'unreadAllRm.htm',
                                                    type:'post',
                                                    data:{'projectId':$("#idProjRm").val()},
                                                    success:function(){
                                                        $(".clicked").click();
                                                    },  
                                                        error : function(e) {  
                                                        alert('Error: ' + e);   
                                                    }
                                                });
                                            });

                                           $(".rms").on('click',".readRm",function(){
                                               var id = $(this).parent().siblings(".idRm").text();
                                               $.ajax({
                                                    url:'readRemarks.htm',
                                                    type:'post',
                                                    data:{'id':id},
                                                    success:function(){
                                                        $(".clicked").click();
                                                    },  
                                                        error : function(e) {  
                                                        alert('Error: ' + e);   
                                                    }
                                                });
                                           });

                                           $(".rms").on('click',".unreadRm",function(){
                                               var id = $(this).parent().siblings(".idRm").text();
                                               $.ajax({
                                                    url:'unreadRemarks.htm',
                                                    type:'post',
                                                    data:{'id':id},
                                                    success:function(){
                                                        $(".clicked").click();
                                                    },  
                                                        error : function(e) {  
                                                        alert('Error: ' + e);   
                                                    }
                                                });
                                           });
        });
    </script>
</html>