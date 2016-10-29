<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page import="model.Category"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<link href="css/admin.css" rel="stylesheet">
<title>Quản lí sản phẩm</title>
</head>
<body>
	<%
            ProductDAOImpl productDAO = new ProductDAOImpl();
            List <Product> listProduct = productDAO.getListProduct();
    		CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
    		String description_err = "";
    		
    		if (request.getAttribute("description_err") != null) {
    			description_err = (String) request.getAttribute("description_err");
    		}
    	%>
	<div id="panelwrap">
		<div class="header">
			<div class="title">
				<a href="#">Admin</a>
			</div>
			<div class="header_right">
				<a href="index.jsp">Home</a>
			</div>
			<div class="header_right">
				Welcome Admin,<a href="UserLoginServlet?command=logout"
					class="logout">Logout</a>
			</div>

			<div class="menu">
				<ul>
					<li><a href="quanliuser.jsp" class="selected">Main page</a></li>
				</ul>
			</div>

		</div>

		<div class="submenu">
			<ul>
				<li><a href="quanliuser.jsp">Users</a></li>
				<li><a href="quanliproduct.jsp">Product</a></li>
				<li><a href="quanlicategory.jsp">Category</a></li>
				<li><a href="quanlihoadon.jsp">HoaDon</a></li>
			</ul>
		</div>

		<div class="center_content">

			<div id="wrap">
				<div id="content">
					<ul id="tabsmenu" class="tabsmenu">
						<li class="active"><a href="#tab1">Danh sách sản phẩm</a></li>
					</ul>

					<table id="rounded-corner">
						<thead>
							<tr>
								<th>Id_Product</th>
								<th>Id_Category</th>
								<th>Tên</th>
								<th>Miêu tả</th>
								<th>Giá</th>
								<th>Ngày nhập</th>
								<th>Tình trạng</th>
								<th>Xóa</th>
								<th>Hình</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="12"></td>
							</tr>
						</tfoot>
						<% 
							for(Product product : listProduct){ 
                		%>
						<tr class="odd">
							<td><%= product.getProduct_id() %></td>
							<td><%= product.getCategory_id() %></td>
							<td><%= product.getName() %></td>
							<td><%= product.getDescription() %></td>
							<td><%= Math.round(product.getPrice())%></td>
							<td><%= product.getNgay_nhap()%></td>
							<td><%= product.getTinh_trang()%></td>
							<td><a
								href="DeleteProductServlet?product_id=<%=product.getProduct_id()%>"><img
									src="images/trash.gif" alt="" title="" border="0" /></a></td>
							<td><a
								href="image.jsp?product_id=<%=product.getProduct_id()%>"
								><i></i>Xem</a></td>
						</tr>
						<% } %>
					</table>
					<ul id="tabsmenu" class="tabsmenu">
						<li class="active"><a href="#tab1">Thêm sản phẩm</a></li>
					</ul>
					<div id="tab1" class="tabcontent">
						<form action="AddProductServlet" method="POST" class="form"
							enctype="multipart/form-data">
							<div class="form_row">
								<label>Loại sản phẩm</label> <br>
								<p style="color: red"><%=description_err%></p>
								<%
									for (Category list : categoryDAO.getCategoryChildren()) {
								%>
								<input type="radio" name="category_id"
									value="<%=list.getCategory_id()%>">
								<%=list.getCategory_id()%>(<%=list.getName() %>)
								<%
									}
			                	%>
							</div>
							<div class="form_row">
								<label>Tên</label> <input type="text" class="form_input"
									name="name" />
							</div>
							<div class="form_row">
								<label>Miêu tả</label>
								<p style="color: red"><%=description_err%></p>
								<textarea class="form_textarea" name="description"></textarea>
							</div>
							<div class="form_row">
								<label>Hình</label>
								<p style="color: red"><%=description_err%></p>
								<input type="file" name="photo" />
							</div>
							<div class="form_row">
								<label>Giá</label>
								<p style="color: red"><%=description_err%></p>
								<input type="text" class="form_input" name="price" />
							</div>
							<div class="form_row">
								<label>Tình trạng</label>
								<p style="color: red"><%=description_err%></p>
								<input type="text" class="form_input" name="tinh_trang" />
							</div>
							<div class="form_row">
								<input type="submit" class="form_submit" value="Thêm" />
							</div>
							<div class="clear"></div>
						</form>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>