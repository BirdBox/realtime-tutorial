(function() {
  // Initialize the socket & handlers
  var connectToServer = function() {
    var warbleSocket = new SockJS('http://localhost:5555/warble');

    warbleSocket.onopen = function() {
      clearInterval(connectRetry);
      $('.connect-status')
        .removeClass('disconnected')
        .addClass('connected')
        .text('Connected');
    };

    warbleSocket.onmessage = function(e) {
      $('#warble-msg').text(e.data);
    };

    warbleSocket.onclose = function() {
      clearInterval(connectRetry);
      connectRetry = setInterval(connectToServer, 1000);
      $('.connect-status')
        .removeClass('connected')
        .addClass('disconnected')
        .text('Disconnected');
    };

    // Connect the text field to the socket
    $('.msg-sender').off('input').on('input', function() {
      warbleSocket.send($('.msg-sender input').val()); 
    });
  };

  var connectRetry = setInterval(connectToServer, 1000);
})();
