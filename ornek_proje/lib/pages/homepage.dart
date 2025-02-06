import 'package:flutter/material.dart';
import 'package:ornek_proje/widgets/app_title.dart';
import 'package:ornek_proje/widgets/user_list.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTitle(),//Başlık kısmı
          Expanded(child: UserList()),//Kullanıcı listesi
        ],
      ),
    );
  }
}

