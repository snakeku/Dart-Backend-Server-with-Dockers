import 'dart:io';

const String serverName = 'dartServer';
const int port = 8080;

Future<void> main() async {
  // listen on any ip address on port 8080
  final server = await HttpServer.bind(InternetAddress.anyIPv4, port);
  print('Server started: ${server.address} port ${server.port}');

  // Handle Requests
  await for (HttpRequest request in server) {
    // Set Response Headers
    request.response
      ..headers.set('Content-Type', 'text/plain')
      ..headers.set('Server', serverName)
      ..write('Hello World');

    // Close the Response
    await request.response.close();
  }
}
