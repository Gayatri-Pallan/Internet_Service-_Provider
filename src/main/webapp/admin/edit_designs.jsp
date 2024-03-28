<%@page import="java.awt.ActiveEvent"%>
<%@page import="com.entity.DesignDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.DesignDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Designs</title>
<%@include file="allCss.jsp" %>
</head>
<body style="background-color:#dbd1d0;">
	<%@include file="navbar.jsp" %>
	<div class="container">
	<div class="row">
	<div class="col-md-4 offset-md-4 mt-4">
	<div class="card">
	<div class="card-body">
	<h4 class="text-center">Edit Designs</h4>
	
<%
int id=Integer.parseInt(request.getParameter("id"));
DesignDAOImpl dao=new DesignDAOImpl(DBConnect.getConn());
DesignDtls d=dao.getDesignById(id);
%>

	<form action="../editdesigns" method="post">
	<input type="hidden" name="id" value="<%=d.getDesignId()%>">
	<div class="form-group">
	<label for="exampleInputEmail1">Design Name*</label><input
	name="dname" type="text" class="form-control"
	id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=d.getDesignName()%>">
	</div>
	<div class="form-group">
	<label for="exampleInputEmail1">Designer Name*</label><input
	name="designer" type="text" class="form-control"
	id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=d.getDesigner()%>">
	</div>
	
	<div class="form-group">
	<label for="exampleInputPassword1">Price*</label><input
	name="price" type="number" class="form-control"
	id="exampleInputPassword1" aria-describedby="emailHelp" value="<%=d.getPrice()%>">
	</div>
	
	
	
	<div class="form-group">
	<label for="inputState">Design Status</label><select
	  id="inputState" name="status" class="form-control">
<% 
if("Active".equals(d.getStatus())){
%>
    <option value="Active">Active</option>
	<option value="Inactive">Inactive</option>
	<% 
	}else{
	%>
	<option value="Inactive">Inactive</option>
	<option value="Active">Active</option>
    <%
		}
	%>
 </select>
	</div>
	<button type="submit" class="btn btn-primary offset-md-5">Update</button>
	</form>
	
	</div>
	</div>
	</div>
	</div>
	</div>
	<div style="margin-top:100px;">

</div>
</body>
</html>