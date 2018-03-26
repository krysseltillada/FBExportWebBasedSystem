$(document).ready(function () {

    function connect() {
        var socket = new SockJS('/FBExportSystem/admin/notification');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function(frame) {
            
            console.log('Connected: ' + frame);
            stompClient.subscribe('/topic/notification', function(response){
              
                var notification = JSON.parse(response.body);

                iziToast.info({
                    title: 'Hello',
                    message: 'Welcome!',
                });
                
            });

        }, function (message) {
            console.log(message + " ERROR TNG INA");
            connect();
        });

    }
    
    connect();

});