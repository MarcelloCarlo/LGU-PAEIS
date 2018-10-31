<%--
  Created by IntelliJ IDEA.
  User: Li Ven
  Date: 10/18/2018
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!-- begin #header -->
<div id="header" class="header navbar navbar-default navbar-fixed-top">
    <!-- begin container-fluid -->
    <div class="container-fluid">
        <!-- begin mobile sidebar expand / collapse button -->
        <div class="navbar-header">
            <a href="#" class="navbar-brand"><span class="navbar-logo"></span> PAEIS/MTOPS</a>
            <button type="button" class="navbar-toggle" data-click="top-menu-toggled">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <!-- end mobile sidebar expand / collapse button -->

        <!-- begin header navigation right -->
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown navbar-user">
                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="hidden-xs">Sample User</span> <b class="caret"></b>
                </a>
                <ul class="dropdown-menu animated fadeInLeft">
                    <li class="arrow"></li>
                    <li><a href="PAEISPortal.jsp">Log Out</a></li>
                </ul>
            </li>
        </ul>
        <!-- end header navigation right -->
    </div>
    <!-- end container-fluid -->
</div>
<!-- end #header -->

<!-- begin #top-menu -->
<div id="top-menu" class="top-menu">
    <!-- begin top-menu nav -->
    <ul class="nav">
        <%--<li><a href="PAEISSAIndex.jsp"><i class="fa fa-calendar"></i> <span>Records</span></a></li>--%>
        <li><a href="MTOPSAment.jsp"><i class="fa fa-file-text"></i> <span>Franchise Assessment Processing</span></a></li>
        <%--<li class="has-sub">--%>
            <%--<a href="javascript:;">--%>
                <%--<b class="caret pull-right"></b>--%>
                <%--<i class="fa fa-gears"></i>--%>
                <%--<span>Reports</span>--%>
            <%--</a>--%>
            <%--<ul class="sub-menu">--%>
                <%--<li><a href="BPLSETerReports.jsp"><i class="fa fa-file-excel-o"></i> <span>Termination Reports</span></a></li>--%>
                <%--<li><a href="BPLSEEndReports.jsp"><i class="fa fa-file-excel-o"></i> <span>Evaluated Reports</span></a></li>--%>
                <%--<li><a href="BPLSESSReports.jsp"><i class="fa fa-file-excel-o"></i> <span>Small Scale Reports</span></a></li>--%>
                <%--<li><a href="BPLSELSReports.jsp"><i class="fa fa-file-excel-o"></i> <span>Large Scale Reports</span></a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
    </ul>
    <!-- end top-menu nav -->
</div>
<!-- end #top-menu -->

