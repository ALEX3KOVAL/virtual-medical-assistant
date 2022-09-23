import 'package:medical_dialogue_system/server/api/db/dbUserController.dart';
import 'package:medical_dialogue_system/server/hashing.dart';

Future<bool> registration(String userName, String password, {String email = "", String phoneNumber = ""}) async {
  try {
    Map<String, String> resultMap = <String, String>{};
    resultMap["userName"] = userName;
    resultMap["password"] = hashingPassword(password);
    if (email.isEmpty) {
      resultMap["phoneNumber"] = phoneNumber;
    }
    else {
      resultMap["email"] = email;
    }
    (await DBUserController.instance()).add(resultMap);
    return true;
  }
  catch(e) {
    print(e);
    return false;
  }
}

void login(String userName, String password, {String email = "", String phoneNumber = ""}) {

}

void check(String userName, String password, {String email = "", String phoneNumber = ""}) {

}