<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/18/2018
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>MTOPS | Licensing</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="icon" href="extras/logo1.png">

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="assets/css/animate.min.css" rel="stylesheet"/>
    <link href="assets/css/style.min.css" rel="stylesheet"/>
    <link href="assets/css/style-responsive.min.css" rel="stylesheet"/>
    <link href="assets/css/theme/default.css" rel="stylesheet" id="theme"/>
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet"/>
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<%
    LGUConnect conX = new LGUConnect();
    try {
        Connection conn3 = conX.getConnection();
        Statement ss3 = conn3.createStatement();
        ResultSet gg3 = ss3.executeQuery("SELECT * FROM mtops_t_application_frm APL JOIN mtops_r_toda TODA ON APL.TODA = TODA.TODA_ID WHERE APF_STATUS = 'Treasury'");%>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<jsp:include page="BPLSTComponent.jsp"></jsp:include>

<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb pull-right">
            <li><a href="javascript:;">Treasury</a></li>
            <li class="active">License Processing</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">License Processing</h1>
        <!-- end page-header -->

        <div class="row">
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <h4 class="panel-title">License Processing Table</h4>
                    </div>
                    <div class="panel-body">
                        <table
                                id="data-table"
                                class="table table-striped table-bordered nowrap"
                                width="100%"
                        >
                            <thead>
                            <tr>
                                <th>Applicant's Name</th>
                                <th>TODA</th>
                                <th>Status</th>
                                <th>Date Received</th>
                                <th>Action</th>
                                <th class="hidden">Action</th>
                                <th class="hidden">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                while (gg3.next()) {
                                    String lastPart = "location.href='MTOPSFinalReceipt.jsp?idNo=" + gg3.getString("APF_ID") + "&tbId=" + gg3.getString("TB_ID") + "&treId=" +session.getAttribute("empid")+"'";
                            %>
                            <tr>
                                <td><%=gg3.getString("APF_FNAME") +' '+gg3.getString("APF_MNAME") +' '+gg3.getString("APF_LNAME")%></td>
                                <td><%=gg3.getString("TODA_NAME")%></td>
                                <td><%=gg3.getString("APF_STATUS")%></td>
                                <td><%=gg3.getString("APF_DATEACCESSED")%></td>
                                <td>
                                    <button
                                            type="button"
                                            class="btn btn-success"
                                    <%--  data-toggle="modal"
                                      data-target="#modal-processpayment"--%> onclick="<%=lastPart%>"
                                            title="Payment for Permit"
                                    ><i class="fa fa-lg fa-money"></i>
                                    </button>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- end panel -->
            </div>
        </div>
    </div>
    <!-- end #content -->

    <!-- #modal-processpayment -->
    <div class="modal fade" id="modal-processpayment">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
                    <h4 class="modal-title">Process Licence</h4>
                </div>
                <form class="form-horizontal" id="treasuryNewApplForm" name="treasuryNewApplForm">
                    <div class="modal-body">
                        <div class="panel-body col-md-12">

                            <h5>Reference Number: <label class="control-label" id="tRefno"></label></h5>

                            <h5>Applicant's Name: <label class=" control-label" id="tBuNa"></label></h5>

                            <h5>TODA: <label class=" control-label" id="tBuN"></label></h5>

                            <h5>Applicant's Address: <label class=" control-label" id="tTA"></label></h5>

                            <h5>Date Billed: <label class="control-label" id="tDB"></label></h5>

                        </div>
                        <div class="panel-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Kind of Fee/Tax</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>

                                </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="form-group"><label class="col-md-4 control-label">Payment Mode: </label>
                            <div class="col-md-8">
                                <select name="optPaymentType" class="form-control" data-style="btn-white" tabindex="-1">
                                    <option value="CH">Cash</option>
                                    <option value="TW">Treasury Warrant</option>
                                    <option value="CK">Cash</option>
                                    <option value="MO">Money Order</option>
                                </select>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-md-4 control-label">Amount: </label>
                            <div class="col-md-5">
                                <input type="text" name="txtAmt" class="form-control" placeholder="PHP"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Amount: </label>
                            <div class="col-md-5">
                                <input type="text" name="txtChng" class="form-control" placeholder="PHP"/>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                            <button type="submit" id="btnTreNewAppl" class="btn btn-sm btn-success">Process</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- begin scroll to top btn -->
<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
        class="fa fa-angle-up"></i></a>
<!-- end scroll to top btn -->
</div>
<!-- end page container -->

<jsp:include page="BPLSTFooter.jsp"></jsp:include>

<!-- ================== BEGIN BASE JS ================== -->
<script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
<script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
<script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!--[if lt IE 9]>
<script src="assets/crossbrowserjs/html5shiv.js"></script>
<script src="assets/crossbrowserjs/respond.min.js"></script>
<script src="assets/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
<!-- ================== END BASE JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
<script src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
<script src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
<script src="assets/js/table-manage-responsive.demo.min.js"></script>
<script src="assets/js/apps.min.js"></script>
<script src="assets/js/divTreasury.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
</body>
<%
    } catch (SQLException | ClassNotFoundException e) {
        out.print(e);
    }
%>
</html>