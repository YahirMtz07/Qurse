<%@page import="java.time.LocalDate"%>
<%@page import="conexion.conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Qurse</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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



            .curso{
                position: fixed;
                bottom: 20px; /* Distancia desde el borde inferior */
                right: 20px; /* Distancia desde el borde derecho */
                padding: 5px;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                display: flex;
                justify-content: center;
                margin: 20px;
                border-radius: 15px;
                box-shadow: none;
                transition: all 0.3s ease-in-out;
                max-width: 400px;
                float: left;
                -webkit-box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
                -moz-box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
                box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
            }


            .curso:hover{
                border-radius: 15px;
                cursor: pointer;
                transition: .3s;
                -webkit-box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
                -moz-box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
                box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
                margin: 20px;
                transform: scale(1.5);

            }



            .imagenCurso {
                width: 100%;
                max-width: 400px;
                height: auto;
                border-radius: 15px;
            }

            .imagenCurso2 {
                width: 100%;
                max-width: 100px;
                height: auto;
                border-radius: 15px;
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
                padding-top: 90px;
            }
            .course-container {
                display: flex;
                flex-wrap: wrap;
                justify-content:flex-start;
            }
            .course {
                background-color: white;
                border: 1px solid #ccc;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                margin: 10px;
                padding: 15px;
                width: 350px;
                text-align: center;
                transition: all 0.3s ease-in-out;
            }
            .course:hover {
                -webkit-box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
                -moz-box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
                box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
                transition: .3s;
                cursor: pointer;
                margin: 10px;
                padding: 15px;
                width: 350px;
                text-align: center;
            }
            .course img {
                max-width: 100%;
                height: 200px;
                border-radius: 4px;
                object-fit: cover;
            }
            .course h3 {
                margin: 10px 0;
            }
            .course p {
                width: 100%;
                line-height: 1.5;
                max-height: 3em;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 3;
            }

        </style>
    </head>
    <body>
         <%
            Integer idUser = (Integer) session.getAttribute("idUser");
            if (idUser == null) {

                response.sendRedirect("login.jsp");
                return;
            }
        %>
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
                <div class="prompt-bold">Qurse</div><div class="prompt-semibold" style="margin-top: 15px;color: #481c00; font-size: 15px;">Aprendiz</div>
            </div>
            <div class="headerDerecha">
                <button class="btn" type="button" onclick="window.location.href = 'Datos.jsp'">
                    <img class="fotodeperfil" src="imagenes/pp.jpg" alt="alt"/>
                </button>
            </div>
            <div style="background-color:#FFD56A;" class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                <div class="offcanvas-header">
                    <h2 style="color:#481c00;" class="prompt-extrabold" id="offcanvasExampleLabel">Navegador</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body" >


                    <button class="button button-item" onclick="window.location.href = 'indexAprendiz.jsp'">
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
                    <button class="button button-item" onclick="window.location.href = 'indexAprendiz.jsp'">
                        <span class="button-bg">
                            <span class="button-bg-layers">
                                <span class="button-bg-layer button-bg-layer-1 -purple"></span>
                                <span class="button-bg-layer button-bg-layer-2 -turquoise"></span>
                                <span class="button-bg-layer button-bg-layer-3 -yellow"></span>
                            </span>
                        </span>
                        <span class="button-inner">
                            <span class="button-inner-static">Buscador de Cursos</span>
                            <span class="button-inner-hover">Buscador de Cursos</span>
                        </span>
                    </button><br><br>
                    <button class="button button-item" onclick="window.location.href = 'MisCursosAprendiz.jsp'">
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
                    <button class="button button-item" onclick="window.location.href = 'indexAprendiz.jsp'">
                        <span class="button-bg">
                            <span class="button-bg-layers">
                                <span class="button-bg-layer button-bg-layer-1 -purple"></span>
                                <span class="button-bg-layer button-bg-layer-2 -turquoise"></span>
                                <span class="button-bg-layer button-bg-layer-3 -yellow"></span>
                            </span>
                        </span>
                        <span class="button-inner">
                            <span class="button-inner-static">Sala de Recompensas</span>
                            <span class="button-inner-hover">Sala de Recompensas</span>
                        </span>
                    </button><br><br>

                </div>
            </div></div>

            <%
               
                if (idUser == null) {
                    out.println("<h2>No has iniciado sesión.</h2>");
                    return;
                }

                conexion bd = new conexion();
                PreparedStatement ps = null;
                ResultSet rs = null;
                boolean hasCourses = false;

                try {
                    bd.conectar();
                    String query = "SELECT c.idCurso, c.nombreCurso, c.descripcion, c.categoria, p.image "
             + "FROM informaciongeneralCursos c "
             + "LEFT JOIN portadasCursos p ON c.idCurso = p.idCurso "
             + "WHERE c.idCurso IN (SELECT idCurso FROM cursosInscritos WHERE idUser = ?)";
                    ps = bd.conectar().prepareStatement(query);
                    ps.setInt(1, idUser);
                    rs = ps.executeQuery();

                    out.println("<div class='course-container'>");

                    while (rs.next()) {
                        hasCourses = true;
                        int idCurso = rs.getInt("idCurso");
                        String nombreCurso = rs.getString("nombreCurso");
                        String descripcion = rs.getString("descripcion");
                        String categoria = rs.getString("categoria");
                        Blob imageBlob = rs.getBlob("image");
                        String imageBase64 = null;

                        if (imageBlob != null) {
                            byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                            imageBase64 = java.util.Base64.getEncoder().encodeToString(imageBytes);
                        }

                        out.println("<div class='course'>");
                        if (imageBase64 != null) {
                            out.println("<img src='data:image/jpeg;base64," + imageBase64 + "' alt='Course Image'>");
                        } else {
                            out.println("<img src='placeholder.jpg' alt='No Image'>");
                        }
                        out.println("<h3>" + nombreCurso + "</h3>");
                        out.println("<p><strong>Descripción:</strong> " + descripcion + "</p>");
                        out.println("<p><strong>Categoría:</strong> " + categoria + "</p>");
                        out.println("<a href='leccionesCursoAprendiz.jsp?idCurso=" + idCurso + "&linkCurso=" + java.net.URLEncoder.encode(nombreCurso, "UTF-8") + "'>Entrar Al Curso</a>");
                        out.println("<br>");
                           out.println("<a href='cancelarInscripcion.jsp?idCurso=" + idCurso + "&linkCurso=" + java.net.URLEncoder.encode(nombreCurso, "UTF-8") + "&idUser=" + idUser + "'>Cancelar Inscripcion</a>");
                        out.println("</div>");
                    }

                    out.println("</div>");

                    if (!hasCourses) {

                        out.println("<div class='no-courses' style='text-align:center; font-size:20px; margin-top:20px;'>");
                        out.println("<p>Parece que no tienes cursos inscritos.</p>");
                        out.println("</div>");
                    }

                } catch (SQLException e) {
                    out.println("<h2>Error al recuperar los cursos: " + e.getMessage() + "</h2>");
                } finally {
                    if (rs != null) try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    if (ps != null) try {
                        ps.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    bd.cierraConexion();
                }
            %>


    </body>
</html>
