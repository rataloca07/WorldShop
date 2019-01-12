/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var config = {
    apiKey: "AIzaSyA_ofnnL-cNgugdJqWmCsk4gkjSr83Xc1I",
    authDomain: "worldshop-7d480.firebaseapp.com",
    databaseURL: "https://worldshop-7d480.firebaseio.com",
    projectId: "worldshop-7d480",
    storageBucket: "worldshop-7d480.appspot.com",
    messagingSenderId: "100885795718"


};
firebase.initializeApp(config);

function inicializar() {
    imagen = document.querySelector("#direccion").value;
    nombre = "";
    fileButton = document.getElementById('imagen');
    cancelar = document.querySelector(".cancelar");

    cancelar.addEventListener("click", function (e) {
        e.preventDefault();
        console.log("Nombre: " + nombre);
        if (nombre !== "") {
            var storage = firebase.storage();
            storageRef = storage.ref('');
            storageRef.child("usuario/" + nombre).delete().then(() => {
                console.log('delete success');
                document.querySelector(".foto").style.backgroundImage = "url('')";
            }).catch((error) => {
                console.log('delete error');
            });
        } else {
            alert("No se eliminó");
        }

    }, false);


    fileButton.addEventListener('change', function (e) {
        file = e.target.files[0];
        nombre = file.name;

        var storageRef = firebase.storage().ref();

        var task = storageRef.child('usuario/' + file.name).put(file);


        task.on('state_changed',
                function (snapshot) {
                    var percentage = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                    console.log(percentage);
                },
                function (error) {
                },
                function () {
                    storageRef.child('usuario/' + file.name).getDownloadURL().then(function (downloadURL) {
                        var foto = document.querySelector(".foto");
                        foto.style.backgroundImage = "url('" + downloadURL + "')";
                        document.querySelector("#direccion").value = downloadURL;
                        console.log('File available at', downloadURL);
                    }
                    );
                    var desertRef = firebase.storage().refFromURL(url);

                });
    });
}

window.onload = inicializar;