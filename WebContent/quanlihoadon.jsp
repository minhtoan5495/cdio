<%@page import="model.HoaDon"%>
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
<title>Quản lí hóa đơn</title>
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
					<li class="active"><a href="#tab1">Danh sách hóa đơn</a></li>
				</ul>


				<table id="rounded-corner">
					<thead>
						<tr>
							<th>ID</th>
							<th>Họ tên</th>
							<th>Địa chỉ</th>
							<th>Số điện thoại</th>
							<th>Ngày lập</th>
							<th>Xóa</th>
							<th></th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="12"></td>
						</tr>
					</tfoot>
					<%
				    	HoaDonDAOImpl hoadonDAO = new HoaDonDAOImpl();
				    	List<HoaDon> list = new ArrayList<HoaDon>();
				    	list = hoadonDAO.getListHD();
				    %>
					<tbody>
						<% for( HoaDon p: list ){%>
						<tr class="odd">
							<td><%=p.getMa_hoa_don()%></td>
							<td><%=p.getHo_ten()%></td>
							<td><%=p.getDia_chi()%></td>
							<td><%=p.getDien_thoai()%></td>
							<td><%=p.getNgay_lap()%></td>
							<td><a
								href="DeleteHoaDonServlet?ma_hoa_don=<%=p.getMa_hoa_don()%>"><img
									src="images/trash.gif" alt="" title="" border="0" /></a></td>
							<td><a
								href="quanlicthd.jsp?ma_hoa_don=<%=p.getMa_hoa_don()%>"
								>Xem</a></td>
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>
		</div>
		<!-- end of right content-->
		<div class="clear"></div>
	</div>
	<!--end of center_content-->
</body>
</html>