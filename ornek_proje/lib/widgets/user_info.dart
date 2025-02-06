import 'package:flutter/material.dart';
import 'package:ornek_proje/model/user_model.dart';

class UserInfo extends StatelessWidget {
  final User user;
  const UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(//Köşeleri kıvrımlı ve rengi beyaz olacak şekilde bir container oluşturuldu.
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [//Sırasıyla kullanıcının bilgileri ekranda sıralandı.
          _buildInformationRow('Name', user.name),
          _buildInformationRow('Username', user.username),
          _buildInformationRow('Email', user.email),
          _buildInformationRow('Phone', user.phone),
          _buildInformationRow('Website', user.website),
          const SizedBox(height: 10),
          _buildSectionHeader('Address'),
          _buildInformationRow('Street', user.address?.street),
          _buildInformationRow('Suite', user.address?.suite),
          _buildInformationRow('City', user.address?.city),
          _buildInformationRow('Zipcode', user.address?.zipcode),
          _buildInformationRow(
            'Geo Location',
            user.address?.geo != null//Adres değeri null değilse
                ? "Lat: ${user.address!.geo!.lat}, Lng: ${user.address!.geo!.lng}"//Adres bilgilerini yazdır.
                : "Not available",//Boşsa uygun değil yaz.
          ),
          const SizedBox(height: 10),
          _buildSectionHeader('Company'),
          _buildInformationRow('Name', user.company?.name),
          _buildInformationRow('Catch Phrase', user.company?.catchPhrase),
          _buildInformationRow('Business', user.company?.bs),
        ],
      ),
    );
  }

  Widget _buildInformationRow(String label, dynamic value) {//Bilgileri kolay gösterebilmek için bir fonksiyon tanımlandı.İki parametresinden birisi sabit bir string diğeri ise netten gelen veri
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value ?? 'Not available',
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.purple,
        ),
      ),
    );
  }
}
