<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title> <c:out value="${page }"/> </title>
</head>
<body>


	<div class="container mt-3">
		<h1 class="text-center">Welcome to ToDo Management</h1>

		<c:if test="${not empty msg}">
			<div class="alert alert-success">
				<b><c:out value="${msg }"></c:out></b>
			</div>
		</c:if>

		<div class="row mt-5">

			<div class="col-md-3">

				<div class="list-group">
					<button type="button" class="list-group-item list-group-item-action active">Menu</button>
					<a href="<c:url value='/add'></c:url>" class="list-group-item list-group-item-action">Add TODO</a>
					<a href="<c:url value='/home'></c:url>" class="list-group-item list-group-item-action">View TODO</a>

				</div>

			</div>


			<div class="col-md-9">

				<c:if test="${page=='home' }">
					<h1 class="text-center">All TODO</h1>
					<c:forEach items="${todos }" var="t">
						<div class="card mt-2">
							<div class="card-body">
								<h3> <c:out value="${t.todoTitle }" /></h3>
								<p><c:out value="${t.todoContent }" /></p>
							</div>
						</div>
					</c:forEach>
				</c:if>

				<c:if test="${page == 'add' }">
					<h1 class="text-center">Add TODO</h1>
					
					<form:form action="saveTodo" method="post" modelAttribute="todo">
						
						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control" placeholder="Enter Your Todo Title"/>
						</div>
						
						<div class="form-group">
							<form:textarea path="todoContent" cssClass="form-control" placeholder="Enter Your Todo Content" cssStyle="height: 200px;"/>
						</div>
						
						<div class="container text-center">
							<button class="btn btn-outline-success">Add</button>
						</div>
					
					</form:form>
				</c:if>

			</div>

		</div>

	</div>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>