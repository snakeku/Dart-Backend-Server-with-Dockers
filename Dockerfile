FROM dart:stable

COPY . /dart-server

WORKDIR /dart-server

RUN mkdir build

EXPOSE 8080

RUN dart compile exe ./bin/dart_server.dart -o ./build/dart_server

CMD ["./build/dart_server"]

