<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Vehiculos</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <form class="navbar-form navbar-right" action="/signin.jsp" method="post">
                <%
                    UserService userService = UserServiceFactory.getUserService();
                    User user = userService.getCurrentUser();
                    if (user != null) {
                        pageContext.setAttribute("user", user);
                %>
                <a id="username">Hello ${fn:escapeXml(user.nickname)}</a>
                <a href="<%= userService.createLogoutURL(request.getRequestURI())%>" class="btn btn-success">Sign Out</a>
                <%  } else { %>
                <a href="<%= userService.createLoginURL(request.getRequestURI())%>" class="btn btn-success">Sign In</a>
                <%
                    }
                %>
            </form>
        </div><!--/.navbar-collapse -->
    </div>
</nav>


