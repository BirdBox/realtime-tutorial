#!/usr/bin/env node

var http = require('http'),
    sockjs = require('sockjs'),
    warble = sockjs.createServer();

warble.on('connection', function(conn) {
  console.log('Got connection');
  conn.on('data', function(message) {
    console.log('Got data: ' + message);
    conn.write(message);
  });
  conn.on('close', function() {
    console.log('Lost connection');
  });
});

var server = http.createServer();
warble.installHandlers(server, {prefix:'/warble'});
server.listen(5555, '0.0.0.0');
