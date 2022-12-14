# chat_app

- На данный момент реализовывается основной каркас мессенджера: отправка сообщений одного пользователя другому через сервер с кешированием данных на персональном устройстве.
## Отчет по build 0.2.1:
- Реализованы следующие модули:

### GRPC:
- Унарный метод передачи сообщения клиент-сервер.

### Чат менеджер:
- Отображение страницы профиля.
- Отображение страницы чатов, выбор чатов, сообщения.
- Отображение загрузки сообщения на сервер.

### SendManager:
- Работает отправка сообщения, запись в локальную базу и серверную базу.

### SignalService:
- Реализованы сигналы на основе изменения БД, подключение к интернету.

### StorageManager:
- Реализована инициализация локальной БД. При ее отсутствии создается локальная БД с первоначальными таблицами. Реализованы CRUD-операции. Реализована прослушивание изменение в локальной БД


## How it works:
После клонирования перед запуском прописываем в консоль:
- Вы должны находится в директории приложения
- `dart pub get` или `flutter pub get`
- Переходим в директорию сервера
- `cd \server`
- `dart pub get`

Генеация прото файла для клиента:
- `protoc -I .\proto\ .\proto\chats.proto --dart_out=grpc:./lib/src/generated/chats`
- `protoc -I .\proto\ .\proto\messages.proto --dart_out=grpc:./lib/src/generated/messages`
- `protoc -I .\proto\ .\proto\users.proto --dart_out=grpc:./lib/src/generated/users`
- `protoc -I ./proto/ ./proto/grpcsynh.proto --dart_out=grpc:./lib/src/generated/sync`

Генерация прото файла для сервера
- `protoc -I .\proto\ .\proto\chats.proto --dart_out=grpc:./server/lib/src/generated`
- `protoc -I .\proto\ .\proto\messages.proto --dart_out=grpc:./server/lib/src/generated`
- `protoc -I .\proto\ .\proto\users.proto --dart_out=grpc:./server/lib/src/generated`
- `protoc -I ./proto/ ./proto/grpcsynh.proto --dart_out=grpc:./lib/src/generated/sync`

Запуск gRPC сервера:
- Вы должны находится в директории `flutter_chap_app`
- `dart .\server\bin\server.dart`

Запуск REST сервера:
- Вы должны находится в директории `flutter_chap_app`
- `dart .\server\bin\restApi\rest_server.dart`

Можем запускать приложение:
- Вы должны находится в директории `flutter_chap_app`
- `flutter run` 

При ошибках с grpc или Базой: 
Проверьте что база создана (Создается на каждом пк отдельно, тк файлики `.dart_tool` в `.gitignore`)

Для проверки успешной записи в базу раскомментировать нужные строки(создать базу) в файле:
`\server\lib\src\test_db\test.dart`

Запуск проверки серверной бд:
`dart .\server\lib\src\test_db\test.dart`

### Запуск приложения 
Каждый шаг выполнять в отдельной консоли, не закрывая предыдущие.

1. Запустить [gRPC сервер](#запуск-grpc-сервера)
2. Запустить [REST сервер](#запуск-rest-сервера)
3. Запустить клиент (`flutter run`)

#### Запуск gRPC сервера

1. [Открыть консоль bash](#как-запустить-консоль-bash-в-windows-visual-studio-code)

2. В консоли из директории приложения запустить команду `./run_server.sh`.

![image ./run_server.sh](assets/images/for_readme/20221210145111.png)

Скрипт запустит pub get как для основного приложения, так и для сервера; сгенерирует protoc для grpc; запустит сервер в консоли).

![image resolving dependences](assets/images/for_readme/20221210145136.png)


#### Запуск REST сервера

1. Открыть консоль bash.

![image bash terminal is opened](assets/images/for_readme/20221210145042.png)

2. Запустить команду `./run_rest_server.sh 

![image open new terminal](assets/images/for_readme/20221227150920.png)

##### Как запустить консоль bash в Windows (Visual Studio Code)

1. Открыть новый терминал

![image open new terminal](assets/images/for_readme/20221210144947.png)

2. В открытом терминале открыть выпадающий список launch profiles

![image choose a terminal](assets/images/for_readme/20221210145029.png)

3. Выбрать bash

![image bash terminal is opened](assets/images/for_readme/20221210145042.png)

 
