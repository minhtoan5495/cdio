<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liên hệ | CDIO2</title>
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
<jsp:include page="header.jsp"></jsp:include>
<section>
	<div class="container">
		<div class="row">

			<div id="contact-page" class="container">
				<div class="bg">
					<div class="row">
						<div class="col-sm-12">
							<h2 class="title text-center">Liên hệ với chúng tôi</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-8">
							<div class="contact-form">
								<h2 class="title text-center">Gửi mail</h2>
								<div class="status alert alert-success" style="display: none"></div>
								<form  method="post" action= "SendMail" id="main-contact-form" 
									class="contact-form row"
									name="contact-form" >
									<div class="form-group col-md-6">
										<input type="text" name="name" class="form-control"
											required="required" placeholder="Tên">
									</div>
									<div class="form-group col-md-6">
										<input type="email" name="email" class="form-control"
											required="required" placeholder="Email">
									</div>
									<div class="form-group col-md-12">
										<input type="text" name="subject" class="form-control"
											required="required" placeholder="Chủ đề">
									</div>
									<div class="form-group col-md-12">
										<textarea name="text" id="message" required="required"
											class="form-control" rows="8"
											placeholder="Viết tin nhắn của bạn"></textarea>
									</div>
									<div class="form-group col-md-12">
										<input type="submit" name="submit"
											class="btn btn-primary pull-right" value = "Submit">
									</div>
								</form>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="contact-info">
								<h2 class="title text-center">Thông tin liên lạc</h2>
								<address>
									<p>CDIO Inc.</p>
									<p>K7/25 Quang Trung, Quận Hải Châu, Đà Nẵng, VN</p>
									<p>Mobile: 19001009</p>
									<p>Fax: 1-714-252-0026</p>
									<p>Email: info@CDIO.com</p>
								</address>
								<div class="social-networks">
									<h2 class="title text-center">Mạng xã hội</h2>
									<ul>
										<li><a href="#"><i class="fa fa-facebook"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
										<li><a href="#"><i class="fa fa-youtube"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/#contact-page-->
		</div>
	</div>
	<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647;"><i class="fa fa-angle-up"></i></a>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>