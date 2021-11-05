<%@ page import="com.example.model.SongModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.dao.impl.SongDao" %>
<%@ page import="com.example.model.AbstractModel" %>
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
    <%@include file="inc/_header.jsp" %>

    <div class="product-status mg-b-15">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="product-status-wrap">
                        <h4>Library List</h4>

                        <!-- Search form -->
                        <form action="<%=request.getContextPath()%>/admin/song/search" method="get">
                            <div class="input-group">
                                <div class="form-outline" style="display: inline-block">
                                    <input id="search-input" type="text" id="form1" class="form-control" name="txtname"
                                           value="${txtname}"/>
                                </div>
                                <button type="submit"
                                        style="display: inline-block;margin-bottom: 25px;margin-left: 20px"
                                        class="btn btn-primary waves-effect waves-light">
                                    Search
                                </button>
                            </div>
                        </form>


                        <%
                            if (request.getParameter("msg") != null) {
                                if ("1".equals(request.getParameter("msg"))) {
                                    out.print("<span>Thêm thành công</span>");
                                } else if ("2".equals(request.getParameter("msg"))) {
                                    out.print("<span>Xóa thành công</span>");
                                }
                            }
                            if (request.getParameter("err") != null) {
                                if ("2".equals(request.getParameter("err"))) {
                                    out.print("<span>Xóa thất bại</span>");
                                }
                            }

                        %>

                        <div class="asset-inner">
                            <table>
                                <tr>
                                    <th>No</th>
                                    <th>Ảnh <i class="fas fa-sort"></i></th>
                                    <th>Tên bài hát

                                        <%
                                            AbstractModel action =(AbstractModel)request.getAttribute("songs");
                                            if(action.getSortBy().equals("desc")&&action.getSortName().equals("name")){
                                        %>
                                        <a href="<%=request.getContextPath()%>/admin/songs?page=${songs.page}&maxPageItem=${songs.maxPageItem}&sortName=name&sortBy=asc">
                                            <i class="fas fa-sort"></i>
                                        </a>
                                        <% } else {%>
                                        <a

                                                href="<%=request.getContextPath()%>/admin/songs?page=${songs.page}&maxPageItem=${songs.maxPageItem}&sortName=name&sortBy=desc">

                                            <i class="fas fa-sort"></i>
                                        </a>
                                        <% } %>
                                    </th>
                                    <th>Miêu tả
                                    </th>
                                    <th>Nội dung</th>
                                    <th>Ngày tạo</th>
                                    <th>Lượt nghe</th>
                                    <th>Thể loại</th>
                                    <th>Chức năng</th>
                                </tr>
                                <%
                                    ArrayList<SongModel> list;

                                    if (request.getAttribute("listSong") != null) {
                                        list = (ArrayList) request.getAttribute("listSong");
                                    } else {
                                        list = (ArrayList<SongModel>) new SongDao().selSong(null, null);
                                    }
                                    for (SongModel item : list) {
                                %>

                                <tr>

                                    <td>
                                        <%=item.getId()%>
                                    </td>
                                    <td>
                                        <img src="<%=request.getContextPath()%>/img/<%=item.getImage()%>" alt="">
                                    </td>
                                    <td>
                                        <%=item.getName()%>
                                    </td>
                                    <td>
                                        <%=item.getDescription()%>
                                    </td>

                                    <td>
                                        <%=item.getContent()%>
                                    </td>
                                    <td>
                                        <%=item.getDate_create()%>
                                    </td>
                                    <td>
                                        <%=item.getListens()%>
                                    </td>
                                    <td>
                                        <%=item.getCat().getName()%>
                                    </td>

                                    <td>
                                        <button data-toggle="tooltip" title="Edit" class="pd-setting-ed"><a
                                                href="<%=request.getContextPath()%>/admin/song/edit?id=<%=item.getId()%>"><i
                                                class="fa fa-pencil-square-o"
                                                aria-hidden="true"></i></a>
                                        </button>
                                        <button data-toggle="tooltip" title="Trash" class="pd-setting-ed"><a
                                                href="<%=request.getContextPath()%>/admin/song/del?id=<%=item.getId()%>">
                                            <i class="fa fa-trash-o"
                                               aria-hidden="true"></i>
                                        </a>
                                        </button>
                                    </td>
                                </tr>
                                <% } %>


                            </table>
                        </div>
                        <form id="formSubmit" action="<%=request.getContextPath()%>/admin/songs" method="get">
                            <div class="custom-pagination">
                                <ul class="pagination" id="pagination"></ul>
                                <input type="hidden" value="" id="page" name="page">
                                <input type="hidden" value="" id="maxPageItem" name="maxPageItem">
                                <input type="hidden" value="" id="sortName" name="sortName">
                                <input type="hidden" value="" id="sortBy" name="sortBy">
                            </div>
                        </form>

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
<script type="text/javascript">
    var totalPage = ${songs.totalPage};
    var currentPage =${songs.page}
    var limit = ${songs.maxPageItem};
    var sortName = "${songs.sortName}";
    var sortBy = "${songs.sortBy}";

    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 3,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#page').val(page);
                    $('#maxPageItem').val(limit);
                    $('#sortName').val(sortName);
                    $('#sortBy').val(sortBy);
                    $('#formSubmit').submit();
                }
            }
        });
    });
</script>
<%@include file="inc/_footer.jsp" %>
</body>

</html>