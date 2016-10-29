<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDAOImpl"%>
<%@page import="model.User"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<title>Quản lí thành viên</title>
</head>
<body>
	<%
	        String username_err="";
			if (request.getAttribute("username_err") != null) {
				username_err = (String) request.getAttribute("username_err");
			}
            UserDAOImpl userDAO = new UserDAOImpl();
            List<User> users= new ArrayList<User>();
            users = userDAO.getAll();
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
				Welcome Admin, <a href="UserLoginServlet?command=logout"
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
						<li class="active"><a href="#tab1">Danh sách User</a></li>
					</ul>


					<table id="rounded-corner">
						<thead>
							<tr>
								<th>ID</th>
								<th>Username</th>
								<th>Password</th>
								<th>Họ Tên</th>
								<th>Địa Chỉ</th>
								<th>SĐT</th>
								<th>Role</th>
								<th>Xóa</th>
								<th>Sửa</th>

							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="12"></td>
							</tr>
						</tfoot>

						<tbody>

							<% for(User user: users){%>
							<tr class="odd">
								<td><%= user.getUser_id() %></td>
								<td><%= user.getUsername() %></td>
								<td><%= user.getPassword() %></td>
								<td><%= user.getHo_ten() %></td>
								<td><%= user.getDia_chi() %></td>
								<td><%= user.getDien_thoai() %></td>
								<td><%= user.getRole() %></td>
								<td><a
									href="DeleteUserServlet?user_id=<%=user.getUser_id()%>"><img
										src="images/trash.gif" alt="" title="" border="0" /></a></td>
								<td><a
									href="quanliuser.jsp?user_id=<%=user.getUser_id()%>&username=<%= user.getUsername()%>&password=<%= user.getPassword() %>&dia_chi=<%= user.getDia_chi() %>&sdt=<%= user.getDien_thoai() %>&role=<%= user.getRole() %>&ho_ten=<%= user.getHo_ten() %>"><img
										src="images/edit.png" alt="" title="" border="0" /></a></td>
							</tr>
							<% } %>
						</tbody>
					</table>

					<ul id="tabsmenu" class="tabsmenu">
						<li class="active"><a href="#tab1">Sửa User</a></li>
					</ul>
					<div id="tab1" class="tabcontent">
						<form action="UpdateUserServlet" method="post" class="form">
							<input type="hidden" name="user_id"
								value="<%= request.getParameter("user_id") %>" />
							<div class="form_row">
								<label>Username</label> <input type="text" class="form_input"
									name="username" value="<%= request.getParameter("username") %>" />
							</div>
							<div class="form_row">
								<label>Password</label> <input type="text" class="form_input"
									name="password" value="<%= request.getParameter("password") %>" />
							</div>
							<div class="form_row">
								<label>Họ Tên</label> <input type="text" class="form_input"
									name="ho_ten" value="<%= request.getParameter("ho_ten") %>" />
							</div>
							<div class="form_row">
								<label>Địa Chỉ</label> <input type="text" class="form_input"
									name="dia_chi" value="<%= request.getParameter("dia_chi") %>" />
							</div>
							<div class="form_row">
								<label>SDT</label> <input type="text" class="form_input"
									name="sdt" value="<%= request.getParameter("sdt") %>" />
							</div>

							<div class="form_row">
								<label>Role</label> <input type="text" class="form_input"
									name="role" value="<%= request.getParameter("role") %>" />
							</div>

							<div class="form_row">
								<input type="submit" class="form_submit" value="Sửa" />
							</div>
							<div class="clear"></div>
						</form>
					</div>
					<ul id="tabsmenu" class="tabsmenu">
						<li class="active"><a href="#tab1">Thêm user</a></li>
					</ul>
					<div id="tab2" class="tabcontent">
						<div class="form">
							<form action="AddUserServlet" method="post">
								<div class="form_row">
									<label>Username:</label>
									<p style="color: red"><%=username_err%></p>
									<input type="text" class="form_input" name="username" />
								</div>
								<div class="form_row">
									<label>Password:</label>
									<p style="color: red"><%=username_err%></p>
									<input type="text" class="form_input" name="password" />
								</div>
								<div class="form_row">
									<label>Họ tên:</label>
									<p style="color: red"><%=username_err%></p>
									<input type="text" class="form_input" name="ho_ten" />
								</div>
								<div class="form_row">
									<label>Địa chỉ:</label>
									<p style="color: red"><%=username_err%></p>
									<input type="text" class="form_input" name="dia_chi" />
								</div>
								<div class="form_row">
									<label>SĐT:</label>
									<p style="color: red"><%=username_err%></p>
									<input type="text" class="form_input" name="sdt" />
								</div>
								<div class="form_row">
									<label>Role:</label>
									<p style="color: red"><%=username_err%></p>
									<input type="text" class="form_input" name="role" />
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
