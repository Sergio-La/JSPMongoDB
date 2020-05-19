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
    String codigo = "";
    String nombre = "";
    String apellido = "";

    if ("GET".equalsIgnoreCase(request.getMethod())) {
    } else {
        codigo = request.getParameter("codigo");
        nombre = request.getParameter("nombre");
        apellido = request.getParameter("apellido");

        if(codigo == null || codigo.isEmpty()){
            errmsg = "El código no puede estar vacío.";
        }else if(nombre == null || nombre.isEmpty()){
            errmsg = "El nombre no puede estar vacío.";
        }else if(apellido == null || apellido.isEmpty()){
            errmsg = "El apellido no puede estar vacío.";
        }

        if (errmsg.isEmpty()) {
            try {
                estudiante e = new estudiante();
                e.setCodigo(codigo);
                e.setNombre(nombre);
                e.setApellido(apellido);
                // create
                MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
                estudiantedao estudiantedao = new estudiantedao(mongo);
                estudiantedao.create(e);
                response.sendRedirect("headerest.jsp");
            } catch (NumberFormatException nfe) {
                errmsg = "El codigo debe ser un numero entero.";
            }
        }
    }
    pageContext.setAttribute("errmsg", errmsg);
    pageContext.setAttribute("codigo", codigo);
    pageContext.setAttribute("nombre", nombre);
    pageContext.setAttribute("apellido", apellido);
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insertar Estudiante</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<div class="alert alert-secondary" role="alert"><h2>Agregar Nuevo Estudiante</h2></div>

<div class="container">
  <h3 style='color:red'>${errmsg}</h3>
  <form class="form-horizontal" action="estadd.jsp" method="Post">
  
    <div class="form-group">
      <div class="col-sm-10">
        <input class="form-control" id="codigo" placeholder="Codigo" name="codigo" value="${codigo}">
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-sm-10">
        <input class="form-control" id="nombre" placeholder="Nombre" name="nombre" value="${nombre}">
      </div>
    </div>
    
     <div class="form-group">
      <div class="col-sm-10">
        <input class="form-control" id="apellido" placeholder="Apellido" name="apellido" value="${apellido}">
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-primary">Insertar</button>
      </div>
    </div>
  </form>
</div>
</div>>	
</body>
</html>