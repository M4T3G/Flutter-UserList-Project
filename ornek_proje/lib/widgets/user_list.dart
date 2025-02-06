import 'package:flutter/material.dart';
import 'package:ornek_proje/model/user_model.dart';
import 'package:ornek_proje/services/user_api.dart';
import 'package:ornek_proje/widgets/user_item.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late Future<List<User>> _userListFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userListFuture=UserApi.getUserData();//Program her çalıştığında gidip netten verileri çekiyor.
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: _userListFuture,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<User> _listem=snapshot.data!;//Kullanıcı tipli bir listeye kaydediliyor veriler.

            return ListView.builder(itemCount: _listem.length,itemBuilder: (context, index) {  //ListView ile kullanıcı sayısı kadar kullanıcılar sıralanıyor.
              var oankiUser=_listem[index];
              return UserItem(user:oankiUser); //Başka bir widget ile listedeki her bir eleman sıralanıyor.
            },);
          }else if(snapshot.hasError){
            return Center(child: Text("Hata"),);//Data gelmediyse hata
          }else{
            return Center(child: CircularProgressIndicator(),);//Geliyorsa yükleme işareti
          }
        } ,
      );
  }
}