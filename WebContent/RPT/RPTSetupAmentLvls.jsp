<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 1/30/2019
  Time: 11:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.paeis.dbConnection.LGUConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>RPT | Setup</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
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
    <link href="assets/plugins/bootstrap-wizard/css/bwizard.min.css" rel="stylesheet"/>
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-eonasdan-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade in"><span class="spinner"></span></div>
<!-- end #page-loader -->

<jsp:include page="RPTComponent.jsp"></jsp:include>

<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb pull-right">
            <li><a href="javascript:;">Setup</a></li>
            <li class="active">Assessment Levels</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">Assessment Levels</h1>
        <!-- end page-header -->

        <div class="row">
            <div class="col-md-12">
                <!-- begin panel -->
                <div class="panel panel-inverse panel-danger">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success"
                               data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                        </div>
                        <h4 class="panel-title">Assessment Levels Tables</h4>
                    </div>
                    <div class="panel-body">
                        <a href="#modal-addcont" id="addContbtn" class="btn btn-sm btn-primary" data-toggle="modal">Add Assessment Levels</a>
                    </div>
                    <div class="panel-body">
                        <table id="data-table" class="table table-striped table-bordered nowrap" width="100%">
                            <thead>
                            <tr>
                                <th class="hide"></th>
                                <th>Property Type</th>
                                <th>Property Class</th>
                                <th>Assessment Level</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                LGUConnect cons = new LGUConnect();
                                Connection con9 = cons.getConnection();
                                PreparedStatement getPropType = (PreparedStatement) con9.prepareStatement("SELECT  a.`al_id`,  t.`pt_desc`,  c.`pc_desc`,  a.`al_val` FROM  `rpt_r_assessment_lvl` AS a INNER JOIN `rpt_r_property_type` AS t ON a.`pt_id` = t.`pt_id` INNER JOIN `rpt_r_property_class` AS c ON a.`pc_id` = c.`pc_id` GROUP BY  `al_id`");
                                ResultSet res = getPropType.executeQuery();
                                while (res.next()) {
                            %>
                            <tr>
                                <td class="hide"><%=res.getString("a.AL_ID")%>
                                </td>
                                <td><%=res.getString("t.PT_DESC")%>
                                </td>
                                <td><%=res.getString("c.PC_DESC")%>
                                </td>
                                <td><%=res.getString("a.AL_VAL")%>
                                </td>
                                <td>
                                    <a href="#modal-editcont" id="editContbtn" class="btn btn-sm btn-primary editProp" data-toggle="modal">Edit</a>
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

    <!-- #modal-add -->
    <div class="modal fade" id="modal-addcont">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Assessment Levels</h4>
                        </div>
                        <div class="panel-body">
                            <form enctype="multipart/form-data"  name="addAmentLvlsForm" id="addAmentLvlsForm">
                                <%--<form enctype="multipart/form-data" name="insertUsrForm" id="insertUsrForm">--%>
                                <div>
                                    <fieldset>
                                        <legend class="pull-left width-full">Assessment Levels</legend>
                                        <!-- begin row -->
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Property Type</label>
                                                    <div class="controls">
                                                        <select name="addamentptype" class="form-control">
                                                            <%

                                                                LGUConnect con = new LGUConnect();
                                                                Connection con1 = con.getConnection();
                                                                Statement aa = con1.createStatement();
                                                                ResultSet ss = aa.executeQuery("SELECT * FROM `rpt_r_property_type`");
                                                                while (ss.next()){
                                                            %>
                                                            <option value="<%out.print(ss.getInt("PT_ID"));%>">
                                                                <%out.print(ss.getString("PT_DESC"));%>
                                                            </option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Propery Class</label>
                                                    <div class="controls">
                                                        <select name="addamentpclass" class="form-control">
                                                            <%

                                                                LGUConnect cona = new LGUConnect();
                                                                Connection conk = cona.getConnection();
                                                                Statement bb = conk.createStatement();
                                                                ResultSet tt = bb.executeQuery("SELECT * FROM `rpt_r_property_class`");
                                                                while (tt.next()){
                                                            %>
                                                            <option value="<%out.print(tt.getInt("PC_ID"));%>">
                                                                <%out.print(tt.getString("PC_DESC"));%>
                                                            </option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Assessment Level</label>
                                                    <div class="controls">
                                                        <input type="text" name="addamentlvl" placeholder="Assessment Level"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <br>

                                        <div class="modal-footer">
                                            <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                                            <button type="button" id="btnAddAmentLvls" class="btn btn-sm btn-success" onclick="btnAdd()">Add</button>
                                        </div>
                                        <!-- end row -->
                                    </fieldset>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- #modal-edit -->
    <div class="modal fade" id="modal-editcont">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="panel panel-inverse panel-danger">
                        <div class="panel-heading">
                            <h4 class="panel-title">Assessment Levels</h4>
                        </div>
                        <div class="panel-body">
                            <form enctype="multipart/form-data"  name="editAmentLvlsForm" id="editAmentLvlsForm">
                                <%--<form enctype="multipart/form-data" name="insertUsrForm" id="insertUsrForm">--%>
                                    <input type="text" id="al_id" name="al_id" class="hide">
                                <div>
                                    <fieldset>
                                        <legend class="pull-left width-full">Assessment Levels</legend>
                                        <!-- begin row -->
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Property Type</label>
                                                    <div class="controls">
                                                        <select name="editamentptype" class="form-control">
                                                            <%

                                                                LGUConnect cond = new LGUConnect();
                                                                Connection conj = cond.getConnection();
                                                                Statement rr = conj.createStatement();
                                                                ResultSet qq = rr.executeQuery("SELECT * FROM `rpt_r_property_type`");
                                                                while (qq.next()){
                                                            %>
                                                            <option value="<%out.print(qq.getInt("PT_ID"));%>">
                                                                <%out.print(qq.getString("PT_DESC"));%>
                                                            </option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Property Class</label>
                                                    <div class="controls">
                                                        <select name="editamentpclass" class="form-control" >
                                                            <%

                                                                LGUConnect conb = new LGUConnect();
                                                                Connection conl = conb.getConnection();
                                                                Statement cc = conl.createStatement();
                                                                ResultSet uu = cc.executeQuery("SELECT * FROM `rpt_r_property_class`");
                                                                while (uu.next()){
                                                            %>
                                                            <option value="<%out.print(uu.getInt("PC_ID"));%>">
                                                                <%out.print(uu.getString("PC_DESC"));%>
                                                            </option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Assessment Level</label>
                                                    <div class="controls">
                                                        <input type="text" name="editamentlvl" placeholder="Assessment Level"
                                                               class="form-control" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <br>

                                        <div class="modal-footer">
                                            <button class="btn btn-sm btn-white" data-dismiss="modal">Close</button>
                                            <button type="button" id="btnEditAmentLvls" class="btn btn-sm btn-success">Edit</button>
                                        </div>
                                        <!-- end row -->
                                    </fieldset>
                                </div>
                            </form>
                        </div>
                    </div>
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

<jsp:include page="RPTFooter.jsp"></jsp:include>

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
<script src="assets/js/form-wizards.demo.min.js"></script>
<script src="assets/plugins/bootstrap-wizard/js/bwizard.js"></script>
<script src="assets/plugins/bootstrap-daterangepicker/moment.js"></script>
<script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="assets/plugins/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/plugins/bootstrap-eonasdan-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="assets/js/form-plugins.demo.min.js"></script>
<script src="assets/plugins/masked-input/masked-input.min.js"></script>
<script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
<script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
<script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput-typeahead.js"></script>
<script src="assets/plugins/jquery-tag-it/js/tag-it.min.js"></script>
<script src="assets/plugins/select2/dist/js/select2.min.js"></script>
<script src="assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<script>
    $(document).ready(function () {
        App.init();
        TableManageResponsive.init();

        $("#btnAddAmentLvls").click(function () {
            swal({
                title: "Are you sure?",
                text: "You will save your current changes",
                type: "warning",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Confirm!",
                showCancelButton: true,
                cancelButtonText: 'Cancel'
            }).then(function (result) {
                if(result.value){
                    var addAmentLvlsForm = new FormData($('#addAmentLvlsForm')[0]);
                    $.ajax({
                        type: "POST",
                        url: "insertAssessmentLvl",
                        data: addAmentLvlsForm,
                        enctype: "multipart/form-data",
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            swal({
                                type: 'success',
                                title: 'DONE!.',
                                text: 'Succesfully Processed',
                                confirmButtonText: 'OK'
                            }).then(function (result) {
                                if(result.value){
                                    location.reload(true);
                                }
                            });}
                    });
                }
                else
                if (result.dismiss === swal.DismissReason.cancel) {
                    swalWithBootstrapButtons(
                        'Cancelled',
                        'Operation Halted',
                        'error'
                    )

                }
            });
        });

        $('.editProp').click(function () {
            document.getElementById('al_id').value = $(this).closest("tbody tr").find("td:eq(0)").html().trim();
        });


        $("#btnEditAmentLvls").click(function () {
            swal({
                title: "Are you sure?",
                text: "Current changes will be saved.",
                type: "warning",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Confirm!",
                showCancelButton: true,
                cancelButtonText: 'Cancel'
            }).then(function (result) {
                if(result.value){
                    var editAmentLvlsForm = new FormData($('#editAmentLvlsForm')[0]);
                    $.ajax({
                        type: "POST",
                        url: "editAssessmentLvl",
                        data: editAmentLvlsForm,
                        enctype: "multipart/form-data",
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            swal({
                                type: 'success',
                                title: 'DONE!.',
                                text: 'Succesfully Processed',
                                confirmButtonText: 'OK'
                            }).then(function (result) {
                                if(result.value){
                                    location.reload(true);
                                }
                            });}
                    });
                }
                else
                if (result.dismiss === swal.DismissReason.cancel) {
                    swalWithBootstrapButtons(
                        'Cancelled',
                        'Operation Halted',
                        'error'
                    )

                }
            });
        });
    });
</script>
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-53034621-1', 'auto');
    ga('send', 'pageview');

</script>
</body>
</html>