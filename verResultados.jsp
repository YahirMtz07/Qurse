<%@page import="java.sql.*"%>
<%@page import="conexion.conexion"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Resultados</title>
    <style>
        body { background-color: white; font-family: Arial, sans-serif; }
        .container { width: 80%; margin: auto; padding: 20px; background-color: #fffbe6; border-radius: 10px; }
        h2 { color: #333; text-align: center; }
        .pregunta { margin: 10px 0; padding: 10px; border: 1px solid #d4d4d4; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Preguntas y Respuestas</h2>
        <%
            conexion con = new conexion();
            Connection conn = con.conectar();
            String query = "SELECT * FROM preguntas";

            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
                while (rs.next()) {
                    String pregunta = rs.getString("pregunta");
                    String valor = rs.getString("valor");
        %>
                    <div class="pregunta">
                        <p><strong>Pregunta:</strong> <%= pregunta %></p>
                        <p><strong>Valor:</strong> <%= valor %></p>
                    </div>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Error al recuperar las preguntas: " + e.getMessage() + "</p>");
            } finally {
                con.cierraConexion();
            }
        %>
    </div>
</body>
</html>
