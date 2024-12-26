<%@page import="conexion.conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validar IDS</title>
    </head>
    <body>
        <%
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");

            
            conexion bd = new conexion();
            PreparedStatement ps = null;
            ResultSet rs = null;
            ResultSet rs1 = null;

            try {
                bd.conectar();

                String strQry = "call verificarUsuario(?, ?);";
                ps = bd.conectar().prepareStatement(strQry);
                ps.setString(1, correo);
                ps.setString(2, contrasena);
                rs = ps.executeQuery();

                if (rs.next()) {
                    String mensaje = rs.getString(1);
                    if (mensaje.equals("existe usuario")) {

                        String strQry1 = "select * from Usuario where correo = ? and contrasena = ?;";
                        ps = bd.conectar().prepareStatement(strQry1);
                        ps.setString(1, correo);
                        ps.setString(2, contrasena);
                        rs1 = ps.executeQuery();

                        if (rs1.next()) {
                            HttpSession sesionUser = request.getSession();
                            sesionUser.setAttribute("idUser", rs1.getInt(1));
                            sesionUser.setAttribute("nombre", rs1.getString(2));
                            sesionUser.setAttribute("edad", rs1.getString(3));
                            sesionUser.setAttribute("correo", rs1.getString(4));
                            sesionUser.setAttribute("usuario", rs1.getString(5));
                            sesionUser.setAttribute("contrasena", rs1.getString(6));
                            sesionUser.setAttribute("educador", rs1.getString(7));

                            if (rs1.getString(7).equals("no")) {
                                response.sendRedirect("indexAprendiz.jsp");
                            } else {
                                response.sendRedirect("indexEducador.jsp");
                            }
                        }
                    } else {
                        response.sendRedirect("iniciods.jsp?error=no_existe_usuario");
                    }
                }
            } catch (Exception error) {
                out.print(error.getMessage());
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
                if (rs1 != null) try { rs1.close(); } catch (Exception e) { e.printStackTrace(); }
                if (ps != null) try { ps.close(); } catch (Exception e) { e.printStackTrace(); }
                bd.cierraConexion();
            }
        %>
    </body>
</html>
