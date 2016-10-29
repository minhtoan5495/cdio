<%@page import="java.util.List"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Product"%>
<%@page import="model.Cart"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ | CDIO2</title>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.js"></script>
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
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/main.js"></script>
</head>
<body>
<%
	ProductDAOImpl productDAO = new ProductDAOImpl();
	Cart cart = (Cart) session.getAttribute("cart");
	if (cart == null) {
		cart = new Cart();
		session.setAttribute("cart", cart);
	}
	List<Product> ds = productDAO.getListProduct();
	String page1="",page2="";
	int start=0,end;
	if(ds.size()<19){
		end=9;
	}else{
		end = ds.size();
	}
	if(request.getParameter("start")!=null){
		page1 = request.getParameter("start");
		start = Integer.parseInt(page1);
	}
	if(request.getParameter("end")!=null){
		page2 = request.getParameter("end");
		end = Integer.parseInt(page2);
	}
	List<Product> list = productDAO.getListProductByPagination(ds, start, end);
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="slider.jsp"></jsp:include>
<section>
	<div class="container">
		<div class="row">
			<jsp:include page="category.jsp"></jsp:include>
			<div class="col-sm-9 padding-right">
				<div class="features_items">
					<!--features_items-->
					<h2 class="title text-center">Sản phẩm</h2>
						<%
						for(Product p: list){
						%>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/detail/<%=p.getImage()%>" alt="" />
										<h2><%=Math.round(p.getPrice())%> VNĐ</h2>
										<p><%=p.getName()%></p>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<br/>
											<a
											href="detail.jsp?product_id=<%=p.getProduct_id()%>" class="btn btn-default add-to-cart"><i
												class="fa fa-plus-square"></i>Xem chi tiết</a>
											<a href="CartServlet?command=insertItem&product_id=<%=p.getProduct_id()%>&cartID=<%=System.currentTimeMillis()%>" 
											class="btn btn-default add-to-cart"><i 
											class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
											<h2><%=Math.round(p.getPrice())%> VNĐ</h2>								
										</div>
									</div>
								</div>
							</div>		
						</div>
						<%
						}
						%>												
				</div>
				<ul class="pagination">
					<%
						int a,b;
						int limit = ds.size()/9;
						if(limit *9 < ds.size()){
							limit +=1;
						}
						for(int i=1;i<=limit;i++){
							a = (i-1)*9;
							b=i*9;
							if(b>ds.size()){
								b=ds.size();
							}
					%>
						<li class="active"><a href="index.jsp?start=<%=a%>&end=<%=b%>"><%=i %></a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
	<p id="back-top">
			<a href="#top"><i class="fa fa-angle-up"></i></a>
	</p>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>