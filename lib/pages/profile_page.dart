import 'package:flutter/material.dart';
import 'package:pharmacy/widgets/support_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 207, 130),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 228, 207, 130),

        title: Text('Profile', style: AppWidget.fredokabold(30)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            // Profile Avatar
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blue.shade50,
              child: const Icon(Icons.person, size: 70, color: Colors.blue),
            ),
            const SizedBox(height: 15),

            Text('Samrat Giri', style: AppWidget.fredokabold(20)),

            Text('samrat@example.com', style: AppWidget.fredokalight(15)),

            const SizedBox(height: 20),

            _sectionTitle('Account Settings'),
            _menuTile(Icons.person_outline, 'Edit Profile'),
            _menuTile(Icons.lock_outline, 'Change Password'),
            _menuTile(Icons.location_on_outlined, 'Manage Address'),

            const SizedBox(height: 25),

            _sectionTitle('App Settings'),
            _menuTile(Icons.notifications_outlined, 'Notifications'),
            _menuTile(Icons.color_lens_outlined, 'Theme'),
            _menuTile(Icons.language, 'Language'),

            const SizedBox(height: 25),

            _sectionTitle('Support'),
            _menuTile(Icons.help_outline, 'Help & Support'),
            _menuTile(Icons.privacy_tip_outlined, 'Privacy Policy'),
            _menuTile(Icons.info_outline, 'About App'),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
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
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _menuTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: () {},
      ),
    );
  }
}
