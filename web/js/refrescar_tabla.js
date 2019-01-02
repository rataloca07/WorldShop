/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*console.log("Esta bien integrado");*/

$(function () {
    $("tr td .eliminar").click(function (e) {
        var boton = $(this);
        var accion = boton.text();
        var id = boton.attr("id");
        console.log(accion);
        var path = location.pathname;
        console.log("Se elimino el producto: " + id);
        $.ajax({
            type: "get",
            /*url: "/worldshop2/Controlador_Carrito",*/
            url: path,

            data: {idproducto: id, accion: accion},
            success: function (r) {
                boton.parents("tr").remove();
            }
        });

    });
    $("tr td .modificar").click(function (event) {
        event.preventDefault();
        
        
        boton = $(this);
        id = boton.attr("href");
        var url = $(this).parent().parent().children("td:eq(1)").children("div:eq(0)").css("background-image");
        url = url.replace('url(', '').replace(')', '').replace(/\"/gi, "");
        var nombre = $(this).parent().parent().children("td:eq(2)").text();
        
        var precio = $(this).parent().parent().children("td:eq(3)").text();
        var descripcion = $(this).parent().parent().children("input:eq(0)").val();
        var cantidad = $(this).parent().parent().children("td:eq(4)").text();

        var altura_ventana = $("body").height();
        /* var table = document.getElementById ("ventana-modal");*/
        $(".respuesta-contenido #imagen-fondo div").css("background-image", "url('" + url + "')");
        $(".respuesta-contenido #nombre-producto").text(nombre);
        $(".respuesta-contenido #descripcion-producto-contenido").text(descripcion);
        $(".respuesta-contenido p #cantidad-producto").val(parseInt(cantidad));
        $(".respuesta").height(altura_ventana);
        $(".respuesta").css("display", "flex");

    });
    $(".respuesta .respuesta-contenido #guardar").click(function (e) {
        var path = location.pathname;
        var accion = "Actualizar";
        var cantidad = $(".respuesta .respuesta-contenido p input").val();
        $.ajax({
            type: "get",
            async: true,
            /*url: "/worldshop2/Controlador_Carrito",*/
            url: path,
            data: {idproducto: id, cantidad: cantidad, accion: accion},
            success: function (r) {
                boton.parent().parent().children("td:eq(4)").text(cantidad);
                $(".respuesta").hide();
            }
        });
    });

    $(".respuesta .respuesta-contenido #regresar").click(function (e) {
        $(".respuesta").hide();
    });

});


