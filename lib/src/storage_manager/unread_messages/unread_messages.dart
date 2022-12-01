import 'package:postgres/postgres.dart';

class RecentUnreadMessages {
  var databaseHost;
  var databasePort;
  var databaseName;
  var username;
  var password;

  void getUnreadMessages() async {

    /// receive ids of unread messages
    /// and mark it in local db

    final List<int> listUnreadMessagesIds = [1, 2, 3];
    var connection = PostgreSQLConnection(
        databaseHost, databasePort, databaseName,
        queryTimeoutInSeconds: 3600,
        timeoutInSeconds: 3600,
        username: username,
        password: password);
    await connection.open();
    for (int i in listUnreadMessagesIds) {
      List<List<dynamic>> results = await connection.query(
          "SELECT id, unreadStatus FROM table WHERE id = @idValue",
          substitutionValues: {"idValue": listUnreadMessagesIds[i]});

      for (final row in results) {
        var id = row[0];
        var unreadStatus = row[1];
        print('get message $id $unreadStatus');
      }
    }

    // void setUnreadMessages() async {
    //
    //   /// check ids of unread messages from local db
    //   /// and send it to gRPC
    //
    //   final List<int> listUnreadMessagesIds = [1, 2, 3];
    //   var connection = PostgreSQLConnection(
    //       databaseHost, databasePort, databaseName,
    //       queryTimeoutInSeconds: 3600,
    //       timeoutInSeconds: 3600,
    //       username: username,
    //       password: password);
    //   await connection.open();
    //   for (int i in listUnreadMessagesIds) {
    //     await connection.transaction((ctx) async {
    //       var result = await ctx.query("SELECT id FROM table");
    //       await ctx.query("INSERT INTO table (id) VALUES (@unreadStatus:int4)",
    //           substitutionValues: {"unreadStatus": listUnreadMessagesIds[i]});
    //       for (final row in result) {
    //         var id = row[0];
    //         var unreadStatus = row[1];
    //         print('set message $id $unreadStatus');
    //       }
    //     });
    //   }
    // }
  }
}
