<%@ page import="com.example.dao.impl.CategoryDao" %>
<%@ page import="com.example.model.CategoryModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.dao.ICategoryDao" %>
<%@ page import="javax.inject.Inject" %>
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
<%@include file="inc/_sidebar.jsp"%>

<!-- End Left menu area -->
<!-- Start Welcome area -->


<div class="all-content-wrapper">
    <%@include file="inc/_header.jsp"%>

    <div class="product-status mg-b-15">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="product-status-wrap">
                        <h4>Library List</h4>
                        <%
                            if (request.getParameter("msg") != null) {
                                if ("2".equals(request.getParameter("msg"))) {
                                    out.print("<span>Thêm thành công</span>");
                                } else if ("1".equals(request.getParameter("msg"))) {
                                    out.print("<span>Xóa thành công</span>");
                                }
                            }

                            if (request.getParameter("err") != null) {
                                if ("1".equals(request.getParameter("err"))) {
                                    out.print("<span>Xóa thất bại</span>");
                                }else if ("5".equals(request.getParameter("err"))) {
                                    out.print("<span style='color:red'>Không phải admin</span>");
                                }
                            }

                        %>
                        <div class="asset-inner">
                            <table>
                                <tr>
                                    <th>No</th>
                                    <th>Tên thể loại</th>

                                    <th>Chức năng</th>
                                </tr>

                                <%
                                    ArrayList<CategoryModel> list = (ArrayList<CategoryModel>) request.getAttribute("listCat");
                                    for (CategoryModel a : list) {
                                %>
                                <tr>
                                    <td><%=a.getId_cat()%>
                                    </td>
                                    <td><%=a.getName()%>
                                    </td>

                                    <td>
                                        <button data-toggle="tooltip" title="Edit" class="pd-setting-ed"><a
                                                href="<%=request.getContextPath()%>/admin/cat/edit?id=<%=a.getId_cat()%>"><i
                                                class="fa fa-pencil-square-o" aria-hidden="true"></i></a></button>
                                        <button data-toggle="tooltip" title="Trash" class="pd-setting-ed"><a
                                                href="<%=request.getContextPath()%>/admin/cat/del?id=<%=a.getId_cat()%>"><i class="fa fa-trash-o"
                                                                                          aria-hidden="true"></i></a>
                                        </button>
                                    </td>
                                </tr>
                                <% } %>

                            </table>
                        </div>
                        <div class="custom-pagination">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-copyright-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
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