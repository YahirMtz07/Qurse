<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ver ID Usuario Sesión</title>
</head>
<body>

<%
    
    HttpSession currentSession = request.getSession(false); 

    if (currentSession != null && currentSession.getAttribute("idUser") != null) {
        
        Integer idUsuario = (Integer) currentSession.getAttribute("idUser");
%>
        <h2>El ID de usuario de la sesión iniciada es: <%= idUsuario %></h2>
<%
    } else {
%>
        <h2>No hay ninguna sesión iniciada.</h2>
        <a href="login.jsp">Iniciar sesión</a>
<%
    }
%>

</body>
</html>
