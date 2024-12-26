<%-- 
    Document   : inscripcionCurso
    Created on : 5 nov. 2024, 07:35:52
    Author     : Usuario
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.*"%>
<%@page import="conexion.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Integer idUser = (Integer) session.getAttribute("idUser");
    String idCursoParam = request.getParameter("idCurso");
    if (idCursoParam == null) {
        out.println("<p>No se ha especificado un curso.</p>");
        return;
    }

    Integer idCurso = null;
    try {
        idCurso = Integer.parseInt(idCursoParam);
    } catch (NumberFormatException e) {
        out.println("<p>El ID del curso no es válido.</p>");
        return;
    }

    conexion bd = new conexion();
    ResultSet rs = null;
    String nombreCurso = null;
    String descripcion = null;
    String categoria = null;
    String imageBase64 = null;
    boolean cursoInscrito = false; 

    try {
        bd.conectar();
        
        // Verificar si el usuario ya está inscrito en el curso
        String checkInscripcionQuery = "SELECT COUNT(*) FROM cursosInscritos WHERE idCurso = ? AND idUser = ?";
        PreparedStatement checkStmt = bd.conectar().prepareStatement(checkInscripcionQuery);
        checkStmt.setInt(1, idCurso);
        checkStmt.setInt(2, idUser);
        ResultSet checkRs = checkStmt.executeQuery();
        
        if (checkRs.next()) {
            cursoInscrito = checkRs.getInt(1) > 0; // Si el contador es mayor que 0, el usuario ya está inscrito
        }

        // Consulta principal para obtener los detalles del curso
        String query = "SELECT c.idCurso, c.nombreCurso, c.descripcion, c.categoria, p.image "
                     + "FROM informaciongeneralCursos c "
                     + "LEFT JOIN portadasCursos p ON c.idCurso = p.idCurso "
                     + "WHERE c.idCurso = ?";
        PreparedStatement stmt = bd.conectar().prepareStatement(query);
        stmt.setInt(1, idCurso); 
        rs = stmt.executeQuery();

        if (rs.next()) {
            Blob imageBlob = rs.getBlob("image");
            if (imageBlob != null) {
                byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                imageBase64 = java.util.Base64.getEncoder().encodeToString(imageBytes);
            }
            nombreCurso = rs.getString("nombreCurso");
            descripcion = rs.getString("descripcion");
            categoria = rs.getString("categoria");

            out.println("<div class='course-detail-container'>");
            out.println("<div class='course-image-container'>");
            if (imageBase64 != null) {
                out.println("<img src='data:image/jpeg;base64," + imageBase64 + "' alt='Course Image' class='course-image'>");
            } else {
                out.println("<img src='placeholder.jpg' alt='No Image'>");
            }
            out.println("</div>");
            out.println("<div class='col course-info'>");
            out.println("<h3>" + nombreCurso + "</h3>");
            out.println("<p><strong>Descripción:</strong> " + descripcion + "</p>");
            out.println("<p><strong>Categoría:</strong> " + categoria + "</p>");

            // Mostrar el botón adecuado según si el curso está inscrito o no
            if (cursoInscrito) {
                out.println("<form action='cancelarInscripcion.jsp' method='POST'>");
                out.println("<input type='hidden' name='idCurso' value='" + idCurso + "'>");
                out.println("<input type='hidden' name='idUser' value='" + idUser + "'>");
                out.println("<button type='submit' class='btn-cancelar-inscripcion'>Cancelar Inscripción</button>");
                out.println("</form>");
            } else {
                out.println("<form action='procesarInscripcion.jsp' method='POST'>");
                out.println("<input type='hidden' name='idCurso' value='" + idCurso + "'>");
                out.println("<input type='hidden' name='idUser' value='" + idUser + "'>");
                out.println("<button type='submit' class='btn-inscribir'>Inscribirme</button>");
                out.println("</form>");
            }

            out.println("</div>");
            out.println("</div>");
        } else {
            out.println("<p>Curso no encontrado.</p>");
        }

    } catch (Exception e) {
        out.print("<p>Error al cargar el curso: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (bd != null) { bd.cierraConexion(); }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Incripción a curso</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="imagenes/logo Qurse.png"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Prompt:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <style>
.course-detail-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    font-family: "Prompt", sans-serif;
}

.course-image {
    max-width: 600px; /* Limita el ancho máximo */
    width: 100%;
    height: auto;
    object-fit: cover;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    display: block; /* Asegura que la imagen se trate como un bloque */
    margin: 0 auto; /* Centra la imagen horizontalmente */
}

.course-image-container {
    text-align: center; /* Asegura que la imagen esté centrada */
    margin-bottom: 20px; /* Añade espacio debajo de la imagen */
}

.course-info {
    margin-top: 20px;
}

.course-info h3 {
    font-size: 2.5rem;
    color: #481c00;
    margin-bottom: 10px;
}

.course-info p {
    font-size: 1.1rem;
    color: #666;
    line-height: 1.6;
    margin-bottom: 15px;
}

.course-info p strong {
    color: #481c00;
    font-weight: 600;
}

/* Estilos comunes para ambos botones */
.btn-inscribir, .btn-cancelar-inscripcion {
    padding: 12px 24px;
    font-size: 16px;
    font-weight: 600;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
    border: none;
    outline: none;
    text-transform: uppercase;
    letter-spacing: 1px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    font-family: "Prompt", sans-serif;
}

/* Estilo para el botón "Inscribirme" */
.btn-inscribir {
    background-color: #ED9F03;
    color: #ffffff;
}

.btn-inscribir:hover {
    background-color: #f96200;
    transform: translateY(-2px);
    box-shadow: 0 6px 8px rgba(249, 98, 0, 0.2);
}

/* Estilo para el botón "Cancelar Inscripción" */
.btn-cancelar-inscripcion {
    background-color: #ffffff;
    color: #ED9F03;
    border: 2px solid #ED9F03;
}

.btn-cancelar-inscripcion:hover {
    background-color: #ED9F03;
    color: #ffffff;
    transform: translateY(-2px);
    box-shadow: 0 6px 8px rgba(237, 159, 3, 0.2);
}

/* Efecto al hacer clic en los botones */
.btn-inscribir:active, .btn-cancelar-inscripcion:active {
    transform: translateY(1px);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
            body {
                padding-top: 90px;
                justify-content: center;
                justify-items: center;
            }

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

            .cursoDer{
                float: right;
                display: flex;
                align-content: center;
                margin: 20px;
                width: 80vw;
                justify-content: flex-end;
                text-align: right;
                border-radius: 0;
                box-shadow: none;
                transition: all 0.5s ease-in-out;

            }

            .cursoDer:hover,.cursoIzq:hover{
                padding: 20px;
                border-radius: 15px;
                cursor: pointer;
                transition: .5s;
                -webkit-box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
                -moz-box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
                box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
            }

            .cursoIzq{
                float: left;
                display: flex;
                align-content: center;
                margin: 20px;
                width: 80vw;
                justify-content: left;
                text-align: left;
                border-radius: 0;
                box-shadow: none;
                transition: all 0.5s ease-in-out;
            }

            .imagenCurso {
                width: 100%;
                max-width: 400px;
                height: auto;
                border-radius: 15px;
            }

            .logo {
                width: auto;
                height: 80px;
            }
            .cursoDer .limite-texto{
                float: right;
                margin-bottom: 10px;
            }

            .limite-texto {
                width: 100%;
                line-height: 1.5;
                max-height: 10.5em;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 7;
            }

            .categorias{
                display: flex;
                justify-content: space-around;
                align-content: center;
                padding: 30px;
            }

            .course-detail-container {
                display: flex;
                flex-direction: column;
                gap: 2rem;
                margin: 0 auto;
                width: 100%;
                height: auto;
                padding: 2rem;
                box-sizing: border-box;
            }

            .course-image {
                position: relative;
                width: 100%;
                height: auto;
            }

            .course-info {
                flex: 1;
                position: relative;
                width: 100%;
                height: auto;
            }


            .catind-Mat{
                width: 25vw;
                height: 100px;
                display: flex;
                justify-content: center;
                align-items:  center;
                font-family: "Prompt", sans-serif;
                font-weight: 600;
                font-style: normal;
                font-size: 50px;
                border-radius: 30px;
                margin: 5px;
                background: URL(imagenes/catmat.jpg);
                background-size: 450px;
                background-position-y: -30px;
                cursor: pointer;
                color: white;
                text-shadow:
                    -2px -2px 0 black,
                    2px -2px 0 black,
                    -2px 2px 0 black,
                    2px 2px 0 black;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .catind-Mus{
                width: 25vw;
                height: 100px;
                display: flex;
                justify-content: center;
                align-items:  center;
                font-family: "Prompt", sans-serif;
                font-weight: 600;
                font-style: normal;
                font-size: 50px;
                border-radius: 30px;
                margin: 5px;
                background: URL(imagenes/catmus.jpeg);
                background-size: 450px;
                background-position-y: -30px;
                cursor: pointer;
                color: white;
                text-shadow:
                    -2px -2px 0 black,
                    2px -2px 0 black,
                    -2px 2px 0 black,
                    2px 2px 0 black;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .catind-Cie{
                width: 25vw;
                height: 100px;
                display: flex;
                justify-content: center;
                align-items:  center;
                font-family: "Prompt", sans-serif;
                font-weight: 600;
                font-style: normal;
                font-size: 50px;
                border-radius: 30px;
                margin: 5px;
                background: URL(imagenes/catcie.jpeg);
                background-size: 450px;
                background-position-y: -30px;
                cursor: pointer;
                color: white;
                text-shadow:
                    -2px -2px 0 black,
                    2px -2px 0 black,
                    -2px 2px 0 black,
                    2px 2px 0 black;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .catind-Art{
                width: 25vw;
                height: 100px;
                display: flex;
                justify-content: center;
                align-items:  center;
                font-family: "Prompt", sans-serif;
                font-weight: 600;
                font-style: normal;
                font-size: 50px;
                border-radius: 30px;
                margin: 5px;
                background: URL(imagenes/catart.jpeg);
                background-size: 450px;
                background-position-y: -30px;
                cursor: pointer;
                color: white;
                text-shadow:
                    -2px -2px 0 black,
                    2px -2px 0 black,
                    -2px 2px 0 black,
                    2px 2px 0 black;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .catind-Mat:hover,.catind-Art:hover,.catind-Cie:hover,.catind-Mus:hover{
                transition: .5s;
                -webkit-box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
                -moz-box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
                box-shadow: 10px 10px 30px 3px rgba(140,140,140,0.67);
            }

            .course {
                border: 1px solid #ccc;
                padding: 20px;
                margin: 15px;
                background-color: #f9f9f9;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                font-family: Arial, sans-serif;
                max-width: 300px;
                transition: transform 0.2s, box-shadow 0.2s;
            }

            .course:hover {
                transform: translateY(-5px);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            }

            .course img {
                width: 100%;
                height: auto;
                border-radius: 8px;
            }

            .course h3 {
                color: #333;
                font-size: 1.25rem;
                margin-top: 10px;
            }

            .course p {
                color: #666;
                font-size: 0.9rem;
                margin: 10px 0;
            }

            .course p strong {
                color: #333;
            }

            
            .course a {
                display: inline-block;
                margin-top: 10px;
                padding: 8px 15px;
                background-color: #007bff;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                font-size: 0.9rem;
                transition: background-color 0.2s;
            }

            .course a:hover {
                background-color: #0056b3;
            }

            .course img[alt='No Image'] {
                object-fit: cover;
                height: 200px;
                background-color: #ddd;
            }

            @media (max-width: 768px) {
                .textoBienvenida {
                    font-size: 15vw;
                }

                .cursoIzq, .cursoDer {
                    flex-direction: column;
                }

                .imagenCurso {
                    max-width: 100%;
                    margin-bottom: 15px;
                }

                .categorias{
                    flex-direction: column-reverse;
                    display: flex;
                    align-items:  center;
                }

                .catind-Mat,.catind-Mus,.catind-Cie,.catind-Art{
                    margin: 10px;
                    width: 400px;
                }
            }

            @media (max-width: 1024px) {
                .textoBienvenida {
                    font-size: 15vw;
                }

                .limite-texto {
                    width: calc(100% - 40px);
                }
            }

            @media (min-width: 1441px) {
                .textoBienvenida {
                    font-size: 14vw;
                }

                .limite-texto {
                    width: calc(100% - 40px);
                    max-width: 900px;
                }
            }

            @media (max-width: 1440px) {
                .textoBienvenida {
                    font-size: 16vw;
                }

                .limite-texto {
                    width: calc(100% - 40px);
                }
            }

            .regresar {
                top: 10px;
                left: 10px;
                background-color: #27ae60;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease-in-out;
            }

            .regresar:hover {
                background-color: #481c00;
                color: white;
            }

            .regresar:active {
                transform: scale(0.9);
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
                    </button>
                    <br>
                    <br>
                </div>
            </div>
        </div>

    </body>
</html>
