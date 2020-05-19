<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@page import="modelo.estudiante"%>
<%@page import="modelodao.estudiantedao"%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String errmsg = "";
    MongoClient db = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
    estudiantedao estudiantedao = new estudiantedao(db);

    List<estudiante> estudiantes = estudiantedao.getList();
    if (estudiantes == null || estudiantes.size() == 0) {
        errmsg = "No hay estudiantes";
    }

    pageContext.setAttribute("errmsg", errmsg);
    pageContext.setAttribute("estudiantes", estudiantes);
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista De Estudiantes</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-light bg-light">
	  <a class="navbar-brand" href="headerest.jsp">Inicio</a>
	</nav>
	
	<div class="container">
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th class="table-primary">ID</th>
        <th class="table-primary">Código</th>
        <th class="table-primary">Nombre</th>
        <th class="table-primary">Apellido</th>
        <th class="table-primary">Operaciones</th>
      </tr>
    </thead>
    <tbody>
      <c:choose>
        <c:when test="${not empty errmsg}">
          <tr style='color:red'><td>${errmsg}</td></tr>
        </c:when>
        <c:otherwise>
          <c:forEach var="estudiante" items="${estudiantes}">
            <tr>
              <td> <c:out value="${estudiante.id}"/> </td>
              <td> <c:out value="${estudiante.codigo}"/> </td>
              <td> <c:out value="${estudiante.nombre}"/> </td>
              <td> <c:out value="${estudiante.apellido}"/> </td>
              <td><a class="btn btn-success" href="estedit.jsp?id=${estudiante.id}">Editar</a>&nbsp;<a class="btn btn-danger" href="estdel.jsp?id=${estudiante.id}" onclick="return confirm('¿Está seguro que quiere borrar este estudiante?')">Borrar</a></td>
            </tr>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </tbody>
  </table>
</div>
	
</body>
</html>