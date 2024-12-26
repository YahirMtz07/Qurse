
<%@page import="java.sql.*"%>
<%@page import="conexion.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Obtener los parámetros enviados desde el formulario
    String idCursoParam = request.getParameter("idCurso");
    String idUserParam = request.getParameter("idUser");

    if (idCursoParam == null || idUserParam == null) {
        out.println("<p>Error: No se han recibido los parámetros necesarios.</p>");
        return;
    }

    Integer idCurso = Integer.parseInt(idCursoParam);
    Integer idUser = Integer.parseInt(idUserParam);

   
    try {
        conexion bd = new conexion();
        bd.conectar();
        String insertQuery = "INSERT INTO cursosInscritos (idCurso, idUser) VALUES (?, ?)";
        PreparedStatement stmt = bd.conectar().prepareStatement(insertQuery);
        stmt.setInt(1, idCurso);
        stmt.setInt(2, idUser);
        stmt.executeUpdate();
        response.sendRedirect("MisCursosAprendiz.jsp");
    } catch (Exception e) {
        out.println("<p>Error al procesar la inscripción: " + e.getMessage() + "</p>");
    }
%>
