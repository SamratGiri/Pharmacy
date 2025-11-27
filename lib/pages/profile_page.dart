import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/pages/signup.dart';
import 'package:pharmacy/widgets/support_widget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 207, 130),

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 228, 207, 130),

        elevation: 0,
        flexibleSpace: Container(decoration: BoxDecoration()),
        title: Text('Profile', style: AppWidget.fredokabold(40)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 90),

            // Profile Avatar
            CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xFFFFE29F),
              child: Icon(Icons.person, size: 70, color: Colors.brown),
            ),
            const SizedBox(height: 25),

            Text(
              user?.displayName ?? "No name",
              style: AppWidget.fredokabold(25),
            ),
            Text(user?.email ?? "No email", style: AppWidget.fredokalight(17)),
            const SizedBox(height: 20),

            _sectionTitle('Account Settings'),
            _gradientTile(Icons.person_outline, 'Edit Profile'),
            _gradientTile(Icons.lock_outline, 'Change Password'),
            _gradientTile(Icons.location_on_outlined, 'Manage Address'),

            const SizedBox(height: 25),

            _sectionTitle('App Settings'),
            _gradientTile(Icons.notifications_outlined, 'Notifications'),
            _gradientTile(Icons.color_lens_outlined, 'Theme'),
            _gradientTile(Icons.language, 'Language'),

            const SizedBox(height: 25),

            _sectionTitle('Support'),
            _gradientTile(Icons.help_outline, 'Help & Support'),
            _gradientTile(Icons.privacy_tip_outlined, 'Privacy Policy'),
            _gradientTile(Icons.info_outline, 'About App'),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text('Log Out', style: AppWidget.fredokamedium(20)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Text(title, style: AppWidget.fredokabold(22)),
      ),
    );
  }

  Widget _menuTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontSize: 16)),

        onTap: () {},
      ),
    );
  }
}

Widget _gradientTile(IconData icon, String title) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFFFE29F), Color(0xFFFFD47F), Color(0xFFFFC85C)],
      ),
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1),
      ],
    ),
    child: ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: AppWidget.fredokamedium(18)),
      trailing: Icon(Icons.arrow_forward, size: 16, color: Colors.brown),
      onTap: () {},
    ),
  );
}
