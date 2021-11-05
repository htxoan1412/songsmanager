<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="left-sidebar-pro">
  <nav id="sidebar" class="">
    <div class="sidebar-header">
      <a href="index.html"><img class="main-logo" src="<%=request.getContextPath()%>/img/logo/logo.png" alt=""/></a>
      <strong><a href="index.html"><img src="<%=request.getContextPath()%>/img/logo/logosn.png" alt=""/></a></strong>
    </div>
    <div class="left-custom-menu-adp-wrap comment-scrollbar">
      <nav class="sidebar-nav left-sidebar-menu-pro">
        <%
          HttpSession session1= request.getSession();
          UserModel userLogin = (UserModel)session1.getAttribute("userLogin");
        %>
        <ul class="metismenu" id="menu1">
          <li>
            <a class="has-arrow" href="all-courses.html" aria-expanded="false"><span
                    class="educate-icon educate-library icon-wrap"></span> <span
                    class="mini-click-non">Bài hát</span></a>
            <ul class="submenu-angle" aria-expanded="false">
              <li><a title="All Library" href="<%=request.getContextPath()%>/admin/songs"><span
                      class="mini-sub-pro">Xem</span></a></li>
              <li><a title="Add Library" href="<%=request.getContextPath()%>/admin/song/add"><span class="mini-sub-pro">Thêm mới</span></a>
              </li>

            </ul>
          </li>
          <li>
            <a class="has-arrow" href="all-courses.html" aria-expanded="false"><span
                    class="educate-icon educate-library icon-wrap"></span> <span class="mini-click-non">Danh mục</span></a>
            <ul class="submenu-angle" aria-expanded="false">
              <li><a title="All Library" href="<%=request.getContextPath()%>/admin/cats"><span class="mini-sub-pro">Xem</span></a>
              </li>
              <%
                if (userLogin.getRole().equals("1")){
              %>
              <li><a title="Add Library" href="<%=request.getContextPath()%>/admin/cat/add"><span class="mini-sub-pro">Thêm</span></a>
              </li>
              <%
                }
              %>
            </ul>
          </li>

          <li class="active">
            <a class="has-arrow" href="mailbox.html" aria-expanded="false"><span
                    class="educate-icon educate-data-table icon-wrap"></span> <span class="mini-click-non">Tài khoản</span></a>
            <ul class="submenu-angle" aria-expanded="false">
              <li><a title="Data Table" href="<%=request.getContextPath()%>/data-table.jsp"><span class="mini-sub-pro">Xem</span></a>
              </li>
              <li><a title="Data Table" href="<%=request.getContextPath()%>/add-data-table.jsp"><span class="mini-sub-pro">Thêm mới </span></a>
              </li>
            </ul>
          </li>


        </ul>
      </nav>
    </div>
  </nav>
</div>
