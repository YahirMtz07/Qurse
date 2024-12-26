<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="conexion.conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Crear Lecciones</title>
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
                bottom: 20px;
                right: 20px;
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
                transform: scale(1.2);

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
            .grid {
                display: grid;
            }

            .grid-cols-3 {
                grid-template-columns: repeat(3, minmax(0, 1fr));
            }

            .grid-rows-3 {
                grid-template-rows: repeat(3, minmax(0, 1fr));
            }

            .gap-4 {
                gap: 1rem;
            }

            .col-span-2 {
                grid-column: span 3 / span 2;
            }



            .bg-white {
                background-color: white;
            }

            .rounded-lg {
                border-radius: 0.5rem;
            }

            .shadow-md {
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            }

            .p-6 {
                padding: 1.5rem;
            }

            .p-4 {
                padding: 1rem;
            }

            .z-10 {
                z-index: 10;
            }

            .fixed {
                position: fixed;
            }

            .top-0 {
                top: 0;
            }

            .left-0 {
                left: 0;
            }

            .w-full {
                width: 100%;
            }

            .pt-20 {
                padding-top: 5rem;
            }
            .flashcards-container {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 20px;
                padding: 20px;
            }

            .flashcard {
                background-color: #f0f0f0;
                border-radius: 10px;
                padding: 20px;
                text-align: center;
                cursor: pointer;
                transition: transform 0.2s;
            }

            .flashcard:hover {
                transform: scale(1.05);
            }

            .flashcard-question {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .flashcard-question input[type="checkbox"] {
                display: none;
            }

            .respuesta {
                display: none;
                margin-top: 10px;
                font-weight: bold;
            }

            .flashcard-question input[type="checkbox"]:checked + .pregunta + .respuesta {
                display: block;
            }

            :root {
                --naranja-claro: #FFA726;
                --naranja-oscuro: #FB8C00;
                --marron-claro: #8D6E63;
                --marron-oscuro: #5D4037;
                --fondo: #F5F5F5;
                --blanco: #FFFFFF;
            }

            body {
                background-color: var(--fondo);
                font-family: Arial, sans-serif;
                color: var(--marron-oscuro);
            }

            .container {
                background-color: var(--blanco);
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }

            h2.text-center {
                color: var(--marron-oscuro);
                font-weight: bold;
            }

            .accordion-button {
                color: var(--blanco);
                border: none;
                border-radius: 5px;
                padding: 10px 15px;
                font-size: 20px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                font-weight: 800;
            }

           
            .bg-white {
                background-color: var(--blanco);
                border: 1px solid var(--marron-claro);
            }

            .rounded-lg {
                border-radius: 10px;
            }

            .shadow-md {
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .btn-primary {
                background-color: var(--naranja-oscuro);
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                color: var(--blanco);
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .btn-primary:hover {
                background-color: var(--marron-claro);
            }

            .grid {
                display: grid;
                gap: 20px;
            }

            .text-center {
                text-align: center;
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
        <div class="Header" style="z-index: 1;">
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
                <div class="offcanvas-body" style="z-index: 0;">


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
            String idLeccion = request.getParameter("idLeccion");
            String idCursoParam = request.getParameter("idCurso");
            if (idCursoParam == null || idCursoParam.isEmpty()) {
                idCursoParam = (String) session.getAttribute("idCurso");
            }
            Integer idCurso = Integer.parseInt(idCursoParam);

            conexion bd = new conexion();
            ResultSet rsLecciones = null;
            ResultSet videoRs = null;
            ResultSet audioRs = null;
            ResultSet archivoRs = null;
            ResultSet rs = null;

            PreparedStatement leccionesStmt = null;
            PreparedStatement videoStmt = null;
            PreparedStatement audioStmt = null;
            PreparedStatement archivoStmt = null;

            String nombreVideo = null;
            String nombreAudio = null;
            String nombreArchivo = null;

            Integer idVideo = null;
            Integer idAudio = null;
            Integer idArchivo = null;

            try {
                bd.conectar();

                String checkInscripcionQuery = "SELECT COUNT(*) FROM cursosInscritos WHERE idCurso = ? AND idUser = ?";
                PreparedStatement checkStmt = bd.conectar().prepareStatement(checkInscripcionQuery);
                checkStmt.setInt(1, idCurso);
                checkStmt.setInt(2, idUser);

                String query = "SELECT c.idCurso, c.nombreCurso, c.descripcion, c.categoria, p.image, "
                        + "l.idLeccion, l.tituloLeccion, l.numLeccion, l.numPlantilla, "
                        + "l.nombreAudioLeccion, l.nombreVideoLeccion, l.nombreArchivoLeccion, l.nombreCFLeccion "
                        + "FROM informaciongeneralCursos c "
                        + "LEFT JOIN portadasCursos p ON c.idCurso = p.idCurso "
                        + "LEFT JOIN lecciones l ON c.idCurso = l.idCurso "
                        + "WHERE c.idCurso = ?";
                PreparedStatement stmt = bd.conectar().prepareStatement(query);
                stmt.setInt(1, idCurso);
                rs = stmt.executeQuery();

                
                String leccionesQuery = "SELECT nombreVideoLeccion, nombreAudioLeccion, nombreArchivoLeccion "
                        + "FROM lecciones WHERE idLeccion = ? AND idCurso = ?";
                leccionesStmt = bd.conectar().prepareStatement(leccionesQuery);
                leccionesStmt.setString(1, idLeccion);
                leccionesStmt.setInt(2, idCurso);
                rsLecciones = leccionesStmt.executeQuery();

                if (rsLecciones.next()) {
                    nombreVideo = rsLecciones.getString("nombreVideoLeccion");
                    nombreAudio = rsLecciones.getString("nombreAudioLeccion");
                    nombreArchivo = rsLecciones.getString("nombreArchivoLeccion");
                }

                // Paso 2: Query para obtener el ID del video
                if (nombreVideo != null) {
                    String videoQuery = "SELECT idVideo FROM videosCursos WHERE nombre = ? AND idCurso = ?";
                    videoStmt = bd.conectar().prepareStatement(videoQuery);
                    videoStmt.setString(1, nombreVideo);
                    videoStmt.setInt(2, idCurso);
                    videoRs = videoStmt.executeQuery();
                    if (videoRs.next()) {
                        idVideo = videoRs.getInt("idVideo");
                    }
                }

                // Paso 3: Query para obtener el ID del audio
                if (nombreAudio != null) {
                    String audioQuery = "SELECT idAudio FROM audiosCursos WHERE nombre = ? AND idCurso = ?";
                    audioStmt = bd.conectar().prepareStatement(audioQuery);
                    audioStmt.setString(1, nombreAudio);
                    audioStmt.setInt(2, idCurso);
                    audioRs = audioStmt.executeQuery();
                    if (audioRs.next()) {
                        idAudio = audioRs.getInt("idAudio");
                    }
                }

                if (nombreArchivo != null) {
                    String archivoQuery = "SELECT idArchivo FROM archivosCursos WHERE nombre = ? AND idCurso = ?";
                    archivoStmt = bd.conectar().prepareStatement(archivoQuery);
                    archivoStmt.setString(1, nombreArchivo);
                    archivoStmt.setInt(2, idCurso);
                    archivoRs = archivoStmt.executeQuery();
                    if (archivoRs.next()) {
                        idArchivo = archivoRs.getInt("idArchivo");
                    }
                }

                String nombreCurso = null;
                String nombreLeccion = null;

                if (rs.next()) {
                    nombreCurso = rs.getString("nombreCurso");
                    nombreLeccion = rs.getString("tituloLeccion");

                }


        %>


        <div class="container mt-5" style="padding-bottom:60px;">
            <h2 class="text-center ">Lecciones del curso: <% out.print(nombreCurso); %></h2>
            <br>

            <span class="accordion-button" for="tituloLeccion">Título de la lección</span>
            <p class="prompt-semibold" style="font-size: 30px;color: #FF6D00; margin-left: 10px;"><%
                if (nombreLeccion != null) {
                    out.print(nombreLeccion);
                } else {
                    out.print("Este curso no tiene lecciones registradas.");
                }
                %></p> 

            <div class="container mx-auto px-4 py-8">
                <div class="grid grid-cols-1 gap-4">

                    <!-- Displaying Videos -->
                    <div class="bg-white rounded-lg shadow-md p-6" style="height: 750px;">
                        <h2 class="accordion-header" id="headingVideos">
                            <button class="accordion-button" type="button">
                                <%
                                    if (nombreVideo != null) {
                                        out.print(nombreVideo);
                                    } else {
                                        out.print("Este curso no cuenta con un video disponible.");
                                    }
                                %>
                            </button>
                        </h2>
                        <div>
                            <% if (idVideo != null) { %>
                            <video width="100%" height="300" controls style="max-width: 100%; height: auto; border-radius: 15px;">
                                <source src="MostrarVideo?id=<% out.print(idVideo); %>" type="video/mp4">
                                Tu navegador no soporta la reproducción de videos.
                            </video>
                            <% } else { %>
                            <p>No se encontró un video asociado a esta lección.</p>
                            <% } %>
                        </div>
                    </div>

                    <!-- Displaying Audios -->
                    <div class="bg-white rounded-lg shadow-md p-4">
                        <h2 class="accordion-header" id="headingAudios">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAudios" aria-expanded="false" aria-controls="collapseAudios">
                                <%
                                    if (nombreAudio != null) {
                                        out.print(nombreAudio);
                                    } else {
                                        out.print("Este curso no cuenta con un audio disponible.");
                                    }
                                %>
                            </button>
                        </h2>
                        <div>
                            <% if (idAudio != null) { %>
                            <audio controls style="width: 100%;">
                                <source src="ObtenerAudio?id=<% out.print(idAudio); %>" type="audio/mpeg">
                                Tu navegador no soporta la reproducción de audio.
                            </audio>
                            <% } else { %>
                            <p>No se encontró un audio asociado a esta lección.</p>
                            <% } %>
                        </div>
                    </div>

                    <!-- Displaying Files -->
                    <div class="bg-white rounded-lg shadow-md p-4">
                        <h2 class="accordion-header" id="headingArchivos">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseArchivos" aria-expanded="false" aria-controls="collapseArchivos">
                                <%
                                    if (nombreArchivo != null) {
                                        out.print(nombreArchivo);
                                    } else {
                                        out.print("Este curso no cuenta con un archivo disponible.");
                                    }
                                %>
                            </button>
                        </h2>
                        <div>
                            <% if (idArchivo != null) { %>
                            <a href="VerPDF?id=<% out.print(idArchivo); %>" class="btn btn-primary">Abrir PDF</a>
                            <% } else { %>
                            <p>No se encontró un archivo asociado a esta lección.</p>
                            <% } %>
                        </div>
                    </div>

                    <!-- Displaying CF -->
                    <div class="bg-white rounded-lg shadow-md p-6">
                        <h2 class="accordion-header" id="headingCuestionario">
                            <button class="accordion-button" type="button">
                                Cuestionario de Cierto o Falso
                            </button>
                        </h2>
                        <div>
                            <%

                                conexion conexionBD = new conexion();
                                Connection conn = null;

                                String nombreCuestionario = null;
                                boolean cuestionarioEncontrado = false;
                                Map<Integer, String> respuestasCorrectas = new HashMap<>();
                                Map<Integer, String> respuestasUsuario = new HashMap<>();

                                // Esta variable controlará si el formulario ha sido enviado
                                boolean formularioEnviado = false;

                                try {
                                    conn = conexionBD.conectar();

                                    // Obtener el nombre del cuestionario asociado a la lección
                                    String sqlCuestionario = "SELECT c.idCF, c.nombre "
                                            + "FROM lecciones l "
                                            + "JOIN CiertoFalso c ON l.nombreCFLeccion = c.nombre AND l.idCurso = c.idCurso "
                                            + "WHERE l.idLeccion = ? AND l.idCurso = ?";
                                    stmt = conn.prepareStatement(sqlCuestionario);
                                    stmt.setString(1, idLeccion);
                                    stmt.setInt(2, idCurso);
                                    rs = stmt.executeQuery();

                                    int idCuestionario = -1;

                                    if (rs.next()) {
                                        idCuestionario = rs.getInt("idCF");
                                        nombreCuestionario = rs.getString("nombre");
                                        cuestionarioEncontrado = true;
                                    }

                                    if (cuestionarioEncontrado) {
                                        // Obtener las respuestas correctas
                                        String sqlRespuestas = "SELECT idPRCF, respuesta FROM PRCiertoFalso WHERE idCF = ?";
                                        stmt = conn.prepareStatement(sqlRespuestas);
                                        stmt.setInt(1, idCuestionario);
                                        ResultSet rsRespuestas = stmt.executeQuery();

                                        // Crear un mapa de idPregunta a respuesta correcta
                                        while (rsRespuestas.next()) {
                                            int idPregunta = rsRespuestas.getInt("idPRCF");
                                            String respuestaCorrecta = rsRespuestas.getString("respuesta");
                                            respuestasCorrectas.put(idPregunta, respuestaCorrecta);
                                        }

                                        // Comprobar las respuestas del usuario si se han enviado
                                        if (request.getMethod().equalsIgnoreCase("POST")) {
                                            formularioEnviado = true; // El formulario ha sido enviado
                                            Map<String, String> respuestasUsuarioMap = new HashMap<>();

                                            // Recoger respuestas del formulario
                                            for (String preguntaId : request.getParameterMap().keySet()) {
                                                if (preguntaId.startsWith("respuesta_")) {
                                                    String respuesta = request.getParameter(preguntaId);
                                                    int idPregunta = Integer.parseInt(preguntaId.substring(preguntaId.indexOf('_') + 1));
                                                    respuestasUsuarioMap.put(String.valueOf(idPregunta), respuesta);
                                                }
                                            }

                                            // Comparar las respuestas con las correctas
                                            for (Map.Entry<Integer, String> entry : respuestasCorrectas.entrySet()) {
                                                int idPregunta = entry.getKey();
                                                String respuestaCorrecta = entry.getValue();
                                                String respuestaUsuario = respuestasUsuarioMap.get(String.valueOf(idPregunta));

                                                respuestasUsuario.put(idPregunta, respuestaUsuario);
                                            }
                                        }
                            %>
                            <div class="bg-white rounded-lg shadow-md p-6">
                                <h3 class="text-center text-lg font-bold"><%= nombreCuestionario%></h3>
                                <form method="post">
                                    <input type="hidden" name="idCuestionario" value="<%= idCuestionario%>">
                                    <div class="mt-4">
                                        <%
                                            // Obtener las preguntas del cuestionario
                                            String sqlPreguntas = "SELECT idPRCF, pregunta FROM PRCiertoFalso WHERE idCF = ?";
                                            stmt = conn.prepareStatement(sqlPreguntas);
                                            stmt.setInt(1, idCuestionario);
                                            rs = stmt.executeQuery();

                                            while (rs.next()) {
                                                int idPregunta = rs.getInt("idPRCF");
                                                String pregunta = rs.getString("pregunta");
                                                String resultado = "";
                                                String respuestaUsuario = respuestasUsuario.get(idPregunta);
                                                if (formularioEnviado) {
                                                    boolean esCorrecta = respuestasCorrectas.get(idPregunta).equals(respuestaUsuario);
                                                    resultado = esCorrecta ? "Correcto" : "Incorrecto";
                                                }
                                        %>
                                        <div class="mb-4">
                                            <p class="font-medium"><%= pregunta%></p>
                                            <div class="flex items-center space-x-4">
                                                <label>
                                                    <input type="radio" name="respuesta_<%= idPregunta%>" value="cierto" required
                                                           <%= (respuestaUsuario != null && "cierto".equals(respuestaUsuario)) ? "checked" : ""%> >
                                                    Cierto
                                                </label>
                                                <label>
                                                    <input type="radio" name="respuesta_<%= idPregunta%>" value="falso" required
                                                           <%= (respuestaUsuario != null && "falso".equals(respuestaUsuario)) ? "checked" : ""%> >
                                                    Falso
                                                </label>
                                            </div>
                                            <% if (formularioEnviado) {%>
                                            <p style="font-weight: 800" class="text-left text-sm <%= resultado.equals("Correcto") ? "text-green-500" : "text-red-500"%>">
                                                <%= resultado%>
                                            </p>
                                            <% } %>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Enviar Respuestas</button>
                                    </div>
                                </form>
                            </div>
                            <%
                            } else {
                            %>
                            <div class="bg-white rounded-lg shadow-md p-6">
                                <h3 class="text-center text-lg font-bold">No se encontró un cuestionario asociado a esta lección.</h3>
                            </div>
                            <%
                                    }
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

                        </div>
                    </div>

                    <div class="bg-white rounded-lg shadow-md p-6" style="height: 450px;">
                        <h2 class="accordion-header" id="headingVideos">
                            <button class="accordion-button" type="button">
                                Flash Cards
                            </button>
                        </h2>
                        <div>
                            <%
                                List<Map<String, String>> flashcards = new ArrayList<>();

                                try {
                                    conn = conexionBD.conectar();

                                    String sql = "SELECT fc.pregunta, fc.respuesta "
                                            + "FROM FlashCards fc "
                                            + "INNER JOIN FlashCardsLecciones fcl ON fc.idFC = fcl.idFCL "
                                            + "WHERE fcl.idLeccion = ? LIMIT 6";
                                    stmt = conn.prepareStatement(sql);
                                    stmt.setString(1, idLeccion);
                                    rs = stmt.executeQuery();

                                    while (rs.next()) {
                                        Map<String, String> flashcard = new HashMap<>();
                                        flashcard.put("pregunta", rs.getString("pregunta"));
                                        flashcard.put("respuesta", rs.getString("respuesta"));
                                        flashcards.add(flashcard);
                                    }
                                } catch (SQLException e) {
                                    out.println("<p>Error al recuperar las flashcards: " + e.getMessage() + "</p>");
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

                            <div class="flashcards-container">
                                <%
                                    for (Map<String, String> flashcard : flashcards) {
                                        String pregunta = flashcard.get("pregunta");
                                        String respuesta = flashcard.get("respuesta");
                                %>
                                <div class="flashcard">
                                    <label class="flashcard-question">
                                        <input type="checkbox" class="toggle-answer">
                                        <div class="pregunta">
                                            <p><%= pregunta%></p>
                                        </div>
                                        <div class="respuesta">
                                            <p><%= respuesta%></p>
                                        </div>
                                    </label>
                                </div>
                                <% } %>
                            </div>






                        </div>
                    </div>     

                </div>
            </div>

            <%
                } catch (SQLException e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    // Cerrar ResultSets y Statements
                    if (rsLecciones != null) try {
                        rsLecciones.close();
                    } catch (SQLException ignore) {
                    }
                    if (videoRs != null) try {
                        videoRs.close();
                    } catch (SQLException ignore) {
                    }
                    if (audioRs != null) try {
                        audioRs.close();
                    } catch (SQLException ignore) {
                    }
                    if (archivoRs != null) try {
                        archivoRs.close();
                    } catch (SQLException ignore) {
                    }
                    if (leccionesStmt != null) try {
                        leccionesStmt.close();
                    } catch (SQLException ignore) {
                    }
                    if (videoStmt != null) try {
                        videoStmt.close();
                    } catch (SQLException ignore) {
                    }
                    if (audioStmt != null) try {
                        audioStmt.close();
                    } catch (SQLException ignore) {
                    }
                    if (archivoStmt != null) try {
                        archivoStmt.close();
                    } catch (SQLException ignore) {
                    }
                    bd.cierraConexion();
                }
            %>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        </div>
    </body>
</html>
