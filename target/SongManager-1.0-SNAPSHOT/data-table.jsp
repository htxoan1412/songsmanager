<%@ page import="com.example.dao.impl.UserDao" %>
<%@ page import="com.example.model.UserModel" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html class="no-js" lang="en">


<%@include file="inc/_style.jsp" %>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
<!-- Start Left menu area -->
<%@include file="inc/_sidebar.jsp" %>

<!-- End Left menu area -->
<!-- Start Welcome area -->
<div class="all-content-wrapper">
    <%@include file="inc/_header.jsp"%>

    <!-- Static Table Start -->

    <div class="product-status mg-b-15">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="product-status-wrap">
                        <h4>Library List</h4>
                        <%
                            if (request.getParameter("msg") != null) {
                                if ("1".equals(request.getParameter("msg"))) {
                                    out.print("<span>Thêm thành công</span>");
                                } else if ("3".equals(request.getParameter("msg"))) {
                                    out.print("<span>Xóa thành công</span>");
                                }
                            }
                            if (request.getParameter("err") != null) {
                                if ("3".equals(request.getParameter("err"))) {
                                    out.print("<span>Xóa thất bại</span>");
                                }
                                if("6".equals(request.getParameter("err"))){
                                    out.print("<span>Bạn không có quyền sửa</span>");
                                }
                            }

                        %>
                        <div class="asset-inner">
                            <table>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Password</th>
                                    <th>Email</th>
                                    <th>Birthday</th>
                                    <th>Phone</th>
                                    <th>Trạng thái</th>
                                    <th>Role</th>
                                    <th>Chức năng</th>
                                </tr>
                                <%
                                    UserDao s = new UserDao();

                                    ArrayList<UserModel> list = (ArrayList<UserModel>) s.selUser();

                                    for (UserModel item : list) {
                                %>


                                <tr>

                                    <td>
                                        <%=item.getId()%>
                                    </td>
                                    <td>
                                        <%=item.getName()%>
                                    </td>
                                    <td>
                                        <%=item.getPassword()%>
                                    </td>
                                    <td>
                                        <%=item.getEmail()%>
                                    </td>
                                    <td>
                                        <%=item.getBirthday()%>
                                    </td>
                                    <td>
                                        <%=item.getPhone()%>
                                    </td>

                                    <% if ("1".equals(item.getAction())) {
                                    %>

                                    <td class="datatable-ct">
                                        <i class="fa fa-check" style="color:dodgerblue "></i>
                                    </td>
                                    <% } else { %>
                                    <td class="datatable-ct">
                                        <i class="fa fa-times" style="color: red"></i>
                                    </td>
                                    <% } %>
                                    <td>
                                        <%
//                                            if (item.getRole().equals("1")) out.print(1);
                                            if("1".equals(item.getRole())) out.print(1);
                                            else out.print(0);
                                        %>

                                    </td>
                                    <td>
                                        <button data-toggle="tooltip" title="Edit" class="pd-setting-ed"><a
                                                href="<%=request.getContextPath()%>/admin/user/edit?id=<%=item.getId()%>"><i class="fa fa-pencil-square-o"
                                                                                                                             aria-hidden="true"></i></a>
                                        </button>
                                        <button data-toggle="tooltip" title="Trash" class="pd-setting-ed"><a
                                                href="<%=request.getContextPath()%>/admin/user/del?id=<%=item.getId()%>"><i class="fa fa-trash-o"
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


    <!-- Static Table End -->
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
<%@include file="inc/_footer.jsp" %>
</body>

</html>