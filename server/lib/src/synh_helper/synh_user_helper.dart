import 'package:server/src/generated/grpcsynh.pb.dart';

class SynhHelper {
  static setNewUser({required SynhUser userForList, required dynamic users}) {
    userForList.userId = users['user_id'] as int;
    userForList.name = users['name'] as String;
    userForList.email = users['email'] as String;
    userForList.picture = users['profile_pic_url'] as String;
    userForList.createdDate = users['created_date'] as String;
    userForList.updateDate = users['updated_date'] as String;
    userForList.deletedDate = users['deleted_date'] ?? '';
    return userForList;
  }
}
