<%@page import="java.time.LocalDate"%>
<%@page import="conexion.conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
<%
    String tituloLeccion = request.getParameter("tituloLeccion");
    String videoSeleccionado = request.getParameter("videoSeleccionado");
    String audioSeleccionado = request.getParameter("audioSeleccionado");
    String archivoSeleccionado = request.getParameter("archivoSeleccionado");
    String cfSeleccionado = request.getParameter("cfSeleccionado");
    String idCurso = (String) session.getAttribute("idCurso");

   
    String[] flashcardsSeleccionadas = new String[6];
    for (int i = 1; i <= 6; i++) {
        flashcardsSeleccionadas[i - 1] = request.getParameter("FCSeleccionada" + i);
    }

    
    conexion bd = new conexion();
    PreparedStatement ps = null;

    try {
        bd.conectar();

       String queryCountLecciones = "SELECT COUNT(*) AS totalLecciones FROM lecciones WHERE idCurso = ?";
        ps = bd.conectar().prepareStatement(queryCountLecciones);
        ps.setString(1, idCurso);
        ResultSet rs = ps.executeQuery();
        int numLeccion = 1; 
        if (rs.next()) {
            numLeccion = rs.getInt("totalLecciones") + 1;
        }
        rs.close();
        ps.close();

        // Insertar la nueva lección
        String queryLecciones = "INSERT INTO lecciones (idCurso, tituloLeccion, numLeccion, numPlantilla, nombreVideoLeccion, nombreAudioLeccion, nombreArchivoLeccion, nombreCFLeccion) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        ps = bd.conectar().prepareStatement(queryLecciones, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, idCurso);
        ps.setString(2, tituloLeccion);
        ps.setInt(3, numLeccion);
        ps.setInt(4, 1);
        ps.setString(5, videoSeleccionado);
        ps.setString(6, audioSeleccionado);
        ps.setString(7, archivoSeleccionado);
        ps.setString(8, cfSeleccionado);

        int filasAfectadas = ps.executeUpdate();

        
        int idLeccion = -1;
        ResultSet generatedKeys = ps.getGeneratedKeys();
        if (generatedKeys.next()) {
            idLeccion = generatedKeys.getInt(1);
        }
        ps.close();

        
        if (idLeccion != -1) {
            String queryFlashcards = "INSERT INTO FlashCardsLecciones (idLeccion, pregunta) VALUES (?, ?)";
            ps = bd.conectar().prepareStatement(queryFlashcards);

            for (String flashcard : flashcardsSeleccionadas) {
                if (flashcard != null && !flashcard.isEmpty()) {
                    ps.setInt(1, idLeccion);
                    ps.setString(2, flashcard);
                    ps.executeUpdate();
                }
            }
        }

        response.sendRedirect("leccionesCursos.jsp");

    } catch (SQLException e) {
        out.println("<p>Error al guardar la lección: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (ps != null) ps.close();
            bd.cierraConexion();
        } catch (SQLException e) {
            out.println("<p>Error al cerrar la conexión: " + e.getMessage() + "</p>");
        }
    }
%>

    </body>
</html>
