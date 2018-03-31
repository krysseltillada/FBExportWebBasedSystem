$(document).ready (function () {
    $('#systemLog').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ],
        "order" : [],
        "lengthMenu" : [5, 10, 25]
    });
});