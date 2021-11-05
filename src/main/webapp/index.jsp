<%@ page import="com.example.model.SongModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.dao.impl.SongDao" %>
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
  <%--    <div class="container-fluid">--%>
  <%--        <div class="row">--%>
  <%--            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
  <%--                <div class="logo-pro">--%>
  <%--                    <a href="index.html"><img class="main-logo" src="<%=request.getContextPath()%>/img/logo/logo.png" alt=""/></a>--%>
  <%--                    <p style="float: right;line-height: 50px;font-size: 20px ;margin-right: 40px"><a>Logout</a></p>--%>
  <%--                    <p style="float: right;line-height: 50px;font-size: 20px ;margin-right: 40px"><a>Login</a></p>--%>
  <%--                    --%>
  <%--                </div>--%>
  <%--            </div>--%>
  <%--        </div>--%>
  <%--    </div>--%>

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
                  <th>Ảnh</th>
                  <th>Tên bài hát</th>
                  <th>Miêu tả</th>
                  <th>Nội dung</th>
                  <th>Ngày tạo</th>
                  <th>Lượt nghe</th>
                  <th>Thể loại</th>
                  <th>Chức năng</th>
                </tr>
                <%
                  SongDao s = new SongDao();
                  ArrayList<SongModel> list = (ArrayList<SongModel>) s.selSong();
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
                            href="<%=request.getContextPath()%>/admin/song/edit?id=<%=item.getId()%>"><i class="fa fa-pencil-square-o"
                                                                                                         aria-hidden="true"></i></a>
                    </button>
                    <button data-toggle="tooltip" title="Trash" class="pd-setting-ed"><a
                            href="<%=request.getContextPath()%>/admin/song/del?id=<%=item.getId()%>"><i class="fa fa-trash-o"
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