<%@page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Qurse</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            }

            .offcanvas {
                z-index: 1050;
            }

            .Header {
                z-index: 1040;
            }

            .header2 {
                z-index: 1030;
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

            body {
                font-family: 'Prompt', sans-serif;
            }
            .button-base {
                transition: all 200ms;
                box-shadow: 1px 1px 3px rgba(0,0,0,0.15);
            }
            .button-base:hover .text {
                color: transparent;
            }
            .button-base:hover .icon {
                width: 150px;
                transform: translateX(0);
            }
            .button-left .icon {
                border-left: 1px solid #c2410c;
            }
            .button-right .icon {
                border-left: 1px solid #15803d;
            }
            body {
                padding-top: 90px;
                justify-content: center;
                justify-items: center;
            }


            .button-base {
                width: 150px;
                height: 50px;
                cursor: pointer;
                display: flex;
                align-items: center;
                border: none;
                border-radius: 5px;
                box-shadow: 1px 1px 3px rgba(0,0,0,0.15);
                position: relative;
            }

            .button-base, .button-base span {
                transition: 200ms;
            }

            .button-base .text {
                transform: translateX(35px);
                color: white;
                font-weight: bold;
            }

            .button-base .icon {
                position: absolute;
                border-left: 1px solid transparent;
                transform: translateX(110px);
                height: 40px;
                width: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .button-base svg {
                width: 15px;
                fill: #eee;
            }

            .button-left {
                background: #481c00;
            }

            .button-left:hover {
                background: #9a3412;
            }

            .button-right {
                background: #FF6D00;
            }

            .button-right:hover {
                background: #ED9F03;
            }

            .button-left:hover .text {
                color: transparent;
            }

            .button-left:hover .icon {
                width: 150px;
                border-left: none;
                transform: translateX(0);
            }

            .button-right:hover .text {
                color: transparent;
            }

            .button-right:hover .icon {
                width: 150px;
                border-left: none;
                transform: translateX(0);
            }

            .button-left .icon {
                border-left: 1px solid #573203;
            }

            .button-right .icon {
                border-left: 1px solid #ED9F03;
            }

            body {
                font-family: 'Prompt', sans-serif;
                background-color: #FFD56A;
                margin: 0;
                padding-top: 80px;
            }



            .header2 {
                position: absolute;
                margin-top: 10px;
                left: 0;
                right: 0;
                z-index: 0;
                display: flex;
                justify-content: space-between;
                align-items: center;
                height: 60px;
                padding: 10px;
            }



            .btn {
                display: inline-flex;
                align-items: center;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .btn-orange {
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                font-weight: 600;
                text-align: center;
                text-decoration: none;
                background-color: #f97316;
                color: #ffffff;
                border: 2px solid #f97316;
                border-radius: 5px;
                transition: all 0.3s ease;
                cursor: pointer;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .btn-orange:hover {
                background-color: #fb923c;
                border-color: #fb923c;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .btn-orange:active {
                background-color: #ea580c;
                border-color: #ea580c;
                box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .btn-orange:focus {
                outline: none;
                box-shadow: 0 0 0 3px rgba(249, 115, 22, 0.4);
            }


            .btn-orange-outline {
                background-color: transparent;
                color: #f97316;
            }

            .btn-orange-outline:hover {
                background-color: #fff7ed;
                color: #ea580c;
            }

            .btn-orange-outline:active {
                background-color: #ffedd5;
                color: #c2410c;
            }

            .btn-cancel {
                background-color: #ea580c;
                color: white;
            }

            .btn-cancel:hover {
                background-color: #c2410c;
            }

            .btn-save {
                background-color: #16a34a;
                color: white;
            }

            .btn-save:hover {
                background-color: #15803d;
            }

            .btn-icon {
                margin-left: 10px;
            }

            .main-content {
                padding: 40px 0;
            }

            .page-title {
                font-size: 2.5rem;
                color: #9a3412;
                text-align: center;
                margin-bottom: 40px;
            }

            .course-form {
                max-width: 800px;
                margin: 0 auto;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-label {
                display: block;
                margin-bottom: 5px;
                color: #9a3412;
                font-weight: 500;
            }

            .form-input,
            .form-textarea,
            .form-select {
                width: 100%;
                padding: 10px;
                border: 1px solid #fdba74;
                border-radius: 5px;
                font-family: 'Prompt', sans-serif;
            }

            .form-input:focus,
            .form-textarea:focus,
            .form-select:focus {
                outline: none;
                border-color: #f97316;
                box-shadow: 0 0 0 2px rgba(249, 115, 22, 0.2);
            }

            .image-upload-area {
                border: 2px dashed #fdba74;
                border-radius: 5px;
                padding: 20px;
                text-align: center;
            }

            .upload-icon {
                width: 48px;
                height: 48px;
                margin-bottom: 10px;
                color: #f97316;
            }

            .upload-label {
                color: #ea580c;
                cursor: pointer;
            }

            .upload-label:hover {
                text-decoration: underline;
            }

            .upload-info {
                font-size: 0.875rem;
                color: #9a3412;
            }

            .hidden-input {
                display: none;
            }
            .logo {
                width: auto;
                height: 80px;
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



        </style>
    </head>
    <body >
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
        <div class="container mx-auto px-4">

            <div class="header2">
                <div class="header2izq" >
                    <button class="button-base button-left noselect" onclick="window.location.href = 'MisCursosEducador.jsp'">
                        <span class="text">Cancelar</span>
                        <span class="icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path d="M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z"></path>
                            </svg>
                        </span>
                    </button>
                </div>

                <div class="header2der">
                    <button class="button-base button-right noselect" id="botonEnviar">
                        <span class="text">Guardar</span>
                        <span class="icon">
                            <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 -960 960 960" width="24">
                            <path d="M382-200 113-469l97-97 172 173 369-369 97 96-466 466Z"/>
                            </svg>
                        </span>
                    </button>
                </div>
            </div>
            <br><br>
            <main class="mt-8">
                <h1 class="text-4xl font-bold text-orange-800 mb-8 text-center">Crear Curso</h1>
                <form action="upload" method="post" enctype="multipart/form-data" id="FormularioImage" class="max-w-2xl mx-auto space-y-6" style="margin-bottom: 20px;">
                    <div class="space-y-2">
                        <label for="inputFile" class="block text-sm font-medium text-orange-700">Imagen del curso</label>
                        <div class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-orange-300 border-dashed rounded-md">
                            <img src="img.png" id="image" class="max-h-64 rounded hidden">
                            <div class="space-y-1 text-center" id="uploadPlaceholder">
                                <svg class="mx-auto h-12 w-12 text-orange-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                                <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                </svg>
                                <div class="flex text-sm text-orange-600">
                                    <label for="inputFile" style="padding:5px;" class="relative cursor-pointer bg-white rounded-md font-medium text-orange-600 hover:text-orange-500 focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-orange-500">
                                        <span>Subir una imagen</span>
                                        <input id="inputFile" name="image" type="file" class="sr-only" accept="image/png,image/jpeg" required>
                                    </label>
                                </div>
                                <p class="text-xs text-orange-500">PNG, JPG hasta 10MB</p>
                            </div>
                        </div>
                    </div>

                    <div>
                        <label for="TituloCurso" class="block text-sm font-medium text-orange-700">Título del Curso:</label>
                        <input type="text" name="TituloCurso" id="TituloCurso" class="mt-1 block w-full rounded-md border-orange-300 shadow-sm focus:border-orange-500 focus:ring-orange-500">
                    </div>

                    <div>
                        <label for="DescripcionCurso" class="block text-sm font-medium text-orange-700">Descripción del Curso:</label>
                        <textarea name="DescripcionCurso" id="DescripcionCurso" rows="3" class="mt-1 block w-full rounded-md border-orange-300 shadow-sm focus:border-orange-500 focus:ring-orange-500"></textarea>
                        <p id="descripcionError" class="text-xs text-red-500 hidden">La descripción no puede superar los 1000 caracteres.</p>
                    </div>

                    <div>
                        <label for="categoria" class="block text-sm font-medium text-orange-700">Seleccione una categoría:</label>
                        <select id="categoria" name="categoria" class="mt-1 block w-full rounded-md border-orange-300 shadow-sm focus:border-orange-500 focus:ring-orange-500">
                            <option value="Tecnologia y Programacion">Tecnología y Programación</option>
                            <option value="Ciencias y Matematicas">Ciencias y Matemáticas</option>
                            <option value="Negocios y Emprendimiento">Negocios y Emprendimiento</option>
                            <option value="Idiomas">Idiomas</option>
                            <option value="Artes y Creatividad">Artes y Creatividad</option>
                            <option value="Salud y Bienestar">Salud y Bienestar</option>
                            <option value="Ciencias Sociales y Humanidades">Ciencias Sociales y Humanidades</option>
                            <option value="Desarrollo Personal y Habilidades Blandas">Desarrollo Personal y Habilidades Blandas</option>
                            <option value="Marketing y Publicidad">Marketing y Publicidad</option>
                            <option value="Finanzas y Contabilidad">Finanzas y Contabilidad</option>
                            <option value="Ciencias de Datos e Inteligencia Artificial">Ciencias de Datos e Inteligencia Artificial</option>
                            <option value="Diseño y Multimedia">Diseño y Multimedia</option>
                            <option value="Negocios y Emprendimiento Digital">Negocios y Emprendimiento Digital</option>
                            <option value="Diseño Web y UX UI">Diseño Web y UX/UI</option>
                            <option value="Arte Digital e Ilustracion">Arte Digital e Ilustración</option>
                            <option value="Deportes y Entrenamiento Fisico">Deportes y Entrenamiento Físico</option>
                            <option value="Musica y Produccion Musical">Música y Producción Musical</option>
                            <option value="Gastronomia y Hospitalidad">Gastronomía y Hospitalidad</option>

                        </select>
                    </div>
                </form>

                <script>
                    document.addEventListener("DOMContentLoaded", () => {
                        const image = document.getElementById("image");
                        const uploadPlaceholder = document.getElementById("uploadPlaceholder");
                        const input = document.getElementById("inputFile");
                        const botonEnviar = document.getElementById('botonEnviar');
                        const tituloCurso = document.getElementById('TituloCurso');
                        const descripcionCurso = document.getElementById('DescripcionCurso');
                        const descripcionError = document.getElementById('descripcionError');
                        const categoria = document.getElementById('categoria');
                        const formularioImage = document.getElementById('FormularioImage');

                        botonEnviar.addEventListener('click', function () {
                            if (!input.files.length) {
                                alert("Por favor, selecciona una imagen antes de guardar.");
                                return;
                            }
                            if (tituloCurso.value.trim() === "") {
                                alert("Por favor, ingresa un título para el curso.");
                                return;
                            }
                            if (descripcionCurso.value.trim() === "") {
                                alert("Por favor, ingresa una descripción para el curso.");
                                return;
                            }
                            if (descripcionCurso.value.length > 1000) {
                                descripcionError.classList.remove('hidden');
                                return;
                            } else {
                                descripcionError.classList.add('hidden');
                            }
                            if (categoria.value.trim() === "") {
                                alert("Por favor, selecciona una categoría.");
                                return;
                            }

                            formularioImage.submit();
                        });

                        input.addEventListener("change", () => {
                            const file = input.files[0];
                            if (file) {
                                image.src = URL.createObjectURL(file);
                                image.classList.remove('hidden');
                                uploadPlaceholder.classList.add('hidden');
                            } else {
                                alert("No se pudo cargar la imagen");
                            }
                        });

                        descripcionCurso.addEventListener('input', () => {
                            if (descripcionCurso.value.length > 1000) {
                                descripcionError.classList.remove('hidden');
                            } else {
                                descripcionError.classList.add('hidden');
                            }
                        });
                    });
                </script>
                </body>
                </html>