import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;

  const DefaultLayout({
    super.key,
    this.backgroundColor = Colors.white,
    required this.child,
    this.title,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: renderAppBar(title),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

AppBar? renderAppBar(String? title) {
  if (title == null) {
    return null;
  } else {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
