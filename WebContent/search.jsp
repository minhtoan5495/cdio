<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sản phẩm | CDIO2</title>
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
	<%
		ProductDAOImpl productDAO = new ProductDAOImpl();
		String category_id = request.getParameter("category_id");
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
%>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<jsp:include page="category.jsp"></jsp:include>
			<div class="col-sm-9 padding-right">
				<div class="features_items">
					<!--features_items-->
					<%
					if (category_id == null) {
						for (Product p : productDAO.getListProduct()) {
					%>
					<div class="col-sm-4">
						<div class="product-image-wrapper">
							<div class="single-products">
								<div class="productinfo text-center">
									<img src="images/detail/<%=p.getImage()%>" alt="" />
									<h2><%=p.getPrice()%></h2>
									<p><%=p.getName()%></p>
								</div>
								<div class="product-overlay">
									<div class="overlay-content">
										<br />
										<h2>
											<a href="detail.jsp?product_id=<%=p.getProduct_id()%>"
												class="btn btn-default add-to-cart"><i
												class="fa fa-plus-square"></i>Xem chi tiết</a>
											</li> <br />
										</h2>
										<a
											href="CartServlet?command=insertItem&product_id=<%=p.getProduct_id()%>&cartID=<%=System.currentTimeMillis()%>"
											class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
										<h2><%=p.getPrice()%></h2>
										<p><%=p.getName()%></p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
							}
						} else {
							for (Product sp : productDAO.getListProductByCategory(Integer
								.parseInt(category_id))) {
					%>
					<div class="col-sm-4">
						<div class="product-image-wrapper">
							<div class="single-products">
								<div class="productinfo text-center">
									<img src="images/detail/<%=sp.getImage() %>" alt="" />
									<h2><%=sp.getPrice()%></h2>
									<p><%=sp.getName()%></p>
								</div>
								<div class="product-overlay">
									<div class="overlay-content">
										<br />
										<h2>
											<a href="detail.jsp?product_id=<%=sp.getProduct_id()%>"
												class="btn btn-default add-to-cart"><i
												class="fa fa-plus-square"></i>Xem chi tiết</a>
											</li> <br />
										</h2>
										<a
											href="CartServlet?command=insertItem&product_id=<%=sp.getProduct_id()%>&cartID=<%=System.currentTimeMillis()%>"
											class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
										<h2><%=sp.getPrice()%></h2>
										<p><%=sp.getName()%></p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
								}
							}
						%>

				</div>
				<!--features_items-->
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>