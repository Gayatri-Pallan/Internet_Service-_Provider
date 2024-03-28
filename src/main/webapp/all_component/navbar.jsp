<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false"%>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-8 ">
			<h3>
				<i class="fa-solid fa-wifi pr-2"></i>Internet Service Provider
			</h3>
		</div>
		
		
		
		<c:if test="${not empty userobj}">
		<div class="col-md-3">
		
		<a href="checkout.jsp"><i class="fa-solid fa-cart-plus fa-2x"></i></a>
			<a href="login.jsp" class="btn btn-success ml-2"><i
				class="fa-solid fa-user-plus pr-1"></i>${userobj.name}</a>
				 <a href="login.jsp" class="btn btn-primary"><i
				class="fa-solid fa-right-to-bracket pr-1"></i>Logout</a>
				
		</div>
		</c:if>
		
		<c:if test="${empty userobj}">
		<div class="col-md-3">
			<a href="login.jsp" class="btn btn-success"><i
				class="fa-solid fa-right-to-bracket pr-1"></i>Login</a> <a
				href="register.jsp" class="btn btn-primary"><i
				class="fa-solid fa-user-plus pr-1"></i>Register</a>
		</div>
		</c:if>
		
		
		
	</div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

</nav>