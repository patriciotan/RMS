<%@include file="navigation.jsp" %>

<div id="bodiv">
    <div class="row">
        <div style="float: left; width: 30%; margin-left: 1.2%;">
            <h3><a href="pSummary">Project Summary</a> / ${projectName}</h3>
        </div>
        <div style="float: left; margin-left: 51.8%; margin-right: -10px; margin-top: 12px;">
            <button type="button" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#assign">Assign new resource</button>
        </div>
    </div>
    <div id="resourceSummary" class="col-md-12">
        <div class="row">
            <!-- employee list table-->
                <table id="resProjects" class="display">   
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
                        <tr class="resourceRow" data-toggle="modal" data-target="#editResource">  
                            <td style="text-align: left;" class="aResource"><c:out value="${resource.fname} ${resource.lname}" /></td>						
                            <td class="resoYear"><c:out value="${resource.year}" /></td>   
                            <td class="resoJan"><c:out value="${resource.jan}" /></td>   
                            <td class="resoFeb"><c:out value="${resource.feb}" /></td>   
                            <td class="resoMar"><c:out value="${resource.mar}" /></td>   
                            <td class="resoApr"><c:out value="${resource.apr}" /></td>   
                            <td class="resoMay"><c:out value="${resource.may}" /></td>   
                            <td class="resoJun"><c:out value="${resource.jun}" /></td>   
                            <td class="resoJul"><c:out value="${resource.jul}" /></td>   
                            <td class="resoAug"><c:out value="${resource.aug}" /></td>   
                            <td class="resoSep"><c:out value="${resource.sep}" /></td>   
                            <td class="resoOct"><c:out value="${resource.oct}" /></td>   
                            <td class="resoNov"><c:out value="${resource.nov}" /></td>   
                            <td class="resoDece"><c:out value="${resource.dece}" /></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            
            <!-- Start modal for assign resources-->            
            <div class="modal fade" id="assign" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog-l">
                    <div class="modal-content-sm">
                        <div class="modal-body-sm">
                            <div class="panel panel-primary">  
                                <div class="panel-heading">
                                    <b>Assign resource to <code id="aProj"></code></b>
                                </div>
                                <form id="assign" name="assign" action='<c:url value="assignResource"/>' method="post" modelAttribute="effort">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label for="">Name:</label>
                                            <select class="form-control" name="empId" required="required" id="empName">
                                                <option disabled="true" value="default" selected default></option>
                                                <c:forEach items="${employees}" var="employee">
                                                    <option value="${employee.empId}"><c:out value="${employee.fname} ${employee.lname}" /></option>
                                                </c:forEach>
                                            </select>
                                            <input type="hidden" id="selectedStart"/>
                                            <input type="hidden" id="selectedEnd"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Effort</label>
                                            <table class="table table-hover">
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
                                                <tbody id="addResTable">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div style="text-align: right">
            <!--                                <a href="#" class="ass">display jan value</a>-->
                                            <input type="hidden" name="projId" id="projectId"/>
                                            <input type="hidden" name="count" id="count"/>
                                            <input class="btn btn-success" id="add-but" type="submit" value="Assign">
                                            <button class="btn btn-danger" type="button" data-dismiss="modal"><span>Cancel</span></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End modal for assign resources-->
            
            <!-- Start modal for edit resources-->            
            <div class="modal fade" id="editResource" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog-l">
                    <div class="modal-content-sm">
                        <div class="modal-body-sm">
                            <div class="panel panel-primary">  
                                <div class="panel-heading">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <b>Edit resource effort</b>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label for=""><b id="eResource"></b></label>
                                        <a class="pull-right" data-dismiss="modal" data-toggle="modal" data-target="#removeRes">
                                            <img style="width: 30px;" src='<c:url value="/res/images/delete.png"/>'>
                                        </a>
                                    </div>
                                    <div class="form-group">
                                        <label for="">Effort<input type="text" id="eId"/></label>
                                        <table class="table table-hover">
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
                                                <tr>
                                                    <td><input style="width: 5px" type="number" name="year" disabled id="eYear"/></td>
                                                    <td><input type="number" name="jan" disabled="true" value="0" min="0" step="0.1" id="e1"/></td>
                                                    <td><input type="number" name="feb" disabled="true" value="0" min="0" step="0.1" id="e2"/></td>
                                                    <td><input type="number" name="mar" disabled="true" value="0" min="0" step="0.1" id="e3"/></td>
                                                    <td><input type="number" name="apr" disabled="true" value="0" min="0" step="0.1" id="e4"/></td>
                                                    <td><input type="number" name="may" disabled="true" value="0" min="0" step="0.1" id="e5"/></td>
                                                    <td><input type="number" name="jun" disabled="true" value="0" min="0" step="0.1" id="e6"/></td>
                                                    <td><input type="number" name="jul" disabled="true" value="0" min="0" step="0.1" id="e7"/></td>
                                                    <td><input type="number" name="aug" disabled="true" value="0" min="0" step="0.1" id="e8"/></td>
                                                    <td><input type="number" name="sep" disabled="true" value="0" min="0" step="0.1" id="e9"/></td>
                                                    <td><input type="number" name="oct" disabled="true" value="0" min="0" step="0.1" id="e10"/></td>
                                                    <td><input type="number" name="nov" disabled="true" value="0" min="0" step="0.1" id="e11"/></td>
                                                    <td><input type="number" name="dece" disabled="true" value="0" min="0" step="0.1" id="e12"/></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div style="text-align: right">
                                        <input class="btn btn-success" id="add-but" type="submit" value="Save">
                                        <button class="btn btn-danger removeRes" type="button" data-dismiss="modal" data-toggle="modal" data-target="#view"><span>Cancel</span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End modal for edit resources-->
            
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
                                                <tr><td><b>Current projects:<br/><code id="currentProjects"></code></b></td></tr>
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
                                                <th style="font-weight: bold; text-align: right;">Total Head Count</th><th><code>${summary.total}</code></th></th>
                                            </thead>
                                            <tbody>
                                                <tr><td style="font-weight: bold; text-align: right;">Employees per Business Unit</td><td></td></tr>
                                                <tr><td style="text-align: right;">Philippines</td><td id=""><code>${summary.ph}</code></td></tr>
                                                <tr><td style="text-align: right;">Japan</td><td id=""><code>${summary.jap}</code></td></tr>
                                                <tr><td style="text-align: right;">Rest of the World</td><td><code>${summary.row}</code></td></tr>
                                                <tr><td style="text-align: right;">Alliance</td><td><code>${summary.alli}</code></td></tr>
                                                <tr><td style="font-weight: bold; text-align: right;">Unassigned</td><td><code>#</code></td></tr>
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
</div>

