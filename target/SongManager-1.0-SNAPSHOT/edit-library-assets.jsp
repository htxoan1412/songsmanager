<%@ page import="com.example.model.CategoryModel" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.SongModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html class="no-js" lang="en">

<%@include file="inc/_style.jsp"%>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
<!-- Start Left menu area -->
<div class="left-sidebar-pro">
    <nav id="sidebar" class="">
        <div class="sidebar-header">
            <a href="index.html"><img class="main-logo" src="<%=request.getContextPath()%>/img/logo/logo.png" alt=""/></a>
            <strong><a href="index.html"><img src="<%=request.getContextPath()%>/img/logo/logosn.png" alt=""/></a></strong>
        </div>
        <div class="left-custom-menu-adp-wrap comment-scrollbar">
            <nav class="sidebar-nav left-sidebar-menu-pro">
                <ul class="metismenu" id="menu1">
                    <li>
                        <a class="has-arrow" href="all-courses.html" aria-expanded="false"><span
                                class="educate-icon educate-library icon-wrap"></span> <span
                                class="mini-click-non">Song</span></a>
                        <ul class="submenu-angle" aria-expanded="false">
                            <li><a title="All Library" href="<%=request.getContextPath()%>/song-assets.jsp"><span
                                    class="mini-sub-pro">Song Assets</span></a></li>
                            <li><a title="Add Library" href="<%=request.getContextPath()%>/admin/song/add"><span class="mini-sub-pro">Add Song Asset</span></a>
                            </li>

                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="all-courses.html" aria-expanded="false"><span
                                class="educate-icon educate-library icon-wrap"></span> <span class="mini-click-non">Library</span></a>
                        <ul class="submenu-angle" aria-expanded="false">
                            <li><a title="All Library" href="<%=request.getContextPath()%>/library-assets.jsp"><span class="mini-sub-pro">Library Assets</span></a>
                            </li>
                            <li><a title="Add Library" href="<%=request.getContextPath()%>/admin/cat/add"><span class="mini-sub-pro">Add Library Asset</span></a>
                            </li>
                        </ul>
                    </li>

                    <li class="active">
                        <a class="has-arrow" href="mailbox.html" aria-expanded="false"><span
                                class="educate-icon educate-data-table icon-wrap"></span> <span class="mini-click-non">User</span></a>
                        <ul class="submenu-angle" aria-expanded="false">
                            <li><a title="Data Table" href="data-table.jsp"><span class="mini-sub-pro">Data User</span></a>
                            </li>
                        </ul>
                    </li>


                </ul>
            </nav>
        </div>
    </nav>
</div>
<!-- End Left menu area -->
<!-- Start Welcome area -->
<div class="all-content-wrapper">
    <%@include file="inc/_header.jsp"%>

    <!-- Single pro tab review Start-->
    <div class="single-pro-review-area mt-t-30 mg-b-15">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="product-payment-inner-st">
                        <ul id="myTabedu1" class="tab-review-design">
                            <li class="active"><a href="#description">Library Assets</a></li>

                        </ul>
                        <div id="myTabContent" class="tab-content custom-product-edit">

                            <div class="product-tab-list tab-pane fade active in" id="INFORMATION">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="review-content-section">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="devit-card-custom">



                                                        <form method="post" action="">
                                                            <%
                                                                CategoryModel cat = (CategoryModel) request.getAttribute("category");

                                                            %>

                                                            <div class="form-group">
                                                                <input type="text" class="form-control" name="id"
                                                                       value="<%=cat.getId_cat()%>" readonly>


                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" name="name"
                                                                       value="<%=cat.getName()%>">
                                                            </div>

                                                            <button type="submit"
                                                                    class="btn btn-primary waves-effect waves-light">
                                                                Update
                                                            </button>

                                                        </form>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-copyright-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="footer-copy-right">
                        <p>Copyright © 2018. All rights reserved. Template by <a
                                href="https://colorlib.com/wp/templates/">Colorlib</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="inc/_footer.jsp"%>
</body>

</html>