import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconButton(
      onPressed: null,
      icon: CircleAvatar(
        backgroundColor: Color.fromRGBO(247, 236, 21, 1),
        foregroundImage: AssetImage('assets/profile.png'),
        radius: 30.0,
      ),
    );
  }
}
