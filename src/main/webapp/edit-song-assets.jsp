<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.model.CategoryModel" %>
<%@ page import="com.example.model.SongModel" %>
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

    <!-- Single pro tab review Start-->
    <div class="single-pro-review-area mt-t-30 mg-b-15">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="product-payment-inner-st">
                        <ul id="myTabedu1" class="tab-review-design">
                            <li class="active"><a href="#description">Song Assets</a></li>
                        </ul>
                        <div id="myTabContent" class="tab-content custom-product-edit">
                            <div class="product-tab-list tab-pane fade active in" id="description">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="review-content-section">
                                            <%
                                                ArrayList<CategoryModel> cat = (ArrayList<CategoryModel>)request.getAttribute("categories");
                                            %>
                                            <div id="dropzone1" class="pro-ad addcoursepro">
                                                <form action="" enctype="multipart/form-data"
                                                      class="dropzone dropzone-custom needsclick addlibrary"
                                                      id="demo1-upload" method="post">
                                                    <div class="row">
                                                        <%
                                                            SongModel song = (SongModel)request.getAttribute("song");
                                                            if(song!=null){
                                                         %>


                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="form-group">
                                                                <input name="image" type="file" class="form-control"
                                                                       placeholder="Name">
                                                                <img src="<%=request.getContextPath()%>/img/<%=song.getImage()%>" alt="" style="width: 150px">
                                                            </div>
                                                            <div class="form-group">
                                                                <input name="name" type="text" class="form-control"
                                                                       placeholder="Name" value="<%=song.getName()%>">
                                                            </div>
                                                            <div class="form-group">
                                                                <input name="description" type="text"
                                                                       class="form-control" placeholder="description" value="<%=song.getDescription()%>">
                                                            </div>
                                                            <div class="form-group">
                                                                <input name="content" type="text" class="form-control"
                                                                       placeholder="Content" value="<%=song.getContent()%>">
                                                            </div>
                                                            <div class="form-group">
                                                                <%
                                                                    if (cat.size()>0){
                                                                %>
                                                                <select class="form-control" name="category" id="category">
                                                                    <%
                                                                        for (CategoryModel item:cat){

                                                                            if(item.getId_cat()== song.getId_cat()){
                                                                    %>
                                                                    <option value="<%=item.getId_cat()%>" selected><%=item.getName()%></option>
                                                                    <%
                                                                            }else {
                                                                    %>

                                                                    <option value="<%=item.getId_cat()%>"><%=item.getName()%></option>
                                                                    <%
                                                                            }
                                                                        }
                                                                    %>
                                                                </select>
                                                                <%
                                                                    }
                                                                %>
                                                            </div>


                                                        </div>
                                                        <%
                                                            }
                                                        %>

                                                    </div>


                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="payment-adress">
                                                                <button type="submit"
                                                                        class="btn btn-primary waves-effect waves-light">
                                                                    Submit
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
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
<div class="footer-copyright-area">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="footer-copy-right">
                    <p>Copyright © 2018. All rights reserved. Template by <a href="https://colorlib.com/wp/templates/">Colorlib</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="inc/_footer.jsp"%>
</body>

</html>