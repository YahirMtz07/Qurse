<%@page import="java.time.LocalDate"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="conexion.conexion" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detalles Cuestionario</title>
        <link rel="icon" type="image/png" href="imagenes/logo Qurse.png"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Prompt:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <style>
            .Header {
                background-color: #ED9F03;
                width: 100%;
                height: 60px;
                position: fixed;
                top: 0;
                left: 0;
                display: flex;
                align-items: center;
                padding: 0 20px;
                z-index:10;
            }
            .headerIzq {
                display: flex;
                align-items: center;
                justify-content: flex-start;
            }

            .headerDerecha {
                margin-left: auto;
                display: flex;
                align-items: center;
            }

            .fotodeperfil {
                border-radius: 100%;
                height: 45px;
                width: 45px;
            }

            .qcoins {
                background-color: white;
                height: 30px;
                border-radius: 100px;
                border: #f96200 solid;
                margin-right: 10px;
                padding-left: 5px;
                padding-right: 5px;
                font-family: "Prompt", sans-serif;
                font-weight: 600;
                font-style: normal;
                text-align: center;
                padding-top: 1px;
            }
            .logo {
                width: auto;
                height: 80px;
            }
            @media (max-width: 768px) {


                .curso {
                    flex-direction: column;
                }

                .imagenCurso {

                    margin-bottom: 15px;
                }
            }

            @media (max-width: 1024px) {

            }

            @media (min-width: 1441px) {

            }

            @media (max-width: 1440px) {

            }


            button {
                all: unset;
            }

            .button {
                position: relative;
                display: inline-flex;
                height: 3.5rem;
                align-items: center;
                border-radius: 9999px;
                padding-left: 2rem;
                padding-right: 2rem;
                font-family: Segoe UI;
                font-size: 1.2rem;
                font-weight: 640;
                color: #fafaf6;
                letter-spacing: -0.06em;
            }

            .button-item {
                background-color: transparent;
                color: #481c00;
                border: #FF6D00;
                border-style: solid;
                font-family: "Prompt", sans-serif;
                font-weight: 600;
                font-style: normal;
            }

            .button-item .button-bg {
                border-color: #FFD56A;
                background-color: #FFD56A;
            }

            .button-inner,
            .button-inner-hover,
            .button-inner-static {
                pointer-events: none;
                display: block;
            }

            .button-inner {
                position: relative;
            }

            .button-inner-hover {
                position: absolute;
                top: 0;
                left: 0;
                opacity: 0;
                transform: translateY(70%);
            }

            .button-bg {
                overflow: hidden;
                border-radius: 2rem;
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                transform: scale(1);
                transition: transform 1.8s cubic-bezier(0.19, 1, 0.22, 1);
            }

            .button-bg,
            .button-bg-layer,
            .button-bg-layers {
                display: block;
            }

            .button-bg-layers {
                position: absolute;
                left: 50%;
                transform: translate(-50%);
                top: -60%;
                aspect-ratio: 1 / 1;
                width: max(200%, 10rem);
            }

            .button-bg-layer {
                border-radius: 9999px;
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                transform: scale(0);
            }

            .button-bg-layer.-purple {
                background-color: #ED9F03;
            }

            .button-bg-layer.-turquoise {
                background-color: #f96200;
            }

            .button-bg-layer.-yellow {
                --tw-bg-opacity: 1;
                background-color: #FFD56A;
            }

            .button:hover .button-inner-static {
                opacity: 0;
                transform: translateY(-70%);
                transition:
                    transform 1.4s cubic-bezier(0.19, 1, 0.22, 1),
                    opacity 0.3s linear;
            }

            .button:hover .button-inner-hover {
                opacity: 1;
                transform: translateY(0);
                transition:
                    transform 1.4s cubic-bezier(0.19, 1, 0.22, 1),
                    opacity 1.4s cubic-bezier(0.19, 1, 0.22, 1);
            }

            .button:hover .button-bg-layer {
                transition:
                    transform 1.3s cubic-bezier(0.19, 1, 0.22, 1),
                    opacity 0.3s linear;
            }

            .button:hover .button-bg-layer-1 {
                transform: scale(1);
            }

            .button:hover .button-bg-layer-2 {
                transition-delay: 0.1s;
                transform: scale(1);
            }

            .button:hover .button-bg-layer-3 {
                transition-delay: 0.2s;
                transform: scale(1);
            }



            .prompt-thin {
                font-family: "Prompt", sans-serif;
                font-weight: 100;
                font-style: normal;
            }

            .prompt-extralight {
                font-family: "Prompt", sans-serif;
                font-weight: 200;
                font-style: normal;
            }

            .prompt-light {
                font-family: "Prompt", sans-serif;
                font-weight: 300;
                font-style: normal;
            }

            .prompt-regular {
                font-family: "Prompt", sans-serif;
                font-weight: 400;
                font-style: normal;
            }

            .prompt-medium {
                font-family: "Prompt", sans-serif;
                font-weight: 500;
                font-style: normal;
            }

            .prompt-semibold {
                font-family: "Prompt", sans-serif;
                font-weight: 600;
                font-style: normal;
            }

            .prompt-bold {
                font-family: "Prompt", sans-serif;
                font-weight: 700;
                font-style: normal;
                font-size: 40px;
                color: #481c00;
            }

            .prompt-extrabold {
                font-family: "Prompt", sans-serif;
                font-weight: 800;
                font-style: normal;
            }

            .prompt-black {
                font-family: "Prompt", sans-serif;
                font-weight: 900;
                font-style: normal;
            }

            .prompt-thin-italic {
                font-family: "Prompt", sans-serif;
                font-weight: 100;
                font-style: italic;
            }

            .prompt-extralight-italic {
                font-family: "Prompt", sans-serif;
                font-weight: 200;
                font-style: italic;
            }

            .prompt-light-italic {
                font-family: "Prompt", sans-serif;
                font-weight: 300;
                font-style: italic;
            }

            .prompt-regular-italic {
                font-family: "Prompt", sans-serif;
                font-weight: 400;
                font-style: italic;
            }

            .prompt-medium-italic {
                font-family: "Prompt", sans-serif;
                font-weight: 500;
                font-style: italic;
            }

            .prompt-semibold-italic {
                font-family: "Prompt", sans-serif;
                font-weight: 600;
                font-style: italic;
            }

            .prompt-bold-italic {
                font-family: "Prompt", sans-serif;
                font-weight: 700;
                font-style: italic;
            }

            .prompt-extrabold-italic {
                font-family: "Prompt", sans-serif;
                font-weight: 800;
                font-style: italic;
            }

            .prompt-black-italic {
                font-family: "Prompt", sans-serif;
                font-weight: 900;
                font-style: italic;
            }


            body {
                background-color: #f4f4f4;

            }
            body {
                font-family: Arial, sans-serif;
                background-color: #FFF5E6;
                color: #4A3728;
                margin: 0;
                padding: 20px;
                padding-top: 250px;
            }
            h1 {
                color: #FF8C00;
                text-align: center;
            }
            form {
                max-width: 600px;
                margin: 0 auto;
                background-color: #FFDAB9;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            label {
                display: block;
                margin-bottom: 5px;
                color: #8B4513;
            }
            input[type="text"],
            input[type="file"] {
                width: 100%;
                padding: 8px;
                margin-bottom: 15px;
                border: 1px solid #D2691E;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="file"] {
                background-color: white;
            }
            input[type="submit"] {
                background-color: #FF8C00;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
                font-size: 16px;
                width: 100%;
            }
            input[type="submit"]:hover {
                background-color: #FFA500;
            }
            .btn-back {
                background-color: #fb8700;
                border: none;
                border-radius: 50%;
                cursor: pointer;
                position: fixed;
                top: 80px;
                left: 20px;
                width: 50px;
                height: 50px;
                transition: all 0.3s ease;
                z-index: 5;
            }
            .btn-back:hover {
                transform: scale(1.1);
            }

            .img-back {
                margin-top: 5px;
                width: 40px;
                height: 40px;
            }



            h2 {
                color: #e67e22;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #f39c12;
                color: white;
            }
            a {
                text-decoration: none;
                color: #fff;
                background-color: #FF6D00;
                padding: 10px 15px;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            a:hover {
                background-color: #ED9F03;
            }
            table {
                border-collapse: separate;
                border-spacing: 0;
                width: 100%;
                border: 1px solid #ddd;
                border-radius: 10px;
                overflow: hidden;
            }

            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }


            tr:last-child td {
                border-bottom: none;
            }

            /* Redondear las esquinas de las celdas en las esquinas */
            tr:first-child th:first-child {
                border-top-left-radius: 10px;
            }

            tr:first-child th:last-child {
                border-top-right-radius: 10px;
            }

            tr:last-child td:first-child {
                border-bottom-left-radius: 10px;
            }

            tr:last-child td:last-child {
                border-bottom-right-radius: 10px;
            }

        </style>
    </head>
    <body>

        <div class="Header">
            <div class="headerIzq">
                <button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                    <img src="imagenes/menu_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" width="35" height="35" alt="alt"/>
                </button>
                <%
                    LocalDate date = LocalDate.now();
                    int mes = date.getMonthValue();

                    if (mes == 12) {
                %>

                <img class="logo" src="imagenes/logo Qurse navidad.png" alt="alt"/>
                <%
                } else {
                %>   

                <img class="logo" src="imagenes/logo Qurse.png" alt="alt"/>

                <%
                    }
                %>
                <div class="prompt-bold">Qurse</div><div class="prompt-semibold" style="margin-top: 15px;color: #481c00; font-size: 15px;">Educador</div>
            </div>
            <div class="headerDerecha">

            </div>
            <div style="background-color:#FFD56A;" class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                <div class="offcanvas-header">
                    <h2 style="color:#481c00;" class="prompt-extrabold" id="offcanvasExampleLabel">Navegador</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body" >


                    <button class="button button-item" onclick="window.location.href = 'indexEducador.jsp'">
                        <span class="button-bg">
                            <span class="button-bg-layers">
                                <span class="button-bg-layer button-bg-layer-1 -purple"></span>
                                <span class="button-bg-layer button-bg-layer-2 -turquoise"></span>
                                <span class="button-bg-layer button-bg-layer-3 -yellow"></span>
                            </span>
                        </span>
                        <span class="button-inner">
                            <span class="button-inner-static">Pagina Principal</span>
                            <span class="button-inner-hover">Pagina Principal</span>
                        </span>
                    </button><br><br>
                    <button class="button button-item" onclick="window.location.href = 'MisCursosEducador.jsp'">
                        <span class="button-bg">
                            <span class="button-bg-layers">
                                <span class="button-bg-layer button-bg-layer-1 -purple"></span>
                                <span class="button-bg-layer button-bg-layer-2 -turquoise"></span>
                                <span class="button-bg-layer button-bg-layer-3 -yellow"></span>
                            </span>
                        </span>
                        <span class="button-inner">
                            <span class="button-inner-static">Mis Cursos</span>
                            <span class="button-inner-hover">Mis Cursos</span>
                        </span>
                    </button><br><br>

                </div>
            </div></div>

        <h2>Detalles del Cuestionario</h2>

        <%
            int idCuestionario = Integer.parseInt(request.getParameter("idCuestionario"));
            conexion conexionBD = new conexion();
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                conn = conexionBD.conectar();
                stmt = conn.createStatement();

                String sqlCuestionario = "SELECT nombre FROM CiertoFalso WHERE idCF = " + idCuestionario;
                rs = stmt.executeQuery(sqlCuestionario);
                String nombreCuestionario = "";
                if (rs.next()) {
                    nombreCuestionario = rs.getString("nombre");
                }
                out.println("<h3> Nombre: " + nombreCuestionario + "</h3>");

                String sqlPreguntas = "SELECT pregunta, respuesta FROM PRCiertoFalso WHERE idCF = " + idCuestionario;
                rs = stmt.executeQuery(sqlPreguntas);
        %>

        <table>
            <tr>
                <th>Pregunta</th>
                <th>Respuesta</th>
            </tr>
            <%
                while (rs.next()) {
                    String pregunta = rs.getString("pregunta");
                    String respuesta = rs.getString("respuesta");
            %>
            <tr>
                <td><%= pregunta%></td>
                <td><%= respuesta%></td>
            </tr>
            <%
                }
            %>
        </table>

        <%
            } catch (SQLException e) {
                out.println("<p>Error al recuperar los detalles del cuestionario: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (stmt != null) {
                        stmt.close();
                    }
                    conexionBD.cierraConexion();
                } catch (SQLException e) {
                    out.println("<p>Error al cerrar la conexión: " + e.getMessage() + "</p>");
                }
            }
        %>

        <a href="verCuestionarios.jsp">Volver a la lista de Cuestionarios</a>

    </body>
</html>
