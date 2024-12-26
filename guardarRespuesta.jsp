<%@page import="java.sql.*"%>
<%@page import="conexion.conexion"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resultado de Guardar Respuesta</title>
</head>
<body>
    <%
        
        int idPregunta = Integer.parseInt(request.getParameter("idPregunta"));
        String respuesta = request.getParameter("respuesta");
        
        conexion con = new conexion();
        Connection conn = con.conectar();

       
        boolean exito = con.guardarRespuesta(idPregunta, respuesta);

        if (exito) {
    %>
            <h2>Respuesta guardada exitosamente.</h2>
    <%
        } else {
    %>
            <h2>Error al guardar la respuesta.</h2>
    <%
        }
        con.cierraConexion();
    %>
    <a href="verResultados.jsp">Volver a ver resultados</a>
    <a href="crearPregunta.jsp">Crear otra pregunta</a>
</body>
</html>
