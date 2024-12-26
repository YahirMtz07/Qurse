<%@page import="java.time.LocalDate"%>
<%@page import="conexion.conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Qurse</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="imagenes/logoQurse.png"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Prompt:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <style>


            body {
                padding-top: 80px;
                align-content: start;
                background-color: #FFD56A;
                
            }
            body::-webkit-scrollbar {
                width:10px;
                height: 10px;
                background-color: #ED9F03;

            }
            
            
            body::-webkit-scrollbar-thumb {
                border-radius: 15px;
                background-color: #481c00;
                
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



            .textoBienvenida {
                font-family: "Prompt", sans-serif;
                font-weight: 800;
                font-style: normal;
                font-size: 10vw;
                color: #FF6D00;
                justify-content: center;
                align-content: center;
                display: flex;
                margin-left: 20px;
                margin-right: 20px;
                text-align: center;
            }

             .cursoIzq{
                padding: 10px;
                border-radius: 25px;
                border: #ED9F03 solid 5px;
                float: left;
                display: flex;
                align-content: center;
                margin: 20px;
                 width: 97%;
                justify-content: left;
                text-align: left;
                box-shadow: none;
                transition: all 0.5s ease-in-out;
                padding: 10px;
            }
            
            .cursoDer{
                background-color: #FFD56A;
                border-radius: 25px;
                border: #ED9F03 solid 5px;
                float: right;
                display: flex;
                align-content: center;
                margin: 20px;
                padding-left:20px;
                width: 97%;
                justify-content:right;
                text-align: end;
                padding: 10px;
                box-shadow: none;
                transition: all 0.5s ease-in-out;

            }

            .cursoDer:hover,.cursoIzq:hover{
                padding: 20px;
                border: #FF6D00 solid 5px;
                border-radius: 25px;
                cursor: pointer;
                transition: .5s;
                -webkit-box-shadow: 10px 10px 30px 3px rgba(237, 159, 3, 0.67);
                -moz-box-shadow: 10px 10px 30px 3px rgba(237, 159, 3, 0.67);
                box-shadow: 10px 10px 30px 3px rgba(237, 159, 3, 0.67);
            }

           

            .imagenCurso {
                width: 100%;
                max-width: 400px;
                height: auto;
                border-radius: 15px;
                border: #481c00 solid 5px;
            }

            .logo {
                width: auto;
                height: 80px;
            }
        

            .limite-texto {
                text-align: justify;
                width: 90%;
                line-height: 1.5;
                max-height: 9.9em;
                overflow: hidden;
                text-overflow: ellipsis;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 11;
                display: inline-block;

            }

            .categorias::-webkit-scrollbar {
                background-color: transparent;
                 height: 10px;
                 border-radius: 100px;
            }
            .categorias::-webkit-scrollbar-thumb {

                background-color: #481c00;
                border-radius: 10px;

            }
            .categorias::-webkit-scrollbar-thumb:hover {
                cursor: grab;
            }
            .categorias::-webkit-scrollbar-thumb:active {
                cursor: grabbing;
            }


            .categorias{
                overflow-x: auto;
                background-color: #ED9F03;
                border-radius: 10px 10px 10px 10px;
                display: flex;
                justify-content: space-around;
                align-content: center;
                padding: 10px;
                max-width: 100%;
                margin-bottom: 10px;
            }

            .categoria{
                font-family: "Prompt", sans-serif;
                font-weight: 600;
                font-style: normal;
                background-color: #481c00;
                padding: 5px;
                border-radius: 10px;
                color: white;
                min-width:200px; 
                justify-content: center;
                text-align: center;
                transition: all .5s;
                margin-left: 5px;
                margin-right: 5px;
                text-align: center;
                display: flex;
                align-items:  center;
            }
         
             .categoria:hover{
                
                background-color: #f96200;
                color: white;
                transition: all .5s;
                cursor: pointer;
            }
            
            .burger{
                background-color: #fff;
                height: 5px;
                width: 30px;
                margin: 3px;
                border-radius: 5px;
                position: relative;
                left: -6px;
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

                .categoria{
                    margin: 11px;
                    width: 90%;

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
                background-color: #481c00;
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


            .boton-menu{
                background-color:#ED9F03;
                display: flex;
                align-items: center;
                align-content: center;
                justify-content: center;
                border-radius: 0px 50px 50px 0px;
                width: 230px;
                transition: all 1s;
                margin-bottom: 5px;
                font-family: "Prompt", sans-serif;
                font-weight: 700;
                font-style: normal;
                color: #481c00;
                padding: 10px;
            }

            .boton-menu:hover{
                cursor: pointer;
                background-color:#FFD54F;
                transition: all 1s;
                width: 287px;
                
            }

        </style>
    </head>
    <body>
        <div class="Header">
            <div class="headerIzq">
                <button style="background-color: #481c00; max-width: 50px;height: 40px;" class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                    <div class="burger"></div>
                    <div class="burger"></div>
                    <div class="burger"></div>
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
                <div class="prompt-bold">Qurse</div>
            </div>
            <div class="headerDerecha">

                <a onclick="window.location.href = 'iniciods.jsp'" class="btn regresar">Iniciar Sesion</a>

            </div>
            <div style="background-color:#FFD56A;  width: 300px; margin: 0px; " class="offcanvas offcanvas-start" tabindex="-9" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                <div class="offcanvas-header" style="background-color: #ED9F03; display: flex; align-: center; height: 60px; margin-bottom: 20px;">
                    <h2 style="color:#481c00; padding-top: 10px;" class="prompt-extrabold" id="offcanvasExampleLabel">Navegador</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body"  style=" padding: 0px; margin: 0px;">


                    <div class="boton-menu" onclick="window.location.href = 'index.jsp'">
                        <div>Pagina Principal</div>
                    </div>
                    <div class="boton-menu" onclick="window.location.href = 'iniciods.jsp'">
                        <div>Buscador de Cursos</div>
                    </div>
                    <div class="boton-menu" onclick="window.location.href = 'iniciods.jsp'">
                        <div>Mis Cursos</div>
                    </div>
                    <div class="boton-menu" onclick="window.location.href = 'iniciods.jsp'">
                        <div>Sala de Recompensas</div>
                    </div>




                </div>
            </div></div>
        <div class="container-fluid">

            <%
                Boolean isFirstVisit = (Boolean) session.getAttribute("visited");

                if (isFirstVisit == null || !isFirstVisit) {
            %>
            <div class="textoBienvenida"><p>Bienvenido</p></div>
            <%
                    session.setAttribute("visited", true);
                } else {

                }
            %>
            <nav>          
                <h2 class="prompt-extrabold" style=" color:#481c00; font-size: 20px; padding-left: 25px;">Categorias</h2>
                <div class="categorias">
                    <div  class="categoria" onclick="window.location.href = 'index.jsp'"><div>Todos</div></div>
                    <div  class="categoria" onclick="window.location.href = 'indexCatTecnologíayProgramación.jsp'"><div>Tecnología y Programación</div></div>
                    <div  class="categoria" onclick="window.location.href = 'indexCatCienciasyMatemáticas.jsp'"><div>Ciencias y Matemáticas</div></div>
                    <div  class="categoria" onclick="window.location.href = 'indexCatNegociosyEmprendimiento.jsp'"><div>Negocios y Emprendimiento</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatIdiomas.jsp'"><div>Idiomas</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatArtesyCreatividad.jsp'"><div>Artes y Creatividad</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatSaludyBienestar.jsp'"><div>Salud y Bienestar</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatCienciasSocialesyHumanidades.jsp'"><div>Ciencias Sociales y Humanidades</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatDesarrolloPersonalyHabilidadesBlandas.jsp'"><div>Desarrollo Personal y Habilidades Blandas</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatMarketingyPublicidad.jsp'"><div>Marketing y Publicidad</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatFinanzasyContabilidad.jsp'"><div>Finanzas y Contabilidad</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatCienciasdeDatoseInteligenciaArtificial.jsp'"><div>Ciencias de Datos e Inteligencia Artificial</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatDiseñoyMultimedia.jsp'"><div>Diseño y Multimedia</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatNegociosyEmprendimientoDigital.jsp'"><div>Negocios y Emprendimiento Digital</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatDiseñoWebyUXUI.jsp'"><div>Diseño Web y UX/UI</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatArteDigitaleIlustración.jsp'"><div>Arte Digital e Ilustración</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatDeportesyEntrenamientoFísico.jsp'"><div>Deportes y Entrenamiento Físico</div></div>
                    <div style="background-color: #FF6D00;" class="categoria" onclick="window.location.href = 'indexCatMúsicayProducciónMusical.jsp'"><div>Música y Producción Musical</div></div>
                    <div class="categoria" onclick="window.location.href = 'indexCatGastronomíayHospitalidad.jsp'"><div>Gastronomía y Hospitalidad</div></div>


                </div>
            </nav>  
            <div>
                <h2 class="prompt-extrabold" style="font-size: 50px; color:#481c00;">Cursos Qurse</h2>

                <%
                    conexion bd = new conexion();
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    boolean hasCourses = false;
                    boolean isRightAligned = true;

                    try {
                        bd.conectar();
                        String query = "SELECT c.idCurso, c.nombreCurso, c.descripcion, c.categoria, p.image "
                                + "FROM informaciongeneralCursos c "
                                + "LEFT JOIN portadasCursos p ON c.idCurso = p.idCurso where c.publico='si' and c.categoria='Música y Producción Musical'";
                        ps = bd.conectar().prepareStatement(query);
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

                            String cursoClass = isRightAligned ? "cursoDer" : "cursoIzq";
                            String cursoUrl = "detallesCurso.jsp?idCurso=" + idCurso + "&linkCurso=" + java.net.URLEncoder.encode(nombreCurso, "UTF-8");

                            
                            out.println("<a  href='" + cursoUrl + "' class='" + cursoClass + "' style='text-decoration: none; color: inherit;'>");

                            if (isRightAligned) {
                                out.println("<div class='prompt-medium' style='padding-right:10px; color:#481c00; '>");
                                out.println("<div class='prompt-extrabold' style='font-size: 35px; width:100%; justify-items: right;'><div style='background-color:#ED9F03; padding:6px; margin:5px; border-radius:15px;  margin-right:-1px;  width:fit-content;'>" + nombreCurso + "</div></div>");
                                out.println("<div class='limite-texto' style='color:white; font-weight: 600; width:fitcontent; background-color:#481c00; padding:10px; border-radius:15px;'>" + descripcion + "</div>");
                                out.println("<div class='prompt-extrabold' style='font-size: 20px; margin-bottom:5px;  width:100%; justify-items: right; '><div style='background-color:#ED9F03; border-radius:15px; padding:5px; margin-top:5px; width:fit-content;'><strong>Categoría:</strong> " + categoria + "</div></div>");
                                out.println("</div>");
                            }

                            if (imageBase64 != null) {
                                out.println("<img class='imagenCurso' src='data:image/jpeg;base64," + imageBase64 + "' alt='Imagen del curso'>");
                            } else {
                                out.println("<img class='imagenCurso' src='imagenes/cursoDefault.jpg' alt='Imagen por defecto'>");
                            }

                            if (!isRightAligned) {
                                 out.println("<div class='prompt-medium' style='padding-left:10px; color:#481c00; '>");
                                out.println("<div class='prompt-extrabold' style='font-size: 35px; width:100%; justify-items: left; '><div style='background-color:#ED9F03; padding:6px; margin:5px; border-radius:15px; width:fit-content; margin-left:-1px;'>" + nombreCurso + "</div></div>");
                                out.println("<div class='limite-texto' style='color:white; font-weight: 600; width:fitcontent; background-color:#481c00; padding:10px; border-radius:15px;'>" + descripcion + "</div>");
                                out.println("<div class='prompt-extrabold' style='font-size: 20px; margin-bottom:5px; width:100%; justify-items: left; '><div style='background-color:#ED9F03; border-radius:15px; padding:5px; margin-top:5px; width:fit-content;'><strong>Categoría:</strong> " + categoria + "</div></div>");
                                out.println("</div>");
                            }

                            out.println("</a>"); 

                            isRightAligned = !isRightAligned;
                        }

                        out.println("</div>");

                        if (!hasCourses) {
                            out.println("<div class='no-courses' style='text-align:center; font-size:20px; margin-top:20px;'>");
                            out.println("<p>No hay cursos disponibles para esta categoria por el momento.</p>");
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

            </div>

        </div>
    </body>
</html>
