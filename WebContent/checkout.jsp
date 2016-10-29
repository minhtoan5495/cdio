<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="model.Cart"%> 
<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Xác nhận mua hàng | CDIO2</title>
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
		String hoten="",diachi="",dienthoai="";
		String hoten_err = "";
		if (request.getAttribute("ho_ten_err") != null) {
			hoten_err = (String) request.getAttribute("ho_ten_err");
		}
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		TreeMap<Product, Integer> list = cart.getListProduct();
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<section id="cart_items">
	<div class="container">
		<div class="shopper-informations">
			<div class="row">
				<div class="col-sm-5">
					<div class="shopper-info">
						<p>Thông tin giao hàng</p>
						<form action="CheckoutServlet" method="post">
							<p style="color: red"><%=hoten_err%></p>
							<input type="text" placeholder="Họ tên" name="ho_ten">
							<p style="color: red"><%=hoten_err%></p>
							<input type="text" placeholder="Địa chỉ giao hàng" name="dia_chi">
							<p style="color: red"><%=hoten_err%></p>
							<input type="text" placeholder="Điện thoại liên hệ"
								name="dien_thoai">
							<button type="submit" class="btn btn-primary" href="">Xác
								nhận</button>
						</form>

					</div>
				</div>
				<div class="col-sm-6">
					<div class="total_area">
						<div class="shopper-info">
							<ul>
								<p>Thông tin đơn hàng</p>
								<%
									double total =0;
									for (Map.Entry<Product, Integer> entry : list.entrySet()) {
										if(cart != null){
											total = total + entry.getValue() * entry.getKey().getPrice();
										}
									}
								%>

								<li>Tổng tiền hàng <span><%=Math.round(total)  %> VNĐ</span></li>
								<li>Phí vận chuyển <span>0 VNĐ</span></li>
								<li>Tổng cộng <span><%=Math.round(total)  %> VNĐ</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		</br>
		<div class="table-responsive cart_info">
			<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="image">Hình ảnh</td>
						<td class="description">Mô tả</td>
						<td class="price">Giá</td>
						<td class="quantity">Số lượng</td>
						<td class="total">Tổng</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<%
						for (Map.Entry<Product, Integer> entry : list.entrySet()) {
					%>
					<tr>
						<td class="cart_product"><a href=""><img
								src="images/detail/<%=entry.getKey().getImage() %>" alt=""></a>
						</td>
						<td class="cart_description">
							<h4>
								<a href=""><%=entry.getKey().getName()%></a>
							</h4>
							<p>
								Mã sản phẩm:
								<%=entry.getKey().getProduct_id()%></p>
						</td>
						<td class="cart_price">
							<p><%=Math.round(entry.getKey().getPrice())%></p>
						</td>
						<td class="cart_quantity">
							<div class="cart_quantity_button">
								<a class="cart_quantity_up"
									href="CartServlet?command=addItem&product_id=<%=entry.getKey().getProduct_id()%>&cartID=<%=System.currentTimeMillis()%>">
									+ </a> <input class="cart_quantity_input" type="text"
									name="quantity" value="<%=entry.getValue()%>"
									autocomplete="off" size="2" disabled="disabled"> <a
									class="cart_quantity_down"
									href="CartServlet?command=subItem&product_id=<%=entry.getKey().getProduct_id()%>&cartID=<%=System.currentTimeMillis()%>">
									- </a>
							</div>
						</td>
						<td class="cart_total">
							<p class="cart_total_price"><%=Math.round(entry.getValue() * entry.getKey().getPrice())%></p>
						</td>
						<td class="cart_delete"><a class="cart_quantity_delete"
							href="CartServlet?command=removeItem&product_id=<%=entry.getKey().getProduct_id()%>&cartID=<%=System.currentTimeMillis()%>"><i
								class="fa fa-times"></i></a></td>
					</tr>
					<%
						}
					%>
					<tr>

						<td><a class="btn btn-default update" href="index.jsp">Tiếp
								tục mua hàng</a>
						<td>
						<td><a class="btn btn-default update"
							href="CartServlet?command=cancelItem">Hủy đơn hàng</a>
						<td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647;"><i class="fa fa-angle-up"></i></a>
	</section>
	<!--/#cart_items-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>