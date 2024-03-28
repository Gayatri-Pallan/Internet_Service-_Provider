<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Interior Designs:Registration</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body>

<div class="container p-5 ml-2">
<div class="row">
<div class="col-md-8 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center text-black"style="margin-bottom:5vh;">Registration</h4>
	
<c:if test="${not empty succMsg }">
<p class="text-center text-success"> ${succMsg }</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
<p class="text-center text-danger"> ${failedMsg }</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>

<form action="register" method="post">
 <div class="form-group">
    <label for="exampleInputEmail1">Enter Full Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" pattern="[A-Za-z ]{1,32}"  required="required" name="fname">
  </div>

  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required="required" name="email">
  </div>
   <div class="form-group">
    <label for="exampleInputEmail1">Phone No</label>
    <input type="text	" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"  maxlength="10" pattern="[6789][0-9]{9}" title="Enter Number Only" required="required" name="phno">
  
     <!--  <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"  maxlength = "10" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required="required" name="phno">-->
  
  
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
  </div>
  <div class="form-check p-2">
    <input type="checkbox" class="form-check-input" name="check" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms & Conditions</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>