</div>
</div>
</div><!-- closing div from navigation-->
    </body>
    <script>
        $(document).ready(function(){
           $("#2").attr("class","active"); 
           $("#resProjects").dataTable();
        
            $("#resProjects").on("click",".resourceRow",function(){
                $("#eResource").html($(this).children(".aResource").text()); 
                var yearSelected=$(this).children(".resoYear").text();
                $("#eYear").val(yearSelected);
                $("#e1").val($(this).children(".resoJan").text());
                $("#e2").val($(this).children(".resoFeb").text());
                $("#e3").val($(this).children(".resoMar").text());
                $("#e4").val($(this).children(".resoApr").text());
                $("#e5").val($(this).children(".resoMay").text());
                $("#e6").val($(this).children(".resoJun").text());
                $("#e7").val($(this).children(".resoJul").text());
                $("#e8").val($(this).children(".resoAug").text());
                $("#e9").val($(this).children(".resoSep").text());
                $("#e10").val($(this).children(".resoOct").text());
                $("#e11").val($(this).children(".resoNov").text());
                $("#e12").val($(this).children(".resoDece").text());
                
                var start = $(this).parent().parent().siblings().find("#startYear").val();
                var end = $(this).parent().parent().siblings().find("#endYear").val();
                
                var startYear = start.substring(0,4);
                var endYear = end.substring(0,4);
                
                var startMonth = start.substring(5,7);
                var endMonth = end.substring(5,7);
                
                //-----------------------------------------------------------------------------
                //lacking diri dapat disable and stuff
                if(startYear==endYear){
                    for(var i=1;i<=12;i++){
                        if(i>=startMonth&&i<=endMonth){
                            $("#e"+i).removeAttr("disabled");
                        }
                    }
                }else{
                    if(startYear==yearSelected){
                        for(var i=startMonth;i<=12;i++){
                            $("#e"+i).removeAttr("disabled");
                        }
                    }else if(endYear==yearSelected){
                        for(var i=1;i<=endMonth;i++){
                            $("#e"+i).removeAttr("disabled");
                        }
                    }else{
                        for(var i=1;i<=12;i++){
                            $("#e"+i).removeAttr("disabled");
                        }
                    }
                }
                $("#eId").val($(this).children(".resoId").val());
                $.ajax({
                    url:'getTotalEffort.htm',
                    type:'post',
                    data:{'year':yearSelected,'resId':$(this).children(".resoId").val()},
                    success:function(data,status){
                        var x = data.toString();
                        var res=x.split("%");
                        for(var i=1;i<=12;i++){
                            var wait = Math.round((1-res[i])*10)/10;
                            var finall = Math.round((wait+parseFloat($("#e"+i).val()))*10)/10; 
                            $("#e"+i).attr("max",finall);
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