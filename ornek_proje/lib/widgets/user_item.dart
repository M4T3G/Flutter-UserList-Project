import 'package:flutter/material.dart';
import 'package:ornek_proje/model/user_model.dart';
import 'package:ornek_proje/pages/details_page.dart';

class UserItem extends StatelessWidget {
  final User user;
  const UserItem({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(//Inkwell ile listedeki her kullanıcı için buton tıklanılabilir hale getirildi.
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(user: user)));//Tıklandığı zaman kullanıcı ayrıntı sayfasını açıyor.
      },
      child: Card(//Listede kullanıcı bilgilerinden Username ve email gösterilitor.
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        shadowColor: Colors.purple,
        color: Colors.white,
        child: Column(
          children: [
            Text(user.username!,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Chip(label: Text(user.email!))
          ],
        ),
      ),
    );
  }
}