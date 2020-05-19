<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="modelo.materia"%>
<%@page import="modelodao.materiadao"%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String errmsg = "";
    String codigo = "";
    String materia = "";
    String estcod = "";
    String estnom = "";
    String nota = "";

    if ("GET".equalsIgnoreCase(request.getMethod())) {
    } else {
        codigo = request.getParameter("codigo");
        materia = request.getParameter("materia");
        estcod = request.getParameter("estcod");
        estnom = request.getParameter("estnom");
        nota = request.getParameter("nota");

        if(codigo == null || codigo.isEmpty()){
            errmsg = "El código no puede estar vacío.";
        }else if(materia == null || materia.isEmpty()){
            errmsg = "La materia no puede estar vacío.";
        }else if(estcod == null || estcod.isEmpty()){
            errmsg = "El codigo del estudiante no puede estar vacío.";
        }else if(estnom == null || estnom.isEmpty()){
            errmsg = "El nombre del estudiante no puede estar vacío.";
        }else if(nota == null || nota.isEmpty()){
            errmsg = "La nota no puede estar vacía.";
        }

        if (errmsg.isEmpty()) {
            try {
                materia a = new materia();
                a.setCodigo(codigo);
                a.setMateria(materia);
                a.setEstcod(estcod);
                a.setEstnom(estnom);
                a.setNota(nota);
                // create
                MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
                materiadao materiadao = new materiadao(mongo);
                materiadao.create(a);
                response.sendRedirect("headerest.jsp");
            } catch (NumberFormatException nfe) {
                errmsg = "El codigo debe ser un numero entero.";
            }
        }
    }
    pageContext.setAttribute("errmsg", errmsg);
    pageContext.setAttribute("codigo", codigo);
    pageContext.setAttribute("materia", materia);
    pageContext.setAttribute("estcod", estcod);
    pageContext.setAttribute("estnom", estnom);
    pageContext.setAttribute("nota", nota);


%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insertar Materia</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<div class="alert alert-secondary" role="alert"><h2>Agregar Nueva Materia</h2></div>

<div class="container">
  <h3 style='color:red'>${errmsg}</h3>
  <form class="form-horizontal" action="matadd.jsp" method="Post">
  
    <div class="form-group">
      <div class="col-sm-10">
        <input class="form-control" id="codigo" placeholder="Codigo" name="codigo" value="${codigo}">
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-sm-10">
        <input class="form-control" id="materia" placeholder="Materia" name="materia" value="${materia}">
      </div>
    </div>
    
     <div class="form-group">
      <div class="col-sm-10">
        <input class="form-control" id="estcod" placeholder="Código del estudiante" name="estcod" value="${estcod}">
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-sm-10">
        <input class="form-control" id="estnom" placeholder="Nombre del estudiante" name="estnom" value="${estnom}">
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-sm-10">
        <input class="form-control" id="nota" placeholder="Nota" name="nota" value="${nota}">
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