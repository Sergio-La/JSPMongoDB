<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="modelodao.estudiantedao"%>
<%@page import="com.mongodb.MongoClient"%>

<%
    String id = request.getParameter("id");
    String errmsg = "";

    if (id == null || id.isEmpty()) {
        errmsg = "Parametro invalido.";
    } else {
        MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
        estudiantedao estudiantedao = new estudiantedao(mongo);
        if (estudiantedao.exists(id)) {
        	estudiantedao.delete(id);
            response.sendRedirect("estList.jsp");
        } else {
            errmsg = "No se encontro ningún estudiante.";
        }
    }

    pageContext.setAttribute("errmsg", errmsg);
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Borrar Estudiante</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>

<div>
  <h3>Borrar Estudiante</h3>
  <h3 style='color:red'>${errmsg}</h3>
</div>
	
</body>
</html>