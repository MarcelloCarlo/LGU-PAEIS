$(document).ready(function () {
    App.init();
    // LoginV2.init();
    $("#bplsBtn").click(function () {
        var formX = $("#newForm").val();
        if (formX === "nSing") {
            window.open("/BPLS/BPLSAplSglBus.jsp");
        } else if (formX === "nCorp") {
            window.open("/BPLS/BPLSAplCrpBus.jsp");
        } else if (formX === "Mtops") {
            window.open("/MTOPS/MTOPSMtrzdApl.jsp")
        } else if (formX === "rCorp") {

        }
    });

    $("#loginBtn").click(function () {
        console.log("Login On");
        var loginEmpForm = new FormData($('#loginEmpForm')[0]);
        $.ajax({
            type: "POST",
            url: "LoginServlet",
            data: loginEmpForm,
            processData: false,
            contentType: false,
            success: function (response) {
               window.location = response.url;
            },
            error: function (response) {
                swal({
                    type: 'error',
                    title: 'Login Failed!'
                });
            }
        });
    });
});