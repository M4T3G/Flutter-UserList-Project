import 'package:dio/dio.dart';
import 'package:ornek_proje/model/user_model.dart';

class UserApi {
  static const String _url = 'https://jsonplaceholder.typicode.com/users';
  //Verilen çekildiği URL
  static Future<List<User>> getUserData() async {
    List<User> _userList = [];
    try {
      var result = await Dio().get(_url);//URL verilen çekilip bir değişkene atıldı.

      if (result.data is List) {//Sonuçlar listeyse
        _userList = (result.data as List).map((e) => User.fromJson(e)).toList();//Json formatından listeye çevrildi.
      }else{
        return [];
      }
    } catch (e) {
      print("Hata: $e");
    }
    return _userList;
  }
}