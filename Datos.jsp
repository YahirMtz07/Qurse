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

    conexion bd = new conexion();
    ResultSet rs = null;
    String userRole = null; 

    try {
        bd.conectar();
        String strQry = "SELECT educador FROM Usuario WHERE idUser = ?;";
        PreparedStatement stmt = bd.conectar().prepareStatement(strQry);
        stmt.setInt(1, idUser);
        rs = stmt.executeQuery();

        if (rs.next()) {
            userRole = rs.getString("educador");
        } else {
            response.sendRedirect("iniciods.jsp");
            return;
        }

    } catch (Exception e) {
        out.print(e.getMessage());
    } finally {
        if (rs != null) try {
            rs.close();
        } catch (SQLException ignore) {
        }
        if (bd != null) {
            bd.cierraConexion();
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Editar Informacion</title>
        <link rel="icon" type="image/png" href="imagenes/logo Qurse.png"/>
        <link href="https://fonts.googleapis.com/css2?family=Prompt:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Prompt:wght@400;700&display=swap" rel="stylesheet">
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

            .publicidad{

                width: 100%;
                height: 150px;
                background-color: black;
                font-family: "Prompt", sans-serif;
                font-weight: 800;
                font-style: normal;
                color: white;
                border-radius: 30px;
                font-size: 100px;
                text-align: center;
                display: flex;
                justify-content: center;
                align-content: center;
                margin-bottom: 50px;
            }

            .categorias{
                display: flex;
                justify-content: space-around;
                align-content: center;
                padding: 30px;

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
            button.Regresar{
                background-color: #fb8700;
                position: absolute;
                border-radius: 20px;
                cursor: pointer;
                top: 70px;
                left: 10px;
                width: 50px;
                height: 50px;
                z-index: 0;
            }

            button.Regresar:hover{
                box-shadow: 100px, 100px, 100px;
                transform: translateY(2px);
            }
            
            

            .IMG-Regresar{
                position: absolute;
                left: 1px;
                top: 1.5px;
                height: 45px;
                width: 45px;
            }

            div.nombre{
                background-color: #ffc74c;
                border-radius: 12px;
                width: 72%;
                height: 20%;
                position: fixed;
                top: 20%;
                right: 14%;
            }

            div.Correo{
                background-color: #ffc74c;
                border-radius: 12px;
                width: 72%;
                height: 20%;
                right: 14%;
                position: fixed;
                top: 42%;
            }


            div.Contra{
                background-color: #ffc74c;
                border-radius: 12px;
                width: 72%;
                height: 20%;
                right: 14%;
                position: fixed;
                top: 64%;
            }

            .contenedor{
                background-color: orange;
                height: 23%;
                font-size: 2.7vh;
                position: absolute;
                top: 10%;
                left: 3%;
                border-radius: 8px;
                padding-top: 0.5vh;
                padding-left: 1.5vh;
                padding-right: 1.5vh;
                font-family: 'Prompt', sans-serif;
                font-weight: 600;

            }

            div.usuario{
                position: absolute;
                height: 35%;
                top: 45%;
                left: 3%;
                right: 15%;
                font-size: 5vh;
                font-family: 'Prompt', sans-serif;
                font-weight: 600;
                overflow: hidden;
                text-overflow: ellipsis;

            }

            button.editar{
                background-color: #ffc74c;
                background-image: url(imagenes/Lapiz.png);
                background-size: cover;
                background-position: center;
                transition: background-image 0.3s ease;
                position: absolute;
                border-radius: 10px;
                cursor: pointer;
                top: 45%;
                right: 2%;
                padding-top: 0.1vh;
                padding-left: 0.1vh;
                padding-right: 1.5vh;
                width: 50px;
                height: 50px;
                border: 0;
            }
            button.editar:hover{
                background-color: #e8be3f;
                box-shadow: 100px, 100px, 100px;
                transform: translateY(2px);
            }

            button.editar.clickeado {
                background-image: url(imagenes/guardar.jpg) ;

            }


            .IMG-Lapiz{
                position: absolute;
                left: 12%;
                top: 0%;
                height: auto;
                width: 80%;
            }
            
            .boton-container {
                display: flex;
                justify-content: flex-end;
                width: 100%;
                top: 10px;
            }

            .CerrarSesion{
                position: absolute;
                top: 80px;
                right: 10px;
                padding: 10px 20px;
                background-color: #FF6D00;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            
            .CerrarSesion:hover {
                background-color: #ffc74c;
            }
            
            .boton-container button {
                position: absolute;
                top: 80px;
                right: 150px;
                padding: 10px 20px;
                background-color: #481c00;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .boton-container button:hover {
                background-color: #8B4513;
            }

            .IMG-Guardar{
                position: absolute;
                right: 12%;
                top: 0%;
                height: auto;
                width: 10%;
            }

            @media (max-width: 1250px) {
                div.nombre{
                    right: 8%;
                    width: 84%;
                }
                div.Correo{
                    right: 8%;
                    width: 84%;
                }
                div.Contra{
                    right: 8%;
                    width: 84%;
                }
            }


            @media (max-width: 750px) {
                div.nombre{
                    height: 150px;
                    width: 100%;
                    right: 0%;
                    left: 0%;
                    top: 100px;
                }
                div.Correo{
                    height: 150px;
                    width: 100%;
                    right: 0%;
                    left: 0%;
                    top: 275px;
                }
                div.Contra{
                    height: 150px;
                    width: 100%;
                    right: 0%;
                    left: 0%;
                    top: 450px;
                }


            }

            @media (max-width: 590px) {
                div.usuario{
                    font-size: 4vh;
                }
            }

            @media (max-width: 450px) {
                div.usuario{
                    font-size: 3.5vh;
                    top: 55%;
                }
                div.nombre{
                    height: 130px;
                }
            }

        </style>
    </head>
    <body>
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
         
        <%
            
            try {
                bd.conectar();
                String strQry = "SELECT * FROM Usuario WHERE idUser = ?;";
                PreparedStatement stmt = bd.conectar().prepareStatement(strQry);
                stmt.setInt(1, idUser);
                rs = stmt.executeQuery();

                if (rs.next()) {
        %>
        <button class="Regresar" onclick="goBack()"><img class="IMG-Regresar" src="imagenes/regresar.png" alt="Regresar"></button>
         <button class="CerrarSesion" onclick="cerrarSesion()">Cerrar Sesión</button>
        <form id="editForm" method="post" action="edita.jsp"> 
            <div class="boton-container">
                <button class="guardar" type="button" id="guardarButton">Guardar</button>
            </div>
            <div class="nombre">
                <div class="contenedor">Nombre:</div>
                <div class="usuario" contenteditable="false" id="usuario1"><%= rs.getString("nombre")%></div>
                <input type="hidden" name="Txtusuario" id="hiddenUsuario" />
                <button type="button" class="editar"></button>
            </div>
            <div class="Correo">
                <div class="contenedor">Correo Electrónico:</div>
                <div class="usuario" contenteditable="false" id="correo1"><%= rs.getString("correo")%></div>
                <input type="hidden" name="Txtcorreo" id="hiddenCorreo" />
                <button type="button" class="editar"></button>
            </div>
            <div class="Contra">
                <div class="contenedor">Contraseña:</div>
                <div class="usuario" contenteditable="false" id="contrasenia1"><%= rs.getString("contrasena")%></div>
                <input type="hidden" name="Txtcontrasenia" id="hiddenContrasenia" />
                <button type="button" class="editar"></button>
            </div>
        </form>

        <script>
            function goBack() {
                const userRole = '<%= userRole%>'; 
                if (userRole === 'si') {
                    window.location.href = 'indexEducador.jsp'; 
                } else {
                    window.location.href = 'indexAprendiz.jsp'; 
                }
            }
             function cerrarSesion() {
                window.location.href = 'logout.jsp';
            }

            const botones = document.querySelectorAll('.editar');
            botones.forEach((boton) => {
                boton.addEventListener('click', () => {
                    boton.classList.toggle('clickeado');
                });
            });

            const editButtons = document.querySelectorAll('.editar');
            const guardarButton = document.getElementById('guardarButton');

            editButtons.forEach((button) => {
                button.addEventListener('click', () => {
                    const editableDiv = button.parentElement.querySelector('.usuario');
                    const isEditable = editableDiv.isContentEditable;

                    editableDiv.contentEditable = !isEditable;

                    if (isEditable) {
                        editableDiv.blur();
                    }
                });
            });

            guardarButton.addEventListener('click', () => {
                const usuarioDiv = document.getElementById('usuario1');
                const correoDiv = document.getElementById('correo1');
                const contraseniaDiv = document.getElementById('contrasenia1');

                const usuarioNuevo = usuarioDiv.innerText.trim();
                const correoNuevo = correoDiv.innerText.trim();
                const contraseniaNueva = contraseniaDiv.innerText.trim();

                if (usuarioNuevo === "") {
                    alert("El nombre no puede estar vacío.");
                    return;
                }
                if (correoNuevo === "") {
                    alert("El correo no puede estar vacío.");
                    return;
                }
                if (contraseniaNueva === "") {
                    alert("La contraseña no puede estar vacía.");
                    return;
                }

                const correoRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!correoRegex.test(correoNuevo)) {
                    alert("Por favor, ingrese un correo electrónico válido.");
                    return;
                }

                if (contraseniaNueva.length < 8 || contraseniaNueva.length > 16) {
                    alert("La contraseña debe tener entre 8 y 16 caracteres.");
                    return;
                }

                document.getElementById('hiddenUsuario').value = usuarioNuevo;
                document.getElementById('hiddenCorreo').value = correoNuevo;
                document.getElementById('hiddenContrasenia').value = contraseniaNueva;

                document.getElementById('editForm').submit();
            });
        </script>
        <%
                }
                rs.close();
                bd.cierraConexion();

            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
    </body>
</html>
