<%@page import="com.entity.User"%>
<%@page import="com.entity.DesignDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.DesignDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Design</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.10, fadeOut 0.10s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
<%
	User u = (User) session.getAttribute("userobj");
	%>



	<c:if test="${not  empty addcart}">

		<div id="toast">${addcart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addcart" scope="session"/>


	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			DesignDAOImpl dao = new DesignDAOImpl(DBConnect.getConn());
			List<DesignDtls> list = dao.getAllNewDesign();
			for (DesignDtls d : list) {
			%>
			<div class="col-md-3 mt-4">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Images/<%=d.getPhotoName()%>"
							style="width: 160px; height: 150px" class="img-thumblin">
						<p><%=d.getDesignName()%></p>
						<p>
							Owner:
							<%=d.getDesigner()%></p>
						<p>
							Type:
							<%=d.getDesignCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?designId=<%=d.getDesignId()%>&&id=<%=u.getId()%>"
								class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>

							<%
							}
							%>
							
							
								
								<a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign pr-1"></i><%=d.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
</body>
</html>