<%@page import="java.sql.*"%>
<%@page import="conexion.conexion"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resultado de Guardar Pregunta</title>
</head>
<body>
    <%
        String[] preguntas = request.getParameterValues("pregunta");
        String[] valores = request.getParameterValues("valor");
        conexion con = new conexion();
        Connection conn = con.conectar();
        boolean exito = true;

        if (preguntas != null && valores != null) {
            for (int i = 0; i < preguntas.length; i++) {
                boolean resultado = con.guardarPregunta(preguntas[i], valores[i]);
                if (!resultado) {
                    exito = false; 
                }
            }
        }

        con.cierraConexion();

        if (exito) {
            response.sendRedirect("verResultados.jsp");
        } else {
            out.println("<h2>Error al guardar alguna pregunta.</h2>");
        }
    %>
</body>
</html>
