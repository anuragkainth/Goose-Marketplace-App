import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_app/constants/colors.dart';
import 'package:marketplace_app/constants/images.dart';
import 'package:marketplace_app/pages/profile_page.dart';
import 'package:marketplace_app/utilities/floating_bar_add_button.dart';
import 'package:marketplace_app/utilities/floating_bar_buttons.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  late User? user;
  @override
  void initState() {

    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Discover Here',style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 19)),),
       leading: Center(child: Image.asset('images/$gooseLogo')),
       actions: [
         PopupMenuButton(
           itemBuilder: (BuildContext context) {
             return [
               PopupMenuItem(
                 value: 'signOut',
                 child: Text('Sign out', style: GoogleFonts.nunito(textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),),
               ),
             ];
           },
           onSelected: (value) {
             if (value == 'signOut') {
               FirebaseAuth.instance.signOut();
             }
           },
         ),
       ],
     ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Welcome User,',
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 34
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '',
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SizedBox(height: 10),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingNavAddButton(onPressed: (){},),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.width * 2 / 13,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingNavButtons(icon: Icons.home, buttonName: 'Discover', onPressed: (){}),
            FloatingNavButtons(icon: Icons.category, buttonName: 'Items', onPressed: (){}),
            SizedBox(width: 40.0),
            FloatingNavButtons(icon: Icons.auto_awesome, buttonName: 'Services', onPressed: (){}),
            FloatingNavButtons(icon: Icons.person, buttonName: 'Profile', onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  ProfileSettingsPage(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
