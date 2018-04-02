$(document).ready (function () {
    $('#systemLog').DataTable({
        dom: 'lBfrtip',
        buttons: [
            {
                extend : "copyHtml5",
                title: 'FONG BROS SYSTEM LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY")
            },
            {
                extend : "excelHtml5",
                title: 'FONG BROS SYSTEM LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY")
            },
            {
                extend : "csvHtml5",
                title: 'FONG BROS SYSTEM LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY")
            },
            {
                extend : "pdfHtml5",
                title: 'FONG BROS SYSTEM LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY"),
                download: 'open'
            },
            {
                extend : "print",
                title : "",
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY"),
                customize : function (win) {
                    $(win.document.body).prepend("<h1> <img class = 'mr-2' src = '" + window.location.origin + "/FBExportSystem/resources/company-logo.png' width = '50' height = '50' /> FONG BROS SYSTEM LOGS </h1>");
                }
            }
        ],
        "order" : [],
        "lengthMenu" : [5, 10, 25]
    });

     $('#userAccessLog').DataTable({
        dom: 'lBfrtip',
        buttons: [
            {
                extend : "copyHtml5",
                title: 'FONG BROS USER ACCESS LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY")
            },
            {
                extend : "excelHtml5",
                title: 'FONG BROS USER ACCESS LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY")
            },
            {
                extend : "csvHtml5",
                title: 'FONG BROS USER ACCESS LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY")
            },
            {
                extend : "pdfHtml5",
                title: 'FONG BROS USER ACCESS LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY"),
                download: 'open'
            },
            {
                extend : "print",
                title : "",
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY"),
                customize : function (win) {
                    $(win.document.body).prepend("<h1> <img class = 'mr-2' src = '" + window.location.origin + "/FBExportSystem/resources/company-logo.png' width = '50' height = '50' /> FONG BROS USER ACCESS LOGS </h1>");
                }
            }
        ],
        "order" : [],
        "lengthMenu" : [5, 10, 25]
    });
});