<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="navigation.jsp" %>

<div id="bodiv">
    <div class="row">
        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading"><a href="#" class="pull-right">View more</a> <h5><b>Under loaded resources for February</b></h5></div>
                <div class="panel-body">
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <th style="text-align: left">Resource Name</th>
                                <th style="text-align: right">Max Effort</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="text-align: left">Employee Name</td>
                                    <td style="text-align: right">0.3</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">Employee Name</td>
                                    <td style="text-align: right">0.8</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">Employee Name</td>
                                    <td style="text-align: right">0.1</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading"><a href="#" class="pull-right">View more</a> <h5><b>Unassigned resources for next month</b></h5></div>
                <div class="panel-body">
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <th style="text-align: left">Resource Name</th>
                                <th style="text-align: right">End Date</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="text-align: left">Employee Name</td>
                                    <td style="text-align: right">yyyy/mm/dd</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">Employee Name</td>
                                    <td style="text-align: right">yyyy/mm/dd</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">Employee Name</td>
                                    <td style="text-align: right">yyyy/mm/dd</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="well"> 
                <form class="form">
                    <h5><b>Add new project or client</b></h5>
                    <br/>
                    <div class="input-group text-center">
                        <input disabled type="text" class="form-control" placeholder="New project">
                        <span class="input-group-btn"><button class="btn btn-primary" type="button">ADD</button></span>
                    </div>
                    <br/>
                    <div class="input-group text-center">
                        <input disabled type="text" class="form-control" placeholder="New client">
                        <span class="input-group-btn"><button class="btn btn-primary" type="button">ADD</button></span>
                    </div>
                </form>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading"><h5><b>Latest clients added</b></h5></div>
                <div class="panel-body">
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <th style="text-align: left">Client Name</th>
                                <th style="text-align: right">Date Added</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="text-align: left">Client Name</td>
                                    <td style="text-align: right">yyyy/mm/dd</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">Client Name</td>
                                    <td style="text-align: right">yyyy/mm/dd</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">Client Name</td>
                                    <td style="text-align: right">yyyy/mm/dd</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading"><h5><b>Latest projects added</b></h5></div>
                <div class="panel-body">
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <th style="text-align: left">Project Name</th>
                                <th style="text-align: right">Date Added</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="text-align: left">Project Name</td>
                                    <td style="text-align: right">yyyy/mm/dd</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">Project Name</td>
                                    <td style="text-align: right">yyyy/mm/dd</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">Project Name</td>
                                    <td style="text-align: right">yyyy/mm/dd</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading"><a href="#" class="pull-right">View more</a> <h5><b>Unassigned projects for next month</b></h5></div>
                <div class="panel-body">
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <th style="text-align: left">Project Name</th>
                                <th style="text-align: right">End Date</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="text-align: left">Project Name</td>
                                    <td style="text-align: right">yyyy/mm/dd</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">Project Name</td>
                                    <td style="text-align: right">yyyy/mm/dd</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">Project Name</td>
                                    <td style="text-align: right">yyyy/mm/dd</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
</div>
</div><!-- closing div from navigation-->


    <script>
        $(document).ready(function(){
        $('#redesign').click(function(){
            if ($(this).hasClass('on')) {
                $('#main .col-md-6').addClass('col-md-4').removeClass('col-md-6');
                $(this).removeClass('on');
            }
            else {
                $('#main .col-md-4').addClass('col-md-6').removeClass('col-md-4');
                $(this).addClass('on');
            }
            });

            $("#0").attr("class","active");

        });
    </script>
</html>