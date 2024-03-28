<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Plans</title>
<%@include file="allCss.jsp" %>
</head>
<body >
	<%@include file="navbar.jsp" %>
	
	<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>

	<div class="container">
	<div class="row">
	<div class="col-md-4 offset-md-4 mt-4">
	<div class="card">
	<div class="card-body">
	<h4 class="text-center">Add Plans</h4>
	
	
	<c:if test="${not empty succMsg}">
<p class="text-center text-success">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg}">
<p class="text-center text-danger">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>


	<form action="../add_designs" method="post"
	enctype="multipart/form-data">
	
	<div class="form-group">
	<label for="exampleInputEmail1">Internet Plan*</label><input
	name="dname" type="text" class="form-control"
	id="exampleInputEmail1" aria-describedby="emailHelp">
	</div>
	<div class="form-group">
	<label for="exampleInputEmail1">Owner Name*</label>
	<input
	name="designer" type="text" class="form-control"
	id="exampleInputEmail1" aria-describedby="emailHelp">
	</div>
	
	<div class="form-group">
	<label for="exampleInputPassword1">Price*</label><input
	name="price" type="number" class="form-control"
	id="exampleInputPassword1" aria-describedby="emailHelp">
	</div>
	
	<div class="form-group">
	<label for="inputState">Plan Categories</label><select
	  id="inputState" name="categories" class="form-control">
	  <option selected>--select--</option>
	  <option value="New">New Plan</option>
	 
	  </select>
	</div>
	
	<div class="form-group">
	<label for="inputState">Plan Status</label><select
	  id="inputState" name="status" class="form-control">
	  <option selected>--select--</option>
	  <option value="Active">Active</option>
	  
	  </select>
	</div>
	
	<div class="form-group">
	<label for="exampleFormControlFile1">Upload Photo</label><input
	name="dimg" type="file" class="form-control-file"
	id="exampleFormControlFile1">
	</div>
	
	
	<button type="submit" class="btn btn-primary offset-md-5">Add</button>
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