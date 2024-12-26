<%@page import="conexion.conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Guardar Información del Curso</title>
</head>
<body>
    <%
       
        Integer idUsuario = (Integer) request.getAttribute("idUser");
        String tituloCurso = (String) request.getAttribute("tituloCurso");
        String descripcionCurso = (String) request.getAttribute("descripcionCurso");
        String categoria = (String) request.getAttribute("categoria");

        
        conexion bd = new conexion();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            bd.conectar();

           
            String insertInfoQuery = "INSERT INTO informaciongeneralCursos (idUser, nombreCurso, descripcion, categoria) VALUES (?, ?, ?, ?)";
            ps = bd.conectar().prepareStatement(insertInfoQuery, Statement.RETURN_GENERATED_KEYS); 
            ps.setInt(1, idUsuario);
            ps.setString(2, tituloCurso);
            ps.setString(3, descripcionCurso);
            ps.setString(4, categoria);
            int result = ps.executeUpdate();

            if (result > 0) {
                
                int idCurso = 0;
                rs = ps.getGeneratedKeys(); 
                if (rs.next()) {
                    idCurso = rs.getInt(1); 

                    
                    Integer idImg = (Integer) request.getAttribute("imageId");
                    if (idImg != null) {
                       
                        String updateCourseIdQuery = "UPDATE portadasCursos SET idCurso = ? WHERE idPortada = ?";
                        ps = bd.conectar().prepareStatement(updateCourseIdQuery);
                        ps.setInt(1, idCurso); 
                        ps.setInt(2, idImg); 

                        int updateResult = ps.executeUpdate();
                        if (updateResult > 0) {
                            out.println("<h2>Información del curso y la imagen guardadas exitosamente.</h2>");
                               response.sendRedirect("MisCursosEducador.jsp");
                        } else {
                            out.println("<h2>Error al actualizar la imagen con el ID del curso.</h2>");
                        }
                    } else {
                        out.println("<h2>Error: ID de la imagen no proporcionado.</h2>");
                    }
                }
            } else {
                out.println("<h2>Error al guardar la información del curso.</h2>");
            }
        } catch (SQLException e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            bd.cierraConexion();
        }
    %>
</body>
</html>
