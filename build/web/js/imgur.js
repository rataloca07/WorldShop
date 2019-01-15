$("document").ready(function () {

    $('input[type=file]').on("change", function () {

        var $files = $(this).get(0).files;

        if ($files.length) {


            if ($files[0].size > $(this).data("max-size") * 1024) {
                console.log("Please select a smaller file");
                return false;
            }

            var apiUrl = 'https://api.imgur.com/3/image';
            var apiKey = '105e1b877012b8f';

            var formData = new FormData();
            formData.append("image", $files[0]);

            var settings = {
                "async": true,
                "crossDomain": true,
                "url": apiUrl,
                "method": "POST",
                "datatype": "json",
                "headers": {
                    "Authorization": "Client-ID " + apiKey
                },
                "processData": false,
                "contentType": false,
                "data": formData,
                beforeSend: function (xhr) {
                    console.log("Uploading | 上传中");
                },
                success: function (res) {
                    var photo_hash = res.data.deletehash;
                    console.log(res.data.link);
                    var foto = document.querySelector(".foto");
                    foto.style.backgroundImage = "url('" + res.data.link + "')";
                    document.querySelector("#direccion").value = res.data.link;
                    console.log("Eliminar foto: " + photo_hash);
                },
                error: function () {
                    alert("Failed | 上传失败");
                }
            };
            $.ajax(settings).done(function (response) {
                console.log("Done | 成功");
            });
        }
    });
    $(".cancelar").on("click", function () {


        var apiUrl = 'https://api.imgur.com/3/image/83Ghm3WeZlvsgIg';
        var apiKey = '105e1b877012b8f';


        var settings = {
            "async": true,
            "crossDomain": true,
            "url": apiUrl,
            "method": "DELETE",
            "datatype": "json",
            "headers": {
                "Authorization": "Client-ID " + apiKey
            },
            "processData": false,
            "contentType": false,
            "data": false,
            success: function (res) {
                console.log("Eliminado");
            },
            error: function () {
                alert("Failed | 上传失败");
            }
        };
        $.ajax(settings).done(function (response) {
            console.log("Done | 成功");
        });
    });
});


