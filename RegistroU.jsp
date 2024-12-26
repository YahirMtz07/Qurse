<%-- 
    Document   : RegistroU
    Created on : 15 oct. 2024, 07:32:14
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro</title>
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
                background-color: #007D5F;
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
                background-color: #ED9F03;
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

            .checkbox-btn {
                display: flex;
                align-items: first;
                margin-bottom: 15px;
                cursor: pointer;
                font-size: 16px;
                color: #333;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            .checkbox-btn input {
                position: absolute;
                opacity: 0;
                cursor: pointer;
                height: 0;
                width: 0;
            }

            .checkmark {
                position: relative;
                height: 25px;
                width: 25px;
                border: 2.5px solid #ffffff;
                border-radius: 5px;
                background-color: #ffffff;
                transition: background-color 0.2s linear, border 0.2s linear;
            }


            .checkbox-btn input:checked ~ .checkmark {
                background-color: #ffffff;
            }

            .checkmark:after {
                content: "";
                position: absolute;
                visibility: hidden;
                opacity: 0;
                left: 50%;
                top: 50%;
                width: 10px;
                height: 14px;
                border: solid #007D5F;
                border-width: 0 2.5px 2.5px 0;
                transform: translate(-50%, -50%) rotate(45deg);
                transition: visibility 0s, opacity 0.2s linear;
            }

            .checkbox-btn input:checked ~ .checkmark:after {
                visibility: visible;
                opacity: 1;
            }

            .checkbox-text {
                margin-bottom: 5px;
                text-align: center;
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
            function validarRegistro(event) {

                var nombre = document.getElementById('nombre').value.toLowerCase();
                var edad = document.getElementById('edad').value.toLowerCase();
                var correo = document.getElementById('correo').value.toLowerCase();
                var usuario = document.getElementById('usuario').value;
                var contrasena = document.getElementById('contrasena').value;
                var educador = document.getElementById('educador').value;
                const expresion = /^[a-zA-ZÀ-ÿ\s]+$/;
                const expresionLongitud = /^.{8,16}$/;
                function cumpleExpresion(texto) {
                    return expresion.test(texto);
                }
                function cumpleExpresionCorreo(correo) {
                    const regexCorreo = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                    return regexCorreo.test(correo);
                }

                if (nombre === "" || edad === "" || correo === "" || usuario === "" || contrasena === "") {
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

                if (!cumpleExpresion(nombre)) {
                    Swal.fire({
                        title: "Error!",
                        text: "El campos de nombre solo debe contener letras y espacios",
                        imageUrl: "imagenes/sixd.png",
                        imageWidth: 200,
                        imageHeight: 267,
                        imageAlt: "Perro"
                    });
                    return false;
                }

                if (isNaN(edad) || edad < 6 || edad > 100) {
                    Swal.fire({
                        title: "Error!",
                        text: "La edad debe estar entre 6 y 100 años.",
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

                if (educador === true) {
                    Swal.fire({
                        title: "EDUCADOR",
                        text: "¿Estas seguro que deseas ser educador?",
                        imageUrl: "imagenes/sixd.png",
                        imageWidth: 200,
                        imageHeight: 267,
                        imageAlt: "Perro"
                    });
                    return false;
                }

                return true;
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="left">
                <a href="index.jsp" class="btn regresar">Regresar</a>
                <h1 class="prompt-semibold">REGISTRO</h1>
                <%
                    String errorMsj = request.getParameter("error");
                    if (errorMsj != null && errorMsj.equals("ya_existe")) {
                %>

                <div>
                    <p style="color:red;">El correo que ingresaste ya tiene una cuenta existente</p>
                </div>

                <% }
                    errorMsj = "";
                %>
                <form class="needs-validation" action="Registro.jsp" method="post" onsubmit="validarRegistro(event)" id="formularioRegistro" novalidate>
                    <input type="text" id="nombre" name="nombre" placeholder="Nombre completo(Solo letras)" required>

                    <input type="number" id="edad" name="edad" placeholder="Edad" required>

                    <input type="email" id="correo" name="correo" placeholder="Correo" required>

                    <input type="text" id="usuario" name="usuario" placeholder="Usuario" required>

                    <input type="password" id="contrasena" name="contrasena" placeholder="Contraseña(8-16 carcateres)" required>

                    <label class="checkbox-btn">
                        <input type="checkbox" id="educador" name="educador" Value="edu"> 
                        <span style="margin-right:  10px;"  class="checkmark"></span>
                        &ZeroWidthSpace;Registrarse como educador
                    </label>

                    <button class="button">Registrarme</button>
                </form>
                <br>
                <p>Tienes una cuenta? <a style="color:#471D21" href="iniciods.jsp">Inicio de Sesión</a></p>
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
