<%@page import="model.ChiTietHoaDon"%>
<%@page import="dao.ChiTietHoaDonDAOImpl"%>
<%@page import="dao.HoaDonDAOImpl"%>
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
<title>Quản lí chi tiết</title>
</head>
<body>
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

		<div id="wrap">
			<div id="content">
				<ul id="tabsmenu" class="tabsmenu">
					<li class="active"><a href="#tab1">Danh sách mua</a></li>
				</ul>


				<table id="rounded-corner">
					<thead>
						<tr>
							<th>Mã chi tiết hóa đơn</th>
							<th>Mã hóa đơn</th>
							<th>Mã sản phẩm</th>
							<th>Số lượng</th>
							<th>Giá bán</th>
						</tr>
					</thead>
					<tfoot>
					</tfoot>
					<%
					    ChiTietHoaDonDAOImpl cthdDAO = new ChiTietHoaDonDAOImpl();
					    List<ChiTietHoaDon> list = new ArrayList<ChiTietHoaDon>();
					    String ma_hoa_don = request.getParameter("ma_hoa_don");
			    	%>
					<tbody>
						<% 
				    		for(ChiTietHoaDon p: cthdDAO.getListCTHDByMHD(Integer.parseInt(ma_hoa_don)) ){
				    	%>
						<tr class="odd">
							<td><%=p.getMa_chi_tiet_hd()%></td>
							<td><%=p.getMa_hoa_don()%></td>
							<td><%=p.getMa_san_pham()%></td>
							<td><%=p.getSo_luong()%></td>
							<td><%=Math.round(p.getGia_ban())%></td>
						</tr>
						<%} %>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="12"></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647;"><i class="fa fa-angle-up"></i></a>
</body>
</html>