<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Interior Design: cart</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	
	
	<c:if test="${empty userobj}">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<c:if test="${not empty succMsg}">
	<div class="alert alert-success" role="alert">${succMsg }</div>
	<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty failedMsg}">
	<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
	<c:remove var="failedMsg" scope="session"/>
	</c:if>
	
	
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-warning text-center">Cart</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Plan Name</th>
									<th scope="col">Owner</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
							
						<%
                             User u=(User)session.getAttribute("userobj");
							CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
							List<Cart> cart=dao.getDesigByUser(u.getId());
							
							Double totalPrice=0.00;
							for(Cart c:cart){
								totalPrice=c.getTotalPrice();
							%>
								<tr>
									<th scope="row"><%=c.getDesignname() %></th>
									<td><%=c.getDesigner() %></td>
									<td><%=c.getPrice() %></td>
									<td>
									<a href="remove_design?designId=<%=c.getDesignId() %>&&id=<%=c.getUserId() %>&&cid=<%=c.getCid() %>" class="btn btn-sm btn-danger">Remove</a>
									
									</td>
								</tr>
								<%}
							%>
							
							<tr>
							<td>Total Price</td>
							<td></td>
							<td></td>
							<td><%=totalPrice %></td>
							</tr>
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
					<img alt="" src="Images/Payment.jpg"
							style="width: 300px; height: 200px" class="-thumblin">
					</div>
					</div>
					</div>
					
					<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						
						
						<form action="request" method="post">
						<input type="hidden" value="${userobj.id}" name="id">
						
						
						
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text" name="username"
										class="form-control" id="inputEmail4" value="${userobj.name}" pattern="[A-Za-z ]{1,32}"  required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email" name="email"
									class="form-control" id="inputPassword4" value="${userobj.email}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input type="text" name="phno"
										class="form-control" id="inputEmail4" value="${userobj.phno}" maxlength="10" pattern="[6789][0-9]{9}" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text" name="address"
									class="form-control" id="inputPassword4" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"  name="landmark"
										class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text" name="city"
									class="form-control" id="inputPassword4" required>
								</div>	
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"  name="state"
										class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pincode</label> <input type="number"  name="pincode"
									class="form-control" id="inputPassword4" required>
								</div>
							</div>
							<div class="form-group">
							<label>Payment Mode</label>
							<select class="form-control" name="payment">
							<option value="noselect">--Select--</option>
							<option  value="COD">Online</option>
							</select>
							</div>
							
							<div class="text-center">
							<button class="btn btn-warning">Click here after paying</button>
							</div>
						</form>
					</div>
</div>
		</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>