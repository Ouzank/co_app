// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, unused_local_variable, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class ProfilPic extends StatefulWidget {
  @override
  _ProfilPicState createState() => _ProfilPicState();
}

class _ProfilPicState extends State<ProfilPic> {
  @override
  Widget build(BuildContext context) {
    Widget bottomSheet() {
      return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              'Choisir une photo de profil',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                FlatButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: () {},
                  label: Text('Camera'),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () {},
                  label: Text('Gallery'),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget imageProfil = Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/960281.jpg'),
            backgroundColor: Colors.redAccent,
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => bottomSheet()));
                },
                child: Icon(
                  Icons.camera,
                  size: 28,
                ),
              ))
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_left),
        ),
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            'Choisir une photo de profil',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          imageProfil
        ]),
      ),
    );
  }
}
