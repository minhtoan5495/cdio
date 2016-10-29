<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập | Đăng kí</title>
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
		String  username = "", err = "",
				username_err="",hoten="",sdt="",diachi="", password_err="";
		
		if (request.getAttribute("username_err") != null) {
			username_err = (String) request.getAttribute("username_err");
		}
		if (request.getAttribute("password_err") != null) {
			password_err = (String) request.getAttribute("password_err");
		}
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
	%>

<jsp:include page="header.jsp"></jsp:include>
<section id="form"><!--form-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-sm-offset-1">
				<div class="login-form">
					<!--login form-->
					<h2>Đăng nhập hệ thống</h2>
					<form action="UserLoginServlet" method="post">
						<p style="color: red"><%=err%></p>
						<input type="email" placeholder="Nhập địa chỉ Email ..."
							name="username" /> <input type="password"
							placeholder="Mật khẩu ..." name="password" />
						<button type="submit" class="btn btn-default">Đăng nhập</button>
					</form>
				</div>
				<!--/login form-->
			</div>
			<div class="col-sm-1">
				<h2 class="or">Hoặc</h2>
			</div>
			<div class="col-sm-4">
				<div class="signup-form">
					<!--sign up form-->
					<h2>Tạo tài khoản mới !</h2>
					<form action="UserRegisterServlet" method="post">
						<p style="color: red"><%=username_err%></p>
						<input type="email" placeholder="Email Address" name="username"
							value="<%=username%>" />
						<p style="color: red"><%=password_err%></p>
						<input type="password" placeholder="Password" name="password" />
						<input placeholder="Họ tên" name="ho_ten" value="<%=hoten%>" /> <input
							placeholder="Điện thoại" name="sdt" value="<%=sdt%>" /> <input
							placeholder="Địa chỉ" name="dia_chi" value="<%=diachi%>" />
						<button type="submit" class="btn btn-default">Đăng ký</button>
					</form>
				</div>
				<!--/sign up form-->
			</div>
		</div>
	</div>
	<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647;"><i class="fa fa-angle-up"></i></a>
</section><!--/form-->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>