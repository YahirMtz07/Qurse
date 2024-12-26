<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.Connection"%>
<%@page import="conexion.conexion"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guardar Preguntas</title>
</head>
<body>
    <%@ page import="conexion.conexion" %>
<%@ page import="java.sql.*" %>
<%
   
    String idCurso = (String) session.getAttribute("idCurso");
    String[] preguntas = request.getParameterValues("pregunta");
    String[] respuestas = request.getParameterValues("respuesta");

    conexion con = new conexion();
    Connection conn = null;

    try {
        
        conn = con.conectar();

        
        String insertSQL = "INSERT INTO FlashCards (pregunta, respuesta, idCurso) VALUES (?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(insertSQL);

        for (int i = 0; i < preguntas.length; i++) {
            pstmt.setString(1, preguntas[i]);
            pstmt.setString(2, respuestas[i]);
            pstmt.setString(3, idCurso);
            pstmt.addBatch(); 
        }

        
        int[] resultados = pstmt.executeBatch();
        int filasInsertadas = resultados.length;

        out.println("<h3>Se guardaron " + filasInsertadas + " preguntas y respuestas exitosamente.</h3>");

    } catch (SQLException e) {
        out.println("<h3>Error al guardar las preguntas y respuestas: " + e.getMessage() + "</h3>");
    } finally {
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("<h3>Error al cerrar la conexión: " + e.getMessage() + "</h3>");
        }
    }
    String redirectURL = "resultados.jsp"; 
    response.sendRedirect(redirectURL);
%>

</body>
</html>
