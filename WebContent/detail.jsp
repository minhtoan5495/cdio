<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ChiTietHoaDonDAOImpl"%>
<%@page import="model.Cart"%>
<%@page import="dao.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chi tiết sản phẩm | CDIO2</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.css.map" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap.css.map" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</head>
<body>

	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=968001383268692";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	</script>
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=968001383268692";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	</script>

	<%
		ProductDAOImpl productDAO = new ProductDAOImpl();
		String product_id = request.getParameter("product_id");
		int msp = Integer.parseInt(product_id);
	%>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<jsp:include page="category.jsp"></jsp:include>
			<div class="col-sm-9 padding-right">
				<div class="product-details">
					<!--product-details-->
					<div class="col-sm-5">
						<div class="view-product">
							<div id="recommended-item-carousel" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner">
									<div class="item active">
										<div class="col-sm-12">
											<div class="product-image-wrapper">
												<div class="single-products">
													<div class="product text-center">
														<img
															src="images/detail/<%=productDAO.getProduct(msp).getImage()%>"
															alt="" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<a class="left detail-item-control"
									href="#recommended-item-carousel" data-slide="prev"> </a> <a
									class="right detail-item-control"
									href="#recommended-item-carousel" data-slide="next"> </a>
							</div>
						</div>
					</div>
					<div class="col-sm-5">
						<div class="product-information">
							<!--/product-information-->
							<img src="images/home/new.jpg" class="newarrival" alt="" />
							<h2><%=productDAO.getProduct(msp).getName()%></h2>
							<p>
								Mã sản phẩm:
								<%=product_id%></p>
							<span> <span><%=Math.round(productDAO.getProduct(msp).getPrice())%>
									VNĐ</span> <br />
							<a
								href="CartServlet?command=insertItem&product_id=<%=product_id%>&cartID=<%=System.currentTimeMillis()%>"
								class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
							</span>
							<p>
								<b>Tình trạng: <%=productDAO.getProduct(msp).getTinh_trang()%></b>
							</p>
							<div>
								<div class="fb-like" data-href="detail.jsp?p=<%=msp%>" 
								data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>
							</div>								
						</div>
						<!--/product-information-->
					</div>
				</div>
				<!--/product-details-->
			</div>
			<div></div>
			<div class="category-tab shop-details-tab">
				<!--category-tab-->
				<div class="col-sm-12">
					<ul class="nav nav-tabs">
						<li><a href="#facebook" data-toggle="tab">Comment Facebook</a></li>
					</ul>
				</div>
				<div class="tab-content">
					<div class="tab-pane fade active in" id="reviews">
						<div class="col-sm-12">
							<ul>
								<%
									Date date = new Date();
									DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									String stringDate = dateFormat.format(date);
									if (session.getAttribute("uname") != null) {
								%>
								<li><a href=""><i class="fa fa-user"></i><%=session.getAttribute("uname")%></a></li>
								<%
									}
								%>
								<li><a href=""><i class="fa fa-calendar-o"></i></a><%=stringDate%></li>								
							</ul>
							<div class="col-sm-12">
								<div class="fb-comments" data-href="details.jsp?p=<%=msp%>"
								 data-width="800" data-numposts="5"></div>
							</div>
						</div>
					</div>					
				</div>
			</div>
			<!--/category-tab-->

			<div class="recommended_items">
				<!--recommended_items-->
				<h2 class="title text-center">Sản phẩm cùng danh mục</h2>
				<div id="recommended-item-carousel" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="item active">
							<%
									int a = 0;
									for(Product list : productDAO.getListProductByCategory(productDAO.getProduct(msp).getCategory_id())){
										a++;
										if(a == 4) break;
								%>
							<div class="col-sm-4">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<img src="images/detail/<%=list.getImage() %>" alt="" />
											<h2><%= list.getName()%></h2>
											<h2><%= Math.round(list.getPrice())%>
												VNĐ
											</h2>
											<h2>
												<a href="detail.jsp?product_id=<%=list.getProduct_id()%>"
													class="btn btn-default add-to-cart">Xem</a> <a
													href="CartServlet?command=insertItem&product_id=<%=list.getProduct_id()%>&cartID=<%=System.currentTimeMillis()%>"
													class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
											</h2>
										</div>
									</div>
								</div>
							</div>
								<%
									}
								%>
						</div>
					</div>
				</div>
			</div>
			<!--/recommended_items-->
		</div>
	</div>
	<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647;"><i class="fa fa-angle-up"></i></a>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>