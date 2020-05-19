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
    String id = request.getParameter("id");
    String errmsg = "";
    String codigo = "";
    String nombre = "";
    String apellido = "";

    if (id == null || id.isEmpty()) {
        errmsg = "Parametro invalido";
    } else {
        MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
        estudiantedao estudiantedao = new estudiantedao(mongo);
        if ("GET".equalsIgnoreCase(request.getMethod())) {
            estudiante estudiante = estudiantedao.getestudiante(id);
            codigo = estudiante.getCodigo();
            nombre = estudiante.getNombre();
            apellido = estudiante.getApellido();
        } else {
        	codigo = request.getParameter("codigo");
        	nombre = request.getParameter("nombre");
        	apellido = request.getParameter("apellido");

            if(codigo == null || codigo.isEmpty()){
                errmsg = "El código del estudiante no puede estar vacío.";
            }else if(nombre == null || nombre.isEmpty()){
                errmsg = "El nombre del estudiante no puede estar vacío.";
            }else if(apellido == null || apellido.isEmpty()){
                errmsg = "El apellido del estudiante no puede estar vacío.";
            }

           
            	estudiante estudiante = estudiantedao.getestudiante(id);
            	estudiante.setCodigo(codigo);
            	estudiante.setNombre(nombre);
            	estudiante.setApellido(apellido);
                // update
                estudiantedao.update(estudiante);
                response.sendRedirect("estList.jsp");
            }
        }
    

    pageContext.setAttribute("errmsg", errmsg);
    pageContext.setAttribute("id", id);
    pageContext.setAttribute("codigo", codigo);
    pageContext.setAttribute("nombre", nombre);
    pageContext.setAttribute("apellido", apellido);
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Estudiante</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


<div class="container">
  <h2>Editar Estudiante</h2>
  <h3 style='color:red'>${errmsg}</h3>
  <form class="form-horizontal" action="estedit.jsp?id=${id}" method="Post">
    <input type="hidden" name="id" value="${id}">
    
    <div class="form-group">
      <div class="col-sm-10">
        <input class="form-control" id="codigo" placeholder="Código" name="codigo" value="${codigo}">
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
        <button type="submit" class="btn btn-primary">Guardar</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>