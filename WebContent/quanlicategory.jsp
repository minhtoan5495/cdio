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
<title>Quản lí loại sản phẩm</title>
</head>
<body>
	<%
		String parent_err = "";
		
		if (request.getAttribute("parent_err") != null) {
			parent_err = (String) request.getAttribute("parent_err");
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
						<li class="active"><a href="#tab1">Danh sách loại hàng</a></li>
					</ul>


					<table id="rounded-corner">
						<thead>
							<tr>
								<th></th>
								<th>ID</th>
								<th>Tên loại sản phẩm</th>
								<th>Parent</th>
								<th>Sửa</th>
								<th>Xóa</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="12"></td>
							</tr>
						</tfoot>
						<%
							CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
						    List<Category> list= new ArrayList<Category>();
						    list = categoryDAO.getCategory();
					    %>
						<tbody>
							<% for( Category c: list ){%>
							<tr class="odd">
								<td></td>
								<td><%=c.getCategory_id()%></td>
								<td><%=c.getName()%></td>
								<td><%=c.getParent()%></td>
								<td><a
									href="quanlicategory.jsp?category_id=<%=c.getCategory_id()%>&category=<%=c.getName()%>&parent=<%=c.getParent()%>"><img
										src="images/edit.png" alt="" title="" border="0" /></a></td>
								<td><a
									href="DeleteCategoryServlet?category_id=<%=c.getCategory_id()%>"><img
										src="images/trash.gif" alt="" title="Hoàn tất" border="0" /></a></td>

							</tr>
							<%} %>
						</tbody>
					</table>
					<ul id="tabsmenu" class="tabsmenu">
						<li class="active"><a href="#tab2">Sửa loại sản phẩm</a></li>
					</ul>
					<div id="tab2" class="tabcontent">
						<div class="form">
							<form action="UpdateCategoryServlet" method="POST" class="form">
								<input type="hidden" name="category_id"
									value="<%= request.getParameter("category_id") %>" />
								<div class="form_row">
									<label>Tên loại:</label>
									<p style="color: red"><%=parent_err%></p>
									<input type="text" class="form_input" name="category"
										value="<%= request.getParameter("category") %>" />
								</div>
								<div class="form_row">
									<label>Parent:</label>
									<p style="color: red"><%=parent_err%></p>
									<input type="text" class="form_input" name="parent"
										value="<%= request.getParameter("parent") %>" />
								</div>
								<div class="form_row">
									<input type="submit" class="form_submit" value="Lưu" />
								</div>
							</form>
							<div class="clear"></div>
						</div>
					</div>
					<ul id="tabsmenu" class="tabsmenu">
						<li class="active"><a href="#tab1">Thêm loại sản phẩm mới</a></li>
					</ul>
					<div id="tab1" class="tabcontent">


						<div class="form">
							<form action="AddCategoryServlet" method="post">
								<div class="form_row">
									<label>Tên loại:</label>
									<p style="color: red"><%=parent_err%></p>
									<input type="text" class="form_input" name="category" />
								</div>
								<div class="form_row">
									<label>Parent:</label>
									<p style="color: red"><%=parent_err%></p>
									<input type="text" class="form_input" name="parent" />
								</div>
								<div class="form_row">
									<input type="submit" class="form_submit" value="Thêm" />
								</div>
								<div class="clear"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- end of right content-->
			<div class="clear"></div>
		</div>
	</div>
	<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647;"><i class="fa fa-angle-up"></i></a>
</body>
</html>