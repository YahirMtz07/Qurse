<%@page import="java.sql.*"%>
<%@page import="conexion.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
   
    Integer idCurso = Integer.parseInt(request.getParameter("idCurso"));
    
    try {
       
        conexion bd = new conexion();
        bd.conectar();
        
        
        String updateQuery = "delete from informaciongeneralCursos WHERE idCurso = ? ";
        PreparedStatement stmt = bd.conectar().prepareStatement(updateQuery);
 
        stmt.setInt(1, idCurso);
        

        int rowsUpdated = stmt.executeUpdate();
        
        if (rowsUpdated > 0) {
            out.println("<p>Curso eliminado con exito.</p>");
        } else {
            out.println("<p>No se encontro curso para publicar.</p>");
        }
        
        
        response.sendRedirect("MisCursosEducador.jsp");
    } catch (Exception e) {
        out.println("<p>Error al cancelar la inscripción: " + e.getMessage() + "</p>");
    }
%>
    </body>
</html>
