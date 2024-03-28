<%@page import="com.entity.Design_Request"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.DesignRequestImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Requests</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<c:if test="${empty userobj}">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	

	<div class="container">
	<h4 class="text-center text-primary">Your Requests</h4>
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Request Id</th>
					<th scope="col">Name</th>
					<th scope="col">Design Name</th>
					<th scope="col">Designer</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
			
			<%
		User u=(User)session.getAttribute("userobj");
			DesignRequestImpl dao=new DesignRequestImpl(DBConnect.getConn());
			List<Design_Request> dlist=dao.getDesign(u.getEmail());
			
			
			for(Design_Request d:dlist)
			{%>
				<tr>
					<th scope="row"><%=d.getRequestId() %></th>
					<td><%=d.getUserName() %></td>
					<td><%=d.getDesignName() %></td>
					<td><%=d.getDesigner() %></td>
					<td><%=d.getPrice() %></td>
					<td><%=d.getPaymentType() %></td>
				</tr>
			<%}
			%>
				

			</tbody>
		</table>
	</div>
</body>
</html>