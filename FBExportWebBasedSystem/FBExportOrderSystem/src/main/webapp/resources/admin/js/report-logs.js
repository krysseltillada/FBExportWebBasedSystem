$(document).ready (function () {
    $('#systemLog').DataTable({
        dom: 'lBfrtip',
        buttons: [
            {
                extend : "copyHtml5",
                title: 'FONG BROS SYSTEM LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY"),
                text : '<span>Copy</span> <i class="fa fa-copy ml-1" aria-hidden = "true"></i>',
				className : "border border-white bg-blue text-white rounded"
            },
            {
                extend : "excelHtml5",
                title: 'FONG BROS SYSTEM LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY"),
                text : '<span>Excel</span> <i class="fa fa-file-excel-o ml-1" aria-hidden = "true"></i>',
				className : "border border-white bg-blue text-white rounded"
            },
            {
                extend : "pdfHtml5",
                title: 'FONG BROS SYSTEM LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY"),
                text : '<span>PDF</span> <i class = "fa fa-file-excel-o ml-1" aria-hidden = "true"></i>',
				className : "border border-white bg-blue text-white rounded",
                download: 'open'
            },
            {
                extend : "print",
                title : "",
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY"),
                text : '<span>Print</span> <i class="fa fa-print ml-1" aria-hidden="true"></i>',
				className : "border border-white bg-blue text-white rounded",
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
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY"),
                text : '<span>Copy</span> <i class="fa fa-copy ml-1" aria-hidden = "true"></i>',
				className : "border border-white bg-blue text-white rounded"
            },
            {
                extend : "excelHtml5",
                title: 'FONG BROS USER ACCESS LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY"),
                text : '<span>Excel</span> <i class="fa fa-file-excel-o ml-1" aria-hidden = "true"></i>',
				className : "border border-white bg-blue text-white rounded"
            },
            {
                extend : "pdfHtml5",
                title: 'FONG BROS USER ACCESS LOGS',
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY"),
                text : '<span>PDF</span> <i class = "fa fa-file-excel-o ml-1" aria-hidden = "true"></i>',
				className : "border border-white bg-blue text-white rounded",
                download: 'open'
            },
            {
                extend : "print",
                title : "",
                messageBottom: "Report generated: " + moment(new Date()).format("MMMM D, YYYY"),
                text : '<span>Print</span> <i class="fa fa-print ml-1" aria-hidden="true"></i>',
				className : "border border-white bg-blue text-white rounded",
                customize : function (win) {
                    $(win.document.body).prepend("<h1> <img class = 'mr-2' src = '" + window.location.origin + "/FBExportSystem/resources/company-logo.png' width = '50' height = '50' /> FONG BROS USER ACCESS LOGS </h1>");
                }
            }
        ],
        "order" : [],
        "lengthMenu" : [5, 10, 25]
    });
});