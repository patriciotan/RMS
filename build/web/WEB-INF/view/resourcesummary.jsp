<%@include file="navigation.jsp" %>
<button type="button" class="btn btn-lg btn-primary pull-left" data-toggle="modal" data-target="#summary">Show head count</button>
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
                            <th>Sept</th>
                            <th>Oct</th>
                            <th>Nov</th>
                            <th>Dec</th>
                        </tr>
                    </thead>
                    <tbody id="resources">
                        <c:forEach items="${resources}" var="resource">
                        <tr class="resourceRow" data-toggle="modal" data-target="#resInfo">   
                            <input type="hidden" class="resId" value="${resource.resourceId}"/>
                            <td style="text-align: left;" class="resName"><c:out value="${resource.fname} ${resource.lname}" /></td>						
                            <td>yyyy</td>   
                            <td>#</td>
                            <td>#</td>   
                            <td>#</td>
                            <td>#</td>   
                            <td>#</td>
                            <td>#</td>   
                            <td>#</td>
                            <td>#</td>   
                            <td>#</td>
                            <td>#</td>   
                            <td>#</td>
                            <td>#</td>
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
                                                <tr><td><b>Current projects:<code></code></b></td></tr>
                                            </tbody>
                                        </table>
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
            <!-- info Modal --> 
                    
            <!-- summary Modal -->
                <div class="modal fade" id="summary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog-s">
                        <div class="modal-content-sm">
                            <div class="modal-body-sm">
                                <div class="panel panel-primary">  
                                    <div class="panel-heading">
                                        <b>Summary</b>
                                    </div>
                                    <div class="panel-body">
                                        <table class="table table-hover">
                                            <col width="250">
                                            <col width="118">
                                            <thead>
                                                <th style="font-weight: bold; text-align: right;">Total Head Count</th><th>#</th></th>
                                            </thead>
                                            <tbody>
                                                <tr><td style="font-weight: bold; text-align: right;">Employees per Business Unit</td><td></td></tr>
                                                <tr><td style="text-align: right;">Philippines</td><td>#</td></tr>
                                                <tr><td style="text-align: right;">Japan</td><td>#</td></tr>
                                                <tr><td style="text-align: right;">Rest of the World</td><td>#</td></tr>
                                                <tr><td style="text-align: right;">Alliance</td><td>#</td></tr>
                                                <tr><td style="font-weight: bold; text-align: right;">Unassigned</td><td>#</td></tr>
                                            </tbody>
                                        </table>
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
        </div>
    </div>
</div><!-- closing div from navigation-->
    </body>
    <script>
        $(document).ready(function(){
           $("#3").attr("class","active"); 
           $("#resSummary").dataTable();
           
            $("#resources").on('click',".resourceRow",function(){
               $.ajax({
                   url:'getSpecificResource.htm',
                   type:'Get',
                   data:{'id':$(this).children(".resId").val()},
                   success:function(data,status){
                       var x = data.toString();
                       var res=x.split("%");
                       $("#employeeName").text(res[0]+" "+res[1]+" "+res[2]);
                       $("#resUnit").text(res[3]);
                       $("#resHired").text(res[4]);
                   },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }
                   
               });
           });
        });
    </script>
</html>