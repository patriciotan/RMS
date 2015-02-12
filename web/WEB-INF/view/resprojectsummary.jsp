<%@include file="navigation.jsp" %>

<div id="bodiv">
    <div class="row">
        <div style="float: left; width: 30%; margin-left: 1.2%;">
            <h3><a href="pSummary">Project Summary</a> / ${projectName}</h3>
            <input type="text" id="startDate" value="${project.start}" />
            <input type="text" id="endDate" value="${project.end}" />
        </div>
        <div style="float: left; margin-left: 51.8%; margin-right: -10px; margin-top: 12px;">
            <button type="button" class="btn btn-lg btn-primary assignOption" data-toggle="modal" data-target="#assign">Assign new resource</button>
        </div>
    </div>
    <div id="resourceSummary" class="col-md-12">
        <div class="row">
            <!-- employee list table-->
                <table id="resProjects" class="display">   
                    <thead>
                        <tr>
                            <th style="display:none;"></th>
                            <th style="display:none;"></th>
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
                            <td style="display:none;"><input type="hidden" class="resoId" value="${resource.empId}"/></td>
                            <td style="display:none;"><input type="hidden" class="resoEId" value="${resource.effortId}"/></td>
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
                                    <b>Assign resource to <code id="aProj">${projectName}</code></b>
                                </div>
                                <form name="assign" action='<c:url value="assignResource"/>' method="post" modelAttribute="effort">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label for="">Name:</label>
                                            <select class="form-control" name="empId" required="required" id="empName">
                                                <option disabled="true" value="default" selected default></option>
                                                <c:forEach items="${employees}" var="employee">
                                                    <option value="${employee.empId}"><c:out value="${employee.fname} ${employee.lname}" /></option>
                                                </c:forEach>
                                            </select>
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
                                            <input type="text" name="projId" id="projectId" value="${projectId}"/>
                                            <input type="text" name="count" id="count"/>
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
                                <form name="edit" action='<c:url value="editResource"/>' method="post" modelAttribute="effort">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label for=""><b id="eResource"></b></label>
                                            <a class="pull-right removeRes" data-dismiss="modal" data-toggle="modal" data-target="#removeRes">
                                                <img style="width: 30px;" src='<c:url value="/res/images/delete.png"/>'>
                                            </a>
                                        </div>
                                        <div class="form-group">
                                            <label for="">Effort
                                                <input type="text" name="empId" id="eId"/>
                                                <input type="text" name="effortId" id="effortId" />
                                            </label>
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
                                                        <td><input type="number" name="year" style="width:55px;" id="eYear" readonly/></td>
                                                        <td><input type="number" name="jan" style="width:55px;" value="0" min="0" step="0.1" id="e1"/></td>
                                                        <td><input type="number" name="feb" style="width:55px;" value="0" min="0" step="0.1" id="e2"/></td>
                                                        <td><input type="number" name="mar" style="width:55px;" value="0" min="0" step="0.1" id="e3"/></td>
                                                        <td><input type="number" name="apr" style="width:55px;" value="0" min="0" step="0.1" id="e4"/></td>
                                                        <td><input type="number" name="may" style="width:55px;" value="0" min="0" step="0.1" id="e5"/></td>
                                                        <td><input type="number" name="jun" style="width:55px;" value="0" min="0" step="0.1" id="e6"/></td>
                                                        <td><input type="number" name="jul" style="width:55px;" value="0" min="0" step="0.1" id="e7"/></td>
                                                        <td><input type="number" name="aug" style="width:55px;" value="0" min="0" step="0.1" id="e8"/></td>
                                                        <td><input type="number" name="sep" style="width:55px;" value="0" min="0" step="0.1" id="e9"/></td>
                                                        <td><input type="number" name="oct" style="width:55px;" value="0" min="0" step="0.1" id="e10"/></td>
                                                        <td><input type="number" name="nov" style="width:55px;" value="0" min="0" step="0.1" id="e11"/></td>
                                                        <td><input type="number" name="dece" style="width:55px;" value="0" min="0" step="0.1" id="e12"/></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                <div class="panel-footer">
                                    <div style="text-align: right">
                                        <input class="btn btn-success" id="add-but" type="submit" value="Save">
                                        <button class="btn btn-danger" type="button" data-dismiss="modal" data-toggle="modal" data-target="#view"><span>Cancel</span></button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End modal for edit resources-->
            
            <!-- Start modal for remove resource-->            
            <div class="modal fade" id="removeRes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog-s">
                    <div class="modal-content-sm">
                        <div class="modal-body-sm">
                            <div class="panel panel-primary">  
                                <div class="panel-heading">
                                    <b>Remove Resource</b>
                                </div>
                                <form name="del" action='<c:url value="deleteResource"/>' method="post" modelAttribute="resource">
                                    <div class="panel-body">
                                        <div class="form-group" style="text-align: center;">
                                            <label>Are you sure you want to remove <b id="remName"></b>?</label><input type="text" name="empId" id="removeId"/><input type="text" name="effortId" id="removeEId"/>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div style="text-align: right;">
                                            <input class="btn btn-success" id="add-but" type="submit" value="Yes"/>&nbsp;
                                            <button class="btn btn-danger" type="button"  data-dismiss="modal" data-toggle="modal" data-target="#editResource"><span>No</span></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End modal for remove resource-->
            
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
        
            $(".removeRes").click(function(){
               $("#remName").text($("#eResource").text()); 
               $("#removeId").val($("#eId").val());
               $("#removeEId").val($("#effortId").val());
            });
        
            $("#resources").on("click",".resourceRow",function(){
                var yearSelected=$(this).children(".resoYear").text();
                
                $("#effortId").val($(this).children().children(".resoEId").val());
                $("#eId").val($(this).children().children(".resoId").val());
                $("#eResource").html($(this).children(".aResource").text()); 
                
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
                
                var start = $("#startDate").val();
                var end = $("#endDate").val();
                
                var startYear = start.substring(0,4);
                var endYear = end.substring(0,4);
                
                var startMonth = start.substring(5,7);
                var endMonth = end.substring(5,7);
                
                for(var i=1;i<=12;i++){
                    $("#e"+i).attr("disabled","true");
                }
                
                if(startYear==endYear){
                    for(var i=1;i<=12;i++){
                        if(i>=startMonth&&i<=endMonth){
                            $("#e"+i).removeAttr("disabled");
                        }
                    }
                }else{
                    if(startYear==yearSelected){
                        for(var i=parseInt(startMonth);i<=12;i++){
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
                $.ajax({
                    url:'getTotalEffort.htm',
                    type:'post',
                    data:{'year':yearSelected,'resId': $("#eId").val()},
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
            
            
            $(".assignOption").click(function(){ 
               $("#addResTable").html("");
               
               var start = $("#startDate").val();
               var end = $("#endDate").val();
               var startYear = start.substring(0,4);
               var endYear = end.substring(0,4);
               var diffYear=endYear-startYear;
               $("#count").val(diffYear+1);
               for(var i=0;i<=diffYear;i++){
                   var t=i*12;
                   $("#addResTable").append("<tr>" +
                                            "<input type='hidden' name='year' value='"+(parseInt(startYear)+i)+"' class='year'/>" +
                                            "<td>"+(parseInt(startYear)+i)+"</td>" +
                                            "<td><input type='number' name='jan' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+1)+"'/></td>" +
                                            "<td><input type='number' name='feb' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+2)+"'/></td>" +
                                            "<td><input type='number' name='mar' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+3)+"'/></td>" +
                                            "<td><input type='number' name='apr' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+4)+"'/></td>" +
                                            "<td><input type='number' name='may' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+5)+"'/></td>" +
                                            "<td><input type='number' name='jun' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+6)+"'/></td>" +
                                            "<td><input type='number' name='jul' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+7)+"'/></td>" +
                                            "<td><input type='number' name='aug' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+8)+"'/></td>" +
                                            "<td><input type='number' name='sep' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+9)+"'/></td>" +
                                            "<td><input type='number' name='oct' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+10)+"'/></td>" +
                                            "<td><input type='number' name='nov' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+11)+"'/></td>" +
                                            "<td><input type='number' name='dece' value='0' min='0' readonly disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+12)+"'/></td>" +
                                        "</tr>");
               }
                $("#empName").val("default");
            });
           
            $("#empName").change(function(){
                var start = $("#startDate").val();
                var end = $("#endDate").val();
                
                var startYear = start.substring(0,4);
                var endYear = end.substring(0,4);
                var diffYear=endYear-startYear;
                
                var startMonth = start.substring(5,7);
                var endMonth = end.substring(5,7);
                
                var last=(diffYear+1)*12;
                var end=parseInt(endMonth)+(diffYear*12);
                
                var resId=$(this).val();
                $.ajax({
                    url:'getSpecificEffortMonth.htm',
                    type:'post',
                    data:{'year':startYear,'noYears':diffYear+1,'resId':resId},
                    success:function(data,status){
                        var x = data.toString();
                        var res=x.split("%");
                        for(var x=0;x<=diffYear;x++){
                            var t=x*12;
                            for(var i=1;i<=12;i++){
                               $(".month"+(parseInt(t)+i)).val("0");
                               $(".month"+(parseInt(t)+i)).removeAttr("disabled");
                            }
                        }
                        
                        for(var i=1;i<=last;i++){
                            if(i>=startMonth && i<=end){
                                $(".month"+i).removeAttr("readonly");
                                $(".month"+i).attr("max",Math.round( (1-res[i]) * 10 ) / 10);
                            }
                        }
                        
                    }
                });
            });
        });
    </script>
</html>