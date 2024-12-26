
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.*"%>
<%@page import="conexion.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Integer idUser = (Integer) session.getAttribute("idUser");
    if (idUser == null) {
        response.sendRedirect("iniciods.jsp");
        return;
    }

    String idCurso = request.getParameter("idCurso");
    if (idCurso == null || idCurso.isEmpty()) {
        idCurso = (String) session.getAttribute("idCurso");
    }
    conexion bd = new conexion();
    ResultSet rs = null;
    PreparedStatement ps = null;
    String userRole = null;

    try {
        bd.conectar();

        
        String queryRole = "SELECT educador FROM Usuario WHERE idUser = ?;";
        ps = bd.conectar().prepareStatement(queryRole);
        ps.setInt(1, idUser);
        rs = ps.executeQuery();

        if (rs.next()) {
            userRole = rs.getString("educador");
        } else {
            response.sendRedirect("iniciods.jsp");
            return;
        }
        rs.close();
        ps.close();

        String queryCourse = "SELECT c.idCurso, c.nombreCurso, c.descripcion, c.categoria, c.publico, p.image "
                + "FROM informaciongeneralCursos c "
                + "LEFT JOIN portadasCursos p ON c.idCurso = p.idCurso "
                + "WHERE c.idCurso = ?;";
        ps = bd.conectar().prepareStatement(queryCourse);
        ps.setInt(1, Integer.parseInt(idCurso));
        rs = ps.executeQuery();

        if (rs.next()) {
            String nombreCurso = rs.getString("nombreCurso");
            String descripcion = rs.getString("descripcion");
            String categoria = rs.getString("categoria");
            String publico = rs.getString("publico");
            Blob imageBlob = rs.getBlob("image");
            String imageBase64 = null;

            if (imageBlob != null) {
                byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                imageBase64 = java.util.Base64.getEncoder().encodeToString(imageBytes);
            }


%>
<html>
    <head>
        <title>Detalles Curso</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="icon" type="image/png" href="imagenes/logo Qurse.png"/>
        <link href="https://fonts.googleapis.com/css2?family=Prompt:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="icon" type="image/png" href="imagenes/logo Qurse.png"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Prompt:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            orange: {
                                50: '#fff7ed',
                                100: '#ffedd5',
                                200: '#fed7aa',
                                300: '#fdba74',
                                400: '#fb923c',
                                500: '#f97316',
                                600: '#ea580c',
                                700: '#c2410c',
                                800: '#9a3412',
                                900: '#7c2d12',
                            },
                        },
                    },
                },
            }
        </script>
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


            
            h2 {
                color: #e67e22;
                margin-bottom: 20px;
            }
            .card-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
                margin: 20px 0;
                width: 100%;
                max-width: 1200px;
            }
            .card {
                background-color: white;
                border: 1px solid #ddd;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                padding: 20px;
                width: 200px;
                transition: transform 0.2s;
            }
            .card:hover {
                transform: scale(1.05);
            }
            .card h3 {
                color: #f39c12;
                margin: 0 0 10px;
            }
            .card a {
                display: block;
                text-decoration: none;
                color: #fff;
                padding: 10px;
                border-radius: 5px;
                margin-bottom: 5px;
                transition: background-color 0.3s;
            }
            .btn-detalle {
                background-color: #FF6D00;
            }
            .btn-detalle:hover {
                background-color: #ED9F03;
            }
            .btn-delete {
                background-color: #481c00;
            }
            .btn-delete:hover {
                background-color: #8B4513;
            }
            .btn-create {
                display: inline-block;
                text-decoration: none;
                color: white;
                background-color: #f96200;
                padding: 15px 30px;
                border-radius: 5px;
                font-size: 18px;
                margin-top: 20px;
                transition: background-color 0.3s;
            }
            .btn-agregaraCurso {
                background-color: #f39c12;
            }
            .btn-agregaraCurso:hover {
                background-color: #e67e22;
            }
            .btn-create:hover {
                background-color: #fb8700;
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
            body {
                font-family: 'Prompt', sans-serif;
                background-color: #fafaf6;
                margin: 0;
                padding-top: 80px;
            }

            .cont {
                display: flex;
                flex-direction: column;
                align-items: stretch;
                padding: 20px;
                min-height: 100vh;
                gap: 20px;
            }
            
            .RecDidac, .RecInf, .infoGeneral {
                background-color: #ffc24e;
                border: 2px solid #FFA000;
                border-radius: 15px;
                padding: 20px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                display: flex;
                flex-direction: column;
                
            }
            
            .infoGeneral{
                justify-content: space-between;
                
            }

            .RecDidac, .RecInf {
                flex: 1;
            }

            .infoGeneral {
                flex: 2;
            }

            @media (min-width: 768px) {
                .cont {
                    flex-direction: row;
                    flex-wrap: wrap;
                    justify-content: space-between;
                }

                .RecDidac, .RecInf {
                    width: calc(25% - 10px);
                }

                .infoGeneral {
                    width: calc(50% - 20px);
                }
            }

            @media (min-width: 1024px) {
                .RecDidac, .RecInf {
                    width: calc(20% - 10px);
                }

                .infoGeneral {
                    width: calc(60% - 20px);
                }
            }

            button {
                background-color: #FFA000;
                color: #BF360C;
                border: 1px solid #FF6F00;
                padding: 10px 15px;
                margin: 5px 0;
                border-radius: 5px;
                cursor: pointer;
                font-size: 20px;
                white-space: normal;
                word-wrap: break-word;
                transition: background-color 0.3s, transform 0.2s;
            }

            button:hover {
                background-color: #FFD54F;
                transform: translateY(-2px);
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
                z-index: 1000;
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

            .logo {
                width: auto;
                height: 80px;
            }

            .prompt-bold {
                font-family: "Prompt", sans-serif;
                font-weight: 700;
                font-style: normal;
                font-size: 40px;
                color: #481c00;
            }

            .prompt-semibold {
                font-family: "Prompt", sans-serif;
                font-weight: 600;
                font-style: normal;
            }

            .imgCurse {
                max-width: 100%;
                height: auto;
                border: 3px solid #FFA000;
                border-radius: 15px;
                margin-bottom: 15px;
            }

            .curso {
                position: fixed;
                bottom: 20px;
                right: 20px;
                padding: 15px;
                background-color: #fafaf6;
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transition: all 0.3s ease-in-out;
                cursor: pointer;
            }

            .curso:hover {
                transform: scale(1.05);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            }

           

        </style>
    </head>
    <body>
       <div class="Header">
        <div class="headerIzq">
            <button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                <img src="imagenes/menu_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" width="35" height="35" alt="alt"/>
            </button>
            <%                    LocalDate date = LocalDate.now();
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

        <div class="cont">
            <div class="RecDidac">
                <h2 class="prompt-bold" style="font-size: 24px; margin-bottom: 15px;">Agregar/Crear Recurso Didactico</h2>
                
                <button class="button button-item" onclick="window.location.href = 'verCuestionarios.jsp'">
                    <span class="button-bg">
                        <span class="button-bg-layers">
                            <span class="button-bg-layer button-bg-layer-1 -purple"></span>
                            <span class="button-bg-layer button-bg-layer-2 -turquoise"></span>
                            <span class="button-bg-layer button-bg-layer-3 -yellow"></span>
                        </span>
                    </span>
                    <span class="button-inner">
                        <span class="button-inner-static">Verdadero o Falso</span>
                        <span class="button-inner-hover">Verdadero o Falso</span>
                    </span>
                </button><br>
                
                <button class="button button-item" onclick="window.location.href = 'resultados.jsp'">
                    <span class="button-bg">
                        <span class="button-bg-layers">
                            <span class="button-bg-layer button-bg-layer-1 -purple"></span>
                            <span class="button-bg-layer button-bg-layer-2 -turquoise"></span>
                            <span class="button-bg-layer button-bg-layer-3 -yellow"></span>
                        </span>
                    </span>
                    <span class="button-inner">
                        <span class="button-inner-static">FlashCards</span>
                        <span class="button-inner-hover">FlashCards</span>
                    </span>
                </button><br>
                
            </div>
            <div class="infoGeneral">
                <div>
                    <% if (imageBase64 != null) {%>
                    <img class="imgCurse" src="data:image/jpeg;base64,<%= imageBase64%>" alt="Imagen del Curso">
                    <% } else { %>
                    <img class="imgCurse" src="placeholder.jpg" alt="Sin Imagen">
                    <% }%>
                </div>
                <h1 style="font-size:30px;" class="prompt-extrabold"><%= nombreCurso%></h1>
                <p><strong>Descripción:</strong> <%= descripcion%></p>
                <p><strong>Categoría:</strong> <%= categoria%></p>
                <p><strong>Publico:</strong> <%= publico%></p>
            </div>
            <div class="RecInf">
                <h2 class="prompt-bold" style="font-size: 24px; margin-bottom: 15px;">Agregar/Crear Recurso Informativo</h2>
                <button class="button button-item" onclick="window.location.href = 'audiosCursos.jsp'">
    <span class="button-bg">
        <span class="button-bg-layers">
            <span class="button-bg-layer button-bg-layer-1 -purple"></span>
            <span class="button-bg-layer button-bg-layer-2 -turquoise"></span>
            <span class="button-bg-layer button-bg-layer-3 -yellow"></span>
        </span>
    </span>
    <span class="button-inner">
        <span class="button-inner-static">Audio</span>
        <span class="button-inner-hover">Audio</span>
    </span>
</button><br>

<button class="button button-item" onclick="window.location.href = 'videosCursos.jsp'">
    <span class="button-bg">
        <span class="button-bg-layers">
            <span class="button-bg-layer button-bg-layer-1 -purple"></span>
            <span class="button-bg-layer button-bg-layer-2 -turquoise"></span>
            <span class="button-bg-layer button-bg-layer-3 -yellow"></span>
        </span>
    </span>
    <span class="button-inner">
        <span class="button-inner-static">Video</span>
        <span class="button-inner-hover">Video</span>
    </span>
</button><br>

<button class="button button-item" onclick="window.location.href = 'archivosCursos.jsp'">
    <span class="button-bg">
        <span class="button-bg-layers">
            <span class="button-bg-layer button-bg-layer-1 -purple"></span>
            <span class="button-bg-layer button-bg-layer-2 -turquoise"></span>
            <span class="button-bg-layer button-bg-layer-3 -yellow"></span>
        </span>
    </span>
    <span class="button-inner">
        <span class="button-inner-static">Archivo PDF</span>
        <span class="button-inner-hover">Archivo PDF</span>
    </span>
</button><br>
            </div>
        </div>

        <div class="curso" onclick="window.location.href = 'leccionesCursos.jsp'">
            <div class="prompt-extrabold" style="font-size: 25px;">
                <div style="font-size: 28px;">Lecciones</div>
            </div>
        </div>
    </body>
</html>
<%
        } else {
            out.println("<h2>Error: No se encontró el curso.</h2>");
        }
    } catch (SQLException e) {
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
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
        if (bd != null) {
            bd.cierraConexion();
        }
    }
%>
<% session.setAttribute("idCurso", idCurso);%>


