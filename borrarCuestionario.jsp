<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="conexion.conexion" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrar Cuestionario</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fffbf2;
            color: #333;
            padding: 20px;
            text-align: center;
        }
        h2 {
            color: #e67e22;
        }
        .message {
            font-size: 1.2em;
            margin: 20px 0;
        }
        a {
            text-decoration: none;
            color: #fff;
            background-color: #27ae60;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #218c4f;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<h2>Borrar Cuestionario</h2>

<%
    conexion conexionBD = new conexion();
    Connection conn = null;
    PreparedStatement pstmt = null;
    int idCuestionario = Integer.parseInt(request.getParameter("idCF"));

    try {
        conn = conexionBD.conectar();
        String sql = "DELETE FROM CiertoFalso WHERE idCF = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, idCuestionario);

        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
%>
            <div class="message">Cuestionario borrado exitosamente.</div>
<%
        } else {
%>
            <div class="message">No se encontró el cuestionario para borrar.</div>
<%
        }
    } catch (SQLException e) {
%>
        <div class="message">Error al borrar el cuestionario: <%= e.getMessage() %></div>
<%
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            conexionBD.cierraConexion();
        } catch (SQLException e) {
%>
            <div class="message">Error al cerrar la conexión: <%= e.getMessage() %></div>
<%
        }
    }
%>

<div class="back-link">
    <a href="verCuestionarios.jsp">Volver a la lista de Cuestionarios</a>
</div>

</body>
</html>
