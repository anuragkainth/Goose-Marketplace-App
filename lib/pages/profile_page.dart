import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_app/utilities/floating_bar_buttons.dart';
import 'package:marketplace_app/utilities/floating_bar_add_button.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings', style: GoogleFonts.nunito(),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: Icon(
                    Icons.person,
                    size: 64,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            _buildButton(
              icon: Icons.person,
              title: 'Personal Information',
              onTap: () {},
            ),
            _buildNotificationButton(
              icon: Icons.notifications,
              title: 'Push Notifications',
              subtitle: 'Receive push notifications',
              value: true,
              onToggle: (value) {},
            ),
            _buildNotificationButton(
              icon: Icons.email,
              title: 'Subscribe to Email',
              subtitle: 'Receive newsletters and updates',
              value: false,
              onToggle: (value) {},
            ),
            _buildButton(
              icon: Icons.language,
              title: 'Language',
              onTap: () {},
            ),
            _buildButton(
              icon: Icons.lock,
              title: 'Change Password',
              onTap: () {},
            ),
            _buildButton(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
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

  Widget _buildButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon,color: Colors.white,),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white,),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onToggle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.white,),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onToggle,
          ),
        ],
      ),

    );
  }
}
