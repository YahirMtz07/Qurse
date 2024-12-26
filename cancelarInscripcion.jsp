<%@page import="java.sql.*"%>
<%@page import="conexion.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idCurso = request.getParameter("idCurso");
    if (idCurso == null || idCurso.isEmpty()) {
        idCurso = (String) session.getAttribute("idCurso");
    }

    
    String idUser = request.getParameter("idUser");
    if (idUser == null || idUser.isEmpty()) {
        idUser = (String) session.getAttribute("idUser");
    }
    try {
        conexion bd = new conexion();
        bd.conectar();
        
        
        String deleteQuery = "DELETE FROM cursosInscritos WHERE idCurso = ? AND idUser = ?";
        PreparedStatement stmt = bd.conectar().prepareStatement(deleteQuery);
        stmt.setString(1, idCurso);
        stmt.setString(2, idUser);
        stmt.executeUpdate();
        
        out.println("<p>Inscripción cancelada con éxito.</p>");
        

        response.sendRedirect("MisCursosAprendiz.jsp");
    } catch (Exception e) {
        out.println("<p>Error al cancelar la inscripción: " + e.getMessage() + "</p>");
    }
%>
