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
<title>Quản lí hóa đơn</title>
<link href="css/admin.css" rel="stylesheet">
</head>
<%	
		ProductDAOImpl productDAO = new ProductDAOImpl();
		String product_id = request.getParameter("product_id");
		int msp = Integer.parseInt(product_id);
	%>
<body>
	<img src="images/detail/<%= productDAO.getProduct(msp).getImage()%>">
</body>
</html>