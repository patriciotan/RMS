<%@include file="navigation.jsp" %>

<div id="bodiv">
    <div class="row page-header" style="margin-top: 0%;">
        <div style="float: left; width: 86%;">
            <ol class="breadcrumb">
                <li class="active">Resource Summary</li>
            </ol>
        </div>
        <div style="float: left;" class="pull-right">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#summary">
                <span style="color: #333333" class="glyphicon glyphicon-plus" aria-hidden="true"></span> <b>Show head count</b>
            </button>
        </div>
    </div>
    <div id="resourceSummary" class="col-md-12">
        <div class="row">
            <!-- employee list table-->
                <table id="resSummary" class="display">   
                    <thead>
                        <tr>
                            <th>Name</th>
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
                    <tbody id="resources">
                        <c:forEach items="${resources}" var="resource">
                        <tr class="resourceRow" data-toggle="modal" data-target="#resInfo" data-toggle="tooltip" data-placement="top" title="Click to view resource information">   
                            <input type="hidden" class="resId" value="${resource.empId}"/>
                            <td style="text-align: left;" class="resName"><c:out value="${resource.fname} ${resource.lname}" /></td>						
                            <td><c:out value="${resource.year}" /></td>   
                            <td><c:out value="${resource.jan}" /></td>   
                            <td><c:out value="${resource.feb}" /></td>   
                            <td><c:out value="${resource.mar}" /></td>   
                            <td><c:out value="${resource.apr}" /></td>   
                            <td><c:out value="${resource.may}" /></td>   
                            <td><c:out value="${resource.jun}" /></td>   
                            <td><c:out value="${resource.jul}" /></td>   
                            <td><c:out value="${resource.aug}" /></td>   
                            <td><c:out value="${resource.sep}" /></td>   
                            <td><c:out value="${resource.oct}" /></td>   
                            <td><c:out value="${resource.nov}" /></td>   
                            <td><c:out value="${resource.dece}" /></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            
            <!-- info Modal -->
                <div class="modal fade" id="resInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content-sm">
                            <div class="modal-body-sm">
                                <div class="panel panel-primary">  
                                    <div class="panel-heading">
                                        <b id="employeeName"></b>
                                    </div>
                                    <div class="panel-body">
                                        <table>
                                            <tbody>
                                                <tr><td><b>Business unit:<code id="resUnit"></code></b></td></tr>
                                                <tr><td><b>Date hired:<code id="resHired"></code></b><td></tr>
                                                <tr><td><b>Projects Assigned To:<br/><code id="currentProjects"></code></b></td></tr>
                                            </tbody>
                                        </table>
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
            <!-- info Modal --> 
                    
            <!-- summary Modal -->
                <div class="modal fade" id="summary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="panel panel-primary"> 
                                    <div class="panel-heading">
                                        <b>Resources per Business Unit</b>
                                    </div>
                                    <div class="panel-body">
                                        <div id="chartContainer" style="height:390px;"></div>
                                        <input id="phVal" type="hidden" value="${summary.ph}">
                                        <input id="jpVal" type="hidden" value="${summary.jap}">
                                        <input id="rwVal" type="hidden" value="${summary.row}">
                                        <input id="alVal" type="hidden" value="${summary.alli}">
                                        <input id="unVal" type="hidden" value="${summary.unassigned}">
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
            <!-- summary Modal -->  
            
            <!-- reminder Modal -->
                <div class="modal fade" id="reminder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" style="width: 50%;">
                        <div class="modal-content-sm">
                            <div class="modal-body-sm">
                                <div class="panel panel-primary">  
                                    <div class="panel-heading">
                                        <b>Resources Load Reminder for ${month} ${year}</b>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-6">
                                            <table class="table table-hover display tablee">
                                                <thead>
                                                    <th style="text-align: left">Under load Employees</th>
                                                    <th style="text-align: right">Max effort</th>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${underload}" var="ul">
                                                    <tr>   
                                                        <td style="text-align: left;" class="resName"><c:out value="${ul.fname} ${ul.lname}" /></td>						
                                                        <td style="text-align: right"><c:out value="${ul.jan}" /></td>
                                                    </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-6">
                                            <table class="table table-hover display tablee">
                                                <thead>
                                                    <th style="text-align: left">Full load Employees</th>
                                                    <th style="text-align: right">Max effort</th>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${overload}" var="ol">
                                                    <tr>   
                                                        <td style="text-align: left;" class="resName"><c:out value="${ol.fname} ${ol.lname}" /></td>						
                                                        <td style="text-align: right"><c:out value="${ol.jan}" /></td>   
                                                    </tr>
                                                    </c:forEach>
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
            <!-- reminder Modal -->  
            
            
            
        </div>
    </div>
</div>

</div>
</div>
</div><!-- closing div from navigation-->
    </body>
    
    <script type="text/javascript">
    window.onload = function () {
        var chart = new CanvasJS.Chart("chartContainer",
        {
        data: [
        {
            type: "pie",
        dataPoints: [
        {  y: $("#phVal").val(), indexLabel: "Philippines" },
        {  y: $("#jpVal").val(), indexLabel: "Japan" },
        {  y: $("#rwVal").val(), indexLabel: "Rest of the World" },
        {  y: $("#alVal").val(), indexLabel: "Alliance" },
        {  y: $("#unVal").val(), indexLabel: "Unassigned" }
        ]
        }
        ]
    });

        chart.render();
    }
    </script>
    
    <script>
        $(document).ready(function(){
           $("#3").attr("class","active"); 
           $("#resSummary").dataTable();
           $('#reminder').modal('show');
           $(".resourceRow").tooltip();
           $('.tablee').DataTable({
                "order": [[ 1, "desc" ]],
                "scrollCollapse": true,
                "paging":         false,
                "bInfo":          false,
                "bFilter":        false
            });
           
            $("#resources").on('click',".resourceRow",function(){
               $.ajax({
                   url:'getSpecificEmployee.htm',
                   type:'post',
                   data:{'id':$(this).children(".resId").val()},
                   success:function(data,status){
                       $("#currentProjects").html("");
                       var x = data.toString();
                       var res=x.split("%");
                       $("#employeeName").text(res[0]+" "+res[1]+" "+res[2]);
                       $("#resUnit").text(res[3]);
                       $("#resHired").text(res[4]);
                       if(res.length==5){
                           $("#currentProjects").append("Currently not assigned to any project");
                       }
                       for(var i=5;i<res.length;i++){
                           $("#currentProjects").append(i-4+". "+res[i]+"<br/> ");
                       }
                   },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }
                   
               });
           });
        
        });
    </script>
</html>