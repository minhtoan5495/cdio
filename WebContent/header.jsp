<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<header id="header"><!--header-->
	<div class="header_top">
		<!--header_top-->
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="contactinfo">
						<ul class="nav nav-pills">
							<li><a href="#"><i class="fa fa-phone"></i> +19001009</a></li>
							<li><a href="#"><i class="fa fa-envelope"></i>
									support@CDIO2.vn</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="social-icons pull-right">
						<ul class="nav navbar-nav">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header_top-->

	<div class="header-middle">
		<!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="logo pull-left">
						<a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<div>
							<ul class="nav navbar-nav">
								<li><a href="login.jsp"><i class="fa fa-lock"></i> Đăng
										kí/Đăng nhập</a></li>
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>
										Giỏ hàng</a></li>
							</ul>
						</div>
						<br />
						<div class="btn-group pull-right">
							<div class="btn-group">
									<%
										if (session.getAttribute("uname") != null) {
									%>
								<button type="button"
									class="btn btn-default dropdown-toggle usa"
									data-toggle="dropdown">
									Xin chào,
									<%=session.getAttribute("uname")%>
								</button>
								<br />
								<ul class="nav navbar-nav">
									<li><a href="UserLoginServlet?command=logout">Đăng
											xuất</a></li>
								</ul>
								<%
										}
									%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-middle-->
	<div class="header-bottom">
		<!--header-bottom-->
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<div class="mainmenu pull-left">
						<ul class="nav navbar-nav collapse navbar-collapse" class="active">
							<li><a href="index.jsp">Trang chủ</a></li>
							<li class="dropdown"><a href="#">Shop<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="pageproduct.jsp">Sản phẩm</a></li>
									<li><a href="cart.jsp">Giỏ hàng</a></li>
									<li><a href="checkout.jsp">Thanh toán</a></li>
									<li><a href="login.jsp">Tài khoản</a></li>
								</ul></li>
							<li><a href="huongdanmuahang.jsp">Hướng dẫn mua hàng</a></li>
							<li><a href="contact.jsp">Liên hệ</a></li>
							<li><a href="information.jsp">Thông tin cửa hàng</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-bottom--> </header>
	<!--/header-->

</body>
</html>