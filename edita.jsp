
<%@page import="conexion.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario para actualizar datos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="estilos.css"/>
    </head>
    <body>
        <%
            String Nombre = request.getParameter("Txtusuario");
            String Correo = request.getParameter("Txtcorreo");
            String Contraseña = request.getParameter("Txtcontrasenia");
            Integer idUser = (Integer) session.getAttribute("idUser");
            if (idUser == null) {
                response.sendRedirect("iniciods.jsp");
                return;
            }
            conexion bd = new conexion();
            try {
                bd.conectar();
                String strQry = "update Usuario set nombre='" + Nombre + "', correo ='" + Correo + "', contrasena='" + Contraseña + "' where idUser = '" + idUser + "';";

                
                int resultadoEdita = bd.edita(strQry);
               
                out.print("resultado " + resultadoEdita);
                request.getRequestDispatcher("Datos.jsp").forward(request, response);
            } catch (Exception ex) {
                out.print(ex.getMessage());
            }
        %>
    </body>
</html>