import 'package:flutter/material.dart';
import 'package:ornek_proje/model/user_model.dart';
import 'package:ornek_proje/widgets/user_info.dart';

class DetailsPage extends StatelessWidget {
  final User user;
  const DetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(//Üstteki bar ile mesafe olması için
        child: SingleChildScrollView(//Telefon yatay çevrildiğinde de piksel taşmasından dolayı hata vermemesi için kullanıldı.
          child: Column(
            children: [
              Align(//Bir ok sembolü ile önceki sayfaya geri dönüş sağlanıyor.
                alignment: Alignment.centerLeft,
                child: IconButton(
                  iconSize: 24,
                  color: Colors.purple,
                  onPressed: () {
                    Navigator.of(context).pop();//Geri dönme işlevi navigator ile yapıldı
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              const SizedBox(height: 30),//Arada boşluk
              Row(
                children: [
                  Expanded(//Kullanıcının ismi
                    child: Text(
                      user.username!,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(//Kullanıcının ID değeri
                    '#${user.id}',
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),//Boşluk
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: UserInfo(user: user),//Kullanıcının diğer bilgileri başka bir widget yardımıyla gösteriliyor.
              ),
            ],
          ),
        ),
      ),
    );
  }
}
