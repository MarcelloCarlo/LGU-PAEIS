$(document).ready(function () {
    App.init();
    TableManageResponsive.init();
    FormWizardValidation.init();
    FormPlugins.init();

    $('#dateNCorpBussSECReg').datetimepicker({
        format: "DD-MM-YYYY",

    });
    $('#dateNCorpBussEstRentStart').datetimepicker({
        format: "DD-MM-YYYY",
    });

    $('#submitBtn').click(function () {
        swal.mixin({
            confirmButtonText: 'Next &rarr;',
            showCancelButton: true,
            progressSteps: ['1', '2']
        }).queue([{
            title: 'Terms & Conditions',
            text: 'Do you agree on the terms and conditions?'
        },
            'Confirm?',
        ]).then((result) => {
            if(result.value
    )
        {
            var applicationFormCorp = new FormData($('#applicationFormCorp')[0]);
            $.ajax({
                type: "POST",
                enctype: "multipart/form-data",
                url: "uploadCorpAppForm",
                data: applicationFormCorp,
                processData: false,
                contentType: false,
                success: function (response) {
                    swal({
                        type: 'success',
                        title: 'All Done!',
                        html: 'Your Reference Number (Save It!): <b>' + JSON.stringify(response) + '</b> Your Application is subject to evaluation, Wait for further instructions. Ensure that your inserted contact number is active/valid!',
                        confirmButtonText: 'Proceed'
                    }).then((result) => {
                        if(result.value
                )
                    {
                        var refx = "?refNo=" + response;
                        //$.get("BPLSRtSlip.jsp", { refNo:JSON.stringify(response)});
                        window.location.replace("BPLSRtSlip.jsp" + refx);
                    }
                })
                    ;
                },
                error: function () {
                    swal("error", "Process encountered an error", "error");
                }
            });
        }
    });
        return false;
    });
});