$(document).ready(function () {

    function printlayer(){
            var data = $('#printableArea').html();
            var css = $("head").html();

            var mywindow = window.open();
            mywindow.document.write("<html><head>" + css + "</head><body>" + data+"</body></html>");

            mywindow.setTimeout(function(){
              mywindow.print();
              mywindow.close();
            }, 1000);
    }

    $("#btnPrintReceipt").click(function () {
        printlayer();
    });

});