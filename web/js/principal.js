/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function iniciar() {
    boton1 = document.getElementsByClassName("modelos-boton-enlace");
    categorias = document.getElementsByClassName("modelos-nuevos-contenedor");
    fecha = document.getElementsByClassName("numeros");
    contador();
}
function llamada(algo) {

    if (algo.getAttribute("id") === "nada") {
        algo.setAttribute("id", "seleccionado");
        categoria(algo);
        /*bandera[indice]=true;*/
        for (var j = 0; j < boton1.length; j++) {
            if (boton1[j] !== algo ) {
                boton1[j].setAttribute("id", "nada");
            }
        }
    }
}
function categoria(cat){
    var categ;
    categ="modelos-nuevos-contenedor "+cat.querySelector(".modelos-boton").innerText.toLowerCase();
   /*if(categ=="MUJERES"){*/
        for(var k=0; k<categorias.length;k++){
            if(categ==categorias[k].getAttribute("class")){
                categorias[k].setAttribute("id", "activo");
            }
            else{
                categorias[k].setAttribute("id", "inactivo");
            }
        }
   /* }*/
    
}

function contador(){
    var ahora = new Date();
    var evento = new Date("2018-12-25");
    
    var tiempoActual = ahora.getTime();
    var tiempoEvento = evento.getTime();
    
    var tiempoRestante = tiempoEvento - tiempoActual;
    /* Math.floor() redondea un numero*/
    var s= Math.floor(tiempoRestante/1000);
    var m = Math.floor(s/60);
    var h = Math.floor(m/60);
    var d = Math.floor(h/24);
    
    h%=24;
    m%=60;
    s%=60;
    
    h = (h<10)? "0" + h:h;
    m = (m<10)? "0" + m:m;
    s = (s<10)? "0" + s:s;
    
    /*textContent tambien retorna los display none*/
    fecha[0].textContent =d;
    fecha[1].textContent =h;
    fecha[2].textContent =m;
    fecha[3].textContent =s;
    /*fecha[0].innerText =d;
    fecha[1].innerText =h;
    fecha[2].innerText =m;
    fecha[3].innerText =s;*/
    
    setTimeout(contador,1000);
    
}

window.addEventListener("load", iniciar, false);

