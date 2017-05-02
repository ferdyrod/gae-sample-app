<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Automovil" %>
<%@ page import="models.Motocicleta" %>
<%@ page import="models.Bicicleta" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%--
  Created by IntelliJ IDEA.
  User: ferdyrod
  Date: 5/2/17
  Time: 1:55 AM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="stylesheets/main.css">
    <title>VideoJuegos Info</title>
</head>
<body>

<jsp:include page="signin.jsp"/>


<div class="container theme-showcase" role="main">

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <h1>Listados de Vehiculos</h1>
        <p>Esta aplicación lista diferentes modelos de Automóviles, Motocicletas y Bicicletas.</p>
        <p>Anímate a agregar a la lista tus modelos favoritos!</p>
    </div>


    <div class="page-header">
        <h1>Autómoviles
            <%
                UserService userService = UserServiceFactory.getUserService();
                User user = userService.getCurrentUser();
                if (user != null) {
            %>
            <button type="button" class="btn btn-danger pull-right" data-toggle="modal" data-target="#add-automovil-modal">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            </button>
            <%
                }
            %>
        </h1>
    </div>

    <div class="row">
        <div class="col-md-12">
            <%
                List<Automovil> automoviles = ObjectifyService.ofy()
                        .load()
                        .type(Automovil.class)
                        .order("-created_at")
                        .list();
                
                if (automoviles.isEmpty()) {
            %>
            <p>No hay autos, agrega uno</p>
            <%
                } else {
            %>
            <table class="table">
                <thead>
                <tr>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Año</th>
                </tr>
                </thead>
                <tbody>

                <%
                    for (Automovil automovil : automoviles) {
                                pageContext.setAttribute("make", automovil.make);
                                pageContext.setAttribute("model", automovil.model);
                                pageContext.setAttribute("year", automovil.year);
                %>
                <tr>
                <td>${fn:escapeXml(make)}</td>
                <td>${fn:escapeXml(model)}</td>
                <td>${fn:escapeXml(year)}</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <%
                }
            %>
        </div>
    </div>

    <div class="page-header">
        <h1>Motocicletas
            <%
                if (user != null) {
            %>
            <button type="button" class="btn btn-danger pull-right" data-toggle="modal" data-target="#add-motocicleta-modal">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            </button>
            <%
                }
            %>
        </h1>
    </div>

    <div class="row">
        <div class="col-md-12">
            <%
                List<Motocicleta> motocicletas = ObjectifyService.ofy()
                        .load()
                        .type(Motocicleta.class)
                        .order("-created_at")
                        .list();

                if (motocicletas.isEmpty()) {
            %>
            <p>No hay motocicletas, agrega uno</p>
            <%
            } else {
            %>
            <table class="table">
                <thead>
                <tr>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Año</th>
                </tr>
                </thead>
                <tbody>

                <%
                    for (Motocicleta motocicleta : motocicletas) {
                        pageContext.setAttribute("make", motocicleta.make);
                        pageContext.setAttribute("model", motocicleta.model);
                        pageContext.setAttribute("year", motocicleta.year);
                %>
                <tr>
                    <td>${fn:escapeXml(make)}</td>
                    <td>${fn:escapeXml(model)}</td>
                    <td>${fn:escapeXml(year)}</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <%
                }
            %>
        </div>
    </div>

    <div class="page-header">
        <h1>Bicicletas
            <%
                if (user != null) {
            %>
            <button type="button" class="btn btn-danger pull-right" data-toggle="modal" data-target="#add-bicicleta-modal">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            </button>
            <%
                }
            %>
        </h1>
    </div>

    <div class="row">
        <div class="col-md-12">
            <%
                List<Bicicleta> bicicletas = ObjectifyService.ofy()
                        .load()
                        .type(Bicicleta.class)
                        .order("-created_at")
                        .list();

                if (bicicletas.isEmpty()) {
            %>
            <p>No hay bicicletas, agrega uno</p>
            <%
            } else {
            %>
            <table class="table">
                <thead>
                <tr>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Año</th>
                </tr>
                </thead>
                <tbody>

                <%
                    for (Bicicleta bicicleta : bicicletas) {
                        pageContext.setAttribute("make", bicicleta.make);
                        pageContext.setAttribute("model", bicicleta.model);
                        pageContext.setAttribute("year", bicicleta.year);
                %>
                <tr>
                    <td>${fn:escapeXml(make)}</td>
                    <td>${fn:escapeXml(model)}</td>
                    <td>${fn:escapeXml(year)}</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <%
                }
            %>
        </div>
    </div>

    <!-- Automovil Modal -->
    <div class="modal" id="add-automovil-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Añade Automovil</h4>
                </div>
                <form class="form-horizontal" method="post" action="add_automovil">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="make" class="col-sm-2 control-label">Marca</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="make" name="make" placeholder="BWM">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="model" class="col-sm-2 control-label">Modelo</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="model" name="model" placeholder="M3">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="year" class="col-sm-2 control-label">Año</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="year" name="year" placeholder="2015">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary" >Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!-- Motocicleta Modal -->
    <div class="modal" id="add-motocicleta-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Añade Motocicleta</h4>
                </div>
                <form class="form-horizontal" method="post" action="add_motocicleta">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="moto_make" class="col-sm-2 control-label">Marca</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="moto_make" name="make" placeholder="YAMAHA">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="moto_model" class="col-sm-2 control-label">Modelo</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="moto_model" name="model" placeholder="Z502">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="moto_year" class="col-sm-2 control-label">Año</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="moto_year" name="year" placeholder="2017">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary" >Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bicicleta Modal -->
    <div class="modal" id="add-bicicleta-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Añade Bicicleta</h4>
                </div>
                <form class="form-horizontal" method="post" action="add_bicicleta">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="bike_make" class="col-sm-2 control-label">Marca</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="bike_make" name="make" placeholder="Ironhorse">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bike_model" class="col-sm-2 control-label">Modelo</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="bike_model" name="model" placeholder="SM-2013">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bike_year" class="col-sm-2 control-label">Año</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="bike_year" name="year" placeholder="2016">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary" >Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>



</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
