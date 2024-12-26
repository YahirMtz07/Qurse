<%-- 
    Document   : iniciods
    Created on : 15 oct. 2024, 08:28:55
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Inicio de Sesión</title>
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
                font-family: Prompt, sans-serif;
                padding: 0px;
            }

            .container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                align-items: center;
                height: 100vh;
                max-width: 100%;
                padding: 0px;
                margin: 0;
                box-sizing: border-box;
            }

            .left {
                background-color: #ED9F03;
                width: 50%;
                height: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .left h1 {
                color: #fff;
                font-size: 50px;
                margin-bottom: 20px;
            }

            .left form {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                width: 100%;
            }

            .left input {
                width: 50%;
                padding: 10px;
                margin-bottom: 20px;
                border: none;
                border-radius: 15px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .right {
                width: 50%;
                height: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .right img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            @media (max-width: 1200px) {
                .left {
                    width: 100%;
                }
                .right {
                    width: 100%;
                }
            }

            @media (max-width: 1024px) {
                .left {
                    width: 100%;
                }
                .right {
                    width: 0%;
                }
            }

            @media (max-width: 992px) {
                .left {
                    width: 100%;
                }
                .right {
                    width: 0%;
                }
            }

            @media (max-width: 768px) {
                .container {
                    flex-direction: column;
                }
                .left {
                    width: 100%;
                }
                .right {
                    width: 0%;
                }
            }

            @media (max-width: 480px) {
                .left {
                    padding: 10px;
                }
                .left input {
                    padding: 5px;
                }
                .left button {
                    padding: 5px;
                }
            }

            .button {
                display: inline-block;
                padding: 10px 20px;
                border: none;
                border-radius: 15px;
                background-color: #471D21;
                color: #fff;
                cursor: pointer;
                transition: 0.3s;
            }

            .button:hover {
                background-color: #3e8e41;
            }

            .button:active {
                transform: scale(0.9);
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            .button:focus {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            @keyframes button-click {
                0% {
                    transform: scale(0);
                }
                100% {
                    transform: scale(1);
                }
            }

            .regresar {
                position: fixed;
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
                background-color: #007D5F;
                color: white;
            }

            .regresar:active {
                transform: scale(0.9);
            }

            @keyframes pulsar {
                0% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.2);
                }
                100% {
                    transform: scale(1);
                }
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
        <script>
            function validar(event) {
                event.preventDefault();

                var correo = document.getElementById("correo").value;
                var contrasena = document.getElementById("contrasena").value;
                var expresionLongitud = /^.{8,16}$/;

                function cumpleExpresionCorreo(correo) {
                    const regexCorreo = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                    return regexCorreo.test(correo);
                }

                if (correo === "" || contrasena === "") {
                    Swal.fire({
                        title: "Error!",
                        text: "Llena los campos por favor",
                        imageUrl: "imagenes/sixd.png",
                        imageWidth: 200,
                        imageHeight: 267,
                        imageAlt: "Perro"
                    });
                    return false;
                }

                if (!cumpleExpresionCorreo(correo)) {
                    Swal.fire({
                        title: "Error!",
                        text: "El campo de correo electrónico debe tener un formato válido.",
                        imageUrl: "imagenes/sixd.png",
                        imageWidth: 200,
                        imageHeight: 267,
                        imageAlt: "Perro"
                    });
                    return false;
                }

                if (!expresionLongitud.test(contrasena)) {
                    Swal.fire({
                        title: "Error!",
                        text: "La contraseña debe tener al menos 8 caracteres y un máximo de 16",
                        imageUrl: "imagenes/sixd.png",
                        imageWidth: 200,
                        imageHeight: 267,
                        imageAlt: "Perro"
                    });
                    return false;
                }
                
                document.querySelector('.needs-validation').submit();
                return true;
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="left">
                <a href="index.jsp" class="btn regresar">Regresar</a>
                <h1 class="prompt-semibold">INICIO DE SESIÓN</h1>
                <%
                    String error = request.getParameter("error");
                    if (error != null && error.equals("no_existe_usuario")) {
                %>
                
                <div>
                    <p style="color:red;">El correo o la contraseña no existen</p>
                </div>
                
                <% }
                    error = "";
                %>
                <%
                    String cambioCorreo = request.getParameter("cambioCorreo");
                    if (cambioCorreo != null && cambioCorreo.equals("se_cambio")) {
                %>
                
                <div>
                    <p style="color:green;">Se ha cambiado el correo, profavor ingresa con tu nuevo correo</p>
                </div>
                
                <% }
                    cambioCorreo = "";
                %>
                
                <%
                    String cambioContrasenia = request.getParameter("cambioContrasenia");
                    if (cambioContrasenia != null && cambioContrasenia.equals("se_cambioC")) {
                %>
                
                <div>
                    <p style="color:green;">Se ha cambiado la contraseña, por favor ingresa con tu nueva contraseña</p>
                </div>
                
                <% }
                    cambioContrasenia = "";
                %>

                <form class="needs-validation" onsubmit="validar(event)" action="ValidarIDS.jsp" method="post" id="formularioIDS" novalidate>
                    <input type="email" id="correo" name="correo" placeholder="Correo" required>
                    <input type="password" id="contrasena" name="contrasena" placeholder="Contraseña" required>
                    <button class="button">Iniciar</button>
                </form>
                <br>
                <p>No tienes una cuenta? <a style="color:#471D21" href="RegistroU.jsp">Registro</a></p>
            </div>
            <div class="right">
                <img src="imagenes/perrito.jpg" alt="Perrito">
            </div>
        </div>
        <script>
            
            (function () {
                'use strict'

                var forms = document.querySelectorAll('.needs-validation')

                Array.prototype.slice.call(forms)
                        .forEach(function (form) {
                            form.addEventListener('submit', function (event) {
                                if (validarRegistro(event) === false) {
                                    event.preventDefault()
                                    event.stopPropagation()
                                }

                                form.classList.add('was-validated')
                            }, false)
                        })
            })()
        </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>
</html>
