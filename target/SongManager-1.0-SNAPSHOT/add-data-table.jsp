<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html class="no-js" lang="en">
<%@include file="inc/_style.jsp"%>

<body>
    <!--[if lt IE 8]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
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
                                <li class="active"><a href="#description">Library Assets</a></li>
                                
                            </ul>
                            <div id="myTabContent" class="tab-content custom-product-edit">
                                
                                <div class="product-tab-list tab-pane fade active in" id="INFORMATION">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="review-content-section">
												<div class="row">
													<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <form method="post" action="/admin/user/add">
														<div class="devit-card-custom">
															<div class="form-group" >
																<input type="text" class="form-control" placeholder="Nhập tên" name="name">
															</div>
                                                            <div class="form-group" >
                                                                <input type="text" class="form-control" placeholder="Nhập Password" name="pass">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" placeholder="Nhập email" name ="email">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="date" class="form-control" placeholder="Nhập ngày sinh" name ="birthday">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" placeholder="Nhập số diện thoại" name ="phone">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" placeholder="Nhập trạng thái" name ="action">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control"  name ="role">
                                                            </div>

                                                            <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
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
							<p>Copyright © 2018. All rights reserved. Template by <a href="https://colorlib.com/wp/templates/">Colorlib</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jquery
	<%@include file="inc/_footer.jsp"%>
</body>

</html>