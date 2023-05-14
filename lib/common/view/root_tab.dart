import 'package:actual/common/const/data.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/user/view/login_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatelessWidget {
  const RootTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: GestureDetector(
        onTap: () async {
          await storage.deleteAll();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => LoginScreen(),
            ),
          );
        },
        child: Center(
          child: Text('Root Tab'),
        ),
      ),
    );
  }
}
