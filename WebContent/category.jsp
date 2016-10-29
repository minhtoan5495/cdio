<%@page import="dao.CategoryDAOImpl"%> 
<%@page import="model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
	%>

	<div class="col-sm-3">
		<div class="left-sidebar">
			<h2>Danh mục</h2>
			<div class="panel-group category-products" id="accordian">
				<!--category-productsr-->
				<%
					for (Category list : categoryDAO.getCategoryByParent()) {
				%>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a> <%=list.getName()%>
							</a>
						</h4>
					</div>
					<%
						if (categoryDAO.getCategoryByChildren(list.getCategory_id())
									.size() > 0) {
					%>
					<div class="panel-body">
						<ul>
							<%
								for (Category c2 : categoryDAO.getCategoryByChildren(list
												.getCategory_id())) {
							%>
							<li><a
								href="pageproduct.jsp?category_id=<%=c2.getCategory_id()%>"><%=c2.getName()%>
							</a></li>
							<%
								}
							%>
						</ul>
					</div>
					<%
						}
					%>
				</div>
				<%
					}
				%>
			</div>
			<!--/category-products-->



			<div class="shipping text-center">
				<!--shipping-->
				<img src="images/home/khuyenmai.jpg" alt="" /> <img
					src="images/home/shipping.jpg" alt="" />
			</div>
			<!--/shipping-->

		</div>
	</div>

</body>
</html>